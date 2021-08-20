using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssetServiceProviderDTO
/// </summary>
public class AssetServiceProviderDTO
{
    public AssetServiceProviderDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //public LUT_Service_Provider_Of_Asset()
    //{
    //    this.LUT_Assets_Masters = new HashSet<LUT_Assets_Masters>();
    //}
        public int SPID { get; set; }
    public string Service_Provider_of_Asset { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }

    public virtual ICollection<LUT_Assets_Masters> LUT_Assets_Masters { get; set; }
}