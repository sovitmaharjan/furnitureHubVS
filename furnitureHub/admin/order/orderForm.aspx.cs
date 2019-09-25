using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace furnitureHub.admin.orderFrom {
    public partial class orderForm : System.Web.UI.Page {

        furnitureHub furnitureHubObject = new furnitureHub();

        public string baseUrl {

            get {

                return furnitureHubObject.baseUrl();
            }
        }

        protected void Page_Load(object sender, EventArgs e) {

            string id = Request.Params["d752ebede1f7f7cb0b54f0d726270929"];
            if(string.IsNullOrEmpty(id)) {

                string tblOrder = "tblOrder";
                DataTable dataTable = furnitureHubObject.getNewTableId(tblOrder);
                orderIdAspx.Value = dataTable.Rows[0]["id"].ToString();

                string tblCustomer = "tblCustomer";
                dataTable = furnitureHubObject.getNewTableId(tblCustomer);
                customerIdAspx.Value = dataTable.Rows[0]["id"].ToString();

                string tblPayment = "tblPayment";
                dataTable = furnitureHubObject.getNewTableId(tblPayment);
                paymentIdAspx.Value = dataTable.Rows[0]["id"].ToString();
            } else {

            }
        }

        public void saveClick(object sender, System.EventArgs e) {

            string orderDate = orderDateAspx.Value;
            int orderId = Convert.ToInt32(orderIdAspx.Value);
            int customerId = Convert.ToInt32(customerIdAspx.Value);
            string customerName = customerNameAspx.Value;
            string customerNumber = customerNumberAspx.Value;
            string customerAddress = customerAddressAspx.Value;

            string type = "";
            if(showroomVisitAspx.Checked) {

                type = showroomVisitAspx.Value;
            }
            if(homeVisitAspx.Checked) {

                type = homeVisitAspx.Value;
            }
            if(onlineOrderAspx.Checked) {

                type = onlineOrderAspx.Value;
            }
            if(phoneOrderAspx.Checked) {

                type = phoneOrderAspx.Value;
            }
            string fhMember = fhMemberAspx.Value;

            int paymentId = Convert.ToInt32(paymentIdAspx.Value);
            int totalAmount = Convert.ToInt32(totalAmountAspx.Value);
            int advance = Convert.ToInt32(advanceAspx.Value);
            string collectedBy = collectedByAspx.Value;
            int cash;
            int cheque;
            int bankDeposite;
            int creditCard;
            int ime;
            int online;
            int other;
            if(cashAspx.Checked) {

                cash = 1;
            } else {

                cash = 0;
            }
            if(chequeAspx.Checked) {

                cheque = 1;
            } else {

                cheque = 0;
            }
            if(bankDepositeAspx.Checked) {

                bankDeposite = 1;
            } else {

                bankDeposite = 0;
            }
            if(creditCardAspx.Checked) {

                creditCard = 1;
            } else {

                creditCard = 0;
            }
            if(imeAspx.Checked) {

                ime = 1;
            } else {

                ime = 0;
            }
            if(onlineAspx.Checked) {

                online = 1;
            } else {

                online = 0;
            }
            if(otherAspx.Checked) {

                other = 1;
            } else {

                other = 0;
            }
            string otherNotes = otherNotesAspx.Value;
            string exchangeDetails = exchangeDetailsAspx.Value;
            string productionForm;
            string factoryForm;
            if(productionFormYes.Checked) {

                productionForm = "yes";
            } else {

                productionForm = "no";
            }
            if(factoryFormYes.Checked) {

                factoryForm = "yes";
            } else {

                factoryForm = "no";
            }
            string asd = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string handledBy = handledByAspx.Value;

            furnitureHubObject.saveOrder(

                orderId,
                orderDate,
                customerId,

                customerName,
                customerNumber,
                customerAddress,
                type,
                fhMember,

                paymentId,
                totalAmount,
                advance,
                collectedBy,
                cash,
                cheque,
                bankDeposite,
                creditCard,
                ime,
                online,
                other,
                otherNotes,
                exchangeDetails,

                productionForm,
                factoryForm,
                handledBy
            );

            string itemIds = itemIdsAspx.Value;
            string[] itemId = itemIds.Split('|');
            string itemNames = itemNamesAspx.Value;
            string[] itemName = itemNames.Split('|');
            string dates = datesAspx.Value;
            string[] date = dates.Split('|');
            string prices = pricesAspx.Value;
            string[] price = prices.Split('|');
            int count = itemId.Length;
            int i;
            int j;
            int theItemId;
            for(i = 1; i <= count; i++) {

                j = i - 1;
                if(string.IsNullOrEmpty(itemId[j])) {

                    theItemId = 0;
                } else {

                    theItemId = Convert.ToInt32(itemId[j]);
                }
                DateTime theDateTemp = Convert.ToDateTime(date[j]);
                string theDate = theDateTemp.ToString("yyyy-MM-dd HH:mm:ss");

                furnitureHubObject.saveOrderItem(
                    theItemId,
                    itemName[j],
                    theDate,
                    Convert.ToInt32(price[j]),
                    orderId
                );
            }
            Response.Redirect("~/admin/order/orderList.aspx");
        }
    }
}