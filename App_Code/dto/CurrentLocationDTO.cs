using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CurrentLocationDTO
/// </summary>
public class CurrentLocationDTO
{
    public CurrentLocationDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int CLID { get; set; }
    public Nullable<decimal> Current_Location_X { get; set; }
    public decimal Current_Location_Y { get; set; }
    public System.DateTime Last_Modified { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }
}