//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace HIMS.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class OM_OrdersSet
    {
        public OM_OrdersSet()
        {
            this.RS_Order_RoomsSet = new HashSet<RS_Order_RoomsSet>();
        }
    
        public long OrderId { get; set; }
        public int SID { get; set; }
        public long AccountId { get; set; }
        public System.DateTime DateFrom { get; set; }
        public System.DateTime DateTo { get; set; }
        public System.DateTime CreateTime { get; set; }
        public long AM_Accounts_AccountId { get; set; }
    
        public virtual AM_AccountsSet AM_AccountsSet { get; set; }
        public virtual OM_StateSet OM_StateSet { get; set; }
        public virtual ICollection<RS_Order_RoomsSet> RS_Order_RoomsSet { get; set; }
    }
}
