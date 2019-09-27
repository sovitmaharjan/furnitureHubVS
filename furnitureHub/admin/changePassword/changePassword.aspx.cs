using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace furnitureHub.admin.changePassword {
    public partial class changePassword : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        public void saveClick(object sender, EventArgs e) {

            string oldPassword = oldPasswordAspx.Value;
            string newPassword = newPasswordAspx.Value;
            string confirmPassword = confirmPasswordAspx.Value;
        }
    }
}