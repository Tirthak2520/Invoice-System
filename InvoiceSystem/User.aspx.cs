using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace InvoiceSystem
{
    public partial class User : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"data source= TIRTHAK\SQLEXPRESS; initial catalog=My project; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }            
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewUser.aspx");
        }

        protected void Grid1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != Grid1.EditIndex)
            {
                (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Are you sure you want to delete?');";
            }
        }

        protected void Grid1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
    }


