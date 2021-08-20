using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CurrentConditionDTO
/// </summary>
public class CurrentConditionDTO
{
    public CurrentConditionDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //public LUT_Current_Condition()
    //{
    //    this.LUT_Assets_Masters = new HashSet<LUT_Assets_Masters>();
    //}
        public int CCID { get; set; }
    public string Current_Condition { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }

    public virtual ICollection<LUT_Assets_Masters> LUT_Assets_Masters { get; set; }
}