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
    public partial class Scoreboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["Email"]);
            Response.Write(Session["TestId"]);
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();

            // int test_id = Convert.ToInt32(Session["TestId"]);
            // string mail_id = Convert.ToString(Session["Email"]);


            SqlCommand cmd = new SqlCommand("select Test_name,Crt_ans,Wrn_ans,Attended,Not_attended,Total_score,Total_Question from TestResult where Student_mailid = @var1 AND Test_id = @var2", con);
            cmd.Parameters.AddWithValue("@var1", Convert.ToString(Session["Email"]));
            cmd.Parameters.AddWithValue("@var2", Convert.ToInt32(Session["TestId"]));
            SqlDataReader sr = cmd.ExecuteReader();




            while (sr.Read())
            {
                Label3.Text = Convert.ToString(sr.GetValue(0));
                Label5.Text = Convert.ToString(sr.GetValue(6));
                Label7.Text = Convert.ToString(sr.GetValue(3));
                Label9.Text = Convert.ToString(sr.GetValue(4));
                Label11.Text = Convert.ToString(sr.GetValue(1));
                Label13.Text = Convert.ToString(sr.GetValue(2));
                Label15.Text = Convert.ToString(sr.GetValue(5));
                Session["TotalQuestion"] = Convert.ToInt32(sr.GetValue(6));
            }

            con.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select test_end_duration from TestDetails where test_id = @var1", con);
            cmd.Parameters.AddWithValue("@var1", Convert.ToInt32(Session["TestId"]));
            DateTime srk = Convert.ToDateTime(cmd.ExecuteScalar());
            
            DateTime sk = System.DateTime.Now;
            if (sk>=srk)
            {
                Session["RedirectCategory"] = "Scoreboard";
                Response.Redirect("CorrectAnswer.aspx");
            }
            else
            {
                Response.Write("<script>alert('Please wait untill the time end ')</script>");
            }
        }
    
}

}
    
