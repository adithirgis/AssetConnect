using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FrequencyofAMCDTO
/// </summary>
public class FrequencyofAMCDTO
{
    public FrequencyofAMCDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int FAMCID { get; set; }
    public string Frequency_of_AMC { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }
}