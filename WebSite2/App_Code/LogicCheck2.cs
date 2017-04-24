using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// LogicCheck2 的摘要描述
/// </summary>
public class LogicCheck2
{
    public LogicCheck2()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public void LogicCheck3()
    {
        if (HttpContext.Current.Request.Cookies["name"]==null)
        {
            string strPath = HttpContext.Current.Request.Url.PathAndQuery;
            HttpContext.Current.Response.Redirect("~/LinkWebForm/ShoppingLogin.aspx?returnUrl=" + strPath);
        }
    }
}