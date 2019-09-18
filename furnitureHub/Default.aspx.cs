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

                    message.Text = "<div class='alert alert-danger' id='message' role='alert'>This <strong>User </strong>is temporarily disabled. </div>";
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
            //1 = username exist but inactive
            //2 = username exist and active
            //3 = logout

            //status:
            //0 = inactive user
            //1 = active user

            string userName = userNameAspx.Value;
            string password = passwordAspx.Value;
            DataTable dataTable = furnitureHubObject.getLoginData(userName, password);
            if (dataTable.Rows.Count > 0) {

                string sessionUserName = dataTable.Rows[0]["username"].ToString();
                string sessionPassword = dataTable.Rows[0]["password"].ToString();
                int sessionType = Convert.ToInt32(dataTable.Rows[0]["type"]);
                int sessionStatus = Convert.ToInt32(dataTable.Rows[0]["status"]);
                Session["userName"] = sessionUserName;
                Session["password"] = sessionPassword;
                Session["type"] = sessionType;
                if (sessionStatus == 1) {

                    Session["message"] = 1;
                    if(sessionType == 0){

                        Response.Redirect("admin/dashboard/dashboard.aspx");
                    }
                    if(sessionType == 1){

                        Response.Redirect("supervisior/dashboard/dashboard.aspx");
                    }
                } else {

                    Session["message"] = 1;
                    Response.Redirect("Default.aspx");                    
                }
            } else {

                Session["message"] = 0;
                Response.Redirect("Default.aspx");
            }
        }
    }
}