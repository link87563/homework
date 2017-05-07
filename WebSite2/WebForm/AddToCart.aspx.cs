using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class WebForm_AddToCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["Ppage"] = Request.UrlReferrer.ToString();
        }
        string productID = "";
        if (Request.QueryString!=null)
        {
            productID = Request.QueryString["ProductID"];
        }
        else
        {
            Response.Redirect("~/ProductList2.aspx");
        }

        if (Session["cartID"]==null)
        {
            Session["cartID"] = Guid.NewGuid().ToString();
        }
        //string cartID = "";
        //if (Request.Cookies["cartID"]!=null)
        //{
        //    cartID = Request.Cookies["cartID"].Value;
        //}
        //else
        //{
        //    cartID = Guid.NewGuid().ToString();
        //    Response.Cookies["cartID"].Value = cartID;
        //}
        string strConn = ConfigurationManager.ConnectionStrings["StoreConnectionString"].ConnectionString;
        using (SqlConnection conn=new SqlConnection(strConn))
        {
            //string strCmd = "insert into ShoppingCart (CartID,Quantity,ProductID) values (@CartID,@Quantity,@ProductID)";
            using (SqlCommand cmd=new SqlCommand("ShoppingCartAdd", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID", Session["cartID"].ToString());
                cmd.Parameters.AddWithValue("@Quantity",1);
                cmd.Parameters.AddWithValue("@ProductID", productID);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        Response.Redirect(ViewState["Ppage"].ToString());
        //Response.Redirect("~/WebForm/ProductList2.aspx");
    }
}