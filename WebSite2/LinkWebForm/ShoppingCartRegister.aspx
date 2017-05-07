<%@ Page Title="" Language="C#" MasterPageFile="~/LinkWebForm/LinkMasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCartRegister.aspx.cs" Inherits="LinkWebForm_ShoppingCartRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .spe{
            color:blue;
        }
        
    </style>
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
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="inputName"  Text="FullName" CssClass="control-label"></asp:Label>
                                <div class="input-group">
                                <span class="glyphicon glyphicon-user input-group-addon"></span>
                                <asp:TextBox ID="inputName" runat="server" CssClass="form-control" ToolTip="Please enter you FullName" placeholder="中文"></asp:TextBox>
                                    <div id="span1" class="input-group-addon"><span id="spname" class="glyphicon glyphicon-question-sign spe"></span></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="inputEmail" Text="Email" CssClass="control-label"></asp:Label>
                                <div class="input-group">
                                <span class="input-group-addon">@</span>
                                <asp:TextBox ID="inputEmail"  TextMode="Email" runat="server" CssClass="form-control" ToolTip="Please enter you Email" placeholder="example@gmail.com"></asp:TextBox>
                                    <div id="span2" class="input-group-addon"><span id="spemail" class="glyphicon glyphicon-question-sign spe"></span></div>
                                    </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" AssociatedControlID="inputPwd" Text="Password" CssClass="control-label"></asp:Label>
                                <div class="input-group">
                                <span class="input-group-addon glyphicon glyphicon-eye-open"></span>
                                <asp:TextBox ID="inputPwd" TextMode="Password" runat="server" CssClass="form-control" ToolTip="Please enter you Password" placeholder="Please input over 6 words and a-z or #@!%&*$ or 0-9"></asp:TextBox>
                                <div id="span3" class="input-group-addon"><span id="sppwd" class="glyphicon glyphicon-question-sign spe"></span></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" AssociatedControlID="dopwd" Text="Password Again" CssClass="control-label"></asp:Label>
                                <div class="input-group">
                                <span class="input-group-addon glyphicon glyphicon-eye-open"></span>
                                <asp:TextBox ID="dopwd" TextMode="Password"  runat="server" CssClass="form-control" ToolTip="Please enter you Password Again" placeholder="Password Again"></asp:TextBox>
                                <div id="span4" class="input-group-addon"><span id="sppwd2" class="glyphicon glyphicon-question-sign spe"></span></div>
                                </div>
                            </div>
                            <div class="form-group">
                                 <asp:Button ID="Button1" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="送出" OnClick="Button1_Click" /> 
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
            document.getElementById("ContentPlaceHolder1_inputEmail").onblur = chkemail;
            document.getElementById("ContentPlaceHolder1_inputPwd").onblur = chkpwd;
            document.getElementById("ContentPlaceHolder1_dopwd").onblur = chkpwd2;
        }
        function chkname() {
            var thename = document.getElementById("ContentPlaceHolder1_inputName").value;
            if (thename == "") {
                document.getElementById("spname").innerHTML = "請輸入姓名";
            }
            else {
                var re = /^[\u4E00-\u9fa5]{2}$/;
                if (re.test(thename)) {
                    document.getElementById("spname").innerHTML = "OK";
                }
                else {
                    document.getElementById("spname").innerHTML = "請輸入中文姓名";
                }
            }
        }
        function chkemail() {
            var themail = document.getElementById("ContentPlaceHolder1_inputEmail").value;
            if (themail=="") {
                document.getElementById("spemail").innerHTML = "請輸入電子郵件";
            }
            else {
                var re = /^.+@.+\..{2,4}$/;
                if (re.test(themail)) {
                    document.getElementById("spemail").innerHTML = "OK";
                }
                else {
                    document.getElementById("spemail").innerHTML = "請輸入正確格式";
                }
            }
        }
        var thepwd;
        var thepwd2;
        function chkpwd() {
             thepwd = document.getElementById("ContentPlaceHolder1_inputPwd").value;

            if (thepwd=="") {
                document.getElementById("sppwd").innerHTML = "請輸入密碼";
            }
            else {
                var re = /^(?=.*[a-z].*\d).{6,}$/;
                if (re.test(thepwd)) {
                    document.getElementById("sppwd").innerHTML = "OK";
                }
                else {
                    document.getElementById("sppwd").innerHTML = "請輸入正確格式";
                }
            }
        }
        function chkpwd2() {
            thepwd2 = document.getElementById("ContentPlaceHolder1_dopwd").value;
            if (thepwd2=="") {
                document.getElementById("sppwd2").innerHTML = "請先輸入密碼";
            }
            else {
                if (thepwd2 == thepwd) {
                    document.getElementById("sppwd2").innerHTML = "OK";
                }
                else {
                    document.getElementById("sppwd2").innerHTML = "請輸入正確密碼";
                }
            }
        }
    </script>
</asp:Content>

