<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="WebForm_ProductDetails" %>

<%@ Register Src="~/WebForm/CategoryNav.ascx" TagPrefix="uc1" TagName="CategoryNav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #st1{
            color:blue;
        }
        h3{
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
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ProductID" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-sm-12">
                    <h2 id="st1"><%# Eval("ModelName") %>(<%# Eval("ModelNumber") %>)</h2>
                            <br />
                        </div>
                        <div class="col-sm-6">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/WebForm/Handler.ashx?ProductID="+Eval("ProductID") %>' /><br />
                            <h3>UnitCost:
                    <asp:Label Text='<%# Eval("UnitCost","{0:c0}") %>' runat="server" ID="UnitCostLabel" /></h3>
                            <br />
                        </div>
                        <div class="col-sm-6">
                            Description:
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /><br />
                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-default" NavigateUrl='<%# "~/WebForm/AddToCart.aspx?ProductID="+Eval("ProductID") %>'><span class="glyphicon glyphicon-shopping-cart">加入購物車</span> </asp:HyperLink>
                        </div>
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

