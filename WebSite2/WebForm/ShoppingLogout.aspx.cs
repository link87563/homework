﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForm_ShoppingLogout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Abandon();

        Response.Cookies["name"].Expires = DateTime.Now.AddSeconds(-1);

        Response.Redirect("~/WebForm/ProductList2.aspx");
    }
}