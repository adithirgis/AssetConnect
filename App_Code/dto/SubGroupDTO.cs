using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SubGroupDTO
/// </summary>
public class SubGroupDTO
{
    public SubGroupDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //public LUT_Sub_Group()
    //{
    //    this.LUT_Assets_Masters = new HashSet<LUT_Assets_Masters>();
    //}

    public int SGID { get; set; }
    public int AGrpID { get; set; }
    public string Sub_Group { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }

    public virtual LUT_Asset_Groups LUT_Asset_Groups { get; set; }
    public virtual ICollection<LUT_Assets_Masters> LUT_Assets_Masters { get; set; }
}