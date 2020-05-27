using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Login
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
            protected void btnTestReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("TestReportFirst.aspx");
        }

             protected void btnStudentReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentReportAdmin.aspx");
        }

              protected void btnStaffReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("StaffReportAdmin.aspx");

        }
        
    }
}