using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CameraStatusDTO
/// </summary>
public class CameraStatusDTO
{
    public CameraStatusDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int CaSID { get; set; }
    public string Camera_Status { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }
}