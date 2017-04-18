<%@ WebHandler Language="C#" Class="Json" %>

using System;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using Newtonsoft.Json;

public class Json : IHttpHandler {
             //利用datareader讀資料庫資料轉成Json
    public void ProcessRequest (HttpContext context) {
        string strConn = ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString;
        using (SqlConnection conn=new SqlConnection(strConn))
        {
            string strCmd = "select CategoryID,CategoryName from Categories";
            using (SqlCommand cmd=new SqlCommand(strCmd,conn))
            {
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                List<Categories> categories = new List<Categories>();
                while (dr.Read())
                {
                    Categories category = new Categories();
                    category.CategoryID =Convert.ToInt32( dr["CategoryID"]);
                    category.CategoryName = dr["CategoryName"].ToString();
                    categories.Add(category);
                }
                conn.Close();
                context.Response.ContentType = "application/json";
                context.Response.Write(JsonConvert.SerializeObject(categories));
            }
        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}