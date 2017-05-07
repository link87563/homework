<%@ Page Title="" Language="C#" MasterPageFile="~/LinkWebForm/LinkMasterPage.master" AutoEventWireup="true" CodeFile="ShoppingLogin.aspx.cs" Inherits="LinkWebForm_ShoppingLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #myModalLabel{
            color:lightcoral;
        }
        li{
            color:blue;
            font-size:18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="HiddenTitle" runat="server" Value="會員登入" />
   <div id="login-overlay" >
      <div >
          <div class="modal-header">
              <h3 class="modal-title" id="myModalLabel">Login to Link.com</h3>
          </div>
          <div class="modal-body">
              <div class="row">
                  <div class="col-md-6 col-sm-6">
                      <div class="well">
                              <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Username" CssClass="control-label" AssociatedControlID="inputEmail"></asp:Label>
                                <asp:TextBox ID="inputEmail" runat="server" CssClass="form-control" ToolTip="Please enter you username" placeholder="example@gmail.com"></asp:TextBox>
                                  <span class="help-block"></span>
                              </div>
                              <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Password" CssClass="control-label" AssociatedControlID="inputPassword"></asp:Label>
                                 <asp:TextBox ID="inputPassword" TextMode="Password" runat="server" CssClass="form-control" ToolTip="Please enter your password" placeholder="Password"></asp:TextBox>
                                  <span class="help-block"></span>
                              </div>
                              <div id="loginErrorMsg" class="alert alert-error hide">Wrong username og password</div>
                              <div class="checkbox">
                                  <label>
                                     <asp:CheckBox ID="remember" runat="server" Text="Remember login" />
                                  </label>
                                  <p class="help-block">(if this is a private computer)</p>
                              </div>
                             <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-success btn-block" OnClick="Button1_Click" />
                      </div>
                  </div>
                  <div class="col-sm-6 col-md-6">
                      <p class="lead">Register now for <span class="text-success">FREE</span></p>
                      <ul class="list-unstyled" style="line-height: 2">
                          <li><span class="fa fa-check text-success"></span> See all your orders</li>
                          <li><span class="fa fa-check text-success"></span> Fast re-order</li>
                          <li><span class="fa fa-check text-success"></span> Save your favorites</li>
                          <li><span class="fa fa-check text-success"></span> Fast checkout</li>
                          <li><span class="fa fa-check text-success"></span> Get a gift <small>(only new customers)</small></li>
                      </ul>
                      <p><asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-info btn-block" NavigateUrl="~/LinkWebForm/ShoppingCartRegister.aspx">Yes please, register now!</asp:HyperLink></p>
                  </div>
              </div>
          </div>
      </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

