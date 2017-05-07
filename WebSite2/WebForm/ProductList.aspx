<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/MasterPage.master" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="WebForm_ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <h3><%# Eval("CategoryName") %></h3>
        </ItemTemplate>
        <AlternatingItemTemplate><h3 style="background-color:#0094ff;color:white"><%# Eval("CategoryName") %></h3></AlternatingItemTemplate>
        <SeparatorTemplate><hr style="border-color:#808080"/></SeparatorTemplate>
        <HeaderTemplate><h1 style="color:orangered">Products</h1></HeaderTemplate>
        <FooterTemplate>&copy Link</FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

