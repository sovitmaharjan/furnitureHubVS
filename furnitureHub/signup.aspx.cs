using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace furnitureHub {

    public partial class signup : System.Web.UI.Page {

        furnitureHub furnitureHubObject = new furnitureHub();

        public string baseUrl {

            get {

                return furnitureHubObject.baseUrl();
            }
        }

        protected void Page_Load(object sender, EventArgs e) {

        }

        public void register(object sender, System.EventArgs e) {

            string userName = userNameAspx.Value;
            string password = passwordAspx.Value;
            furnitureHubObject.register(userName, password);
            Response.Redirect("admin/dashboard/dashboard.aspx");
        }
    }
}