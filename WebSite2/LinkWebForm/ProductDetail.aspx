<%@ Page Title="" Language="C#" MasterPageFile="~/LinkWebForm/LinkMasterPage.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="LinkWebForm_ProductDetail" %>

<%@ Register Src="~/LinkWebForm/CategoryNav.ascx" TagPrefix="uc1" TagName="CategoryNav" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
    #st1{
        color:blue;
    }
    #st2{
        color:red;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-lg-3">
            <uc1:CategoryNav runat="server" ID="CategoryNav" />
        </div>
        <div class="col-lg-9">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ProductID" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="col-sm-12">
                        <h2 id="st1"><%# Eval("ModelName") %>(<%# Eval("ModelNumber") %>)</h2>
                    </div>
                    <div class="col-sm-6">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/LinkWebForm/ImageHandler.ashx?ProductID="+Eval("ProductID") %>' />
                        <h3 id="st2">特價:<asp:Label ID="Label2" runat="server" Text='<%# Eval("UnitCost","{0:c0}") %>'></asp:Label></h3><br />
                    </div>
                    <div class="col-sm-6">
                         <h3>詳細資料:</h3><br />
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Description") %>'></asp:Label><br />
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary" NavigateUrl='<%# "~/LinkWebForm/AddToCart.aspx?ProductID="+Eval("ProductID") %>'><span class="glyphicon glyphicon-shopping-cart" >加入購物車</span> </asp:HyperLink>
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="SELECT * FROM [Products] WHERE ([ProductID] = @ProductID)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="ProductID" DefaultValue="1" Name="ProductID" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

