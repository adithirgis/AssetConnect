using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssetLeasedToDTO
/// </summary>
public class AssetLeasedToDTO
{
    public AssetLeasedToDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    
        public int ALID { get; set; }
        public string Asset_Leased_To { get; set; }
        public string Description { get; set; }
        public bool IsDeleted { get; set; }
    }

