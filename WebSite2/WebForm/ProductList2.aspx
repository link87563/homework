<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/MasterPage.master" AutoEventWireup="true" CodeFile="ProductList2.aspx.cs" Inherits="WebForm_ProductList2" %>

<%@ Register Src="~/WebForm/CategoryNav.ascx" TagPrefix="uc1" TagName="CategoryNav" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .thumbnail{
            margin:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="HiddenTitle" runat="server" Value="商品" />
    <div class="row">
        <div class="col-lg-3">
            <uc1:CategoryNav runat="server" ID="CategoryNav" />
        </div>
        <div class="col-lg-9 row">
                     <h2><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h2>
            <asp:DataList ID="DataList1" RepeatDirection="Horizontal" RepeatColumns="3" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource2">
                 <ItemTemplate>
                     <div class="thumbnail">
                         <asp:Image ImageUrl='<%# "~/WebForm/Handler.ashx?ProductID="+Eval("ProductID") %>' ID="Image1" runat="server" />
                         <div class="caption">
                             <h4><%# Eval("ModelName") %></h4>
                             <p><%# Eval("UnitCost","{0:c0}") %></p>
                             <p>
                                 <asp:HyperLink CssClass="btn btn-primary" ID="HyperLink2" runat="server" NavigateUrl='<%# "~/WebForm/ProductDetails.aspx?ProductID="+Eval("ProductID") %>'>詳細資料</asp:HyperLink>
                                 <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-default" NavigateUrl='<%# "~/WebForm/AddToCart.aspx?ProductID="+Eval("ProductID") %>'><span class="glyphicon glyphicon-shopping-cart">加入購物車</span> </asp:HyperLink>
                             </p>
                         </div>
                         </div>
                 </ItemTemplate>
            </asp:DataList>
                </div>
            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="SELECT [ProductID], [ModelNumber], [ModelName], [ProductImage], [UnitCost] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="id" DefaultValue="1" Name="CategoryID" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoreConnectionString %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

