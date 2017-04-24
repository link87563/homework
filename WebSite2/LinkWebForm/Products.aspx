<%@ Page Title="" Language="C#" MasterPageFile="~/LinkWebForm/LinkMasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="LinkWebForm_Products" %>

<%@ Register Src="~/LinkWebForm/CategoryNav.ascx" TagPrefix="uc1" TagName="CategoryNav" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .thumbnail{
            margin:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="HiddenTitle" runat="server" Value="商品" />
    <div class="row">
        <div class="col-lg-3">
            <uc1:CategoryNav runat="server" ID="CategoryNav" />
        </div>
        <div class="col-lg-9">
            <h2>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h2>
            <asp:DataList ID="DataList1" RepeatDirection="Horizontal" RepeatColumns="3" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="thumbnail">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/LinkWebForm/ImageHandler.ashx?ProductID="+Eval("ProductID") %>'/>
                        <div class="caption">
                            <h4><%# Eval("ModelName") %></h4>
                            <p><%# Eval("UnitCost","{0:c0}") %></p>
                            <p>
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary" NavigateUrl='<%# "~/LinkWebForm/ProductDetail.aspx?ProductID="+Eval("ProductID") %>'>詳細資料</asp:HyperLink>
                                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-default" NavigateUrl='<%# "~/LinkWebForm/AddToCart.aspx?ProductID="+Eval("ProductID") %>'>加入購物車</asp:HyperLink>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
                    </div>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="SELECT [ProductID], [ModelName], [ProductImage], [UnitCost] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="id"  DefaultValue="1" Name="CategoryID" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

