using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LinkWebForm_ProductDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ProductID = "";
        if (Request.QueryString!=null)
        {
            ProductID = Request.QueryString["ProductID"];
        }
        Label1.Text = string.Format("你選擇的產品編號是:{0}", ProductID);
    }
}