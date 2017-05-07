<%@ Page Title="" Language="C#" MasterPageFile="~/LinkWebForm/LinkMasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="LinkWebForm_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="HiddenTitle" runat="server" Value="商品明細" />
    <asp:FormView ID="FormView1" CssClass="table table-bordered" runat="server" DataKeyNames="OrderID" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            OrderID:
            <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel" /><br />
            CustomerID:
            <asp:Label Text='<%# Bind("CustomerID") %>' runat="server" ID="CustomerIDLabel" /><br />
            OrderDate:
            <asp:Label Text='<%# Bind("OrderDate") %>' runat="server" ID="OrderDateLabel" /><br />
            ShipDate:
            <asp:Label Text='<%# Bind("ShipDate") %>' runat="server" ID="ShipDateLabel" /><br />
        </ItemTemplate>
    </asp:FormView>
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="OrderDetailsID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="OrderDetailsID" HeaderText="OrderDetailsID" ReadOnly="True" InsertVisible="False" SortExpression="OrderDetailsID"></asp:BoundField>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID"></asp:BoundField>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID"></asp:BoundField>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"></asp:BoundField>
            <asp:BoundField DataField="UnitCost" HeaderText="UnitCost" SortExpression="UnitCost"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="SELECT * FROM [OrderDetails] WHERE ([OrderID] = @OrderID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="OrderID" Name="OrderID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="SELECT * FROM [Orders] WHERE ([OrderID] = @OrderID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="OrderID" DefaultValue="" Name="OrderID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

