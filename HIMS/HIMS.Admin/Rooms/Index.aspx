<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="HIMS.Admin.Rooms.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <ol class="breadcrumb">
        <li class="active"><a href="index.html">房间信息管理</a></li>
    </ol>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <div class="form-group">
            <label for="<%: txtRoomNum.ClientID %>" class="col-md-1 control-label">房间号码</label>
            <div class="col-md-3">
                <asp:TextBox ID="txtRoomNum" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <label for="<%: txtRoomType.ClientID %>" class="col-md-1 control-label">房间类型</label>
            <div class="col-md-3">
                <asp:TextBox ID="txtRoomType" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <label for="<%: ddlRoomState.ClientID %>" class="col-md-1 control-label">房间状态</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlRoomState" runat="server" CssClass="form-control"
                    DataTextField="Name" DataValueField="SID">
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-2 col-lg-offset-8">
                <button type="button" class="btn btn-block btn-warning" onclick="$('#<%=AddModal.ClientID%>').modal();">
                    Add
                </button>
            </div>
            <div class="col-lg-2">
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-block btn-primary" Text="Search" OnClick="btnSearch_Click" />
            </div>
        </div>
    </div>

    <div class="table-responsive">
        <asp:ListView ID="lvRooms" runat="server" DataKeyNames="RoomId" OnItemEditing="lvRooms_ItemEditing" OnItemCanceling="lvRooms_ItemCanceling" OnItemDataBound="lvRooms_ItemDataBound" OnItemDeleting="lvRooms_ItemDeleting"
            OnItemUpdating="lvRooms_ItemUpdating">
            <LayoutTemplate>
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>房间号码</th>
                            <th>房间类型</th>
                            <th>价钱</th>
                            <th>房间状态</th>
                            <th>备注</th>
                            <th>最后更新时间</th>
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
                    <td><%# Eval("RoomId") %></td>
                    <td><%# Eval("Num") %></td>
                    <td><%# Eval("Type") %></td>
                    <td><%# Eval("Price") %></td>
                    <td><%# Eval("RM_StateSet.Name") %></td>
                    <td><%# Eval("Remark") %></td>
                    <td><%# Eval("UpdateTime") %></td>
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
                <td><%# Eval("RoomId") %></td>
                <td><%# Eval("Num") %></td>
                <td>
                    <asp:TextBox ID="txtType" runat="server"></asp:TextBox></td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></td>
                <td>
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control"
                        DataTextField="Name" DataValueField="SID">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="txtRemark" runat="server"></asp:TextBox></td>
                <td><%# Eval("UpdateTime") %></td>
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
    <div class="modal fade" id="AddModal" runat="server" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增房间</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">

                        <div class="row form-group">
                            <label class="col-md-3 text-right">房间号码</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtNum" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row form-group">
                            <label class="col-md-3 text-right">房间类型</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtType" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row form-group">
                            <label class="col-md-3 text-right">价格</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row form-group">
                            <label class="col-md-3 text-right">房间状态</label>
                            <div class="col-md-6">
                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control"
                                    DataTextField="Name" DataValueField="SID">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="row form-group">
                            <label class="col-md-3 text-right">备注</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-primary" ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" />
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
