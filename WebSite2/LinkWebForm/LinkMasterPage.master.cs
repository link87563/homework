using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LinkWebForm_LinkMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (ContentPlaceHolder1.FindControl("HiddenTitle")!=null)
            {
                LiteralTitle.Text = ((HiddenField)ContentPlaceHolder1.FindControl("HiddenTitle")).Value;
            }
            else
            {
                LiteralTitle.Text = "";
            }
            if (Request.Cookies["name"]!=null)
            {
                HyperLinkLogin.Text = Request.Cookies["name"].Value + "登出";
                HyperLinkLogin.NavigateUrl = "~/LinkWebForm/ShoppingLogout.aspx";
            }
            else
            {
                HyperLinkLogin.Text = "登入";
                HyperLinkLogin.NavigateUrl = "~/LinkWebForm/ShoppingLogin.aspx";
            }
        }
    }
}
