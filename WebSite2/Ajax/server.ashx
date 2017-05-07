<%@ WebHandler Language="C#" Class="server" %>

using System;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public class server : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string strConn = ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString;
        using (SqlConnection conn=new SqlConnection(strConn))
        {
            string strCmd = "Select count(FirstName) from Employees where FirstName=@FirstName";
            using (SqlCommand cmd=new SqlCommand(strCmd,conn))
            {
                string name = context.Request.QueryString["UserName"];
                cmd.Parameters.AddWithValue("@FirstName",name);
                conn.Open();
                int i =Convert.ToInt32(cmd.ExecuteScalar());
                    conn.Close();
                    context.Response.ContentType = "text/plain";
                if (i<=0)
                {
                    context.Response.Write("沒人使用");
                }
                else
                {
                    context.Response.Write("有人用過");
                }
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}