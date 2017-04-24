<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryNav.ascx.cs" Inherits="LinkWebForm_CategoryNav" %>
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
    <HeaderTemplate>
        <div class="list-group">
    </HeaderTemplate>
    <ItemTemplate>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/LinkWebForm/Products.aspx?id=" +Eval("CategoryID")%>' CssClass="list-group-item">
                        <%# Eval("CategoryName") %></asp:HyperLink>
    </ItemTemplate>
    <FooterTemplate>
        </div>
    </FooterTemplate>
</asp:Repeater>
<asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
