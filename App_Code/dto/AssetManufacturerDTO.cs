using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssetManufacturerDTO
/// </summary>
public class AssetManufacturerDTO
{
    public AssetManufacturerDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
   
        //public LUT_Asset_Manufacturers()
        //{
        //    this.LUT_Assets_Masters = new HashSet<LUT_Assets_Masters>();
        //}

        public int MnfID { get; set; }
        public string Asset_Manufacturer { get; set; }
        public string Description { get; set; }
        public bool IsDeleted { get; set; }

        public virtual ICollection<LUT_Assets_Masters> LUT_Assets_Masters { get; set; }
    
}