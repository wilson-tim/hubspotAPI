using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http;
using System.Web.Script.Serialization;
using System.Net.Http.Headers;
using System.Configuration;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;

namespace HUBSPOT_API
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                if ((args.Count() == 2) || (args.Count() == 3))
                {
                    string brand = args[0].ToString();
                    string module = args[1].ToString();
                    Boolean debugFlag = ((args.Count() == 3) && args[2].ToString() == "DEBUG") ? true : false;
                    string storedProcedureName = "";
                    Contact objContact = new Contact();

                    if (brand == "ZZTEST")
                    {
                        if (module == "TMENEWS")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_TM_ENEWS", debugFlag).Wait();
                        if (module == "TMBROCREQ")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS", debugFlag).Wait();
                        if (module == "TMQUOTES")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_TM_QUOTES", debugFlag).Wait();
                        if (module == "TMBOOKINGS")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_TM_BOOKINGS", debugFlag).Wait();
                        if (module == "SSENEWS")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_SS_ENEWS", debugFlag).Wait();
                        if (module == "SSBROCREQ")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS", debugFlag).Wait();
                        if (module == "SSQUOTES")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_SS_QUOTES", debugFlag).Wait();
                        if (module == "SSBOOKINGS")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_SS_BOOKINGS", debugFlag).Wait();
                        if (module == "FLQUOTES")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_FL_QUOTES", debugFlag).Wait();
                        if (module == "FLBOOKINGS")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_FL_BOOKINGS", debugFlag).Wait();
                        if (module == "LEBOAT" || module == "SUNSAIL" || module == "MOORINGS" || module == "FOOTLOOSE")
                            objContact.SyncContactProperties(module).Wait();
                    }
                    if (brand == "ZLBTEST")
                    {
                        if (module == "ENEWS")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_NEPTUNE_ENEWS", debugFlag).Wait();
                        if (module == "BROCREQ")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS", debugFlag).Wait();
                        if (module == "QUOTES")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_NEPTUNE_QUOTES", debugFlag).Wait();
                        if (module == "BOOKINGS")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_NEPTUNE_BOOKINGS", debugFlag).Wait();
                        if (module == "LEBOAT" || module == "SUNSAIL" || module == "MOORINGS" || module == "FOOTLOOSE")
                            objContact.SyncContactProperties(module).Wait();
                    }
                    if (brand == "DEV")
                    {
                        if (module == "ENEWS")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_SS_ENEWS", debugFlag).Wait();
                        if (module == "BROCREQ")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS", debugFlag).Wait();
                        if (module == "QUOTES")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_SS_QUOTES", debugFlag).Wait();
                        if (module == "BOOKINGS")
                            objContact.CreateOrUpdateContact(brand, "BUILD_HUBSPOT_TRITON_SS_BOOKINGS", debugFlag).Wait();
                        if (module == "LEBOAT" || module == "SUNSAIL" || module == "MOORINGS" || module == "FOOTLOOSE")
                            objContact.SyncContactProperties(module).Wait();
                    }
                    if (brand == "LEBOAT")
                    {
                        if (module == "ENEWS")
                        {
                            storedProcedureName = "BUILD_HUBSPOT_NEPTUNE_ENEWS";
                            objContact.CreateOrUpdateContact(brand, storedProcedureName, debugFlag).Wait();
                        }
                        if (module == "BROCREQ")
                        {
                            storedProcedureName = "BUILD_HUBSPOT_NEPTUNE_BROCHURE_REQUESTS";
                            objContact.CreateOrUpdateContact(brand, storedProcedureName, debugFlag).Wait();
                        }
                        if (module == "QUOTES")
                        {
                            storedProcedureName = "BUILD_HUBSPOT_NEPTUNE_QUOTES";
                            objContact.CreateOrUpdateContact(brand, storedProcedureName, debugFlag).Wait();
                        }
                        if (module == "BOOKINGS")
                        {
                            storedProcedureName = "BUILD_HUBSPOT_NEPTUNE_BOOKINGS";
                            objContact.CreateOrUpdateContact(brand, storedProcedureName, debugFlag).Wait();
                        }
                        if (module == "PREFS")
                        {
                            storedProcedureName = "BUILD_HUBSPOT_NEPTUNE_CONTACT_PREFERENCES";
                            objContact.UpdateContact(brand, storedProcedureName, debugFlag).Wait();
                        }
                    }
                    if (brand == "SUNSAIL")
                    {
                        if (module == "ENEWS")
                            storedProcedureName = "BUILD_HUBSPOT_TRITON_SS_ENEWS";
                        if (module == "BROCREQ")
                            storedProcedureName = "BUILD_HUBSPOT_TRITON_SS_BROCHURE_REQUESTS";
                        if (module == "QUOTES")
                            storedProcedureName = "BUILD_HUBSPOT_TRITON_SS_QUOTES";
                        if (module == "BOOKINGS")
                            storedProcedureName = "BUILD_HUBSPOT_TRITON_SS_BOOKINGS";

                        objContact.CreateOrUpdateContact(brand, storedProcedureName, debugFlag).Wait();
                    }
                    if (brand == "MOORINGS")
                    {
                        if (module == "ENEWS")
                            storedProcedureName = "BUILD_HUBSPOT_TRITON_TM_ENEWS";
                        if (module == "BROCREQ")
                            storedProcedureName = "BUILD_HUBSPOT_TRITON_TM_BROCHURE_REQUESTS";
                        if (module == "QUOTES")
                            storedProcedureName = "BUILD_HUBSPOT_TRITON_TM_QUOTES";
                        if (module == "BOOKINGS")
                            storedProcedureName = "BUILD_HUBSPOT_TRITON_TM_BOOKINGS";

                        objContact.CreateOrUpdateContact(brand, storedProcedureName, debugFlag).Wait();
                    }
                    if (brand == "FOOTLOOSE")
                    {
                        if (module == "ENEWS")
                            storedProcedureName = "BUILD_HUBSPOT_TRITON_FL_ENEWS";
                        if (module == "BROCREQ")
                            storedProcedureName = "BUILD_HUBSPOT_TRITON_FL_BROCHURE_REQUESTS";
                        if (module == "QUOTES")
                            storedProcedureName = "BUILD_HUBSPOT_TRITON_FL_QUOTES";
                        if (module == "BOOKINGS")
                            storedProcedureName = "BUILD_HUBSPOT_TRITON_FL_BOOKINGS";

                        objContact.CreateOrUpdateContact(brand, storedProcedureName, debugFlag).Wait();
                    }
                }
                else
                {
                    Console.WriteLine("Invalid Number of arguments");
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
