using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace furnitureHub.admin {
    public partial class furnitureHubAdmin: System.Web.UI.MasterPage {

        furnitureHub furnitureHubObject = new furnitureHub();

        public string baseUrl {

            get {

                return furnitureHubObject.baseUrl();
            }
        }

        protected void Page_Load(object sender, EventArgs e) {

        }
    }
}