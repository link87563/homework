using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class WebForm_CartItems : System.Web.UI.Page
{
    LogicCheck LogicChk = new LogicCheck();
    string strConn = ConfigurationManager.ConnectionStrings["StoreConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CartID"] == null)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('請先購物!');location.href='ProductList2.aspx'", true);
        }
        else
        {
            GetTotal();
        }
    }

    protected void GetTotal()
    {
        using (SqlConnection conn=new SqlConnection(strConn))
        {
            using (SqlCommand cmd=new SqlCommand("ShoppingTotal",conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID", Session["CartID"].ToString());
                cmd.Parameters.Add("@TototalCost", SqlDbType.Money);
                cmd.Parameters["@TototalCost"].Direction = ParameterDirection.Output;
                conn.Open();
                cmd.ExecuteNonQuery();
                LabelTotal.Text = string.Format("Total:{0:c0}", cmd.Parameters["@TototalCost"].Value);
                conn.Close();
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow therow in GridView1.Rows)
        {
            TextBox TextBoxQty = (TextBox)therow.FindControl("TextBox2");
            CheckBox CheckBoxDel = (CheckBox)therow.FindControl("CheckBox1");
            HiddenField Hidden = (HiddenField)therow.FindControl("HiddenField1");
            ShoppingCartUpdate(Hidden.Value, TextBoxQty.Text, CheckBoxDel.Checked);
        }
        GridView1.DataBind();
        GetTotal();
    }
    protected void ShoppingCartUpdate(string ProductID,string Qty,bool isDel)
    {
        using (SqlConnection conn=new SqlConnection(strConn))
        {
            using (SqlCommand cmd=new SqlCommand("ShoppingCartUpdate",conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID", Session["CartID"].ToString());
                cmd.Parameters.AddWithValue("@ProductID", ProductID);
                cmd.Parameters.AddWithValue("@Quantity", Qty);
                cmd.Parameters.AddWithValue("@isDelete", isDel);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        LogicChk.LogicCheck2();

        using (SqlConnection conn=new SqlConnection(strConn))
        {
            using (SqlCommand cmd=new SqlCommand("CreateOrder",conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("CartID", Session["CartID"].ToString());
                cmd.Parameters.AddWithValue("CustomerID", Convert.ToInt32(Session["CartID"]));
                cmd.Parameters.AddWithValue("OrderDate", DateTime.Now.ToShortDateString());
                cmd.Parameters.AddWithValue("ShipDate", DateTime.Now.AddDays(1));

                cmd.Parameters.AddWithValue("OrderID", SqlDbType.Int);
                cmd.Parameters["OrderID"].Direction = ParameterDirection.Output;
                conn.Open();
                cmd.ExecuteNonQuery();

                string orderID = cmd.Parameters["OrderID"].Value.ToString();
                string strJS = "alert('訂單編號" + orderID + "!');location.href='Order.aspx?OrderID="+orderID+ "'";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", strJS, true);
                conn.Close();
            }
        }

    }
}