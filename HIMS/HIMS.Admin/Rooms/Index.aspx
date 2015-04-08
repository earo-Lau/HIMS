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
            <label for="<%: txtRoomNum.ClientID %>" class="col-sm-1 control-label">房间号码</label>
            <div class="col-sm-2">
                <asp:TextBox ID="txtRoomNum" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <label for="<%: txtRoomType.ClientID %>" class="col-sm-1 control-label">房间类型</label>
            <div class="col-sm-2">
                <asp:TextBox ID="txtRoomType" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <label for="<%: ddlRoomState.ClientID %>" class="col-sm-1 control-label">房间状态</label>
            <div class="col-sm-2">
                <asp:DropDownList ID="ddlRoomState" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-2 col-lg-offset-9">
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-block btn-primary" Text="Search" />
            </div>
        </div>
    </div>

    <div class="table-responsive">
        <asp:ListView ID="lvOrders" runat="server" OnItemEditing="lvOrders_ItemEditing" OnItemCanceling="lvOrders_ItemCanceling" OnItemDeleted="lvOrders_ItemDeleted">
            <LayoutTemplate>
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>房间号码</th>
                            <th>房间类型</th>
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
                    <td><%# Eval("State") %></td>
                    <td><%# Eval("Remark") %></td>
                    <td><%# Eval("UpdateTime") %></td>
                    <td>
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit">
                            <i class="fa fa-pencil" title="编辑"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="lnkDel" runat="server" CommandName="Deleted">
                            <i class="fa fa-times" title=""></i>
                        </asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <td><%# Eval("RoomId") %></td>
                <td><%# Eval("Num") %></td>
                <td><%# Eval("Type") %></td>
                <td>
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </td>
                <td><%# Eval("Remark") %></td>
                <td><%# Eval("UpdateTime") %></td>
                <td>
                    <asp:LinkButton runat="server" CommandName="Cancel">
                        <i class="fa fa-undo"></i>
                    </asp:LinkButton>
                </td>
            </EditItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
