using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;

namespace furnitureHub.admin.orderFrom {
    public partial class orderFormList : System.Web.UI.Page {

        furnitureHub furnitureHubObject = new furnitureHub();
        static furnitureHub staticFurnitureHubObject = new furnitureHub();

        public string baseUrl {

            get {

                return furnitureHubObject.baseUrl();
            }
        }

        protected void Page_Load(object sender, EventArgs e) {

            DataTable dataTable = furnitureHubObject.orderFormList();
            string tableBodyRow = "";
            int i = 1;
            foreach (DataRow value in dataTable.Rows)
            {

                tableBodyRow += "<tr>";
                tableBodyRow += "<td>" + value["id"] + "</td>";
                tableBodyRow += "<td>" + Convert.ToDateTime(value["orderDate"]).ToString("yyyy-MM-dd") + "</td>";
                tableBodyRow += "<td>" + value["customerName"] + "</td>";
                tableBodyRow += "<td>" + value["customerNumber"] + "</td>";
                tableBodyRow += "<td>" + value["totalAmount"] + "</td>";
                tableBodyRow += "<td><div class='button-list'><a id='" + value["id"] + "' class='btn btn-pink w-sm waves-effect waves-light btn-sm item' data-toggle='modal' data-target='#myModal'><i class='mdi mdi-cart'></i> <span>Item </span></a></div></td>";
                tableBodyRow += "<td><div class='button-list'><a id='" + value["id"] + "' class='btn btn-warning w-sm waves-effect waves-light btn-sm item'><i class='mdi mdi-pencil'></i> <span>Edit </span></a></div></td>";
                tableBodyRow += "</tr>";

            }
            tableBody.Text = tableBodyRow;
        }

        [WebMethod]
        public static string[] getItemById(int orderId)
        {

            DataTable dataTable = staticFurnitureHubObject.itemList(orderId);
            int count = dataTable.Rows.Count;
            string[] array = new string[count];
            int i = 0;
            foreach (DataRow value in dataTable.Rows)
            {

                array[i] = value["name"] + "./." + value["deliveryDate"] + "./." + value["price"];
                i++;
            }
            return array;
        }
    }
}