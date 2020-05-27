using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Login
{
    public partial class TestWithQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* session by priya for ref:
                   Session["TestDuration"] = "10";
                   Session["StudentId"] = "119";
                   Session["StudentName"] = "Reesha";
                   Session["Email"] = "Reesh01@gmail.com";
                   Session["TestId"] = "01";
                   Session["TestName"] = "c";
                   Session["UserCategory"] = "student";
                   Session["TotalQuestion"] = "20";*/
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            //SqlConnection con = new SqlConnection(@"server=172.16.5.110 \DESKTOP-RLL3JF9\SQLEXPRESS,1433;Database=KSREITestPortal;User Id=virtusa;password=virtusa");
            //string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select test_name,duration,total_mark from TestDetails where test_id=@testId ", con);
            cmd.Parameters.AddWithValue("@testId", Convert.ToInt32(Session["TestId"]));
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                Session["TestName"] = Convert.ToString(sdr.GetValue(0));
                Session["TestDuration"] = Convert.ToInt32(sdr.GetValue(1));
                Session["TotalMark"] = Convert.ToInt32(sdr.GetValue(2));
            }
            Label1.Text = Session["TestName"].ToString().ToUpper();

            con.Close();
            con.Open();
            cmd = new SqlCommand("select count(test_id) from QuestionAnswer where test_id=@testId ", con);
            cmd.Parameters.AddWithValue("@testId", Convert.ToInt32(Session["TestId"]));
            Session["TotalQuestion"] = Convert.ToInt32(cmd.ExecuteScalar());

            if (!SM1.IsInAsyncPostBack)
            {
                Session["TimeOut"] = DateTime.Now.AddMinutes(Convert.ToInt32(Session["TestDuration"])).ToString();
            }
            con.Close();
            if (!Page.IsPostBack)
            {

                con.Open();
                cmd = new SqlCommand("select * from QuestionAnswer where test_id=@testId", con);
                cmd.Parameters.AddWithValue("@testId", Convert.ToInt32(Session["TestId"]));
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                con.Close();
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            Result();
            Response.Redirect("ScoreBoard.aspx");
        }


        protected void timer1_tick(object sender, EventArgs e)
        {

            if (0 > DateTime.Compare(DateTime.Now, DateTime.Parse(Session["TimeOut"].ToString())))
            {
                lblTimer.Text = string.Format("Time Left: 00:{0}:{1}", ((Int32)DateTime.Parse(Session["TimeOut"].ToString()).Subtract(DateTime.Now).TotalMinutes).ToString(), ((Int32)DateTime.Parse(Session["TimeOut"].ToString()).Subtract(DateTime.Now).Seconds).ToString());
            }
            else
            {
                Result();
                timer1.Enabled = true;
                Session["RedirectCategory"] = "TestWithQuestion";
                Response.Redirect("ScoreBoard.aspx");

            }

        }
        void Result()
        {
            int crt_ans = 0, wrg_ans = 0, not_att = 0, tot_score = 0;
            String User_atte = "";

            foreach (RepeaterItem item in Repeater1.Items)
            {
                RadioButton rb1 = (RadioButton)item.FindControl("Option1");
                RadioButton rb2 = (RadioButton)item.FindControl("Option2");
                RadioButton rb3 = (RadioButton)item.FindControl("Option3");
                RadioButton rb4 = (RadioButton)item.FindControl("Option4");
                Label lb = (Label)item.FindControl("corrans");
                Label lb1 = (Label)item.FindControl("score");
                Label lb2 = (Label)item.FindControl("ques");

                if (rb1.Checked == true)
                {
                    User_atte += "option1#";
                    if (lb.Text.Equals("option1"))
                    {
                        crt_ans++;
                        tot_score += Convert.ToInt32(lb1.Text);

                    }
                    else
                    {
                        wrg_ans++;
                    }
                }
                else if (rb2.Checked == true)
                {
                    User_atte += "option2#";
                    if (lb.Text.Equals("option2"))
                    {
                        crt_ans++;
                        tot_score += Convert.ToInt32(lb1.Text);
                    }
                    else
                    {
                        wrg_ans++;
                    }
                }
                else if (rb3.Checked == true)
                {
                    User_atte += "option3#";
                    if (lb.Text.Equals("option3"))
                    {
                        crt_ans++;
                        tot_score += Convert.ToInt32(lb1.Text);
                    }
                    else
                    {
                        wrg_ans++;
                    }
                }
                else if (rb4.Checked == true)
                {
                    User_atte += "option4#";
                    if (lb.Text.Equals("option4"))
                    {
                        crt_ans++;
                        tot_score += Convert.ToInt32(lb1.Text);
                    }
                    else
                    {
                        wrg_ans++; ;
                    }
                }
                else
                {
                    User_atte += "NULL#";
                    not_att++;
                }
            }
             if (Convert.ToInt32(Session["Login"]) == 1)
             {
                 Session["UserCategory"] = "student";
             }
             else if (Convert.ToInt32(Session["Login"]) == 2)
             {
                 Session["UserCategory"] = "intern";
             }
            int flag = 0;
            Session["CorrectAnswers"] = crt_ans.ToString();
            Session["WrongAnswers"] = wrg_ans.ToString();
            Session["QuestionsNotAttended"] = not_att.ToString();
            Session["TotalScore"] = tot_score.ToString();
            Session["QuestionsAttended"] = (crt_ans + wrg_ans).ToString();
            Session["UserAnswers"] = User_atte;
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            //SqlConnection con = new SqlConnection(@"Server=172.16.5.110\localhost,1433;Database=KSREITestPortal;User Id=virtusa;password=virtusa");
            con.Open();
            SqlCommand cmd2 = new SqlCommand("select Student_id from TestResult where Student_mailid=@0 and Test_id=@1  ", con);
            cmd2.Parameters.AddWithValue("@0", Session["Email"].ToString());
            cmd2.Parameters.AddWithValue("@1", Convert.ToInt32(Session["TestId"]));
            SqlDataReader sr = cmd2.ExecuteReader();
            while (sr.Read())
            {
                flag++;
            }
            con.Close();
            con.Open();
            if (flag != 0)
            {
                SqlCommand cmd1 = new SqlCommand(" UPDATE TestResult SET Student_id=@0 ,Student_name=@1,Student_mailid=@2,Test_name=@3,Test_id=@4,Crt_ans=@5,Wrn_ans=@6,Attended=@7,Not_attended=@8,Total_score=@9,User_Atten=@10,Duration=@11,Student_category=@12,Total_Question=@13 where Student_mailid=@stu and Test_id=@tesi ", con);
                cmd1.Parameters.AddWithValue("@stu", Session["Email"].ToString());
                cmd1.Parameters.AddWithValue("@tesi", Convert.ToInt32(Session["TestId"]));

                cmd1.Parameters.AddWithValue("@0", Convert.ToInt32(Session["StudentId"]));
                cmd1.Parameters.AddWithValue("@1", Session["StudentName"].ToString());
                cmd1.Parameters.AddWithValue("@2", Session["Email"].ToString());
                cmd1.Parameters.AddWithValue("@3", Session["TestName"].ToString());
                cmd1.Parameters.AddWithValue("@4", Convert.ToInt32(Session["TestId"]));
                cmd1.Parameters.AddWithValue("@5", Convert.ToInt32(Session["CorrectAnswers"]));
                cmd1.Parameters.AddWithValue("@6", Convert.ToInt32(Session["WrongAnswers"]));
                cmd1.Parameters.AddWithValue("@7", Convert.ToInt32(Session["QuestionsAttended"]));
                cmd1.Parameters.AddWithValue("@8", Convert.ToInt32(Session["QuestionsNotAttended"]));
                cmd1.Parameters.AddWithValue("@9", Convert.ToInt32(Session["TotalScore"]));
                cmd1.Parameters.AddWithValue("@10", Session["UserAnswers"].ToString());
                cmd1.Parameters.AddWithValue("@11", Convert.ToInt32(Session["TestDuration"]));
                cmd1.Parameters.AddWithValue("@12", Session["UserCategory"].ToString());
                cmd1.Parameters.AddWithValue("@13", Convert.ToInt32(Session["TotalQuestion"]));

                cmd1.ExecuteNonQuery();
            }


            else if (flag == 0)
            {
                SqlCommand cmd = new SqlCommand(" insert into TestResult(Student_id,Student_name,Student_mailid,Test_name,Test_id,Crt_ans,Wrn_ans,Attended,Not_attended,Total_score,User_Atten,Duration,Student_category,Total_Question) values(@0,@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13)", con);
                cmd.Parameters.AddWithValue("@0", Convert.ToInt32(Session["StudentId"]));
                cmd.Parameters.AddWithValue("@1", Session["StudentName"].ToString());
                cmd.Parameters.AddWithValue("@2", Session["Email"].ToString());
                cmd.Parameters.AddWithValue("@3", Session["TestName"].ToString());
                cmd.Parameters.AddWithValue("@4", Convert.ToInt32(Session["TestId"]));
                cmd.Parameters.AddWithValue("@5", Convert.ToInt32(Session["CorrectAnswers"]));
                cmd.Parameters.AddWithValue("@6", Convert.ToInt32(Session["WrongAnswers"]));
                cmd.Parameters.AddWithValue("@7", Convert.ToInt32(Session["QuestionsAttended"]));
                cmd.Parameters.AddWithValue("@8", Convert.ToInt32(Session["QuestionsNotAttended"]));
                cmd.Parameters.AddWithValue("@9", Convert.ToInt32(Session["TotalScore"]));
                cmd.Parameters.AddWithValue("@10", Session["UserAnswers"].ToString());
                cmd.Parameters.AddWithValue("@11", Convert.ToInt32(Session["TestDuration"]));
                cmd.Parameters.AddWithValue("@12", Session["UserCategory"].ToString());
                cmd.Parameters.AddWithValue("@13", Convert.ToInt32(Session["TotalQuestion"]));
                cmd.ExecuteNonQuery();

            }
            con.Close();

        }

    }
}
