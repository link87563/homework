<%@ WebHandler Language="C#" Class="Search" %>

using System;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using Newtonsoft.Json;

public class Search : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string name = "";
        if ( context.Request.QueryString["name"] !=null )
        {
            name = context.Request.QueryString["name"];
        }
        string strConn = ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString;
        using (SqlConnection conn=new SqlConnection(strConn))
        {
            string strCmd = "select CustomerID from Customers where CustomerID like @CustomerID";
            using (SqlCommand cmd=new SqlCommand(strCmd,conn))
            {
                cmd.Parameters.AddWithValue("@CustomerID", name + "%");
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                List<string> items = new List<string>();
                while (dr.Read())
                {
                    items.Add(dr[0].ToString());
                }
                conn.Close();
                context.Response.ContentType = "application/json";
                context.Response.Write(JsonConvert.SerializeObject(items));
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}