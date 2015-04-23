<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="HIMS.Admin.Orders.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="index.html">订单管理</a></li>
        <li class="active">房间预订</li>
    </ol>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-md-1 control-label">房间类型：</label>
            <div class="col-md-3">
                <asp:TextBox ID="txtRoomType" runat="server" CssClass="form-control"></asp:TextBox>
            </div>


            <label class="col-md-1 control-label">入住时间</label>
            <div class="col-md-3">
                <div class="input-group date datepicker col-md-12">
                    <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control"></asp:TextBox>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>

            <label class="col-md-1 control-label">离开时间</label>
            <div class="col-md-3">
                <div class="input-group date datepicker col-md-12">
                    <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control"></asp:TextBox>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>

        </div>
        <div class="form-group">

            <div class="col-lg-2 col-lg-offset-10">
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-block btn-primary" Text="Search" OnClick="btnSearch_Click" />
            </div>
        </div>
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
                            <th>预定</th>
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
                    <td>
                        <asp:Button CommandName="Booking" runat="server" CssClass="btn btn-success" Text="Booking" >
                        </asp:Button>
                    </td>
                </tr>

            </ItemTemplate>
        </asp:ListView>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="BookingModal" runat="server" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">预订房间</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <asp:HiddenField ID="hidRoomId" runat="server" />
                        <div class="row form-group">
                            <label class="col-md-3 text-right">会员姓名</label>
                            <div class="input-group col-md-6">
                            <asp:TextBox ID="txtMemberName" runat="server" CssClass="form-control col-md-8"></asp:TextBox>
                                </div>
                        </div>

                        <div class="row form-group">
                            <label class="col-md-3 text-right">会员手机号码</label>
                            <div class="input-group col-md-6">
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control col-md-8"></asp:TextBox>
                                </div>
                        </div>
                        
                        <div class="row form-group">
                            <label class="col-md-3 text-right">入住时间</label>

                            <div class="input-group col-md-6">
                                <asp:TextBox ID="txtDateEnter" runat="server" ReadOnly="true" CssClass="form-control disabled"></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>
                        
                        <div class="row form-group">
                            <label class="col-md-3 text-right">离开时间</label>

                            <div class="input-group col-md-6">
                                <asp:TextBox ID="txtDateLeave" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-primary" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click">
                    </asp:Button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
