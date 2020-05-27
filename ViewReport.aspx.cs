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
    public partial class ViewReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Convert.ToString(Session["StaffName"]);
            
            TableRow trow = new TableRow();
            TableCell tc = new TableCell();
            tc.Text = "TestsPosted";
            trow.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "View";
            trow.Cells.Add(tc);
            Table1.Rows.Add(trow);

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs); 
con.Open();

            SqlCommand cmd = new SqlCommand("select Test_id from TestDetails t join Staff s on conducted_by=staff_name where s.staff_id=@0", con);
            cmd.Parameters.AddWithValue("@0", Session["StaffId"]);
            SqlDataReader sr = cmd.ExecuteReader();
            while (sr.Read())
            {
                TableRow trow2 = new TableRow();
                TableCell tc2 = new TableCell();
                tc2.Text = Convert.ToString(sr.GetValue(0));
                trow2.Cells.Add(tc2);
                Button b = new Button();
                b.ID = "buttonid|" + sr.GetValue(0);
                b.Text = "Show";
                b.Click += this.bclick;
                tc2 = new TableCell();
                tc2.Controls.Add(b);
                trow2.Cells.Add(tc2);
                Table1.Rows.Add(trow2);
            }
            con.Close();

        }

        private void bclick(object sender, EventArgs e)
        {
            Button bb = sender as Button;
            Session["TestId"] = bb.ID.Split('|')[1];
            Response.Redirect("StudentReportStaff.aspx");
            throw new NotImplementedException();
        }
    }
}