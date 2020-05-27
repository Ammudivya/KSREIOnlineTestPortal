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
    public partial class StudentTestScoreAdmin : System.Web.UI.Page
    {
        public int s_no3 = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label2.Text = Convert.ToString(Session["StaffName"]);
            //Label1.Text = Convert.ToString(Session["StaffId"]);
            Button ebtn;
            TableRow row = new TableRow();
            TableCell c1 = new TableCell();
            c1.Text = "sno";
            row.Cells.Add(c1);
            TableCell c2 = new TableCell();
            c2.Text = "test name";
            row.Cells.Add(c2);
            TableCell c4 = new TableCell();
            c4.Text = "test id";
            row.Cells.Add(c4);
            TableCell c3 = new TableCell();
            c3.Text = " test score";
            row.Cells.Add(c3);
            TableCell c5 = new TableCell();
            c5.Text = "Student id";
            row.Cells.Add(c5);
            TableCell c6 = new TableCell();
            c6.Text = "show";
            row.Cells.Add(c6);
            Table1.Rows.Add(row);


            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand sc1 = new SqlCommand("select Test_name,Test_id,Total_score,Student_mailid from TestResult where  Student_mailid=@0 ", con);
            sc1.Parameters.AddWithValue("@0", Convert.ToString(Session["Email"]));


            SqlDataReader sr1 = sc1.ExecuteReader();
            while (sr1.Read())
            {
                s_no3++;
                TableRow tr = new TableRow();
                TableCell cell0 = new TableCell();
                cell0.Text = Convert.ToString(s_no3);
                tr.Cells.Add(cell0);
                TableCell cell3 = new TableCell();
                cell3.Text = Convert.ToString(sr1.GetValue(0));
                tr.Cells.Add(cell3);
                TableCell cell1 = new TableCell();
                cell1.Text = Convert.ToString(sr1.GetValue(1));
                tr.Cells.Add(cell1);
                TableCell cell2 = new TableCell();
                cell2.Text = Convert.ToString(sr1.GetValue(2));
                tr.Cells.Add(cell2);
                TableCell cell7 = new TableCell();
                cell7.Text = Convert.ToString(sr1.GetValue(3));
                tr.Cells.Add(cell7);
                TableCell cell5 = new TableCell();

                ebtn = new Button();
                ebtn.ID = "editbtn|" + sr1.GetValue(1) + "|" + sr1.GetValue(3);
                ebtn.Text = "show";
                ebtn.Click += this.btnclick1;
                cell5 = new TableCell();
                cell5.Controls.Add(ebtn);
                tr.Cells.Add(cell5);
                Table1.Rows.Add(tr);
            }



            con.Close();


        }
        private void btnclick1(object sender, EventArgs e)
        {
            //throw new NotImplementedException();
            Button b = sender as Button;
            Session["TestId"] = b.ID.Split('|')[1];
            Session["Email"] = b.ID.Split('|')[2];
            Session["RedirectCategory"] = "StudentTestScoreAdmin";
            Response.Redirect("Scoreboard.aspx");
        }
    }

    /*  protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
      {
      }*/
}