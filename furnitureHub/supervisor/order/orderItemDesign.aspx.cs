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
        string filePathimage;
        int id = 0;
        string column = "";
        string value = "";
        int orderItemId = 0;
        int status = 0;
        protected void btnsave_Click(object sender, EventArgs e) {


            foreach(var file in FileUpload1.PostedFiles) {
                  if(FileUpload1.HasFile) {
                string fileName = FileUpload1.FileName;
                filePathimage = Server.MapPath("../../images/" + System.Guid.NewGuid() + fileName);
                FileUpload1.SaveAs(filePathimage);

                FileStream fs = new FileStream(filePathimage, FileMode.Open, FileAccess.Read);
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes(Convert.ToInt32(fs.Length));
                br.Close();
                fs.Close();
                  } else {
                //lblerrorRep.Visible = true;
                // lblerrorRep.Text = "Couldn't upload the file! Please try latter.";
                filePathimage = "";


                 }
                  furnitureHubObject.saveimage(id, column, value, orderItemId, filePathimage, status);
            }
            
        }
    }
}

        //}
   // }
//}