using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace furnitureHub.supervisor.order {
    public partial class orderItemDesign : System.Web.UI.Page {

        furnitureHub furnitureHubObject = new furnitureHub();
        static furnitureHub staticFurnitureHubObject = new furnitureHub();

        public string baseUrl {

            get {

                return furnitureHubObject.baseUrl();
            }
        }

        protected void Page_Load(object sender, EventArgs e) {

            string id = Request.Params["d752ebede1f7f7cb0b54f0d726270929"];
            if(string.IsNullOrEmpty(id)) {
            } else {

                int itemId = Convert.ToInt32(id);
                DataTable dataTable = furnitureHubObject.itemList(itemId);
                itemNameAspx.Text = dataTable.Rows[0]["name"].ToString();
            }
        }

    }
}