using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Login
{
    public partial class StaffHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnPsotNewTest_Click(object sender, EventArgs e)
        {
            Response.Redirect("PostNewTest.aspx");
        }

        protected void btnViewReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewReport.aspx");

        }

        protected void btnStudentsReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentReportStaffs.aspx");
        }
    }
}