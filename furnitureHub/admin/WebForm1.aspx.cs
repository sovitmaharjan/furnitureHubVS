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

            DataTable dataTable = furnitureHubObject.rptAttendanceDataTest();
            MemoryStream ms = new MemoryStream();
            TextWriter tw = new StreamWriter(ms);
            string date = Convert.ToDateTime(dataTable.Rows[0]["tdate"]).ToString("yyyy-MM-dd");
            string[] splitDate = date.Split('-');
            string yy = splitDate[0];
            string mm = splitDate[1];
            foreach(DataRow value in dataTable.Rows) {

                string tdate = Convert.ToDateTime(value["tdate"]).ToString("yyyy-MM-dd");
                string[] splitTdate = tdate.Split('-');
                string finalTdate = splitTdate[0] + splitTdate[1] + splitTdate[2];
                string status;
                string time;
                if(string.IsNullOrEmpty(value["OT_Values"].ToString())) {

                    if(string.IsNullOrEmpty(value["InTime"].ToString())) {

                        status = "ABS";
                        time = "0";
                    } else {

                        status = "PRE";
                        time = "1";
                    }
                }else {

                    status = "OT";
                    TimeSpan spWorkMin = TimeSpan.FromMinutes(Convert.ToInt32(value["OT_Values"]));
		            time = spWorkMin.ToString(@"h\.mm");
                }
                tw.WriteLine(value["Emp_id"] + "," +finalTdate + "," + status + "," + time);
            }
            tw.Flush();
            byte[] bytes = ms.ToArray();
            ms.Close();

            Response.Clear();
            Response.ContentType = "application/force-download";
            Response.AddHeader("content-disposition", "attachment; filename=file" + yy + mm + ".dat");
            Response.BinaryWrite(bytes);
            Response.End();
        }
    }
}