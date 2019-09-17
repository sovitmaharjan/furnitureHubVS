using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace furnitureHub {
    public class furnitureHub {

        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString);

        public string baseUrl() {

            return "http://localhost:10001";
        }

        //--------------------------------------------registration--------------------------------------------
        public void register(string userName, string password) {
        

        }

        //--------------------------------------------global function somthing like that--------------------------------------------
        public DataTable queryFunction(string query) {

            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            connection.Close();
            return dataTable;
        }

        public void voidQueryFunction(string query) {

            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);
            connection.Close();
        }

        public DataTable getNewTableId(string tableName) {

            string query = "exec getNewTableId '" + tableName + "'";
            return queryFunction(query);
        }
        

        //--------------------------------------------customer--------------------------------------------
        public DataTable customerList() {

            string query = "select * from viewCustomer";
            return queryFunction(query);
        }


        //--------------------------------------------employee--------------------------------------------
        public DataTable employeeList() {

            string query = "select * from viewEmployee";
            return queryFunction(query);
        }

        public DataTable getEmployeeById(int id) {

            string query = "select * from viewEmployee where id =" + id;
            return queryFunction(query);
        }

        public DataTable itemList(int orderId) {

            string query = "select * from tblOrderDetail where orderId =" + orderId;
            return queryFunction(query);
        }

        //--------------------------------------------orderForm--------------------------------------------

        public DataTable orderFormList() {

            string query = "select * from viewOrder";
            return queryFunction(query);
        }

        public DataTable getNewOrderId() {

            string query = "exec getNewOrderId";
            return queryFunction(query);
        }

        public DataTable getNewCustomerId() {

            string query = "exec getNewCustomerId";
            return queryFunction(query);
        }

        public DataTable getNewPaymentId() {

            string query = "exec getNewPaymentId";
            return queryFunction(query);
        }

        public void saveOrder(

            int orderId,
            string orderDate,
            int customerId,
            string customerName,
            string customerNumber,
            string customerAddress,
            string type,
            string fhMember,

            int paymentId,
            int totalAmount,
            int advance,
            string collectedBy,
            int cash,
            int cheque,
            int bankDeposite,
            int creditCard,
            int ime,
            int online,
            int other,
            string otherNotes,
            string exchangeDetails,

            string productionForm,
            string factoryForm,
            string handledBy
        ) {
            string query = "exec saveOrder"
                + orderId + ", "
                + orderDate + ", "
                + customerId + ", "

                + customerName + ", "
                + customerNumber + ", "
                + customerAddress + ", "
                + type + ", "
                + fhMember + ", "

                + paymentId + ", "
                + totalAmount + ", "
                + advance + ", "
                + collectedBy + ", "
                + cash + ", "
                + cheque + ", "
                + bankDeposite + ", "
                + creditCard + ", "
                + ime + ", "
                + online + ", "
                + other + ", "
                + otherNotes + ", "
                + exchangeDetails + ", "

                + productionForm + ", "
                + factoryForm + ", "
                + handledBy;
            voidQueryFunction(query);
        }

        public void saveOrderDetail(

            int itemId,
            string itemName,
            string itemDate,
            int itemPrice,
            int orderId
        ) {
            string query = "exec saveOrder"
                + itemId + ", "
                + itemName + ", "
                + itemDate + ", "
                + itemPrice + ", "
                + orderId;
            voidQueryFunction(query);
        }
    }
}