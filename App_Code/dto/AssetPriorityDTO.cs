using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssetPriorityDTO
/// </summary>
public class AssetPriorityDTO
{
    public AssetPriorityDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int APID { get; set; }
    public string Asset_Priority { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }
}