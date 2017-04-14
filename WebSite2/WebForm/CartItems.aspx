<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="CartItems.aspx.cs" Inherits="WebForm_CartItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:ImageField DataImageUrlField="ProductID" DataImageUrlFormatString="~/WebForm/Handler.ashx?ProductID={0}" HeaderText="ProductImage">
                <ControlStyle Width="80px" />
            </asp:ImageField>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID"></asp:BoundField>
            <asp:BoundField DataField="ModelName" HeaderText="ModelName" SortExpression="ModelName"></asp:BoundField>
            <asp:BoundField DataField="ModelNumber" HeaderText="ModelNumber" SortExpression="ModelNumber"></asp:BoundField>
            <asp:BoundField DataField="UnitCost" HeaderText="UnitCost" SortExpression="UnitCost" DataFormatString="{0:c0}"></asp:BoundField>
            <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("Quantity") %>' TextMode="Number" min="0" max="10" step="1"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="amount" HeaderText="amount" ReadOnly="True" SortExpression="amount" DataFormatString="{0:c0}"></asp:BoundField>
            <asp:TemplateField HeaderText="刪除">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div class="text-right">
         <asp:Label ID="LabelTotal" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="修改" CssClass="btn btn-danger" OnClick="Button1_Click" />
    </div>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="ShoppingItems" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter SessionField="CartID" Name="CartID" Type="String" DefaultValue="50387d12-b118-476e-bdfb-2f5a34fad747"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

