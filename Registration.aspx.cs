using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Data.Entity.Validation;

public partial class Registration : System.Web.UI.Page
{

    //private const int c_UserID = 0;
    //private const int c_Password = 1; // to get data from grid put constants so that you need not see and write the row nos u can just assign names given here so any change change only here
    //private const int c_SecurityQ = 2;
    //private const int c_SecurityA = 3;
    //private const int c_EmailID = 4;
    //private const int c_PhoneNo = 5;
    //private const int c_Name =6;
    

    protected void Page_Load(object sender, EventArgs e)
    {

        //if (!IsPostBack)
        //{
        //    Bindgrid();
        //}

    }

    //private void Bindgrid()
    //{

    //    UserInfoRepository repo = new UserInfoRepository();
    //    GridView1.DataSource = repo.getAssetUsers();
    //    GridView1.DataBind();
    //}

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AssetC.aspx");  // or we can close this
    }

    //protected void btnClear_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("Registration.aspx");  //refresh button
    //}

    protected void btnSave_Click(object sender, EventArgs e)
    {
        LUT_Asset_Users ui = new LUT_Asset_Users() {   };
        ui.NameOfUser = txtName.Text;
        ui.PhoneNo = txtPhoneNo.Text;
        ui.UserID = txtUserID.Text;
        ui.password = txtPassword.Text;// check whether the passwrd is correct then write
        
        if (ui.password == txtConfirmP.Text)
        {
            ui.EmailID = txtEmailID.Text;
            ui.SecurityQ = txtSecurityQ.Text;
            ui.SecurityA = txtSecurityA.Text;
            AssetTaggingEntities context = new AssetTaggingEntities();
            context.LUT_Asset_Users.Add(ui);
            context.SaveChanges();
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Registration successful.');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Could not match password! Try again.');", true);
            //Response.Redirect("Registration.aspx");
        }
         
        
          // ui.SecurityQ = txtSecurityQ.Text;
        //ui.SecurityA = txtSecurityA.Text;
        //AssetTaggingEntities context = new AssetTaggingEntities();
        //   context.LUT_AssetUsers.Add(ui);
        //    context.SaveChanges();
        //    Response.Write("record added");
    }

   
    //    protected void SelectButton(object sender, EventArgs e) //give select option in the grid as selectbutton event in properties using properties of grid selectindexchanged
    //    {
    //    GridViewRow row = GridView1.SelectedRow;  //any gridview source code
    //    txtUserID.Text = row.Cells[c_UserID].Text;
    //    txtName.Text = row.Cells[c_Name].Text;
    //    txtSecurityQ.Text = row.Cells[c_SecurityQ].Text;
    //    //txtSecurityQ.Text = (row.FindControl("SecurityQ") as Label).Text;
    //    txtEmailID.Text = row.Cells[c_EmailID].Text;
    //    txtSecurityA.Text = row.Cells[c_SecurityA].Text;
    //    txtPassword.Text = row.Cells[c_Password].Text;
    //    txtPhoneNo.Text = row.Cells[c_PhoneNo].Text;
    //}



    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        LUT_Asset_Users ui = new LUT_Asset_Users();
        int usid = Convert.ToInt32(txtUsID.Text);
            var result = (from u in context.LUT_Asset_Users where u.UsID == usid select u).FirstOrDefault();
        if (result != null)
        {
            result.SecurityA = txtSecurityA.Text;
            result.NameOfUser = txtName.Text;
            result.SecurityQ = txtSecurityQ.Text;
            result.password = txtPassword.Text;
            result.EmailID = txtEmailID.Text;
            result.PhoneNo = txtPhoneNo.Text;
            result.UserID = txtUserID.Text;
            context.SaveChanges();
            Response.Write("Record changed");//label
        }
        else
        {
            Response.Write("Record Not Found");
        }
    }

    protected void btnAlrR_Click(object sender, EventArgs e)
    {
        Response.Redirect("LogIn.aspx");
    }
   
}