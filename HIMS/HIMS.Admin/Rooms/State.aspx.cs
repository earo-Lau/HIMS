using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HIMS.Admin.Rooms
{
    public partial class State : System.Web.UI.Page
    {
        #region Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        public void BindData()
        {
            var reader = DAO.DAOContainer.Singleton.GetReader<Data.RM_StateSet>("RoomSet");

            lvStates.DataSource = reader.Get();
            lvStates.DataBind();
        }
        #endregion

        #region Buttons

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            this.AddModal.Visible = true;

        }

        protected void btnColse_Click(object sender, EventArgs e)
        {
            this.AddModal.Visible = false;
            BindData();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var writer = HIMS.DAO.DAOContainer.Singleton.GetWriter<Data.RM_StateSet>("RoomSet");

            var model = new Data.RM_StateSet()
            {
                Name = txtName.Text,
                Value = int.Parse(ddlValue.SelectedValue)
            };

            var result = writer.Create(model);

            if (result <= 0)
            {
                throw new Exception("数据库更新出错，请联系管理员！");
            }
            else
            {
                this.AddModal.Visible = false;
            }
            BindData();

        }

        #endregion

        #region ListView

        protected void lvStates_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lvStates.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void lvStates_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lvStates.EditIndex = -1;
            BindData();
        }

        protected void lvStates_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            var index = e.ItemIndex;

            var sid = long.Parse(lvStates.DataKeys[index].Value.ToString());
            var reader = DAO.DAOContainer.Singleton.GetReader<Data.RM_StateSet>("RoomSet");

            var state = reader.Single(x => x.SID.Equals(sid));

            var writer = DAO.DAOContainer.Singleton.GetWriter<Data.RM_StateSet>("RoomSet");
            var result = writer.Delete(state.SID);

            BindData();
        }

        protected void lvStates_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            var sid = long.Parse(e.Keys["SID"].ToString());

            var item = lvStates.EditItem;
            var txtName = item.FindControl("txtName") as TextBox;
            var ddlValue = item.FindControl("ddlValue") as DropDownList;

            var reader = DAO.DAOContainer.Singleton.GetReader<Data.RM_StateSet>("RoomSet");
            var state = reader.Single(x => x.SID.Equals(sid));

            state.Name = txtName.Text;
            state.Value = int.Parse(ddlValue.SelectedValue);

            var writer = DAO.DAOContainer.Singleton.GetWriter<Data.RM_StateSet>("RoomSet");
            var result = writer.Update(sid, state);
            if (result > 0)
            {
                lvStates.EditIndex = -1;
                BindData();
            }
            else
            {
            }
        }

        protected void lvStates_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var item = e.Item;
            if (item.DisplayIndex == lvStates.EditIndex)
            {
                var ddlValue = item.FindControl("ddlValue") as DropDownList;
                var txtName = item.FindControl("txtName") as TextBox;

                var sid = long.Parse(lvStates.DataKeys[item.DataItemIndex].Value.ToString());
                var reader = DAO.DAOContainer.Singleton.GetReader<Data.RM_StateSet>("RoomSet");

                var state = reader.Single(x => x.SID.Equals(sid));

                ddlValue.SelectedValue = state.Value.ToString();
                txtName.Text = state.Name;
            }
            else
            {
                var labValue = item.FindControl("labValue") as Label;
                labValue.Text = ((Data.RM_StateSet)item.DataItem).Value == 1 ? "是" : "否";
            }
        }
        #endregion


    }
}