using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LinkWebForm_Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = "";
        if (Request.QueryString["id"]!=null)
        {
            id = Request.QueryString["id"];
        }
        Label1.Text = string.Format("你選取了產品編號:{0}", id);
    }
}