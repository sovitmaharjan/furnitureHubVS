using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace furnitureHub.admin {
    public partial class furnitureHubAdmin: System.Web.UI.MasterPage {

        furnitureHub furnitureHubObject = new furnitureHub();

        public string baseUrl {

            get {

                return furnitureHubObject.baseUrl();
            }
        }

        protected void Page_Load(object sender, EventArgs e) {

            if(Session["username"] != null) {
                string userName = Session["userName"].ToString();
                string password = Session["password"].ToString();
                DataTable dataTable = furnitureHubObject.getLoginData(userName, password);
                if(dataTable.Rows.Count > 0) {

                    string sessionUserName = dataTable.Rows[0]["username"].ToString();
                    string sessionPassword = dataTable.Rows[0]["password"].ToString();
                    int sessionType = Convert.ToInt32(dataTable.Rows[0]["type"]);
                    int sessionStatus = Convert.ToInt32(dataTable.Rows[0]["status"]);
                    if(sessionType != 0) {

                        Session.Clear();
                        Session["message"] = "3";
                        Response.Redirect("~/Default.aspx");
                    }
                } else {

                    Session.Clear();
                    Session["message"] = 0;
                    Response.Redirect("~/Default.aspx");
                }
            } else {

                Session.Clear();
                Session["message"] = "3";
                Response.Redirect("~/Default.aspx");
            }
        }

        public void logout(object sender, EventArgs e) {

            Session.Clear();
            Response.Redirect("~/Default.aspx");
        }
    }
}