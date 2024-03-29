﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

namespace furnitureHub {
    public class furnitureHub {

        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString);

        public string baseUrl() {

            return "http://localhost:10001";
        }

        //--------------------------------------------global function something like that--------------------------------------------
        public DataTable queryFunction(string query) {

            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            connection.Close();
            return dataTable;
        }

        //public void voidQueryFunction(string query) {

        //    connection.Open();
        //    SqlCommand command = new SqlCommand(query, connection);
        //    connection.Close();
        //}

        public DataTable rptAttendanceDataTest() {

            string query = "select * from rpt_attendance_data";
            return queryFunction(query);
        }

        //--------------------------------------------login--------------------------------------------
        public DataTable getLoginData(string userName, string password) {

            string query = "select * from tblUserList where userName = '" + userName + "' and password = '" + password + "'";
            return queryFunction(query);
        }
        
        //--------------------------------------------registration--------------------------------------------
        public DataTable register(int id, string userName, string password) {

            int status = 1;
            int type = 1;
            string query = "exec register '"
                + id + "', '"
                + userName + "', '"
                + password + "', '"
                + type + "', '"
                + status + "'";
            return queryFunction(query);
        }

        //--------------------------------------------generates new table id--------------------------------------------

        public DataTable getNewTableId(string tableName) {

            string query = "exec getNewTableId '" + tableName + "'";
            return queryFunction(query);
        }


        //--------------------------------------------customer--------------------------------------------
        public DataTable customerList() {

            string query = "select * from viewCustomer";
            return queryFunction(query);
        }

        public DataTable itemList(int orderId) {

            string query = "select * from tblOrderItem where orderId =" + orderId;
            return queryFunction(query);
        }

        //--------------------------------------------employee--------------------------------------------
        public DataTable employeeList() {

            string query = "select * from viewEmployee";
            return queryFunction(query);
        }

        //--------------------------------------------orderForm--------------------------------------------
        public DataTable orderList() {

            string query = "select * from viewOrder";
            return queryFunction(query);
        }

        public DataTable saveOrder(

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
            string query = "exec saveOrder '"
                + orderId + "', '"
                + orderDate + "', '"
                + customerId + "', '"
                + customerName + "', '"
                + customerNumber + "', '"
                + customerAddress + "', '"
                + type + "', '"
                + fhMember + "', '"
                + paymentId + "', '"
                + totalAmount + "', '"
                + advance + "', '"
                + collectedBy + "', '"
                + cash + "', '"
                + cheque + "', '"
                + bankDeposite + "', '"
                + creditCard + "', '"
                + ime + "', '"
                + online + "', '"
                + other + "', '"
                + otherNotes + "', '"
                + exchangeDetails + "', '"
                + productionForm + "', '"
                + factoryForm + "', '"
                + handledBy + "'";
            return queryFunction(query);
        }

        public DataTable saveOrderItem(

            int itemId,
            string itemName,
            string itemDate,
            int itemPrice,
            int orderId
        ) {
            string query = "exec saveOrderItem '"
                + itemId + "', '"
                + itemName + "', '"
                + itemDate + "', '"
                + itemPrice + "', '"
                + orderId + "'";
            return queryFunction(query);
        }
    }
}