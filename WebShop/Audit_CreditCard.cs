//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebShop
{
    using System;
    using System.Collections.Generic;
    
    public partial class Audit_CreditCard
    {
        public int AuditID { get; set; }
        public int CreditCardID { get; set; }
        public string OldIBANCode { get; set; }
        public string NewIBANCode { get; set; }
        public string OldCreditCardName { get; set; }
        public string NewCreditCardName { get; set; }
        public Nullable<long> OldCreditCardNumber { get; set; }
        public Nullable<long> NewCreditCardNumber { get; set; }
        public Nullable<int> OldCreditCardMonth { get; set; }
        public Nullable<int> NewCreditCardMonth { get; set; }
        public Nullable<int> OldCreditCardYear { get; set; }
        public Nullable<int> NewCreditCardYear { get; set; }
        public Nullable<int> OldCCV { get; set; }
        public Nullable<int> NewCCV { get; set; }
        public Nullable<int> OldFK_CustomerID { get; set; }
        public Nullable<int> NewFK_CustomerID { get; set; }
        public string HostName { get; set; }
        public int HostID { get; set; }
        public string OperatingSystemUser { get; set; }
        public int OperatingSystemID { get; set; }
        public System.DateTime updated_at { get; set; }
        public string operation { get; set; }
    }
}
