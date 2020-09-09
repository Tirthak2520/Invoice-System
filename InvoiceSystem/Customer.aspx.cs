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
    public partial class Customer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"data source= TIRTHAK\SQLEXPRESS; initial catalog=My project; integrated security=true");
        
        private string SortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
            Form_Panel.Visible = false;

        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            Grid_Panel.Visible = true;
            if (ViewState["Mode"] != null && ViewState["Mode"].ToString() == "Add")
            {
                String constring = @"data source= TIRTHAK\SQLEXPRESS; initial catalog=My project; integrated security=true";
                SqlConnection sqlcon = new SqlConnection(constring);
                String pname = "CustomerEntry"; ;
                sqlcon.Open();
                SqlCommand com = new SqlCommand(pname, sqlcon);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@First_Name", TextBox1.Text.ToString());
                com.Parameters.AddWithValue("@Last_Name", TextBox2.Text.ToString());
                com.Parameters.AddWithValue("@Address1", TextBox3.Text.ToString());
                com.Parameters.AddWithValue("@Address2", TextBox4.Text.ToString());
                com.Parameters.AddWithValue("@City", TextBox5.Text.ToString());
                com.Parameters.AddWithValue("@State", TextBox6.Text.ToString());
                com.Parameters.AddWithValue("@ZipCode", TextBox7.Text.ToString());
                com.Parameters.AddWithValue("@Phone_Number", TextBox8.Text.ToString());
                string gender = string.Empty;
                if (RadioButton3.Checked)
                {
                    gender = "Male";
                }
                else if (RadioButton4.Checked)
                {
                    gender = "Female";
                }
                com.Parameters.AddWithValue("@Gender", gender);
                com.Parameters.AddWithValue("@Email", TextBox9.Text.ToString());
                com.Parameters.AddWithValue("@GST_Number", TextBox10.Text.ToString());
                com.Parameters.AddWithValue("@PAN_Number", TextBox11.Text.ToString());
                com.Parameters.AddWithValue("@Created_By", TextBox1.Text.ToString());
                com.Parameters.AddWithValue("@Active", CheckBox1.Checked);
                com.ExecuteNonQuery();
                sqlcon.Close();
                Label1.Text = "Data Has Been Saved Successfully";
            }
            else if (ViewState["Mode"] != null && ViewState["Mode"].ToString() == "Edit")
            {
                int Customer_ID = Convert.ToInt32(ViewState["Customer_ID"]);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Customer Set First_Name = @First_Name,Last_Name=@Last_Name,Address1 = @Address1, Address2=@Address2,City=@City,State=@State,ZipCode=@ZipCode,Phone_Number=@Phone_Number,Gender=@Gender,Email = @Email,GST_Number=@GST_Number,PAN_Number=@PAN_Number,Active=@Active where Customer_ID = @Customer_ID", con);
                cmd.Parameters.AddWithValue("@First_Name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Last_Name", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Address1", TextBox3.Text);
                cmd.Parameters.AddWithValue("@Address2", TextBox4.Text);
                cmd.Parameters.AddWithValue("@City", TextBox5.Text);
                cmd.Parameters.AddWithValue("@State", TextBox6.Text);
                cmd.Parameters.AddWithValue("@ZipCode", TextBox7.Text);
                cmd.Parameters.AddWithValue("@Phone_Number", TextBox8.Text);
                cmd.Parameters.AddWithValue("Customer_ID", Customer_ID);
                string gender = string.Empty;
                if (RadioButton3.Checked)
                {
                    gender = "Male";
                }
                else if (RadioButton4.Checked)
                {
                    gender = "Female";
                }
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Email", TextBox9.Text);
                cmd.Parameters.AddWithValue("@GST_Number", TextBox10.Text);
                cmd.Parameters.AddWithValue("@PAN_Number", TextBox11.Text);
                cmd.Parameters.AddWithValue("@Created_By", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Active", CheckBox1.Checked);
                cmd.ExecuteNonQuery();
                GridView1.EditIndex = -1;
                con.Close();
                BindGrid();
                Label3.Text = "Data Has Been updated Successfully";

            }            
        }
        private void BindGrid(string sortExpression = null)
        {
            string constr = ConfigurationManager.ConnectionStrings["My projectConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Customer_ID, First_Name,Last_Name,Address1,City,State,ZipCode,Phone_Number,Gender,Email,GST_Number,PAN_Number,Active FROM Customer"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            if (sortExpression != null)
                            {
                                DataView dv = dt.AsDataView();
                                this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";

                                dv.Sort = sortExpression + " " + this.SortDirection;
                                GridView1.DataSource = dv;
                            }
                            else
                            {
                                GridView1.DataSource = dt;
                            }

                            GridView1.EditIndex = -1;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Form_Panel.Visible = false;
            Grid_Panel.Visible = true;
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            this.BindGrid(e.SortExpression);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM Customer where Customer_ID='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindGrid();
            Label3.Text = "Data Has Been Deleted Successfully";
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {               
                int Customer_ID = Convert.ToInt32(e.CommandArgument);
                ViewState["Customer_ID"] = Customer_ID;
                ViewState["Mode"] = "Edit";
                GridViewRow row = null;
                for (int m = 0; m < GridView1.DataKeys.Count; m++)
                {
                    if (GridView1.DataKeys[m].Value.ToString() == Customer_ID.ToString())
                    {
                        row = GridView1.Rows[m];
                        break;
                    }
                }

                TextBox1.Text = row.Cells[0].Text.Trim();
                TextBox2.Text = row.Cells[1].Text.Trim();
                TextBox3.Text = row.Cells[2].Text.Trim();
                TextBox5.Text = row.Cells[3].Text.Trim();
                TextBox6.Text = row.Cells[4].Text.Trim();
                TextBox7.Text = row.Cells[5].Text.Trim();
                TextBox8.Text = row.Cells[6].Text.Trim();
                if (row.Cells[7].Text == "Male")
                {
                    RadioButton3.Checked = true;
                }
                else if (row.Cells[7].Text == "Female")
                {
                    RadioButton4.Checked = true;
                }
                TextBox9.Text = row.Cells[8].Text.Trim();
                TextBox10.Text = row.Cells[9].Text.Trim();
                TextBox11.Text = row.Cells[10].Text.Trim();
                Form_Panel.Visible = true;
                Grid_Panel.Visible = false;
            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
        protected void Add1_Click(object sender, EventArgs e)
        {
            Form_Panel.Visible = true;
            Grid_Panel.Visible = false;
            ViewState["Mode"] = "Add";

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                foreach (LinkButton button in e.Row.Cells[13].Controls.OfType<LinkButton>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Are you sure you want to delete?')){ return false; };";
                    }
                }
            }
        }

        protected void cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer.aspx");
        }
    }
}



