using System.Web.Http;
namespace ZaposleniREST_API
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.MapHttpAttributeRoutes();
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
            config.Routes.MapHttpRoute(
                name: "GetStudent",
                routeTemplate: "api/{controller}/{credential}/{type}/{encrypted_password}"
            );
        }
    }
}
