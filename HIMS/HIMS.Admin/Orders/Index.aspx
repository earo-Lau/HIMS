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
    <div class="form-inline">
        <div class="form-group">
            <label for="<%: txtId.ClientID %>">订单Id：</label>
            <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="<%: txtDateFrom.ClientID %>">入住日期：</label>
            <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="<%: txtDateTo.ClientID %>">离开日期：</label>
            <div class="input-group date">
                <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
            </div>
            <div class="input-append date datepicker" data-date-format="yyyy-mm-dd">
                <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control"></asp:TextBox>
                <span class="add-on"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
        </div>
    </div>
</asp:Content>
