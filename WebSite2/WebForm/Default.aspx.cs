using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DropDownList1.Items.Add(new ListItem("item1", "a"));
            DropDownList1.Items.Add(new ListItem("item2", "b"));
            DropDownList1.Items.Add(new ListItem("item3", "c"));
            DropDownList1.Items.Add(new ListItem("item4", "d"));
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = TextBox1.Text;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label2.Text = DropDownList1.SelectedValue;
    }
}