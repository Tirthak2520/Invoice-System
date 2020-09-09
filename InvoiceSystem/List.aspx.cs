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
    public partial class List : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"data source= TIRTHAK\SQLEXPRESS; initial catalog=My project; integrated security=true");
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            int i = 0;
            string sql = null;
            string connetionString = @"data source= TIRTHAK\SQLEXPRESS; initial catalog=My project; integrated security=true";
            SqlConnection connection = new SqlConnection(connetionString);
            connection.Open();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "getCustomerlist";
            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);
            connection.Close();
            GridView_List.DataSource = ds.Tables[0];
            GridView_List.DataBind();
        }
        private  void BindData()
        {
           
        }

        protected void GridView_List_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_List.PageIndex = e.NewPageIndex;
            GridView_List.DataBind();
        }

        protected void GridView_List_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
          
        }

       
    

        protected void Button1_Click(object sender, EventArgs e)
        {
          
        }

        protected void Add1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Invoice.aspx");
        }
    }
}
       
     