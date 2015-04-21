<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="State.aspx.cs" Inherits="HIMS.Admin.Rooms.State" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        $(function () {
            if ($('#<%=AddModal.ClientID%>').length > 0) {
                $('#<%=AddModal.ClientID%>').modal();
            }
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="index.html">房间信息管理</a></li>
        <li class="active">房间状态管理</li>
    </ol>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">

        <div class="col-lg-2 pull-right margin-bottom-15">
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-block btn-warning" Text="Add"
                OnClick="btnAdd_Click" />
        </div>
    </div>
    <div class="table-responsive">
        <asp:ListView ID="lvStates" runat="server" DataKeyNames="SID" OnItemEditing="lvStates_ItemEditing" OnItemCanceling="lvStates_ItemCanceling" OnItemDeleting="lvStates_ItemDeleting" OnItemUpdating="lvStates_ItemUpdating" OnItemDataBound="lvStates_ItemDataBound">
            <LayoutTemplate>
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>状态</th>
                            <th>是否可以入住</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                    </tbody>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("SID") %></td>
                    <td><%# Eval("Name") %></td>
                    <td>
                        <asp:Label ID="labValue" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit">
                            <i class="fa fa-pencil" title="编辑"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="lnkDel" runat="server" CommandName="Delete">
                            <i class="fa fa-times" title=""></i>
                        </asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <td><%# Eval("SID") %></td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:DropDownList ID="ddlValue" runat="server" CssClass="form-control">
                        <asp:ListItem Text="是" Value="1">
                        </asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:LinkButton runat="server" CommandName="Update">
                        <i class="fa fa-check"></i>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" CommandName="Cancel">
                        <i class="fa fa-undo"></i>
                    </asp:LinkButton>
                </td>
            </EditItemTemplate>
        </asp:ListView>
    </div>

    <!--Modal-->
    <div class="modal fade" id="AddModal" runat="server" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" visible="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增房间状态</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">

                        <div class="row form-group">
                            <label class="col-md-3 text-right">状态名称</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row form-group">
                            <label class="col-md-3 text-right">是否可以入住</label>
                            <div class="col-md-6">
                                <asp:DropDownList ID="ddlValue" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="是" Value="1">
                                    </asp:ListItem>
                                    <asp:ListItem Text="否" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-primary" ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" />
                    <asp:Button CssClass="btn btn-danger" ID="btnColse" Text="Close" data-dismiss="modal" runat="server" OnClick="btnColse_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
