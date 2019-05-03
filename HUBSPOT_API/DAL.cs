using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HUBSPOT_API
{
    class DAL
    {
        NameValueCollection sAll = null;
        string connectionString = null;

        public DAL()
        {
            sAll = ConfigurationManager.AppSettings;
            connectionString = sAll.Get("SQLSERVER_CONN_STRING");
        }

        public DataTable GetDataTableFromSQLServerProc(string procedureName, SqlParameter[] Parameters)
        {
            var dataSet = new DataSet();
            
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (var command = new SqlCommand(procedureName, connection) { CommandType = CommandType.StoredProcedure })
                {
                    if(Parameters !=null)
                        command.Parameters.AddRange(Parameters);
                    
                    using (var adapter = new SqlDataAdapter(command))
                    {
                        adapter.SelectCommand.CommandTimeout = 0;
                        adapter.Fill(dataSet);
                    }
                }
            }

            return dataSet.Tables[0];
        }

        public int LogRecordStatus(string procedureName,SqlParameter[] Parameters)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (var command = new SqlCommand(procedureName, connection) { CommandType = CommandType.StoredProcedure })
                {
                    command.Parameters.AddRange(Parameters);
                    var noOfRows = command.ExecuteNonQuery();
                    return noOfRows;
                }
            }
        }
    }
}
