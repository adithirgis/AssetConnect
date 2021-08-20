using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssetMaintenanceDTO
/// </summary>
public class AssetMaintenanceDTO
{
    public AssetMaintenanceDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //public LUT_Maintenance()
    //{
    //    this.LUT_Assets_Masters = new HashSet<LUT_Assets_Masters>();
    //}
        public int MID { get; set; }
    public string Maintenance { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }

    public virtual ICollection<LUT_Assets_Masters> LUT_Assets_Masters { get; set; }
}