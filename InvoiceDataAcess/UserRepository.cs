using System.Data;
using System.Data.SqlClient;

namespace InvoiceDataAcess
{
    public class UserRepository
    {
        public bool ValidateUser(string userName, string password)
        {
            bool isValid = false;
            SqlCommand cmd = new SqlCommand();
            SqlConnection con = new SqlConnection();
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();

            con.ConnectionString = @"data source= TIRTHAK\SQLEXPRESS; initial catalog=My project; integrated security=true";

            int i = 0;
            cmd.CommandText = "select * from User_Master where UserName='" + userName + "'and Password='" + password + "'";
            cmd.Connection = con;
            sda.SelectCommand = cmd;
            sda.Fill(ds, "User_Master");
            if (ds.Tables[i].Rows.Count > 0)
            {
                if (userName == ds.Tables[i].Rows[i]["UserName"].ToString() && password == ds.Tables[i].Rows[i]["Password"].ToString())
                {
                    isValid = true;
                }                
            }            
            return isValid;
        }

    }
}
