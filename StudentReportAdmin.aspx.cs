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
    public partial class StudentReportAdmin : System.Web.UI.Page
    {
       int s_no = 0, dummysid = 1;
        public string college = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Lable3.Visible = false;
            Session["StaffName"] = "dhurga";
            Session["StaffId"] = 1;*/
            //Lable3.Text = "no one attended your test";
            //Label2.Text = Convert.ToString(Session["StaffName"]);
            //Label1.Text = Convert.ToString(Session["StaffId"]);
            int val = Convert.ToInt32(Session["StaffId"]);
            Button ebtn;
            TableRow row = new TableRow();
            TableCell c1 = new TableCell();
            c1.Text = "sno";
            row.Cells.Add(c1);
            TableCell c2 = new TableCell();
            c2.Text = "student name";
            row.Cells.Add(c2);

            TableCell c3 = new TableCell();
            c3.Text = "student mail";
            row.Cells.Add(c3);
            TableCell c4 = new TableCell();
            c4.Text = "test count";
            row.Cells.Add(c4);
            TableCell c5 = new TableCell();
            c5.Text = "average score";
            row.Cells.Add(c5);
            TableCell c7 = new TableCell();
            c7.Text = "student category";
            row.Cells.Add(c7);

            TableCell c6 = new TableCell();

            c6.Text = "show";
            row.Cells.Add(c6);
            Table1.Rows.Add(row);
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand sc1 = new SqlCommand("select Student_name,Student_mailid, count(Test_id) as test_taken , avg(Total_score) as avgg,Student_category,Test_id  from TestResult  group by Student_mailid, Student_name,Student_category,Test_id order by avgg desc", con);
            //sc1.Parameters.AddWithValue("@0", Convert.ToInt32(Session["StaffId"]));
            SqlDataReader sr1 = sc1.ExecuteReader();
            while (sr1.Read())
            {
                s_no++;
                TableRow tr = new TableRow();
                TableCell cell0 = new TableCell();
                cell0.Text = Convert.ToString(s_no);
                tr.Cells.Add(cell0);
                TableCell cell1 = new TableCell();
                cell1.Text = Convert.ToString(sr1.GetValue(0));
                tr.Cells.Add(cell1);
                TableCell cell2 = new TableCell();
                cell2.Text = Convert.ToString(sr1.GetValue(1));
                tr.Cells.Add(cell2);
                TableCell cell3 = new TableCell();
                cell3.Text = Convert.ToString(sr1.GetValue(2));
                tr.Cells.Add(cell3);
                TableCell cell4 = new TableCell();
                cell4.Text = Convert.ToString(sr1.GetValue(3));
                tr.Cells.Add(cell4);
                TableCell cell7 = new TableCell();
                cell7.Text = Convert.ToString(sr1.GetValue(4));
                tr.Cells.Add(cell7);
                Session["TestId"]= Convert.ToString(sr1.GetValue(5));
               TableCell cell5 = new TableCell();
                ebtn = new Button();
                ebtn.ID = "editbtn|" + cell2.Text;
                ebtn.Text = "show";
                ebtn.Click += this.btnclick1;
                cell5 = new TableCell();
                cell5.Controls.Add(ebtn);
                tr.Cells.Add(cell5);
                Table1.Rows.Add(tr);
            }
            if (s_no == 0)
            {
                Table1.Visible = false;
                //Label3.Visible = true;
            }
            con.Close();
        }
        private void btnclick1(object sender, EventArgs e)
        {
            //throw new NotImplementedException();
            Button b = sender as Button;
            Session["Email"] = b.ID.Split('|')[1];
           
            Response.Redirect("StudentTestScoreAdmin.aspx");
        }
    }

}