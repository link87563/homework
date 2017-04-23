using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class LinkWebForm_AddToCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["Ppage"] = Request.UrlReferrer.ToString();
        }
        string ProductID = "";
        if (Request.QueryString!=null)
        {
            ProductID = Request.QueryString["ProductID"];
        }
        else
        {
            Response.Redirect("~/Products.aspx");
        }
        if (Session["cartID"]==null)
        {
            Session["cartID"] = Guid.NewGuid().ToString();
        }
        string strConn = ConfigurationManager.ConnectionStrings["StoreConnectionString"].ConnectionString;
        using (SqlConnection conn=new SqlConnection(strConn))
        {
            using (SqlCommand cmd=new SqlCommand("ShoppingCartAdd2",conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID", Session["cartID"].ToString());
                cmd.Parameters.AddWithValue("@Quantity", 1);
                cmd.Parameters.AddWithValue("@ProductID", ProductID);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        Response.Redirect(ViewState["Ppage"].ToString());
    }
}