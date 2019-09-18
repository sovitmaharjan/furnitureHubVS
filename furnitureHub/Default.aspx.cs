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

        public string baseUrl {

            get {

                return furnitureHubObject.baseUrl();
            }
        }

        protected void Page_Load(object sender, EventArgs e) {

            if (Session["message"] != null) {

                if(Session["message"].ToString() == "0"){

                    message.Text = "<div class='alert alert-danger' id='message' role='alert'><strong>Invalid </strong> Data</div>";
                    timeScript.Text = "<script>setTimeout(function() {$('#message').fadeOut('fast');}, 5000);</script>";
                }
                if (Session["message"].ToString() == "1") {

                    message.Text = "<div class='alert alert-danger' id='message' role='alert'>Waiting for <strong>Admin </strong>approval. Please contact the <strong>Admin </strong></div>";
                    timeScript.Text = "<script>setTimeout(function() {$('#message').fadeOut('fast');}, 5000);</script>";
                }
            }
            
        }

        public void loginClick(object sender, System.EventArgs e) {

            //usertype:
            //0 = admin
            //1 = supervisior

            //message:
            //0 = username doesnot exist
            //1 = username exist but not approved by admin
            //else ok

            //status:
            //0 = username exist but not approved by admin
            //1 = username exist and approved by admin
            //else doesnot exist

            string userName = userNameAspx.Value;
            string password = passwordAspx.Value;
            DataTable dataTable = furnitureHubObject.getLoginData(userName, password);
            if (dataTable.Rows.Count > 0) {

                string sessionUserName = dataTable.Rows[0]["username"].ToString();
                string sessionPassword = dataTable.Rows[0]["password"].ToString();
                string sessionType = dataTable.Rows[0]["type"].ToString();
                int sessionStatus = Convert.ToInt32(dataTable.Rows[0]["status"]);
                if (sessionStatus == 0) {

                    Session["userName"] = sessionUserName;
                    Session["password"] = sessionPassword;
                    Session["message"] = 1;
                    Response.Redirect("superVisior/dashboard/dashboard.aspx");
                }
                if(sessionStatus == 1) {

                    Session["userName"] = sessionUserName;
                    Session["password"] = sessionPassword;
                    Session["message"] = 1;
                    Response.Redirect("superVisior/dashboard/dashboard.aspx");
                } else {

                    Session["userName"] = sessionUserName;
                    Session["password"] = sessionPassword;
                    Session["message"] = 1;
                    Response.Redirect("admin/dashboard/dashboard.aspx");                    
                }
            } else {

                Session["message"] = 0;
                Response.Redirect("Default.aspx");
            }
        }
    }
}