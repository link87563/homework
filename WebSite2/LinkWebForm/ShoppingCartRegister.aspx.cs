using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class LinkWebForm_ShoppingCartRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string strConn = ConfigurationManager.ConnectionStrings["StoreConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(strConn))
        {
            string strCmd = "insert into Customers(FullName,EmailAddress,Password) values (@FullName,@EmailAddress,@Password)";
            using (SqlCommand cmd=new SqlCommand(strCmd,conn))
            {
                cmd.Parameters.AddWithValue("@FullName", inputName.Text);
                cmd.Parameters.AddWithValue("@EmailAddress", inputEmail.Text);
                cmd.Parameters.AddWithValue("@Password", inputPwd.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                string strJS = "alert('加入成功!! 請重新登入!');location.href='ShoppingLogin.aspx'";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", strJS, true);
                conn.Close();
            }
        }
    }
}