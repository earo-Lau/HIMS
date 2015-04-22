using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HIMS.Admin.Rooms
{
    public partial class Index : System.Web.UI.Page
    {
        #region Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitDDL();
                BindData();
            }
        }

        protected void InitDDL()
        {
            var reader = DAO.DAOContainer.Singleton.GetReader<Data.RM_StateSet>("RoomSet");
            var stateSource = reader.Get();
            
            ddlRoomState.DataSource = stateSource;
            ddlRoomState.DataBind();
            ddlRoomState.Items.Insert(0, new ListItem()
            {
                Text = "所有",
                Value = "-1"
            });

            ddlState.DataSource = stateSource;
            ddlState.DataBind();
        }

        protected void BindData()
        {
            var reader = DAO.DAOContainer.Singleton.GetReader<Data.RM_RoomsSet>("RoomSet");

            var roomList = reader.Where(x => (!string.IsNullOrEmpty(txtRoomNum.Text) ? x.Num.Contains(txtRoomNum.Text) : true)
                && (!string.IsNullOrEmpty(txtRoomType.Text) ? x.Type.Contains(txtRoomType.Text) : true)
                && (ddlRoomState.SelectedValue != "-1" ? x.RM_State_SID.ToString().Equals(ddlRoomState.SelectedValue) : true));

            lvRooms.DataSource = roomList;
            lvRooms.DataBind();
        }
        #endregion

        #region Buttons

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindData();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var writer = HIMS.DAO.DAOContainer.Singleton.GetWriter<Data.RM_RoomsSet>("RoomSet");

            var model = new Data.RM_RoomsSet()
            {
                Num = txtNum.Text,
                Type = txtType.Text,
                Price = int.Parse(txtPrice.Text),
                UpdateTime = DateTime.Now.ToLongDateString(),
                Remark = txtRemark.Text,
                RM_State_SID = int.Parse(ddlState.SelectedValue),
                Operator = "系统管理员"
            };

            var result = writer.Create(model);

            if (result <= 0)
            {
                throw new Exception("数据库更新出错，请联系管理员！");
            }
            else
            {
                
            }
            BindData();
        }

        #endregion

        #region ListView

        protected void lvRooms_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lvRooms.EditIndex = -1;
            BindData();
        }

        protected void lvRooms_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lvRooms.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void lvRooms_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            var index = e.ItemIndex;

            var roomId = long.Parse(lvRooms.DataKeys[index].Value.ToString());
            var reader = DAO.DAOContainer.Singleton.GetReader<Data.RM_RoomsSet>("RoomSet");

            var room = reader.Single(x => x.RoomId.Equals(roomId));

            var writer = DAO.DAOContainer.Singleton.GetWriter<Data.RM_RoomsSet>("RoomSet");
            var result = writer.Delete(room.RoomId);

            BindData();
        }

        protected void lvRooms_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (lvRooms.EditIndex >= 0)
            {
                var item = e.Item;
                if (item.DisplayIndex == lvRooms.EditIndex)
                {
                    var ddlState = item.FindControl("ddlState") as DropDownList;
                    var txtType = item.FindControl("txtType") as TextBox;
                    var txtPrice = item.FindControl("txtPrice") as TextBox;
                    var txtRemark = item.FindControl("txtRemark") as TextBox;

                    var roomId = long.Parse(lvRooms.DataKeys[item.DataItemIndex].Value.ToString());
                    var reader = DAO.DAOContainer.Singleton.GetReader<Data.RM_RoomsSet>("RoomSet");

                    var room = reader.Single(x => x.RoomId.Equals(roomId));

                    var stateReader = DAO.DAOContainer.Singleton.GetReader<Data.RM_StateSet>("RoomSet");
                    var stateSource = stateReader.Get();

                    ddlState.DataSource = stateSource;
                    ddlState.DataBind();
                    ddlState.SelectedValue = room.RM_State_SID.ToString();

                    txtType.Text = room.Type;
                    txtPrice.Text = room.Price.ToString();
                    txtRemark.Text = room.Remark;
                }
            }
        }

        protected void lvRooms_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            var roomId = long.Parse(e.Keys["RoomId"].ToString());

            var item = lvRooms.EditItem;
            var ddlState = item.FindControl("ddlState") as DropDownList;
            var txtType = item.FindControl("txtType") as TextBox;
            var txtPrice = item.FindControl("txtPrice") as TextBox;
            var txtRemark = item.FindControl("txtRemark") as TextBox;

            var reader = DAO.DAOContainer.Singleton.GetReader<Data.RM_RoomsSet>("RoomSet");
            var room = reader.Single(x => x.RoomId.Equals(roomId));

            room.RM_State_SID = int.Parse(ddlState.SelectedValue);
            room.Type = txtType.Text;
            room.Price = int.Parse(txtPrice.Text);
            room.Remark = txtRemark.Text;

            var writer = DAO.DAOContainer.Singleton.GetWriter<Data.RM_RoomsSet>("RoomSet");
            var result = writer.Update(roomId, room);
            if (result > 0)
            {
                lvRooms.EditIndex = -1;
                BindData();
            }
            else
            {
            }
        }
        #endregion
    }
}