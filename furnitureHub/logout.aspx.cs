using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace furnitureHub {
    public partial class logout : System.Web.UI.Page {
        furnitureHub furnitureHubObject = new furnitureHub();

        public string baseUrl {

            get {

                return furnitureHubObject.baseUrl();
            }
        }

        //usertype:
        //0 = admin
        //1 = supervisior

        //message:
        //0 = username doesnot exist
        //1 = username exist but inactive
        //2 = username exist and active
        //3 = access denied

        //status:
        //0 = inactive user
        //1 = active user

        protected void Page_Load(object sender, EventArgs e) {

            Session.Clear();
        }

        public void loginClick(object sender, System.EventArgs e) {

            Response.Redirect("~/admin/dashboard/dashboard.aspx");

            string userName = userNameAspx.Value;
            string password = passwordAspx.Value;
            DataTable dataTable = furnitureHubObject.getLoginData(userName, password);
            if(dataTable.Rows.Count > 0) {

                string sessionUserName = dataTable.Rows[0]["username"].ToString();
                string sessionPassword = dataTable.Rows[0]["password"].ToString();
                int sessionType = Convert.ToInt32(dataTable.Rows[0]["type"]);
                int sessionStatus = Convert.ToInt32(dataTable.Rows[0]["status"]);
                Session["userName"] = sessionUserName;
                Session["password"] = sessionPassword;
                Session["type"] = sessionType;
                if(sessionStatus == 1) {

                    Session["message"] = 2;
                    if(sessionType == 0) {

                        Response.Redirect("~/admin/dashboard/dashboard.aspx");
                    } else if(sessionType == 1) {

                        Response.Redirect("~/supervisor/dashboard/dashboard.aspx");
                    }
                } else {

                    Session["message"] = 1;
                    Response.Redirect("~/default.aspx");
                }
            } else {

                Session["message"] = 0;
                Response.Redirect("~/default.aspx");
            }
        }
    }
}