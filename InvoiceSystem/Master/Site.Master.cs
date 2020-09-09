using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
    
namespace InvoiceSystem.Master
{
    public partial class Site : System.Web.UI.MasterPage
    {

        public object AppSettings { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection DbConnection = new SqlConnection(strcon);
            String path = ConfigurationManager.AppSettings["InvoiceSystem"];
        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.Remove("UserName");
            Session.Remove("Password");
            Response.Redirect("Login.aspx");
        }
    }
}