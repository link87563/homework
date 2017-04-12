<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/MasterPage.master" AutoEventWireup="true" CodeFile="ProductList2.aspx.cs" Inherits="WebForm_ProductList2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-lg-3">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <HeaderTemplate>
            <div class="list-group">
        </HeaderTemplate>
       <ItemTemplate>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/WebForm/ProductList2.aspx?id="+ Eval("CategoryID") %>' CssClass="list-group-item">
                <%# Eval("CategoryName") %></asp:HyperLink>
        </ItemTemplate>
                <AlternatingItemTemplate><asp:HyperLink ID="HyperLink1" BackColor="#ff9999" runat="server" NavigateUrl='<%# "~/WebForm/ProductList2.aspx?id="+ Eval("CategoryID") %>' CssClass="list-group-item">
                <%# Eval("CategoryName") %></asp:HyperLink></AlternatingItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>
        </div>
        <div class="col-lg-9 row">
            <h2><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h2>
            <asp:DataList ID="DataList1" RepeatDirection="Horizontal" RepeatColumns="3" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    ProductID:
                    <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" /><br />
                    ModelNumber:
                    <asp:Label Text='<%# Eval("ModelNumber") %>' runat="server" ID="ModelNumberLabel" /><br />
                    ModelName:
                    <asp:Label Text='<%# Eval("ModelName") %>' runat="server" ID="ModelNameLabel" /><br />
                    ProductImage:
                    <asp:Label Text='<%# Eval("ProductImage") %>' runat="server" ID="ProductImageLabel" /><br />
                    UnitCost:
                    <asp:Label Text='<%# Eval("UnitCost") %>' runat="server" ID="UnitCostLabel" /><br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="SELECT [ProductID], [ModelNumber], [ModelName], [ProductImage], [UnitCost] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="id" DefaultValue="1" Name="CategoryID" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoreConnectionString %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

