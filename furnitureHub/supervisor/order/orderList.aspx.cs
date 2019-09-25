using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace furnitureHub.supervisor.order {

    public partial class orderList : System.Web.UI.Page {

        furnitureHub furnitureHubObject = new furnitureHub();
        static furnitureHub staticFurnitureHubObject = new furnitureHub();

        public string baseUrl {

            get {

                return furnitureHubObject.baseUrl();
            }
        }

        protected void Page_Load(object sender, EventArgs e) {

            DataTable dataTable = furnitureHubObject.orderList();
            string tableBodyRow = "";
            foreach(DataRow value in dataTable.Rows) {

                tableBodyRow += "<tr>";
                tableBodyRow += "<td>" + value["id"] + "</td>";
                tableBodyRow += "<td>" + Convert.ToDateTime(value["orderDate"]).ToString("yyyy-MM-dd") + "</td>";
                tableBodyRow += "<td>" + value["customerName"] + "</td>";
                tableBodyRow += "<td><div class='button-list'><a href='orderItemList.aspx?d752ebede1f7f7cb0b54f0d726270929=" + value["id"] + "' class='btn btn-pink w-sm waves-effect waves-light btn-sm item'><i class='mdi mdi-cart'></i> <span>Item </span></a></div></td>";
                tableBodyRow += "</tr>";

            }
            tableBody.Text = tableBodyRow;
        }

    }
}