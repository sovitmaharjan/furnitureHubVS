using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace furnitureHub {
    public partial class Default : System.Web.UI.Page {

        furnitureHub furnitureHubObject = new furnitureHub();

        protected void Page_Load(object sender, EventArgs e) {

        }

        public void loginClick(object sender, System.EventArgs e) {

            string userName = userNameAspx.Value;
            string password = passwordAspx.Value;
            furnitureHubObject.loginCheck(userName, password);
            Response.Redirect("admin/dashboard/dashboard.aspx");
        }

        public string baseUrl {

            get {

                return furnitureHubObject.baseUrl();
            }
        }
    }
}