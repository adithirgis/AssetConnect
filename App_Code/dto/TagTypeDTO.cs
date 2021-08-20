using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TagTypeDTO
/// </summary>
public class TagTypeDTO
{
    public TagTypeDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //public LUT_Tag_Type()
    //{
    //    this.LUT_Assets_Masters = new HashSet<LUT_Assets_Masters>();
    //}

    public int TID { get; set; }
    public string Tag_Type { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }

    public virtual ICollection<LUT_Assets_Masters> LUT_Assets_Masters { get; set; }
}