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
    public partial class Login3 : System.Web.UI.Page
    {
        public int Login;
        public int count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Login = Convert.ToInt32(Session["Login"]);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

            if (Login == 1)
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("select student_mailid,student_id,student_name from Student where student_mailid=@user AND student_password=@pass", con);
                cmd.Parameters.AddWithValue("@user", TextBox1.Text);
                cmd.Parameters.AddWithValue("@pass", TextBox2.Text);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    count = 1;
                    String email = Convert.ToString(sdr.GetValue(0));
                    Session["email"] = email;
                    String id = Convert.ToString(sdr.GetValue(1));
                    Session["StudentId"] = id;
                    String name = Convert.ToString(sdr.GetValue(2));
                    Session["StudentName"] = name;
                    Response.Redirect("Dashboard.aspx");
                }
                if (count != 1)
                {
                    Label3.Text = "Invalid username or Invalid Password!!!!";
                }
                TextBox1.Text = "";
                TextBox2.Text = "";
                con.Close();
            }
            else if (Login == 2)
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("select intern_mailId,intern_id,intern_name from InternStudent where intern_mailId=@user AND intern_password=@pass", con);
                cmd.Parameters.AddWithValue("@user", TextBox1.Text);
                cmd.Parameters.AddWithValue("@pass", TextBox2.Text);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    count = 1;
                    String email = Convert.ToString(sdr.GetValue(0));
                    Session["email"] = email;
                    String id = Convert.ToString(sdr.GetValue(1));
                    Session["StudentId"] = id;
                    String name = Convert.ToString(sdr.GetValue(2));
                    Session["StudentName"] = name;
                    Response.Redirect("Dashboard.aspx");
                }
                if (count != 1)
                {
                    Label3.Text = "Invalid username or Invalid Password!!!!";
                }
                TextBox1.Text = "";
                TextBox2.Text = "";
                con.Close();
            }
            else if (Login == 3)
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("select staff_id,staff_name,staff_mailid from Staff where staff_mailid=@user AND staff_password=@pass", con);
                cmd.Parameters.AddWithValue("@user", TextBox1.Text);
                cmd.Parameters.AddWithValue("@pass", TextBox2.Text);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    count = 1;
                    String email = Convert.ToString(sdr.GetValue(2));
                    Session["email"] = email;
                    String id = Convert.ToString(sdr.GetValue(0));
                    Session["StaffId"] = id;
                    String name = Convert.ToString(sdr.GetValue(1));
                    Session["StaffName"] = name;
                    Response.Redirect("StaffHome.aspx");
                }
                if (count != 1)
                {
                    Label3.Text = "Invalid username or Invalid Password!!!!";
                }
                TextBox1.Text = "";
                TextBox2.Text = "";
                con.Close();
            }
            else if (Login == 4)
            {
                if (TextBox1.Text.Equals("admin123@gmail.com") && TextBox2.Text.Equals("admin"))
                {
                    count = 1;
                    Response.Redirect("AdminHome.aspx");
                }
                else
                {
                    Label3.Text = "Invalid username or Invalid Password!!!!";
                }
            }
            else
            {
                Label3.Text = "No Login account!!";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            

            if (TextBox1.Text == "" && TextBox2.Text == "")
            {
                Label3.Text = "Enter Username and Password then click change password Button!!!";
                Label3.ForeColor = System.Drawing.Color.Red;
            }
            else if(Login==1)
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("select student_password from Student where student_mailid=@user AND student_password=@pass", con);
                cmd.Parameters.AddWithValue("@user", TextBox1.Text);
                cmd.Parameters.AddWithValue("@pass", TextBox2.Text);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    count = 1;
                    String current = Convert.ToString(sdr.GetValue(0));
                    Session["current"] = current;
                    Response.Redirect("Change_password.aspx");
                }
                if (count != 1)
                {
                    Label3.Text = "Invalid username or Invalid Password!!!!";
                }
                TextBox1.Text = "";
                TextBox2.Text = "";
                con.Close();
            }
            else if (Login == 2)
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("select intern_password from InternStudent where intern_mailId=@user AND intern_password=@pass", con);
                cmd.Parameters.AddWithValue("@user", TextBox1.Text);
                cmd.Parameters.AddWithValue("@pass", TextBox2.Text);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    count = 1;
                    String current = Convert.ToString(sdr.GetValue(0));
                    Session["current"] = current;
                    Response.Redirect("Change_password.aspx");
                }
                if (count != 1)
                {
                    Label3.Text = "Invalid username or Invalid Password!!!!";
                }
                TextBox1.Text = "";
                TextBox2.Text = "";
                con.Close();
            }
            else if (Login == 3)
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("select staff_password from Staff where staff_mailid=@user AND staff_password=@pass", con);
                cmd.Parameters.AddWithValue("@user", TextBox1.Text);
                cmd.Parameters.AddWithValue("@pass", TextBox2.Text);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    count = 1;
                    String current = Convert.ToString(sdr.GetValue(0));
                    Session["current"] = current;
                    Response.Redirect("Change_password.aspx");
                }
                if (count != 1)
                {
                    Label3.Text = "Invalid username or Invalid Password!!!!";
                }
                TextBox1.Text = "";
                TextBox2.Text = "";
                con.Close();
            }
            else if (Login == 4)
            {
                Label3.Text = "Can't change admin password!!!";
            }
            
        }
    }
    }
