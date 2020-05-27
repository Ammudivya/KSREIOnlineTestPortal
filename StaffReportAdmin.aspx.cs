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
    public partial class StaffReportAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TableRow tr = new TableRow();
            TableCell tc = new TableCell();
            tc.Text = "Staff_name";
            tr.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "TestPosted_Id";
            tr.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "TestPosted_name";
            tr.Cells.Add(tc);
            Table1.Rows.Add(tr);
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select staff_name,test_id,test_name from Staff s join TestDetails t on(s.staff_id=t.staff_id) group by staff_name,test_id,test_name", con);

            SqlDataReader sr = cmd.ExecuteReader();
            while (sr.Read())
            {
                TableRow tr2 = new TableRow();
                TableCell tc2 = new TableCell();
                tc2.Text = Convert.ToString(sr.GetValue(0));
                tr2.Cells.Add(tc2);
                tc2 = new TableCell();
                tc2.Text = Convert.ToString(sr.GetValue(1));
                tr2.Cells.Add(tc2);
                tc2 = new TableCell();
                tc2.Text = Convert.ToString(sr.GetValue(2));
                tr2.Cells.Add(tc2);
                Table1.Rows.Add(tr2);

            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }
    }
}