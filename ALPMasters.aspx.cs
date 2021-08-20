using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ALPMasters : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            lblUserID.Text = Convert.ToString(Session["UserID"]);
        }
        else
        {
            Response.Redirect("AssetC.aspx");
        }
    }
    protected void AlpV_ItemCommand(object sender, ListViewCommandEventArgs e) //item command event is raised when a button in the LV is clicked//args commandName and CommandArgument, CommandSource
    {//This enables us to perform a custom routine whenever this event occurs
        if (e.CommandName == "Deactivate")   //command name property of a button in order to invoke buit-in functions like edit, delete, select
        {
            //int index = Convert.ToInt32(e.CommandArgument); it identifies item itself
            ListViewItem item = e.Item; // ALPV.Items[index];  represents each item in a listview control
            int ALPID = Convert.ToInt32(((Label)item.FindControl("ALPIDLabel")).Text); //findcontrol searches the current naming container for a server control with the specifies id parameter
            AssetTaggingEntities context = new AssetTaggingEntities();
            //LUT_Current_Condition = new LUT_Current_Condition();
            var result = (from alp in context.LUT_Asset_Leased_or_Purchased where alp.ALPID == ALPID select alp).FirstOrDefault();
            if (result != null)
            {
                if (((Button)e.CommandSource).Text == "Deactivate")
                {
                    result.IsDeleted = true;
                    ((Button)e.CommandSource).Text = "Activate";  //command source- gets the source of command
                    foreach (Control ctrl in item.Controls) //Controls defines the properties methods and events that are shared by all ASP.NET server controls
                    {
                        if (ctrl is Label) //label displays a text on the page
                        {
                            ((Label)ctrl).ForeColor = System.Drawing.Color.Gray;
                        }
                    }
                }
                else
                {
                    result.IsDeleted = false;
                    ((Button)e.CommandSource).Text = "Deactivate";
                    foreach (Control ctrl in item.Controls)
                    {
                        if (ctrl is Label)
                        {
                            ((Label)ctrl).ForeColor = System.Drawing.Color.Black;
                        }
                    }
                }
                context.SaveChanges();
            }
            else
            {
                Response.Write("Record Not Found");
            }

        }
    }
    protected void AlpV_ItemDataBound(object sender, ListViewItemEventArgs e)  // item databound is for data binding modifies the values of data that are bound to it
    {    // listviewItemEventArgs object is passed to the event handler enables to access the properties of item that  is bound
        ListViewItem item = e.Item; // ALPV.Items[index];
        if (item.FindControl("IsDeleted") == null) //searches current naming container
        {
            return;
        }
        bool isDeleted = Convert.ToBoolean(((HiddenField)item.FindControl("IsDeleted")).Value);  //object gets or sets
        AssetTaggingEntities context = new AssetTaggingEntities();
        if (isDeleted)
        {
            ((Button)item.FindControl("Deactivate")).Text = "Activate";
            foreach (Control ctrl in item.Controls)
            {
                if (ctrl is Label)
                {
                    ((Label)ctrl).ForeColor = System.Drawing.Color.Gray;
                }
            }
        }
        else
        {
            ((Button)item.FindControl("Deactivate")).Text = "Deactivate";
            foreach (Control ctrl in item.Controls)
            {
                if (ctrl is Label)
                {
                    ((Label)ctrl).ForeColor = System.Drawing.Color.Black;
                }
            }
        }

    }

}