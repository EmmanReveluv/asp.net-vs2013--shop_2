using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(eShopCOE125MP.Startup))]
namespace eShopCOE125MP
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
