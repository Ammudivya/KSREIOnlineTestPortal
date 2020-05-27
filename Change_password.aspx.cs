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
    public partial class Change_password : System.Web.UI.Page
    {
        public String current;
        public int login_condition;
        protected void Page_Load(object sender, EventArgs e)
        {
            current = Convert.ToString(Session["current"]);
            login_condition = Convert.ToInt32(Session["Login"]);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
                if (TextBox1.Text == current)
                {
                    if (TextBox2.Text == TextBox3.Text)
                    {
                    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);
                        if (login_condition == 1)
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("Update Student Set student_password = '" + TextBox2.Text + "' where student_password= '" + TextBox1.Text + "'", con);
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                        else if (login_condition == 2)
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("Update Intern Set intern_password = '" + TextBox2.Text + "' where intern_password= '" + TextBox1.Text + "'", con);
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                        else if (login_condition == 3)
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("Update Staff Set staff_password = '" + TextBox2.Text + "' where staff_password= '" + TextBox1.Text + "'", con);
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                        Label4.Text = "Successfully Updated!!!";
                        Label4.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        Label4.Text = "New password mismatch with Confirm new password!!!";
                        Label4.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    Label4.Text = "Current Password is Wrong!!!";
                    Label4.ForeColor = System.Drawing.Color.Red;
                }
            }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login3.aspx");
        }
    }
    }

    