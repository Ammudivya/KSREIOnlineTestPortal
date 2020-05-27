using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestPortal
{
    public partial class PostNewTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
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
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            string staffName = Convert.ToString(Session["StaffName"]);
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into TestDetails (test_name, test_type, test_category, test_start_duration, test_end_duration, conducted_by, conducted_to_college,conducted_to_department,conducted_to_year,duration,total_mark) values(@tName,@tType,@tCategory, @tStartDuration,@tEndDuration,@conductedBy,@conductedToClg,@conductedToDept,@conductedToYr,@duration,@totalMarks)", con);
            cmd.Parameters.AddWithValue("@tName", txtTestName.Text);
            cmd.Parameters.AddWithValue("@tType", ddlType.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@tCategory", txtCategory.Text);
            cmd.Parameters.AddWithValue("@tStartDuration", txtStartDuration.Text);
            cmd.Parameters.AddWithValue("@tEndDuration", txtEndDuration.Text);
            cmd.Parameters.AddWithValue("@conductedBy", "Gopal");
            cmd.Parameters.AddWithValue("@conductedToClg", ddlCollege.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@conductedToDept", ddlDepartment.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@conductedToYr", ddlYear.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@duration", Convert.ToInt32(txtDurationStudent.Text));
            cmd.Parameters.AddWithValue("@totalMarks", Convert.ToInt32(txtTotalMarksStudnet.Text));
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            Response.Redirect("StaffHome.aspx");
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

        protected void upload_Click(object sender, EventArgs e)
        {
            string staffName = Convert.ToString(Session["StaffName"]);
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into TestDetails (test_name, test_type, test_category, test_start_duration, test_end_duration, conducted_by, conducted_to_college,conducted_to_department,conducted_to_year,duration,total_mark) values(@tName,@tType,@tCategory, @tStartDuration,@tEndDuration,@conductedBy,@conductedToCmpny,@conductedToDomain,@conductedToBatch,@duration,@totalMarks)", con);
            cmd.Parameters.AddWithValue("@tName", txtTestNameIntern.Text);
            cmd.Parameters.AddWithValue("@tType", ddlTestTypeIntern.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@tCategory", txtTestCategoryIntern.Text);
            cmd.Parameters.AddWithValue("@tStartDuration", txtStartDuartionIntern.Text);
            cmd.Parameters.AddWithValue("@tEndDuration", txtEndDuartionIntern.Text);
            cmd.Parameters.AddWithValue("@conductedBy", "Gopal");
            cmd.Parameters.AddWithValue("@conductedToCmpny", ddlCompany.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@conductedToDomain", ddlDomain.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@conductedToBatch", ddlBatch.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@duration", Convert.ToInt32(txtDuration.Text));
            cmd.Parameters.AddWithValue("@totalMarks", Convert.ToInt32(txtTotalMarks.Text));
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            Response.Redirect("StaffHome.aspx");
        }
    }
}