using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Spatial;
using System.Data.Entity.Validation;
using System.Data.Entity;
using System.IO;

public partial class LocateYourAsset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { }
        public class AssetLocations
    {
        public float Latitude { get; set; }
       // public float Current_Location_Y { get; set; }
        public float Longitude { get; set; }
        // public float Current_Location_X { get; set; }
        public DbGeometry GeographicPoint { get; set; }
    }
       protected void DDSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        Search.Visible = true;
        DDS.Items.Clear();
        if (DDSearch.SelectedValue == "Condition")
        {
            AssetTaggingEntities context = new AssetTaggingEntities();
            List<LUT_Current_Condition> CC = (from cc in context.LUT_Current_Condition where cc.IsDeleted == false select cc).ToList();
            DDS.DataTextField = "Current_Condition";
            DDS.DataValueField = "CCID";
            DDS.DataSource = CC;
            DDS.DataBind();
            DDS.Items.Insert(0, "Select Current Condition");
        }
        if (DDSearch.SelectedValue == "Status")
        {
            AssetTaggingEntities context = new AssetTaggingEntities();
            List<LUT_Current_Status> CS = (from cs in context.LUT_Current_Status where cs.IsDeleted == false select cs).ToList();
            DDS.DataTextField = "Current_Status";
            DDS.DataValueField = "CSID";
            DDS.DataSource = CS;
            DDS.DataBind();
            DDS.Items.Insert(0, "Select Current Status");
        }
        if (DDSearch.SelectedValue == "Asset Groups")
        {
            AssetTaggingEntities context = new AssetTaggingEntities();
            List<LUT_Asset_Groups> Ag = (from ag in context.LUT_Asset_Groups where ag.IsDeleted == false select ag).ToList();
            DDS.DataTextField = "Asset_Groups";
            DDS.DataValueField = "AGrpID";
            DDS.DataSource = Ag;
            DDS.DataBind();
            DDS.Items.Insert(0, " Select Asset Groups");
        }
     }
    public double ConvertDegreeAngleToDouble(double degrees, double minutes, double seconds)
    {
        var multiplier = (degrees < 0 ? -1 : 1);
        var _deg = (double)Math.Abs(degrees);
        var result = _deg + (minutes / 60) + (seconds / 3600);
        return result * multiplier;
    }
    //public double ConvertDegreeAngleToDouble(string point)
    //{
        
    //    var multiplier = (point.Contains("N") || point.Contains("E")) ? 1 : 1; //north and east
    //    point = Regex.Replace(point, "[^0-9.]", ""); 
    //    var pointArray = point.Split('°');
    //    var pointArray1 = point.Split('′');
    //    //var pointArray2 = point.Split('′′');
    //    var degrees = Double.Parse(pointArray[0]);
    //    var minutes = Double.Parse(pointArray[1]) / 60;
    //    var seconds = Double.Parse(pointArray[2]) / 3600;
    //    return (degrees + minutes + seconds) * multiplier;
    //}
}

