using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssetGroups
/// </summary>
public class AssetGroups
{
    public AssetGroups()
    {
        //
        // TODO: Add constructor logic here
        //
    }
   
        //public LUT_Asset_Groups()
        //{
        //    this.LUT_Assets_Masters = new HashSet<LUT_Assets_Masters>();
        //    this.LUT_Sub_Group = new HashSet<LUT_Sub_Group>();
        //}

        public int AGrpID { get; set; }
        public string Asset_Groups { get; set; }
        public string Description { get; set; }
        public bool IsDeleted { get; set; }

        public virtual ICollection<LUT_Assets_Masters> LUT_Assets_Masters { get; set; }
        public virtual ICollection<LUT_Sub_Group> LUT_Sub_Group { get; set; }
    }
