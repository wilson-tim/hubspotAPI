using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using System.Xml.Linq;

namespace HUBSPOT_API
{
    class Contact
    {
        NameValueCollection sAll = ConfigurationManager.AppSettings;

        public int vid { get; set; }
        public bool isNew { get; set; }
        public string status { get; set; }
        public string message { get; set; }
        public string correlationId { get; set; }
        public IList<ValidationResult> validationResults { get; set; }
        public string requestId { get; set; }
        public string error { get; set; }

        public Contact()
        { }

        public Contact(int vid, bool isNew)
        {
            this.vid = vid;
            this.isNew = isNew;
        }

        public class ValidationResult
        {
            public bool isValid { get; set; }
            public string message { get; set; }
            public string error { get; set; }
            public string name { get; set; }
        }

        public class Identity
        {
            public string value { get; set; }
            public string type { get; set; }
            public object timestamp { get; set; }
        }

        public class IdentityProfile
        {
            public int vid { get; set; }
            public IList<Identity> identity { get; set; }
            public IList<object> linkedVid { get; set; }
            public bool isContact { get; set; }
            public long savedAtTimestamp { get; set; }
        }

        public class Property
        {
            public string property { get; set; }
            public string value { get; set; }

            public Property()
            { }

            public Property(string property, string value)
            {
                this.property = property;
                this.value = value;
            }
        }

        public class Properties
        {
            public List<Property> properties { get; set; }
        }

        public async Task<string> CreateOrUpdateContact(string brand, string storedProc, bool debugFlag)
        {
            try
            {
                var objDAL = new DAL();
                var dt_ContactRecords = objDAL.GetDataTableFromSQLServerProc(storedProc,null);
                var columnNames = dt_ContactRecords.Columns.Cast<DataColumn>().Select(x => x.ColumnName).ToArray();

                SqlParameter[] sqlParameter = new SqlParameter[1];
                sqlParameter[0] = new SqlParameter("@BrandName", brand);
                var dt_HubSpotFieldNames = objDAL.GetDataTableFromSQLServerProc("SELECT_SL_HUBSPOT_FIELD_NAMES", sqlParameter);
                
                var hapikey = sAll.Get(brand + "_HAPIKEY");

                foreach (DataRow dataRow in dt_ContactRecords.Rows)
                {
                    // 09/01/2018  TW  Restrict processing to a maximum of 10 data rows per second
                    // Save start time of data row processing
                    DateTime startTime = DateTime.UtcNow;

                    var requestURI = sAll.Get("CREATEORUPDATE_CONTACT_POSTURL");
                    var ObjProperties = new Properties();
                    var objProperty = new List<Property>();
                    foreach (var cName in columnNames)
                    {
                        foreach (DataRow hFieldNameDTrow in dt_HubSpotFieldNames.Rows)
                        {
                            var queryFieldName = hFieldNameDTrow["QueryFieldName"].ToString();
                            var hubSpotFieldName = hFieldNameDTrow["HubSpotFieldName"].ToString();
                            // 19/01/2018  TW  Use case insensitive search
                            //if (cName == queryFieldName)
                            if (String.Equals(cName, queryFieldName, StringComparison.OrdinalIgnoreCase))
                            {
                                objProperty.Add(new Property(hubSpotFieldName, dataRow[cName].ToString()));
                                break;
                            }
                        }
                    }

                    ObjProperties.properties = objProperty;
                    var json = new JSON().Serialize(ObjProperties);
                    if (debugFlag)
                    {
                        Console.WriteLine(json);
                    }
                    var content = new StringContent(json, Encoding.UTF8, "application/json");
                    requestURI = requestURI.Replace(":contact_email", dataRow["Email"].ToString()).Replace(":hapikey", hapikey);

                    var response = await new HubSpot().CreateOrUpdateContact(requestURI, content);
                    var responseOutput = await response.Content.ReadAsStringAsync();
                    if (debugFlag)
                    {
                        Console.WriteLine(responseOutput);
                    }
                    var ObjCustomer = new JSON().Deserialize<Contact>(responseOutput);

                    var sqlParameters = new SqlParameter[8];
                    sqlParameters[0] = new SqlParameter("@Brand", dataRow.Table.Columns.Contains("BrandName") ? dataRow["BrandName"].ToString() : "");
                    sqlParameters[1] = new SqlParameter("@LifeCycleStage", dataRow.Table.Columns.Contains("LifecycleStage") ? dataRow["LifecycleStage"].ToString() : "");
                    sqlParameters[2] = new SqlParameter("@ClientCode", dataRow.Table.Columns.Contains("ClientCode") ? dataRow["ClientCode"].ToString() : "");
                    sqlParameters[3] = new SqlParameter("@VID", ObjCustomer != null ? ObjCustomer.vid.ToString() : "");
                    sqlParameters[4] = new SqlParameter("@Email", dataRow["Email"].ToString());
                    sqlParameters[5] = new SqlParameter("@IsNew", ObjCustomer != null ? ObjCustomer.isNew.ToString() : "");

                    if (response.IsSuccessStatusCode)
                    {
                        sqlParameters[6] = new SqlParameter("@Status", "Success");
                        sqlParameters[7] = new SqlParameter("@Error_Msg", "");
                    }
                    else
                    {
                        sqlParameters[6] = new SqlParameter("@Status", "Fail");

                        var errorMessage = ObjCustomer != null ? ObjCustomer.message : response.StatusCode.ToString();

                        if (ObjCustomer != null)
                        {
                            if (ObjCustomer.validationResults != null)
                            {
                                errorMessage = "";
                                foreach (var err in ObjCustomer.validationResults)
                                {
                                    errorMessage = errorMessage + "Field Name: " + err.name + " ";
                                    errorMessage = errorMessage + "Error: " + err.error + " ";
                                    errorMessage = errorMessage + "Message: " + err.message + " ";
                                }
                            }
                        }
                        sqlParameters[7] = new SqlParameter("@Error_Msg", errorMessage);
                    }
                    new DAL().LogRecordStatus("BUILD_ST_ERROR_LOG", sqlParameters);

                    // 09/01/2018  TW  Restrict processing to a maximum of 10 data rows per second
                    // Check whether to wait before processing the next data row
                    int timeLeft = (int)(startTime.AddSeconds(1.0 / 10.0) - DateTime.UtcNow).TotalMilliseconds;   // 1 second divided by 10 (the maximum number of uploads per second)
                    if (timeLeft > 0)
                    {
                        await Task.Delay(timeLeft);
                    }
                }
                return "Process Completed";
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw ex;
            }
        }

        public async Task<string> SyncContactProperties(string brand)
        {
            try
            {
                var devHapikey = sAll.Get("DEV_HAPIKEY");
                var liveSunsailKey = sAll.Get(brand +"_HAPIKEY");

                var requestURI = sAll.Get("GET_ALL_CONTACTS_PROPERTIES_GETURL");

                var devRequestURI = requestURI.Replace(":hapikey", devHapikey);
                var devResponse = await new HubSpot().GetAllContactProperties(devRequestURI);
                var devResponseOutput = await devResponse.Content.ReadAsStringAsync();
                var devObjContactProperties = new JSON().Deserialize<List<ContactsProperties>>(devResponseOutput);

                foreach (var devProperty in devObjContactProperties.Where(T => (!T.hubspotDefined)))
                {
                    var deletePropertyRequestURI = sAll.Get("DELETE_CONTACT_PROPERTY_DELETEURL");
                    deletePropertyRequestURI = deletePropertyRequestURI.Replace(":property_name", devProperty.name).Replace(":hapikey", devHapikey);
                    var response = await new HubSpot().DeleteContactProperty(deletePropertyRequestURI);
                    if(!response.IsSuccessStatusCode)
                    {
                        throw new Exception("Issue with deleting property " + devProperty.name);
                    }
                }

                requestURI = sAll.Get("GET_ALL_CONTACTS_PROPERTIES_GETURL");
                var liveRequestURI = requestURI.Replace(":hapikey", liveSunsailKey);
                var liveResponse = await new HubSpot().GetAllContactProperties(liveRequestURI);
                var liveResponseOutput = await liveResponse.Content.ReadAsStringAsync();
                var liveObjContactProperties = new JSON().Deserialize<List<ContactsProperties>>(liveResponseOutput);

                foreach (var liveProperty in liveObjContactProperties.Where(liveProperty => (!liveProperty.hubspotDefined)))
                {
                    //var devProperty = devObjContactProperties.Where(T => (!T.hubspotDefined && T.name == liveProperty.name));

                    //if (devProperty.Count() == 0)
                    //{
                        if (liveProperty.type == "enumeration")
                        {
                            var objMultiSelectProperty = new AddContactPropertyMultiSelect();
                            objMultiSelectProperty.name = liveProperty.name;
                            objMultiSelectProperty.label = liveProperty.label;
                            objMultiSelectProperty.description = liveProperty.description;
                            objMultiSelectProperty.groupName = liveProperty.groupName;
                            objMultiSelectProperty.type = liveProperty.type;
                            objMultiSelectProperty.fieldType = liveProperty.fieldType;
                            objMultiSelectProperty.hidden = liveProperty.hidden;
                            objMultiSelectProperty.options = liveProperty.options;
                            objMultiSelectProperty.formField = liveProperty.formField;

                            var json = new JSON().Serialize(objMultiSelectProperty);
                            var content = new StringContent(json, Encoding.UTF8, "application/json");
                            var response = await new HubSpot().CreateContactProperty(devRequestURI, content);
                            var responseOutput = await response.Content.ReadAsStringAsync();
                            if(!response.IsSuccessStatusCode)
                            {
                                throw new Exception("Issue with property " + liveProperty.name + " Error Message:" + responseOutput.ToString());
                            }
                        }
                        else
                        {
                            var objSingleTextProperty = new AddContactPropertyString();
                            objSingleTextProperty.name = liveProperty.name;
                            objSingleTextProperty.label = liveProperty.label;
                            objSingleTextProperty.description = liveProperty.description;
                            objSingleTextProperty.groupName = liveProperty.groupName;
                            objSingleTextProperty.type = liveProperty.type;
                            objSingleTextProperty.fieldType = liveProperty.fieldType;
                            objSingleTextProperty.formField = liveProperty.formField;
                            objSingleTextProperty.displayOrder = liveProperty.displayOrder;
                            objSingleTextProperty.options = liveProperty.options;

                            var json = new JSON().Serialize(objSingleTextProperty);
                            var content = new StringContent(json, Encoding.UTF8, "application/json");
                            var response = await new HubSpot().CreateContactProperty(devRequestURI, content);
                            var responseOutput = await response.Content.ReadAsStringAsync();
                            if (!response.IsSuccessStatusCode)
                            {
                                throw new Exception("Issue with property " + liveProperty.name + " Error Message:" + responseOutput.ToString());
                            }
                        }
                }

                return "Process Completed";
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw ex;
            }
        }
    }
}
