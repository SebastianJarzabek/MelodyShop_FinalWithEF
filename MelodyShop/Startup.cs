using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MelodyShop.Startup))]
namespace MelodyShop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
