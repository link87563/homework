<%@ Page Title="" Language="C#" MasterPageFile="~/LinkWebForm/LinkMasterPage.master" AutoEventWireup="true" CodeFile="CartItem.aspx.cs" Inherits="LinkWebForm_CartItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="HiddenTitle" runat="server" Value="購物車" />
    <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:ImageField DataImageUrlField="ProductID" DataImageUrlFormatString="~/LinkWebForm/ImageHandler.ashx?ProductID={0}" HeaderText="ProductImage">
                <ControlStyle Width="80px" />
            </asp:ImageField>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" />
            <asp:BoundField DataField="ModelName" HeaderText="ModelName" SortExpression="ModelName" />
            <asp:BoundField DataField="ModelNumber" HeaderText="ModelNumber" SortExpression="ModelNumber" />
            <asp:BoundField DataField="UnitCost" HeaderText="UnitCost" SortExpression="UnitCost" DataFormatString="{0:c0}" />
            <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("ProductID") %>' />
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("Quantity") %>' TextMode="Number" min="0" Max="10"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="amount" HeaderText="amount" ReadOnly="True" SortExpression="amount" DataFormatString="{0:c0}" />
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
        <asp:Button ID="Button2" runat="server" Text="結帳" CssClass="btn btn-success" OnClick="Button2_Click"/>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoreConnectionString %>" SelectCommand="ShoppingItems2" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="eb5918d7-058b-47cb-9c9e-c0937f912c57" Name="CartID" SessionField="CartID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

