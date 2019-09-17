using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;

namespace furnitureHub.admin.customer {
    public partial class customerList: System.Web.UI.Page {

        furnitureHub furnitureHubObject = new furnitureHub();
        static furnitureHub staticFurnitureHubObject = new furnitureHub();

        public string baseUrl {

            get {

                return furnitureHubObject.baseUrl();
            }
        }

        protected void Page_Load(object sender, EventArgs e) {

            DataTable dataTable = furnitureHubObject.customerList();
            string tableBodyRow = "";
            int i = 1;
            foreach(DataRow value in dataTable.Rows) {

                tableBodyRow += "<tr>";
                tableBodyRow += "<td>" + i + "</td>";
                tableBodyRow += "<td>" + value["name"] + "</td>";
                tableBodyRow += "<td>" + value["address"] + "</td>";
                tableBodyRow += "<td>" + value["number"] + "</td>";
                tableBodyRow += "<td>" + value["orderId"] + "</td>";
                tableBodyRow += "<td>" + Convert.ToDateTime(value["orderDate"]).ToString("yyyy-MM-dd") + "</td>";
                tableBodyRow += "<td><div class='button-list'><a id='" + value["orderId"] + "' class='btn btn-pink w-sm waves-effect waves-light btn-sm item' data-toggle='modal' data-target='#myModal'><i class='mdi mdi-cart'></i> <span>Item </span></a></div></td>";
                tableBodyRow += "</tr>";

            }
            tableBody.Text = tableBodyRow;
        }

        [WebMethod]
        public static string[] getItemById(int orderId) {

            DataTable dataTable = staticFurnitureHubObject.itemList(orderId);
            int count = dataTable.Rows.Count;
            string[] array = new string[count];
            int i = 0;
            foreach(DataRow value in dataTable.Rows) {

                array[i] = value["name"] + "./." + Convert.ToDateTime(value["deliveryDate"]).ToString("yyyy-MM-dd") + "./." + value["price"];
                i++;
            }
            return array;
        }
    }
}