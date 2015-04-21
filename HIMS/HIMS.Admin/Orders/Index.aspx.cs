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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = "订单管理";
                DataBind();
            }
        }

        protected void DataBind()
        {
            var reader = DAOContainer.Singleton.GetReader<Data.OM_OrdersSet>("OrderSet");
            lvOrders.DataSource = reader.Get();

            lvOrders.DataBind();
        }

        protected void lvOrders_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lvOrders.EditIndex = e.NewEditIndex;
            DataBind();
        }

        protected void lvOrders_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lvOrders.EditIndex = -1;
            DataBind();
        }

        protected void lvOrders_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {

        }
    }
}