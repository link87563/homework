<%@ WebHandler Language="C#" Class="CORS" %>

using System;
using System.Web;

public class CORS : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
            context.Response.AppendHeader("Access-Control-Allow-Origin","*");
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}