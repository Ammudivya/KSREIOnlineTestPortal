using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Login
{
    public partial class Profile : System.Web.UI.Page
    {
        public int Login;
        public string mail;
        protected void Page_Load(object sender, EventArgs e)
        {

          

           
                mail = Convert.ToString(Session["Email"]);
                Login = Convert.ToInt32(Session["Login"]);
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs); con.Open();
                SqlCommand cmd = new SqlCommand("select student_name, student_mailid, student_dob, student_year, student_dept, student_clg from Student where student_mailid = @user", con);
                cmd.Parameters.AddWithValue("@user", mail);
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {

                    Label10.Text = Convert.ToString(sdr.GetValue(0));
                    Session["StudentName"] = Label10.Text;
                    Label11.Text = Convert.ToString(sdr.GetValue(1));
                    Label12.Text = Convert.ToString(sdr.GetValue(2));
                    Label13.Text = Convert.ToString(sdr.GetValue(5));
                    Label14.Text = Convert.ToString(sdr.GetValue(4));
                    Label15.Text = Convert.ToString(sdr.GetValue(3));
                }
                con.Close();
            }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Change_password.aspx");
        }
    }   
    }

    
