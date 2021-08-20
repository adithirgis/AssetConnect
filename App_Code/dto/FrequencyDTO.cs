using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FrequencyDTO
/// </summary>
public class FrequencyDTO
{
    public FrequencyDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //public LUT_Frequency()
    //{
    //    this.LUT_Assets_Masters = new HashSet<LUT_Assets_Masters>();
    //}
        public int FID { get; set; }
    public string Frequency { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }

    public virtual ICollection<LUT_Assets_Masters> LUT_Assets_Masters { get; set; }
}