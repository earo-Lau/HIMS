using HIMS.DAO;
using HIMS.DAO.OrdersServer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HIMS.Admin.Orders
{
    public partial class Index : System.Web.UI.Page
    {
        protected int state = 1;

        #region Load
        protected void Page_Load(object sender, EventArgs e)
        {
            SetState();
            if (!IsPostBack)
            {
                Page.Title = "订单管理";
                BindData();
            }
        }

        protected void SetState()
        {
            var s = Request.QueryString["s"];
            switch (s)
            {
                case "Finish":
                    state = 2;
                    break;
                case "Cancel":
                    state = 3;
                    break;
                default:
                    state = 1;
                    break;
            }
        }

        protected void BindData()
        {
            var orderId = !string.IsNullOrEmpty(txtId.Text) ? int.Parse(txtId.Text) : 0;
            var memberId = !string.IsNullOrEmpty(txtMemberID.Text) ? int.Parse(txtMemberID.Text) : 0;

            var dateFrom = string.IsNullOrEmpty(txtDateFrom.Text) ? DateTime.Now : DateTime.Parse(txtDateFrom.Text);
            var dateTo = string.IsNullOrEmpty(txtDateTo.Text) ? DateTime.Now : DateTime.Parse(txtDateTo.Text);

            var reader = DAOContainer.Singleton.GetReader<Data.OM_OrdersSet>("OrderSet");
            var orders = reader.Where(x => x.SID.Equals(state)
                && (orderId != 0 ? x.OrderId.Equals(orderId) : true)
                && (memberId != 0 ? x.AM_Accounts_AccountId.Equals(memberId) : true)
                && (!string.IsNullOrEmpty(txtMemberName.Text) ? x.AM_AccountsSet.Name.Contains(txtMemberName.Text) : true)
                && (!string.IsNullOrEmpty(txtDateFrom.Text) ? x.DateFrom > dateFrom : true)
                && (!string.IsNullOrEmpty(txtDateTo.Text) ? x.DateTo < dateTo : true)
                );
            var dataSource = AggretedSource(orders);
            dataSource = dataSource.Where(x => (!string.IsNullOrEmpty(txtRoomType.Text) ? x.RoomType.Contains(txtRoomType.Text) : true)).ToList();

            lvOrders.DataSource = dataSource;
            lvOrders.DataBind();
        }
        #endregion

        #region Buttons

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindData();
        }
        #endregion

        #region ListView

        protected void lvOrders_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            var orderId = Convert.ToInt64(e.Keys["OrderId"]);

            var writer = DAO.DAOContainer.Singleton.GetWriter<Data.OM_OrdersSet>("OrderSet");
            var result = writer.Delete(orderId);

            BindData();
        }
        #endregion

        #region Method
        protected IList<OrderViewModal> AggretedSource(IEnumerable<Data.OM_OrdersSet> orders)
        {
            var viewModel = new List<OrderViewModal>();
            foreach (var order in orders)
            {
                foreach (var O_R in order.RS_Order_RoomsSet)
                {
                    var roomReader = DAO.DAOContainer.Singleton.GetReader<Data.RM_RoomsSet>("RoomSet");
                    var room = roomReader.Get(O_R.RM_Rooms_RoomId);

                    viewModel.Add(new OrderViewModal()
                    {
                        OrderId = order.OrderId,
                        AccountId = order.AM_AccountsSet.AccountId,
                        DateFrom = order.DateFrom,
                        DateTo = order.DateTo,
                        MemberName = order.AM_AccountsSet.Name,
                        MemberMobile = order.AM_AccountsSet.Mobile,
                        RoomNum = room.Num,
                        RoomType = room.Type,
                        State = order.OM_StateSet.Name
                    });
                }
            }
            return viewModel;
        }

        protected class OrderViewModal
        {
            public long OrderId { get; set; }
            public long AccountId { get; set; }
            public string MemberName { get; set; }
            public string MemberMobile { get; set; }
            public string RoomNum { get; set; }
            public string RoomType { get; set; }
            public DateTime DateFrom { get; set;}
            public DateTime DateTo { get; set; }
            public string State { get; set; }
        }
        #endregion


    }
}