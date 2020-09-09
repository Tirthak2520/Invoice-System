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
    public partial class Invoice : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["My projectConnectionString"].ConnectionString;
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                InsertRecord();
                BindDataSetData();
                DropDownList1.Items.Insert(0, new ListItem("--Select Customer--", "0"));
            }
        }
        private void BindDataSetData()
        {
            string CS = ConfigurationManager.ConnectionStrings["My projectConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter("Select Customer_ID,First_Name,Last_Name from Customer", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ds.Tables[0].Columns.Add("FullName", typeof(string), "First_Name +' '+Last_Name");
            DropDownList1.DataValueField = "Customer_ID";
            DropDownList1.DataTextField = "FullName";
            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();
        }
        private DataTable CreateDatatable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Item_Description");
            dt.Columns.Add("Quantity");
            dt.Columns.Add("Price");
            dt.Columns.Add("Discount");
            dt.Columns.Add("Total");
           
            dt.AcceptChanges();
            return dt;
        }
        public void InsertRecord()
        {
            DataTable dt = CreateDatatable();
            dt.Rows.Add("");
            dt.Rows.Add("");
            dt.Rows.Add("");
            dt.Rows.Add("");
            dt.Rows.Add("");
            dt.AcceptChanges();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
        
            SqlConnection con = new SqlConnection(conString);
            com = new SqlCommand("InvoiceHeader", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add("@Invoice_Number", SqlDbType.VarChar).Value = Invoicetxt_No.Text;
            com.Parameters.Add("@Invoice_Date ", SqlDbType.Date).Value = Date_txt.Text;
            com.Parameters.Add("@Term", SqlDbType.VarChar).Value = Term_txt.Text;
            com.Parameters.Add("@SubTotal", SqlDbType.VarChar).Value = txtSub_total.Text;          
            com.Parameters.Add("@GST ", SqlDbType.VarChar).Value = txtGST.Text;
            com.Parameters.Add("@Total", SqlDbType.VarChar).Value = txttotal.Text;
            com.Parameters.Add("@Created_By", SqlDbType.VarChar).Value = txttotal.Text;
            com.Parameters.Add("@Customer_ID", SqlDbType.Int).Value = DropDownList1.SelectedValue;
            com.Parameters.Add("@InvoiceHeader_ID", SqlDbType.Int);
            com.Parameters["@InvoiceHeader_ID"].Direction = ParameterDirection.Output;

 
            con.Open();
            com.ExecuteNonQuery();
            int Invoiceheaderid = Convert.ToInt32(com.Parameters["@InvoiceHeader_ID"].Value);
            con.Close();
            GridView1.Visible = true;

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                string t1 = GridView1.Rows[i].Cells[0].Text;
                TextBox txtItem_Description = (TextBox)GridView1.Rows[i].Cells[0].FindControl("txtItem_Description");
                if (txtItem_Description.Text == "")
                {
                   
                }
                else
                {
                    TextBox txt_Quantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("txt_Quantity");
                    TextBox txt_Price = (TextBox)GridView1.Rows[i].Cells[2].FindControl("txt_Price");
                    TextBox txtDiscount = (TextBox)GridView1.Rows[i].Cells[3].FindControl("txtDiscount");                  
                    Label txtTotal = (Label)GridView1.Rows[i].Cells[4].FindControl("txtTotal");
                    txtTotal.Text =(Convert.ToDouble(txt_Quantity.Text) * Convert.ToDouble( txt_Price.Text) - Convert.ToDouble(txtDiscount.Text)).ToString();
                                 

                    {
                        using (SqlConnection conn = new SqlConnection(conString))
                        {
                            using (SqlCommand com = new SqlCommand())
                            {
                                com.CommandType = CommandType.StoredProcedure;
                                com.CommandText = "InvoiceDetail";
                                com.Connection = conn;
                                conn.Open();
                                com.Parameters.AddWithValue("@Item_Description", SqlDbType.VarChar).Value = txtItem_Description.Text.Trim();
                                com.Parameters.AddWithValue("@Quantity", SqlDbType.Int).Value = txt_Quantity.Text.Trim();
                                com.Parameters.AddWithValue("@Price", SqlDbType.Float).Value = txt_Price.Text.Trim();
                                com.Parameters.AddWithValue("@Discount", SqlDbType.Float).Value = txtDiscount.Text.Trim();
                                com.Parameters.AddWithValue("@Total", SqlDbType.Float).Value = txtTotal.Text.Trim();
                                com.Parameters.AddWithValue("@Created_By", SqlDbType.VarChar).Value = txttotal.Text.Trim();
                                com.Parameters.AddWithValue("@InvoiceHeader_ID", SqlDbType.Int).Value = Invoiceheaderid;
                                com.ExecuteNonQuery();
                                conn.Close();

                            }
                        }
                    }
                }
            }
            Response.Redirect("List.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType==DataControlRowType.DataRow)
            {
                TextBox txt_Quantity = (TextBox)e.Row.FindControl("txt_Quantity");
                TextBox txt_Price = (TextBox)e.Row.FindControl("txt_Price");
                TextBox txtDiscount = (TextBox)e.Row.FindControl("txtDiscount");
                Label txtTotal = (Label)e.Row.FindControl("txtTotal");
                txt_Quantity.Attributes["onchange"]= "calculate_price('" + txt_Quantity.ClientID + "','" + txt_Price.ClientID + "','" + txtDiscount.ClientID + "','" + txtTotal.ClientID + "')";
                txt_Price.Attributes["onchange"] = "calculate_price('" + txt_Quantity.ClientID + "','" + txt_Price.ClientID + "','" + txtDiscount.ClientID + "','" + txtTotal.ClientID + "')";
                txtDiscount.Attributes["onchange"] = "calculate_price('" + txt_Quantity.ClientID + "','" + txt_Price.ClientID + "','" + txtDiscount.ClientID + "','" + txtTotal.ClientID + "')";
                
            }
        }

        protected void cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("List.aspx");
        }
    }
}

