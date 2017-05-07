using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// LogicCheck 的摘要描述
/// </summary>
public class LogicCheck
{
    public  LogicCheck()
    {
    }
    public void LogicCheck2()
    {
        if (HttpContext.Current.Request.Cookies["name"] == null)
        {
            string strPath = HttpContext.Current.Request.Url.PathAndQuery;
            HttpContext.Current.Response.Redirect("~/WebForm/ShoppingLogin.aspx?returnUrl=" + strPath);
        }
    }
}