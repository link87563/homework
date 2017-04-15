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
            
        }
    }
}