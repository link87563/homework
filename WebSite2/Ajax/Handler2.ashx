<%@ WebHandler Language="C#" Class="Handler2" %>

using System;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
    using Newtonsoft.Json;

public class Handler2 : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string strConn = ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString;
        using (SqlConnection conn=new SqlConnection(strConn))
        {
            string strCmd = "select ProductID,ProductName,UnitPrice,UnitsInStock from Products where CategoryID=@CategoryID";
            using (SqlDataAdapter da=new SqlDataAdapter(strCmd,conn))
            {
                da.SelectCommand.Parameters.AddWithValue("@CategoryID",1);
                DataSet ds = new DataSet();
                da.Fill(ds, "Products");
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(ds.Tables[0]));
            }
        }
        
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}