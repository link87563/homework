using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForm_ProductDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string productID = "1";
        if (Request.QueryString!=null)
        {
            productID = Request.QueryString["ProductID"];
        }
        Label1.Text = string.Format("你選擇的產品編號是{0}", productID);
    }
}