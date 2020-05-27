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
    public partial class PostNewTestStudent : System.Web.UI.Page
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

    }
}