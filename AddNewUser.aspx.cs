using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestPortal
{
    public partial class AddNewUser : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("select college_name from CollegeDetails", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ddlCollege.DataSource = dt;
                ddlCollege.DataTextField = "college_name";
                ddlCollege.DataBind();
                ddlCollege.Items.Insert(0, new ListItem("--Select college--", "0"));
                //s1 = ddlCollege.SelectedItem.Value;
                cmd = new SqlCommand("select distinct company_name from InternCompany", con);
                sda = new SqlDataAdapter(cmd);
                DataTable dt1 = new DataTable();
                sda.Fill(dt1);
                ddlCompany.DataSource = dt1;
                ddlCompany.DataTextField = "company_name";

                ddlCompany.DataBind();
                con.Close();
                ddlCompany.Items.Insert(0, new ListItem("--Select company--", "0"));
            }
        }
        protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            ddlDepartment.Items.Clear();
            ddlDepartment.Items.Add("Select department");

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            string s1 = ddlCollege.SelectedItem.Value;

            SqlCommand cmd = new SqlCommand("select college_id from CollegeDetails where college_name=@0", con);
            cmd.Parameters.AddWithValue("@0", s1);
            int clg = Convert.ToInt32(cmd.ExecuteScalar());

            cmd = new SqlCommand("select department_name from DepartmentDetails where college_id=" + clg, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlDepartment.DataSource = dt;
            ddlDepartment.DataTextField = "department_name";
            ddlDepartment.DataBind();
            con.Close();

        }

        protected void btnStudent_Click(object sender, EventArgs e)
        {

            
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Student (student_name, student_mailid, student_dob, student_year, student_dept, student_clg, student_password) values(@sName,@sMail,@sDOB,@sYear,@sDept,@sClg,@sPassword)", con);
            cmd.Parameters.AddWithValue("@sName", txtStudentName.Text);
            cmd.Parameters.AddWithValue("@sMail", txtStudentMailId.Text);
            cmd.Parameters.AddWithValue("@sDOB", txtStudentDOB.Text);
            cmd.Parameters.AddWithValue("@sYear", ddlYear.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@sDept", ddlDepartment.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@sClg", ddlCollege.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@sPassword", txtStudentPassword.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            Response.Redirect("AdminHome.aspx");
        }
        protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDomain.Items.Clear();
            ddlDomain.Items.Add("Select domain");

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            string s1 = ddlCompany.SelectedItem.Value;

            SqlCommand cmd = new SqlCommand("select company_domain from InternCompany where company_name=@0 ", con);
            cmd.Parameters.AddWithValue("@0", s1);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlDomain.DataSource = dt;
            ddlDomain.DataTextField = "company_domain";
            ddlDomain.DataBind();
            con.Close();
           
        }

        protected void btnIntern_Click(object sender, EventArgs e)
        {

            
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select company_id from InternCompany where company_name=@iCompany AND company_domain=@iDomain", con);
            cmd.Parameters.AddWithValue("@iDomain", ddlDomain.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@iCompany", ddlCompany.SelectedItem.Value.ToString());
            int companyId = Convert.ToInt32(cmd.ExecuteScalar());
            cmd = new SqlCommand("insert into InternStudent (intern_name, intern_mailId, intern_dob,company_id,intern_batch, intern_password) values(@iName,@iMail,@iDOB,@iCompanyId,@iBatch,@iPassword)", con);
            cmd.Parameters.AddWithValue("@iName", txtInternName.Text);
            cmd.Parameters.AddWithValue("@iMail", txtInternMailId.Text);
            cmd.Parameters.AddWithValue("@iDOB", txtInternDOB.Text);
            cmd.Parameters.AddWithValue("@iCompanyId", companyId);
            cmd.Parameters.AddWithValue("@iBatch", ddlBatch.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@iPassword", txtInternPassword.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            Response.Redirect("AdminHome.aspx");
        }
        protected void btnStaff_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into InternStudent (staff_name, staff_mailId, staff_password) values(@sName,@sMail,@sPassword)", con);
            cmd.Parameters.AddWithValue("@sName", txtStaffName.Text);
            cmd.Parameters.AddWithValue("@sMail", txtStaffMailId.Text);
            cmd.Parameters.AddWithValue("@sPassword", txtStaffPassword.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            Response.Redirect("AdminHome.aspx");
        }
    }
}