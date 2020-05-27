using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Login
{
    public partial class Profile1 : System.Web.UI.Page
    {
        public int Login;
        protected void Page_Load(object sender, EventArgs e)
        {
            Login = Convert.ToInt32(Session["Login"]);
            if (Login==1)
            {
                Response.Redirect("Profile_student.aspx");
            }
            else if(Login==2)
            {
                Response.Redirect("Profile_intern.aspx");
            }
        }
    }
}