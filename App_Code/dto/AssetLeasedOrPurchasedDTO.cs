using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssetLeasedOrPurchasedDTO
/// </summary>
public class AssetLeasedOrPurchasedDTO
{
    public AssetLeasedOrPurchasedDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
      //public LUT_Asset_Leased_or_Purchased()
      //  {
      //      this.LUT_Assets_Masters = new HashSet<LUT_Assets_Masters>();
      //  }

        public int ALPID { get; set; }
        public string Asset_Leased_or_Purchased { get; set; }
        public string Description { get; set; }
        public bool IsDeleted { get; set; }

        public virtual ICollection<LUT_Assets_Masters> LUT_Assets_Masters { get; set; }
    }
