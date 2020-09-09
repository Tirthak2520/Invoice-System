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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"data source= TIRTHAK\SQLEXPRESS; initial catalog=My project; integrated security=true");
        string connetionString = @"data source= TIRTHAK\SQLEXPRESS; initial catalog=My project; integrated security=true";
        
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if (!this.IsPostBack)
            {
                this.BindData();
                this.Bindcustomer();
                this.BindUser();
                this.BindInvoiceData();
                this.BindInvoicepro();
                this.BindTotalInvoiceData();
                this.BindTotalInvoicepro();


            }
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
            command.CommandText = "Monthly_Total";
            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);
            connection.Close();
            if (ds != null)
            {

                for (int j = 0; j < ds.Tables[0].Rows.Count; j++)
                {
                    var row = ds.Tables[0].Rows[j];


                    string MonthName = row["Month"].ToString();
                    if (MonthName == "January")
                    {
                        January.Text = row["Total"].ToString();
                    }
                    else if (MonthName == "February")
                    {
                        February.Text = row["Total"].ToString();
                    }
                    else if (MonthName == "March")
                    {
                        March.Text = row["Total"].ToString();
                    }
                    else if (MonthName == "April")
                    {
                        April.Text = row["Total"].ToString();
                    }
                    else if (MonthName == "May")
                    {
                        May.Text = row["Total"].ToString();
                    }
                    else if (MonthName == "June")
                    {
                        June.Text = row["Total"].ToString();
                    }

                }
            }
            SqlConnection con = new SqlConnection(connetionString);
            string str;
            SqlCommand com;
            con.Open();
            str = "Select COUNT(Customer_ID) from Customer where Active=1";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();
            Total_Customer.Text = reader[""].ToString();
            reader.Close();
            con.Close();
            
        }
        private void BindData()
        {
            SqlConnection con = new SqlConnection(connetionString);
            string str;
            SqlCommand com;
            con.Open();
            str = "Select COUNT(U_ID) from User_Master where Active=1";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();
            Total_User.Text = reader[""].ToString();
            reader.Close();
            con.Close();
        }
        private void Bindcustomer()
        {
            SqlConnection con = new SqlConnection(connetionString);
            string str;
            SqlCommand com;
            con.Open();
            str = "Select COUNT(Customer_ID) AS cnt from Customer where Created_On between '6/1/2019'AND '6/30/2019' and Active = 1";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();
            Customer_Progressbar.Style.Add("Width", reader["cnt"].ToString()+'%');
            reader.Close();
            con.Close();
        }
        private void BindUser()
        {
            SqlConnection con = new SqlConnection(connetionString);
            string str;
            SqlCommand com;
            con.Open();
            str = "Select COUNT(U_ID) AS cnm from User_Master where Created_On between '6/1/2019'AND '6/30/2019' and Active = 1";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();
            User_Progressbar.Style.Add("Width", reader["cnm"].ToString() + '%');
            reader.Close();
            con.Close();
        }
        private void BindInvoiceData()
        {
            SqlConnection con = new SqlConnection(connetionString);
            string str;
            SqlCommand com;
            con.Open();
            str = "Select COUNT(InvoiceHeader_ID) from Invoice_Header where Invoice_Date between '6/1/2019'AND '6/30/2019'";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();
            Total_Invoice.Text = reader[""].ToString();
            reader.Close();
            con.Close();
        }
        private void BindInvoicepro()
        {
            SqlConnection con = new SqlConnection(connetionString);
            string str;
            SqlCommand com;
            con.Open();
            str = "Select COUNT(InvoiceHeader_ID) AS cpn from Invoice_Header where Invoice_Date between '6/1/2019'AND '6/30/2019' ";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();
            Invoice_Progressbar.Style.Add("Width", reader["cpn"].ToString() + '%');
            reader.Close();
            con.Close();
        }
        private void BindTotalInvoiceData()
        {
            SqlConnection con = new SqlConnection(connetionString);
            string str;
            SqlCommand com;
            con.Open();
            str = "Select COUNT(InvoiceHeader_ID) from Invoice_Header";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();
            Totalall_Invoice.Text = reader[""].ToString();
            reader.Close();
            con.Close();
        }
        private void BindTotalInvoicepro()
        {
            SqlConnection con = new SqlConnection(connetionString);
            string str;
            SqlCommand com;
            con.Open();
            str = "Select COUNT(InvoiceHeader_ID)as cpn from Invoice_Header";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();
            Invoiceall_Progressbar.Style.Add("Width", reader["cpn"].ToString() + '%');
            reader.Close();
            con.Close();
        }
    }
    }
