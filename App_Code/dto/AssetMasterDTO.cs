using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssetMasterDTO
/// </summary>
public class AssetMasterDTO
{
    public AssetMasterDTO()
    {
       //constructor
    }
       public int AID { get; set; }
        public string Name_of_Asset { get; set; }
        public int AGrpID { get; set; }
        public int SGID { get; set; }
        public int MnfID { get; set; }
        public int SPID { get; set; }
        public System.DateTime Date_of_Purchase { get; set; }
        public Nullable<System.DateTime> Date_of_Disposal { get; set; }
        public double Purchase_Price { get; set; }
        public int FID { get; set; }
        public byte[] Photo_of_Asset { get; set; }
        public decimal Location_X { get; set; }
        public decimal Location_Y { get; set; }
        public int CSID { get; set; }
        public int CCID { get; set; }
        public string Model { get; set; }
        public string Sub_Model { get; set; }
        public string Description { get; set; }
        public int TID { get; set; }
        public double Depriciation_Value { get; set; }
        public bool Warranty { get; set; }
        public bool AMC { get; set; }
        public bool PM { get; set; }
        public bool QR { get; set; }
        public bool NFC { get; set; }
        public bool GPS { get; set; }
        public bool Camera { get; set; }
        public bool Barcode { get; set; }
        public int ALPID { get; set; }
        public bool Maintenance { get; set; }
        public int MID { get; set; }
        public bool RFID { get; set; }

        public virtual LUT_Asset_Groups LUT_Asset_Groups { get; set; }
        public virtual LUT_Asset_Leased_or_Purchased LUT_Asset_Leased_or_Purchased { get; set; }
        public virtual LUT_Asset_Manufacturers LUT_Asset_Manufacturers { get; set; }
        public virtual LUT_Current_Status LUT_Current_Status { get; set; }
        public virtual LUT_Frequency LUT_Frequency { get; set; }
        public virtual LUT_Maintenance LUT_Maintenance { get; set; }
        public virtual LUT_Service_Provider_Of_Asset LUT_Service_Provider_Of_Asset { get; set; }
        public virtual LUT_Sub_Group LUT_Sub_Group { get; set; }
        public virtual LUT_Tag_Type LUT_Tag_Type { get; set; }
        public virtual LUT_Current_Condition LUT_Current_Condition { get; set; }
    }


   
       
    

