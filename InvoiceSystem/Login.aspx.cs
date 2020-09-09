using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using InvoiceDataAcess;


namespace InvoiceSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Label3.Visible = false;
        }
        protected void btnsignin_Click(object sender, EventArgs e)
        {
            UserRepository userRepository = new UserRepository();
            bool isValid = userRepository.ValidateUser(TextBox1.Text, TextBox2.Text);
            if (isValid)
            {
                Session["UserName"] = TextBox1.Text;
               
                Response.Redirect("Home.aspx");
            }
            else
            {
                Label3.Visible = true;
                Label3.Text = ("Please Enter Valid User Name Or Password.");
            }
        }

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewUser.aspx?Login=1");
        }
    }
}
