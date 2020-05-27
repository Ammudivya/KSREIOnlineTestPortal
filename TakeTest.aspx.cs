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
    public partial class TakeTest : System.Web.UI.Page
    {
        public string min;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["StudentId"]);
            Response.Write(Session["TestId"]);
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select test_name,test_type, test_category,duration,total_mark from TestDetails where test_id=@testId", con);
            cmd.Parameters.AddWithValue("@testId", Convert.ToInt32(Session["TestId"]));
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                lblTestName.Text = Convert.ToString(sdr.GetValue(0));
                lblTestType.Text = Convert.ToString(sdr.GetValue(1));
                lblTestCategory.Text = Convert.ToString(sdr.GetValue(2));
                min = Convert.ToString(sdr.GetValue(3));
                lblTestDuration.Text = min + " " + "Minutes";
                lblTotalMarks.Text = Convert.ToString(sdr.GetValue(4));
            }
            con.Close();
            con.Open();
            cmd = new SqlCommand("select count(test_id) from QuestionAnswer where test_id=@testId", con);
            cmd.Parameters.AddWithValue("@testId", Convert.ToInt32(Session["TestId"]));
            int questionCount = Convert.ToInt32(cmd.ExecuteScalar());
            lblTotalQuestions.Text = Convert.ToString(questionCount);
            con.Close();
        }
        protected void btnTakeTest_Click1(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select student_id from TestResult where (test_id = @var1 AND student_id=@var2)", con);
            cmd.Parameters.AddWithValue("@var1", Convert.ToInt32(Session["TestId"]));
            cmd.Parameters.AddWithValue("@var2", Convert.ToInt32(Session["StudentId"]));
            int studentID = Convert.ToInt32(cmd.ExecuteScalar());
            
                if (studentID != 0)
                {
                Response.Redirect("Scoreboard.aspx");
                
                }
                else
                {
                Response.Redirect("TestWithQuestion.aspx");
            }
            
            
        }
    }
    
}