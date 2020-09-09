using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace InvoiceSystem
{
    public partial class NewUser : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"data source= TIRTHAK\SQLEXPRESS; initial catalog=My project; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Login"] != null && Request.QueryString["Login"].ToString() == "1")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), Guid.NewGuid().ToString(), "hideNavigation();", true);
            }

        }
        protected void AddButton_Click(object sender, EventArgs e)
        {
            
            String constring = @"data source= TIRTHAK\SQLEXPRESS; initial catalog=My project; integrated security=true";
            SqlConnection sqlcon = new SqlConnection(constring);
            String pname = "UserEntry"; ;
            sqlcon.Open();
            SqlCommand com = new SqlCommand(pname, sqlcon);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@First_Name", TextBox1.Text.ToString());
            com.Parameters.AddWithValue("@Last_Name", TextBox2.Text.ToString());
            com.Parameters.AddWithValue("@UserName", TextBox3.Text.ToString());
            com.Parameters.AddWithValue("@Password", TextBox4.Text.ToString());
            com.Parameters.AddWithValue("@Email", TextBox5.Text.ToString());
            com.Parameters.AddWithValue("@Active", CheckBox1.Checked);
            com.Parameters.AddWithValue("@Created_By", TextBox3.Text.ToString());
            com.ExecuteNonQuery();
            sqlcon.Close();
            Label1.Text = "Data Has Been Saved Successfully";
        }

        protected void Cancel_Button_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["Login"] != null && Request.QueryString["Login"].ToString() == "1")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("User.aspx");
            }
        }
    }
}