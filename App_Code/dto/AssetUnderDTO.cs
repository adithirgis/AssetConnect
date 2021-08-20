using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssetUnderDTO
/// </summary>
public class AssetUnderDTO
{
    public AssetUnderDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int AUID { get; set; }
    public string Asset_Under { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }
}