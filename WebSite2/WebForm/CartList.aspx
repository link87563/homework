<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/MasterPage.master" AutoEventWireup="true" CodeFile="CartList.aspx.cs" Inherits="WebForm_CartList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID"></asp:BoundField>
            <asp:BoundField DataField="ModelName" HeaderText="ModelName" SortExpression="ModelName"></asp:BoundField>
            <asp:BoundField DataField="ModelNumber" HeaderText="ModelNumber" SortExpression="ModelNumber"></asp:BoundField>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"></asp:BoundField>
            <asp:BoundField DataField="UnitCost" HeaderText="UnitCost" SortExpression="UnitCost"></asp:BoundField>
            <asp:BoundField DataField="ProductImage" HeaderText="ProductImage" SortExpression="ProductImage"></asp:BoundField>
            <asp:BoundField DataField="amount" HeaderText="amount" ReadOnly="True" SortExpression="amount"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="ShoppingItems" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter SessionField="CartID" Name="CartID" Type="String" DefaultValue="F7EB97FB-9788-4D39-87F8-3767F6451A89"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

