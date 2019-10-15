using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace furnitureHub.admin {
    public partial class WebForm1 : System.Web.UI.Page {
        
        furnitureHub furnitureHubObject = new furnitureHub();

        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void Upload(object sender, EventArgs e) {

            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string contentType = FileUpload1.PostedFile.ContentType;
            using(Stream fs = FileUpload1.PostedFile.InputStream) {
                using(BinaryReader br = new BinaryReader(fs)) {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString;
                    using(SqlConnection con = new SqlConnection(constr)) {
                        string query = "INSERT INTO tblFiles VALUES (@Name, @ContentType, @Data)";
                        using(SqlCommand cmd = new SqlCommand(query)) {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@Name", filename);
                            cmd.Parameters.AddWithValue("@ContentType", contentType);
                            cmd.Parameters.AddWithValue("@Data", bytes);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
            }
            lblMessage.Text = "File uploaded successfully.";
        }

        public void txt(object sender, EventArgs e) {

            DataTable dataTable = furnitureHubObject.orderList();
            //string path = @"D:\test\test.dat";
            //if(!File.Exists(path)) {
            //    var file = File.Create(path);
            //    file.Close();
            //    TextWriter tw = new StreamWriter(path);
            //    foreach(DataRow value in dataTable.Rows) {

            //        tw.WriteLine(value["id"] + ", " + value["type"] + ", " + value["productionForm"] + ", " + value["customerId"] + ", " + value["customerName"] + ", " + value["customerNumber"]);
            //    }
            //    tw.Close();
            //}else {
            //    File.Delete(path);
            //    var file = File.Create(path);
            //    file.Close();
            //    TextWriter tw = new StreamWriter(path);
            //    foreach(DataRow value in dataTable.Rows) {

            //        tw.WriteLine(value["id"] + ", " + value["type"] + ", " + value["productionForm"] + ", " + value["customerId"] + ", " + value["customerName"] + ", " + value["customerNumber"]);
            //    }
            //    tw.Close();
            //}
            MemoryStream ms = new MemoryStream();
            TextWriter tw = new StreamWriter(ms);
            foreach(DataRow value in dataTable.Rows) {

                tw.WriteLine(value["id"] + ", " + value["orderDate"] + ", " + value["productionForm"] + ", " + value["customerName"] + ", " + value["customerNumber"]);
            }
            tw.Flush();
            byte[] bytes = ms.ToArray();
            ms.Close();

            Response.Clear();
            Response.ContentType = "application/force-download";
            Response.AddHeader("content-disposition", "attachment; filename=file.dat");
            Response.BinaryWrite(bytes);
            Response.End(); 
        }
    }
}