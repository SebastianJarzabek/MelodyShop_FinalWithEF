//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MelodyShop.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class purchaseHistory
    {
        public int id { get; set; }
        public Nullable<int> cartId { get; set; }
        public Nullable<System.DateTime> puchaseDate { get; set; }
        public string modyfity { get; set; }
        public Nullable<System.DateTime> modyfityDate { get; set; }
        public string created { get; set; }
        public Nullable<System.DateTime> createdDate { get; set; }
    
        public virtual Cart Cart { get; set; }
    }
}