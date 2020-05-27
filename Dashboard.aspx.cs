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
    public partial class Dashboard : System.Web.UI.Page
    {
        public int login;
        protected void Page_Load(object sender, EventArgs e)
        {
            Button ebtn;
            string institute = "";
            string domain = "";
            int batch=0;
            TableRow tr = new TableRow();
            TableCell tc = new TableCell();
            tc.Text = "Test Name";
            tr.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Test Type";
            tr.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Test Category";
            tr.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Conducted By";
            tr.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Duration";
            tr.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Take Test";
            tr.Cells.Add(tc);
            Table1.Rows.Add(tr);
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            if (Convert.ToInt32(Session["Login"]) == 1)
            {
                SqlCommand cmd = new SqlCommand("select student_year,student_dept,student_clg from Student where student_mailid=@mailId", con);
                cmd.Parameters.AddWithValue("@mailId", Convert.ToString(Session["email"]));
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    batch = Convert.ToInt32(sdr.GetValue(0));
                    domain = Convert.ToString(sdr.GetValue(1));
                    institute = Convert.ToString(sdr.GetValue(2));
                }
                con.Close();
                con.Open();
                cmd = new SqlCommand("select test_id,test_name,test_type,test_category,conducted_by,test_start_duration,test_end_duration from TestDetails where (conducted_to_college=@clg AND conducted_to_department=@dept AND conducted_to_year=@year)", con);
                cmd.Parameters.AddWithValue("@clg", institute);
                cmd.Parameters.AddWithValue("@dept", domain);
                cmd.Parameters.AddWithValue("@year", batch);
                sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    TableRow tr1 = new TableRow();
                    TableCell tc1 = new TableCell();
                    tc1.Text = Convert.ToString(sdr.GetValue(1));
                    tr1.Cells.Add(tc1);
                    tc1 = new TableCell();
                    tc1.Text = Convert.ToString(sdr.GetValue(2));
                    tr1.Cells.Add(tc1);
                    tc1 = new TableCell();
                    tc1.Text = Convert.ToString(sdr.GetValue(3));
                    tr1.Cells.Add(tc1);
                    tc1 = new TableCell();
                    tc1.Text = Convert.ToString(sdr.GetValue(4));
                    tr1.Cells.Add(tc1);
                    tc1 = new TableCell();
                    tc1.Text = Convert.ToString(sdr.GetValue(5)) + Convert.ToString(sdr.GetValue(6));
                    tr1.Cells.Add(tc1);
                    tc1 = new TableCell();
                    ebtn = new Button();
                    ebtn.ID = "editbtn|" + Convert.ToString(sdr.GetValue(0));
                    ebtn.Text = "Take Test";
                    ebtn.Click += this.btnclick1;
                    tc1 = new TableCell();
                    tc1.Controls.Add(ebtn);
                    tr1.Cells.Add(tc1);
                    Table1.Rows.Add(tr1);
                }
                con.Close();

            }
            if (Convert.ToInt32(Session["Login"]) == 2)
            {
                SqlCommand cmd = new SqlCommand("select company_name,company_domain,intern_batch from InternStudent INNER JOIN InternCompany on(InternStudent.company_id=InternCompany.company_id) where intern_mailId=@mailId", con);
                cmd.Parameters.AddWithValue("@mailId", Convert.ToString(Session["Email"]));
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    batch = Convert.ToInt32(sdr.GetValue(2));
                    domain = Convert.ToString(sdr.GetValue(1));
                    institute = Convert.ToString(sdr.GetValue(0));
                }
                con.Close();
                con.Open();
                cmd = new SqlCommand("select test_id,test_name,test_type,test_category,conducted_by,test_start_duration,test_end_duration from TestDetails where(conducted_to_college =@clg AND conducted_to_department=@dept AND conducted_to_year=@year )", con);
                cmd.Parameters.AddWithValue("@clg", institute);
                cmd.Parameters.AddWithValue("@dept", domain);
                cmd.Parameters.AddWithValue("@year", batch);
                sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    TableRow tr1 = new TableRow();
                    TableCell tc1 = new TableCell();
                    tc1.Text = Convert.ToString(sdr.GetValue(1));
                    tr1.Cells.Add(tc1);
                    tc1 = new TableCell();
                    tc1.Text = Convert.ToString(sdr.GetValue(2));
                    tr1.Cells.Add(tc1);
                    tc1 = new TableCell();
                    tc1.Text = Convert.ToString(sdr.GetValue(3));
                    tr1.Cells.Add(tc1);
                    tc1 = new TableCell();
                    tc1.Text = Convert.ToString(sdr.GetValue(4));
                    tr1.Cells.Add(tc1);
                    tc1 = new TableCell();
                    tc1.Text = Convert.ToString(sdr.GetValue(5)) + Convert.ToString(sdr.GetValue(6));
                    tr1.Cells.Add(tc1);
                    ebtn = new Button();
                    ebtn.ID = "editbtn|" + Convert.ToString(sdr.GetValue(0));
                    ebtn.Text = "Take Test";
                    ebtn.Click += this.btnclick1;
                    tc1 = new TableCell();
                    tc1.Controls.Add(ebtn);
                    tr1.Cells.Add(tc1);
                    Table1.Rows.Add(tr1);
                }
                con.Close();
            }

        }
        private void btnclick1(object sender, EventArgs e)
        {
            //throw new NotImplementedException();
            Button b = sender as Button;
            Session["TestId"] = b.ID.Split('|')[1];
            Response.Redirect("TakeTest.aspx");
        }
    }
    }