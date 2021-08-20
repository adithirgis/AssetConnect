using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    

    protected void btnSignIn_Click(Object sender, EventArgs e)
        {
        LUT_Asset_Users ui = new LUT_Asset_Users() { UserID = txtUserID.Text, password = txtPassword.Text };
        UserInfoRepository repo = new UserInfoRepository();


        if (repo.Authenticate(ui))
        {
            Session["UserID"] = ui.UserID;//[key]
            Response.Redirect("AssetConnect.aspx");

        }
        //else
        //{
        //    Response.Write("Not Valid");
        //}

    }

    protected void btnForgotP_Click(object sender, EventArgs e)
    {
        Response.Redirect("ForgotPassword.aspx");
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration.aspx");
    }
}

//protected void btnSubmit_Click(object sender, EventArgs e)
//{
//    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
//    con.Open();
//    SqlCommand cmd = new SqlCommand("select * from UserInformation where UserName =@username and Password=@password", con);
//    cmd.Parameters.AddWithValue("@username", txtUserName.Text);
//    cmd.Parameters.AddWithValue("@password", txtPWD.Text);
//    SqlDataAdapter da = new SqlDataAdapter(cmd);
//    DataTable dt = new DataTable();
//    da.Fill(dt);
//    if (dt.Rows.Count > 0)
//    {
//        Response.Redirect("Details.aspx");
//    }
//    else
//    {
//        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password')</script>");
//    }
//} i
//in web config file
//    <connectionStrings>
//<add name = "dbconnection" connectionString="Data Source=SureshDasari;Integrated Security=true;Initial Catalog=MySampleDB"/>
//</connectionStrings>
//     namespace CRUDinMVC.Models
//{
//    public class StudentDBHandle
//    {
//        private SqlConnection con;
//        private void connection()
//        {
//            string constring = ConfigurationManager.ConnectionStrings["studentconn"].ToString();
//            con = new SqlConnection(constring);
//        }

//        // **************** ADD NEW STUDENT *********************
//        public bool AddStudent(StudentModel smodel)
//        {
//            connection();
//            SqlCommand cmd = new SqlCommand("AddNewStudent", con);
//            cmd.CommandType = CommandType.StoredProcedure;

//            cmd.Parameters.AddWithValue("@Name", smodel.Name);
//            cmd.Parameters.AddWithValue("@City", smodel.City);
//            cmd.Parameters.AddWithValue("@Address", smodel.Address);

//            con.Open();
//            int i = cmd.ExecuteNonQuery();
//            con.Close();

//            if (i >= 1)
//                return true;
//            else
//                return false;
//        }

//        // ********** VIEW STUDENT DETAILS ********************
//        public List<StudentModel> GetStudent()
//        {
//            connection();
//            List<StudentModel> studentlist = new List<StudentModel>();

//            SqlCommand cmd = new SqlCommand("GetStudentDetails", con);
//            cmd.CommandType = CommandType.StoredProcedure;
//            SqlDataAdapter sd = new SqlDataAdapter(cmd);
//            DataTable dt = new DataTable();

//            con.Open();
//            sd.Fill(dt);
//            con.Close();

//            foreach (DataRow dr in dt.Rows)
//            {
//                studentlist.Add(
//                    new StudentModel
//                    {
//                        Id = Convert.ToInt32(dr["Id"]),
//                        Name = Convert.ToString(dr["Name"]),
//                        City = Convert.ToString(dr["City"]),
//                        Address = Convert.ToString(dr["Address"])
//                    });
//            }
//            return studentlist;
//        }

//        // ***************** UPDATE STUDENT DETAILS *********************
//        public bool UpdateDetails(StudentModel smodel)
//        {
//            connection();
//            SqlCommand cmd = new SqlCommand("UpdateStudentDetails", con);
//            cmd.CommandType = CommandType.StoredProcedure;

//            cmd.Parameters.AddWithValue("@StdId", smodel.Id);
//            cmd.Parameters.AddWithValue("@Name", smodel.Name);
//            cmd.Parameters.AddWithValue("@City", smodel.City);
//            cmd.Parameters.AddWithValue("@Address", smodel.Address);

//            con.Open();
//            int i = cmd.ExecuteNonQuery();
//            con.Close();

//            if (i >= 1)
//                return true;
//            else
//                return false;
//        }

//        // ********************** DELETE STUDENT DETAILS *******************
//        public bool DeleteStudent(int id)
//        {
//            connection();
//            SqlCommand cmd = new SqlCommand("DeleteStudent", con);
//            cmd.CommandType = CommandType.StoredProcedure;

//            cmd.Parameters.AddWithValue("@StdId", id);

//            con.Open();
//            int i = cmd.ExecuteNonQuery();
//            con.Close();

//            if (i >= 1)
//                return true;
//            else
//                return false;
//        }
//    }
//}