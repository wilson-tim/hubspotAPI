using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace HUBSPOT_API
{
    class HTTP
    {
        NameValueCollection sAll = ConfigurationManager.AppSettings;

        public async Task<HttpResponseMessage> POST(string requestURI, string contentType, StringContent content)
        {
            var baseAddress = sAll.Get("BASEADDRESS");
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(baseAddress);
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue(contentType));
                HttpResponseMessage response = await client.PostAsync(requestURI, content);
                return response;
            }
        }

        public async Task<HttpResponseMessage> GET(string requestURI, string contentType)
        {
            var baseAddress = sAll.Get("BASEADDRESS");
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(baseAddress);
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue(contentType));
                var response = await client.GetAsync(requestURI);
                return response;
            }
        }

        public async Task<HttpResponseMessage> DELETE(string requestURI, string contentType)
        {
            var baseAddress = sAll.Get("BASEADDRESS");
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(baseAddress);
                client.DefaultRequestHeaders.Accept.Clear();
                //client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue(contentType));
                var response = await client.DeleteAsync(requestURI);
                return response;
            }
        }
    }
}
