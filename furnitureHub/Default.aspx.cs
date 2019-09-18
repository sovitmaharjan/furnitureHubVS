using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace furnitureHub {
    public partial class Default : System.Web.UI.Page {

        furnitureHub furnitureHubObject = new furnitureHub();

        protected void Page_Load(object sender, EventArgs e) {

        }

        public void loginClick(object sender, System.EventArgs e) {

            string userName = userNameAspx.Value;
            string password = passwordAspx.Value;
            DataTable dataTable = furnitureHubObject.getLoginData(userName, password);
            if (dataTable.Rows.Count > 0) {

                string sessionUserName = dataTable.Rows[0]["username"].ToString();
                string sessionPassword = dataTable.Rows[0]["password"].ToString();
                int sessionStatus = Convert.ToInt32(dataTable.Rows[0]["status"]);
                if (sessionStatus == 0) {

                }
                if(sessionStatus == 1) {
                    Response.Redirect("superVisior/dashboard/dashboard.aspx");
                    
                }

            }
            Response.Redirect("admin/dashboard/dashboard.aspx");
        }

        public string baseUrl {

            get {

                return furnitureHubObject.baseUrl();
            }
        }
    }
}