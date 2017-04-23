using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class LinkWebForm_ShoppingLogin : System.Web.UI.Page
{
    string strConn = ConfigurationManager.ConnectionStrings["StoreConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["cartID"] == null)
        {
            Session["cartID"] = Guid.NewGuid().ToString();
        }
        using (SqlConnection conn = new SqlConnection(strConn))
        {
            using (SqlCommand cmd = new SqlCommand("ShoppingCartIDUpdate2", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmailAddress", inputEmail.Text);
                cmd.Parameters.AddWithValue("@Password", inputPassword.Text);
                cmd.Parameters.AddWithValue("@CartID", Session["CartID"].ToString());

                cmd.Parameters.Add("@FullName", SqlDbType.NVarChar, 50);
                cmd.Parameters["@FullName"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add("@CustomerID", SqlDbType.Int);
                cmd.Parameters["@CustomerID"].Direction = ParameterDirection.Output;

                conn.Open();
                cmd.ExecuteNonQuery();
                string i = cmd.Parameters["@FullName"].Value.ToString();
                string strJS = "alert('帳號或密碼錯誤!')";
                if (!string.IsNullOrEmpty(i))
                {
                    Session["CartID"] = cmd.Parameters["@CustomerID"].Value.ToString();
                    Response.Cookies["name"].Value = i.ToString();
                    if (remember.Checked)
                    {
                        Response.Cookies["name"].Expires = DateTime.Now.AddDays(7);
                    }
                    string strUrl = "Products.aspx";
                    if (Request.QueryString["returnUrl"]!=null)
                    {
                        strUrl = Request.QueryString["returnUrl"];
                    }
                    strJS = "alert('" + i + "登入成功!');location.href='" + strUrl + "'";
                }
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", strJS, true);
                conn.Close();
            }
        }
    }
}