<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryNav.ascx.cs" Inherits="WebForm_CategoryNav" %>
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
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoreConnectionString %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>