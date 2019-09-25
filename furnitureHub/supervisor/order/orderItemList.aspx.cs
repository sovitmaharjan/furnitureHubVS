using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace furnitureHub.supervisor.order {
    public partial class orderItemList : System.Web.UI.Page {

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
                string tableBodyRow = "";
                int i = 1;
                foreach(DataRow value in dataTable.Rows) {

                    tableBodyRow += "<tr>";
                    tableBodyRow += "<td>" + i + "</td>";
                    tableBodyRow += "<td>" + value["name"] + "</td>";
                    tableBodyRow += "<td>" + Convert.ToDateTime(value["deliveryDate"]).ToString("yyyy-MM-dd") + "</td>";
                    tableBodyRow += "<td><div class='button-list'><a href='orderItemDesign.aspx?d752ebede1f7f7cb0b54f0d726270929=" + value["id"] + "' class='btn btn-warning w-sm waves-effect waves-light btn-sm item'><i class='mdi mdi-cart'></i> <span>Edit </span></a></div></td>";
                    tableBodyRow += "</tr>";
                    i++;
                }
                tableBody.Text = tableBodyRow;
            }

        }

    }
}