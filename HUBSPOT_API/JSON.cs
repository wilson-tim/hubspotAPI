using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace HUBSPOT_API
{
    class JSON
    {
        public string Serialize<T>(T obj)
        {
            return new JavaScriptSerializer().Serialize(obj);
        }
        public T Deserialize<T>(string json)
        {
            return new JavaScriptSerializer().Deserialize<T>(json);
        }
    }
}
