using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace HUBSPOT_API
{
    class HubSpot
    {
        public async Task<HttpResponseMessage> GetAllContactProperties(string requestURI)
        {
            return await new HTTP().GET(requestURI, "application/json");
        }

        public async Task<HttpResponseMessage> CreateOrUpdateContact(string requestURI, StringContent content)
        {
            return await new HTTP().POST(requestURI, "application/json", content);
        }

        public async Task<HttpResponseMessage> UpdateContact(string requestURI, StringContent content)
        {
            return await new HTTP().POST(requestURI, "application/json", content);
        }

        public async Task<HttpResponseMessage> CreateContactProperty(string requestURI,StringContent content)
        {
            return await new HTTP().POST(requestURI, "application/json", content);
        }

        public async Task<HttpResponseMessage> DeleteContactProperty(string requestURI)
        {
            return await new HTTP().DELETE(requestURI, "application/json");
        }

        public async Task<HttpResponseMessage> GetAllContacts(string requestURI)
        {
            return await new HTTP().GET(requestURI, "application/json");
        }

    }
}
