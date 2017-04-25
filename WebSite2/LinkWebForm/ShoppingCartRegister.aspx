<%@ Page Title="" Language="C#" MasterPageFile="~/LinkWebForm/LinkMasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCartRegister.aspx.cs" Inherits="LinkWebForm_ShoppingCartRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="HiddenTitle" runat="server" Value="註冊" />
            <div class="modal-header">
                <h3 class="modal-title" id="myModalLabel">Register New Accunt</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="well">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server"  Text="FullName" CssClass="control-label"></asp:Label>
                                <asp:TextBox ID="inputName" runat="server" CssClass="form-control" ToolTip="Please enter you FullName" placeholder="Link Chen"></asp:TextBox>
                                <span id="spname"></span>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="inputEmail" Text="Email" CssClass="control-label"></asp:Label>
                                <asp:TextBox ID="inputEmail" TextMode="Email" runat="server" CssClass="form-control" ToolTip="Please enter you Email" placeholder="example@gmail.com"></asp:TextBox>
                                <span id="spemail" class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" AssociatedControlID="inputPwd" Text="Password" CssClass="control-label"></asp:Label>
                                <asp:TextBox ID="inputPwd" TextMode="Password" runat="server" CssClass="form-control" ToolTip="Please enter you Password" placeholder="Password"></asp:TextBox>
                                <span id="sppwd" class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" AssociatedControlID="DobPwd" Text="Password Again" CssClass="control-label"></asp:Label>
                                <asp:TextBox ID="DobPwd" TextMode="Password"  runat="server" CssClass="form-control" ToolTip="Please enter you Password Again" placeholder="Password Again"></asp:TextBox>
                                <span id="sppwd2" class="help-block"></span>
                            </div>
                            <div class="form-group">
                                 <asp:Button ID="Button1" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="送出" /> 
                        </div>
                            <div class="form-group">
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-default btn-lg btn-block" NavigateUrl="~/LinkWebForm/ShoppingLogin.aspx"><span class="glyphicon glyphicon-hand-right"> Login</span></asp:HyperLink>
                            </div>
                       </div>
                    </div>
                </div>
            </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
    <script>
        window.onload=function(){
            document.getElementById("ContentPlaceHolder1_inputName").onblur = chkname;
            
        }
        function chkname() {
            var thename = document.getElementById("ContentPlaceHolder1_inputName").value;
            if (thename == "") {
                document.getElementById("spname").innerHTML = "請輸入姓名";
            }
        }
        
    </script>
</asp:Content>

