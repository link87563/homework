using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForm_Order : System.Web.UI.Page
{
    LogicCheck LogicChk = new LogicCheck();
    protected void Page_Load(object sender, EventArgs e)
    {
        LogicChk.LogicCheck2();
    }
}