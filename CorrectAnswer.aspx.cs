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
    public partial class CorrectAnswer : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["RedirectCategory"]).Equals("StudentTestScoreStaff"))
            {
                Response.Redirect("StudentTestScoreStaff.aspx");
            }
            else if (Convert.ToString(Session["RedirectCategory"]).Equals("StudentTestScoreAdmin"))
            {
                Response.Redirect("StudentTestScoreAdmin.aspx");
            }
            else 
            {
                Response.Redirect("Scoreboard.aspx");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int test_id = Convert.ToInt32(Session["TestId"]);            
            string mail_id = Convert.ToString(Session["Email"]);            
            string userAttended = "";
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cm2 = new SqlCommand("select User_Atten from TestResult where Student_mailid = @var1 and test_id = @var2", con);
            cm2.Parameters.AddWithValue("@var1", mail_id);
            cm2.Parameters.AddWithValue("@var2", test_id);
            userAttended = Convert.ToString(cm2.ExecuteScalar());
            string[] option = userAttended.Split('#');
            string[] options = new string[(option.Length) - 1];
            //Response.Write("previous " + option.Length);
            //Response.Write("After " + options.Length);
            for (int x = 0; x < options.Length; x++)
            {
                options[x] = option[x];
            }
            int total_questions = Convert.ToInt32(Session["TotalQuestion"]);           
            string[] ques = new string[total_questions];
            int j = 0;
            string[] ans = new string[total_questions];
            int i = 0;
            //Response.Write("total qs :" + total_questions);
            SqlCommand cmd1 = new SqlCommand("select test_question from QuestionAnswer where test_id = @var1", con);
            cmd1.Parameters.AddWithValue("@var1", test_id);
            SqlDataReader sr5 = cmd1.ExecuteReader();
            while (sr5.Read())
            {              
                {
                    ques[j] = Convert.ToString(sr5.GetValue(0));
                }
                j++;
            }
            con.Close();
            con.Open();
           SqlCommand cmd2 = new SqlCommand("select test_correctAns from QuestionAnswer where test_id = @var1", con);
            cmd2.Parameters.AddWithValue("@var1", test_id);
            SqlDataReader sr2 = cmd2.ExecuteReader();
            while (sr2.Read())
            {
                // if (i < total_questions - 1)
                {
                    ans[i] = Convert.ToString(sr2.GetValue(0));
                }
                i++;
            }
            con.Close();
            con.Open();
            SqlCommand cmd3 = new SqlCommand("select test_option1,test_option2,test_option3,test_option4 from QuestionAnswer where test_id = @var1", con);
            cmd3.Parameters.AddWithValue("@var1", test_id);
            SqlDataReader sr3 = cmd3.ExecuteReader();

            string[] o1 = new string[total_questions];
            string[] o2 = new string[total_questions];
            string[] o3 = new string[total_questions];
            string[] o4 = new string[total_questions];
            int k = 0;
            while (sr3.Read())
            {            
                {
                    o1[k] = Convert.ToString(sr3.GetValue(0));
                    o2[k] = Convert.ToString(sr3.GetValue(1));
                    o3[k] = Convert.ToString(sr3.GetValue(2));
                    o4[k] = Convert.ToString(sr3.GetValue(3));
                }
                k++;
            }
            String op1 = "a)";
            String op2 = "b)";
            String op3 = "c)";
            String op4 = "d)";
            string appropriateans = "    Appropriate Answer:";
            string crctans = "correct answer";
            string wrngans = "        your answer";
            string unattend = "               unattended";

            for (int m = 0, n = 0; m < total_questions && n < total_questions; m++, n++)
            {
                String z = Convert.ToString(m + 1);
                String a1, a2 = "";
                if (options[m] == "NULL") // null option
                {
                    if (ans[m].Equals("option1"))    // crct ans 1
                    {
                        a1 =  o1[m] + crctans;
                        ques[m] += unattend;
                        Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + a1 + "</br>" + op2 + o2[m] + "</br>" + op3 + o3[m] + "</br>" + op4 + o4[m] + "</br>");                        
                    }
                    else
                    {
                        if (ans[m].Equals("option2")) // crct ans 2
                        {
                            a1 =  o2[m] + crctans;
                            ques[m] += unattend;
                            Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + o1[m] + "</br>" + op2 + a1 + "</br>" + op3 + o3[m] + "</br>" + op4 + o4[m] + "</br>");                           
                        }
                        else if (ans[m].Equals("option3")) // crct ans 3
                        {
                            a1 = o3[m] + crctans;
                            ques[m] += unattend;
                            Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + o1[m] + "</br>" + op2 + o2[m] + "</br>" + op3 + a1 + "</br>" + op4 + o4[m] + "</br>");                           
                        }
                        else if (ans[m].Equals("option4")) // crct ans 4
                        {
                            a1 = o4[m] + crctans;
                            ques[m] += unattend;
                            Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + o1[m] + "</br>" + op2 + o2[m] + "</br>" + op3 + o3[m] + "</br>" + op4 + a1 + "</br>");                           
                        }
                    }
                } 
                else
                {
                    if (options[m].Equals(ans[m]))   // crct ans
                    {

                        if (ans[m].Equals("option1")) //op1
                        {
                            a1 =  o1[m] + crctans;
                            Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + a1 + "</br>" + op2 + o2[m] + "</br>" + op3 + o3[m] + "</br>" + op4 + o4[m] + "</br>");                            
                        }
                        else
                        {
                            if (ans[m].Equals("option2")) //op2
                            {
                                a1 =  o2[m] + crctans;
                                Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + o1[m] + "</br>" + op2 + a1 + "</br>" + op3 + o3[m] + "</br>" + op4 + o4[m] + "</br>");                               
                            }
                            else if (ans[m].Equals("option3")) //op3
                            {
                                a1 =o3[m] + crctans;
                                Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + o1[m] + "</br>" + op2 + o2[m] + "</br>" + op3 + a1 + "</br>" + op4 + o4[m] + "</br>");                             
                            }
                            else if (ans[m].Equals("option4")) //op4
                            {
                                a1 = o4[m] + crctans;
                                Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + o1[m] + "</br>" + op2 + o2[m] + "</br>" + op3 + o3[m] + "</br>" + op4 + a1 + "</br>");                               
                            }
                        }
                    } 
                    else    
                    {
                        if (ans[m].Equals("option1"))   //crct op1
                        {
                            a1 =o1[m] + crctans;
                            if (options[m].Equals("option2")) //crct op1 wrng 2
                            {
                                a2 = o2[m] + wrngans;
                                Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + a1 + "</br>" + op2 + a2 + "</br>" + op3 + o3[m] + "</br>" + op4 + o4[m] + "</br>");                               
                            }
                            else
                            {
                                if (options[m].Equals("option3")) //crct op1 wrng 3
                                {
                                    a2 = o3[m] + wrngans;
                                    Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + a1 + "</br>" + op2 + o2[m] + "</br>" + op3 + a2 + "</br>" + op4 + o4[m] + "</br>");                                  
                                }
                                else 
                                {
                                    a2 = o4[m] + wrngans;
                                    Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + a1 + "</br>" + op2 + o2[m] + "</br>" + op3 + o3[m] + "</br>" + op4 + a2 + "</br>");                                   
                                }
                            }
                        }
                        else
                        {
                            if (ans[m].Equals("option2")) //crct op2
                            {
                                a1 =o2[m] + crctans;
                                if (options[m].Equals("option1")) //crct op2 wrng 1
                                {
                                    a2 = o1[m] + wrngans;
                                    Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + a2 + "</br>" + op2 + a1 + "</br>" + op3 + o3[m] + "</br>" + op4 + o4[m] + "</br>");
                                    
                                }
                                else
                                {
                                    if (options[m].Equals("option3")) //crct op1 wrng 3
                                    {
                                        a2 = o3[m] + wrngans;
                                        Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + o1[m] + "</br>" + op2 + a1 + "</br>" + op3 + a2 + "</br>" + op4 + o4[m] + "</br>");
                                        
                                    }
                                    else //crct op1 wrng 4
                                    {
                                        a2 = o4[m] + wrngans;
                                        Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + o1[m] + "</br>" + op2 + a1 + "</br>" + op3 + o3[m] + "</br>" + op4 + a2 + "</br>");                                        
                                    }
                                }
                            }
                            if (ans[m].Equals("option3")) //crct op3
                            {
                                a1 = o3[m] + crctans;
                                if (options[m].Equals("option1")) //crct op3 wrng 1
                                {
                                    a2 = o1[m] + wrngans;
                                    Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + a2 + "</br>" + op2 + o2[m] + "</br>" + op3 + a1 + "</br>" + op4 + o4[m] + "</br>");                               
                                }
                                else
                                {
                                    if (options[m].Equals("option2")) //crct op3 wrng 2
                                    {
                                        a2 = o2[m] + wrngans;
                                        Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + o1[m] + "</br>" + op2 + a2 + "</br>" + op3 + a1 + "</br>" + op4 + o4[m] + "</br>");                                      
                                    }
                                    else 
                                    {
                                        a2 = o4[m] + wrngans;
                                        Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + o1[m] + "</br>" + op2 + o2[m] + "</br>" + op3 + a1 + "</br>" + op4 + a2 + "</br>");                                       
                                    }
                                }
                            }
                            else 
                            {
                                a1 = o4[m] + crctans;
                                if (options[m].Equals("option1")) //crct op4 wrng 1
                                {
                                    a2 = o1[m] + wrngans;
                                    Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + a2 + "</br>" + op2 + o2[m] + "</br>" + op3 + o3[m] + "</br>" + op4 + a1 + "</br>");                                  
                                }
                                else
                                {
                                    if (options[m].Equals("option2")) //crct op4 wrng 2
                                    {
                                        a2 = o2[m] + wrngans;
                                        Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + o1[m] + "</br>" + op2 + a2 + "</br>" + op3 + o3[m] + "</br>" + op4 + a1 + "</br>");                                       
                                    }
                                    else //crct op4 wrng 3
                                    {
                                        a2 = o3[m] + wrngans;
                                        Response.Write(z + "." + ques[m] + "</br>" + "</br>" + appropriateans + "</br>" + "</br>" + op1 + o1[m] + "</br>" + op2 + o2[m] + "</br>" + op3 + a2 + "</br>" + op4 + a1 + "</br>");                                       
                                    }
                                }
                            }
                        }
                    }
                }
            }
            con.Close();
        }
    }
}
    
