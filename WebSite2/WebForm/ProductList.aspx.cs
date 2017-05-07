using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForm_ProductList : System.Web.UI.Page
{
    LogicCheck LogicChk = new LogicCheck();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.Cookies["name"]==null)
        //{
        //    string strPath = Request.Url.PathAndQuery;
        //    Response.Redirect("~/WebForm/ShoppingLogin.aspx?returnUrl=" + strPath);
        //}
        LogicChk.LogicCheck2();
    }
}