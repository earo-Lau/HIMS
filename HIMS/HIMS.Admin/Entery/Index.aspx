<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="HIMS.Admin.Entery.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="index.html">首页</a></li>
        <li class="active">客户入住</li>
    </ol>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-lg-2 col-lg-offset-10">
        <input id="btnBooking" type="button" class="btn btn-primary" value="Booking Entry" />
    </div>

    <div class="table-responsive">
        <asp:ListView ID="lv_Rooms" runat="server" DataKeyNames="RoomId" OnItemCommand="lv_Rooms_ItemCommand">
            <LayoutTemplate>
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>房间号码</th>
                            <th>房间类型</th>
                            <th>价格</th>
                            <th>备注</th>
                            <th>是否有预订</th>
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
                    <td><%# Eval("Num") %></td>
                    <td><%# Eval("Type") %></td>
                    <td><%# Eval("Price") %></td>
                    <td><%# Eval("Remark") %></td>
                    <td><%# Eval("IsBooking") %></td>
                    <td>
                        <asp:Button CommandName="Booking" runat="server" CssClass="btn btn-success" Text="Booking"></asp:Button>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
