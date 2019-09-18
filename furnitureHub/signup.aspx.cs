using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

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

            string tblUserlist = "tblUserlist";
            DataTable dataTable = furnitureHubObject.getNewTableId(tblUserlist);
            int id = Convert.ToInt32(dataTable.Rows[0]["id"]);
            string userName = userNameAspx.Value;
            string password = passwordAspx.Value;

            furnitureHubObject.register(id, userName, password);
            Response.Redirect("Default.aspx");
        }
    }
}