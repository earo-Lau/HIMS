using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HIMS.Admin.Orders
{
    public partial class Add : System.Web.UI.Page
    {
        #region Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }

        }

        protected void BindData()
        {
            var dateFrom = string.IsNullOrEmpty(txtDateFrom.Text) ? DateTime.Now : DateTime.Parse(txtDateFrom.Text);
            var dateTo = string.IsNullOrEmpty(txtDateTo.Text) ? DateTime.Now : DateTime.Parse(txtDateTo.Text);
            if (dateTo < dateFrom)
            {
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "dateError", "<script>alert('入住时间不能迟过离开时间')</script>");
                return;
            }

            var roomReader = DAO.DAOContainer.Singleton.GetReader<Data.RM_RoomsSet>("RoomSet");
            var rList = roomReader.Where(x => x.RM_StateSet.Value.Equals(1)
                && (!string.IsNullOrEmpty(txtRoomType.Text) ? x.Type.Contains(txtRoomType.Text) : true)
                && !x.RS_Order_RoomsSet.Any(or => 
                    (dateFrom < or.OM_OrdersSet.DateFrom && dateTo > or.OM_OrdersSet.DateFrom)
                    || (dateFrom < or.OM_OrdersSet.DateTo && dateTo > or.OM_OrdersSet.DateTo)
                    ));
            lv_Rooms.DataSource = rList.ToArray();
            lv_Rooms.DataBind();
        }
        #endregion

        #region Buttons
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindData();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var memberReader = DAO.DAOContainer.Singleton.GetReader<Data.AM_AccountsSet>("AccountSet");
            var member = memberReader.Single(x => x.Mobile.Equals(txtMobile.Text));
            if (member == null)
            {
                member = new Data.AM_AccountsSet()
                {
                    Name = txtMemberName.Text,
                    Mobile = txtMobile.Text,
                    Password = "",
                    AM_Role_RoleId = 3,
                    JoinTime = DateTime.Now,
                    UpdateTime = DateTime.Now
                };
                var memberWriter = DAO.DAOContainer.Singleton.GetWriter<Data.AM_AccountsSet>("AccountSet");

                memberWriter.Create(member);
            }

            var order = new Data.OM_OrdersSet()
            {
                AccountId = member.AccountId,
                AM_Accounts_AccountId = member.AccountId,
                CreateTime = DateTime.Now,
                DateFrom = DateTime.Parse(txtDateEnter.Text),
                DateTo = DateTime.Parse(txtDateLeave.Text),
                SID = 1
            };
            var orderWriter = DAO.DAOContainer.Singleton.GetWriter<Data.OM_OrdersSet>("OrderSet");
            orderWriter.Create(order);

            var or = new Data.RS_Order_RoomsSet()
            {
                RoomId = long.Parse(hidRoomId.Value),
                OrderId = order.OrderId,
                OM_Orders_OrderId = order.OrderId,
                RM_Rooms_RoomId = long.Parse(hidRoomId.Value)
            };
            var orWriter = DAO.DAOContainer.Singleton.GetWriter<Data.RS_Order_RoomsSet>("OrderSet");
            orWriter.Create(or);

            BindData();
        }
        #endregion


        #region listview
        protected void lv_Rooms_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Booking")
            {
                var index = e.Item.DisplayIndex;
                var roomId = lv_Rooms.DataKeys[index].Value.ToString();

                hidRoomId.Value = roomId;
                ClientScript.RegisterStartupScript(Page.GetType(), "modal", "<script>$('#" + BookingModal.ClientID + "').modal();</script>");
            }
        }


        #endregion

    }
}