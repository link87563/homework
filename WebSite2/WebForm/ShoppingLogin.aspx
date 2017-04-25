<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingLogin.aspx.cs" Inherits="WebForm_ShoppingLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
  .main {
    max-width: 320px;
    margin: 0 auto;
  }
  .login-or {
    position: relative;
    font-size: 18px;
    color: #aaa;
    margin-top: 10px;
            margin-bottom: 10px;
    padding-top: 10px;
    padding-bottom: 10px;
  }
  .span-or {
    display: block;
    position: absolute;
    left: 50%;
    top: -2px;
    margin-left: -25px;
    background-color: #fff;
    width: 50px;
    text-align: center;
  }
  .hr-or {
    background-color: #cdcdcd;
    height: 1px;
    margin-top: 0px !important;
    margin-bottom: 0px !important;
  }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="HiddenTitle" runat="server" Value="登入" />
    <div class="container">
  <div class="row">
    <div class="main">
      <h3>Please Log In, or <a href="#">Sign Up</a></h3>
      <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6">
          <a href="#" class="btn btn-lg btn-primary btn-block">Facebook</a>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6">
          <a href="#" class="btn btn-lg btn-info btn-block">Google</a>
        </div>
      </div>
      <div class="login-or">
        <hr class="hr-or">
        <span class="span-or">or</span>
      </div>
        <div class="form-group">
        <asp:Label ID="Label1" runat="server" Text="Email" AssociatedControlID="inputEmail"></asp:Label>
        <asp:TextBox ID="inputEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#" CssClass="pull-right">忘記密碼?</asp:HyperLink>
            <asp:Label ID="Label2" runat="server" Text="PassWord" AssociatedControlID="inputPassword"></asp:Label>
            <asp:TextBox ID="inputPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>
        <div class="checkbox pull-right">
                <asp:Label ID="Label3" runat="server" >
             <asp:CheckBox ID="CheckBoxRB" runat="server" />
            Remember me </asp:Label>
        </div>
                 <asp:Button ID="Button1" runat="server" Text="LogIn" CssClass="btn btn-primary" OnClick="Button1_Click" />
    </div>
    
  </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

