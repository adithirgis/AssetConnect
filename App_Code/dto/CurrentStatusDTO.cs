using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CurrentStatusDTO
/// </summary>
public class CurrentStatusDTO
{
    public CurrentStatusDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //public LUT_Current_Status()
    //{
    //    this.LUT_Assets_Masters = new HashSet<LUT_Assets_Masters>();
    //}
        public int CSID { get; set; }
    public string Current_Status { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }

    public virtual ICollection<LUT_Assets_Masters> LUT_Assets_Masters { get; set; }
}