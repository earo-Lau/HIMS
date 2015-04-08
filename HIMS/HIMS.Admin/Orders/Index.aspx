<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="HIMS.Admin.Orders.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="index.html">订单管理</a></li>
        <li class="active">未完成订单</li>
    </ol>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <div class="form-group">
            <label for="<%: txtId.ClientID %>" class="col-sm-1 control-label">订单Id</label>
            <div class="col-sm-2">
                <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <label for="<%: txtMemberID.ClientID %>" class="col-sm-1 control-label">会员ID</label>
            <div class="col-sm-2">
                <asp:TextBox ID="txtMemberID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <label for="<%: txtMemberName.ClientID %>" class="col-sm-1 control-label">会员名</label>
            <div class="col-sm-2">
                <asp:TextBox ID="txtMemberName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label for="<%: txtRoomType.ClientID %>" class="col-sm-1 control-label">房间类型</label>
            <div class="col-sm-2">
                <asp:TextBox ID="txtRoomType" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <label for="<%: txtDateFrom.ClientID %>" class="col-sm-1 control-label">入住日期</label>
            <div class="col-sm-2">
                <div class="input-group date datepicker col-sm-12">
                    <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control"></asp:TextBox>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>

            <label for="<%: txtDateTo.ClientID %>" class="col-sm-1 control-label">离开日期</label>
            <div class="col-sm-2">
                <div class="input-group date datepicker col-sm-12">
                    <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control"></asp:TextBox>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
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
                            <th>会员ID</th>
                            <th>会员名</th>
                            <th>房间号</th>
                            <th>房间类型</th>
                            <th>入住时间</th>
                            <th>离开时间</th>
                            <th>状态</th>
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
                    <td><%# Eval("OrderId") %></td>
                    <td><%# Eval("AccountId") %></td>
                    <td><%# Eval("UserName") %></td>
                    <td><%# Eval("RoomNum") %></td>
                    <td><%# Eval("RoomType") %></td>
                    <td><%# Eval("DateFrom") %></td>
                    <td><%# Eval("DateTo") %></td>
                    <td><%# Eval("State") %></td>
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
                <td><%# Eval("OrderId") %></td>
                <td><%# Eval("AccountId") %></td>
                <td><%# Eval("UserName") %></td>
                <td><%# Eval("RoomNum") %></td>
                <td><%# Eval("RoomType") %></td>
                <td><%# Eval("DateFrom") %></td>
                <td><%# Eval("DateTo") %></td>
                <td>
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:LinkButton runat="server" CommandName="Cancel">
                        <i class="fa fa-undo"></i>
                    </asp:LinkButton>
                </td>
            </EditItemTemplate>
        </asp:ListView>
    </div>

</asp:Content>
