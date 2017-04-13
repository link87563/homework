<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="WebForm_ProductDetails" %>

<%@ Register Src="~/WebForm/CategoryNav.ascx" TagPrefix="uc1" TagName="CategoryNav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
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
        <div class="col-lg-5">
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ProductID" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                      ModelName:
                    <h2><asp:Label Text='<%# Bind("ModelName") %>' runat="server" ID="ModelNameLabel" /></h2><br />
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/WebForm/Handler.ashx?ProductID="+Eval("ProductID") %>' /><br />
                     ModelNumber:
                    <asp:Label Text='<%# Bind("ModelNumber") %>' runat="server" ID="ModelNumberLabel" /><br />
                    <h3>UnitCost:
                    <asp:Label Text='<%# Bind("UnitCost","{0:c0}") %>' runat="server" ID="UnitCostLabel" /></h3><br />
                    Description:
                    <asp:Label Text='<%# Bind("Description") %>' runat="server" ID="DescriptionLabel" /><br />
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

