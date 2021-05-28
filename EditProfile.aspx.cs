using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace SocialMediaWebApplication
{
    public partial class EditProfile : System.Web.UI.Page
    {
        string main = ConfigurationManager.ConnectionStrings["SocialApp"].ConnectionString;
        string date = DateTime.Now.ToString();
        int UserID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                Username();
            }
        }

        public void Username()
        {
            SqlConnection con = new SqlConnection(main);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            DataSet ds1 = new DataSet();
            cmd.CommandText = "select * from [dbo].[Users_PakistaniTwitter] where Email= '" + Session["New"] + "'";
            cmd.Connection = con;
            da1.SelectCommand = cmd;
            da1.Fill(ds1);
            lblUsername.Text = ds1.Tables[0].Rows[0]["Username"].ToString();
            lblUseremail.Text = ds1.Tables[0].Rows[0]["Email"].ToString();
            string ID = ds1.Tables[0].Rows[0]["UserID"].ToString();
            UserID = Convert.ToInt32(ID);
            con.Close();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(main);

            //======= Insert Query.
            string cmdText = "UPDATE [dbo].[Users_PakistaniTwitter] SET Username=@Username,Email=@Email,Password=@Password,Datetime=@Datetime WHERE UserID='"+UserID+"'";

            //====== Providning information to SQL command object about which query to 
            //====== execute and from where to get database connection information.
            SqlCommand cmd = new SqlCommand(cmdText, con);

            cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@Email", txtemailaddress.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@Datetime",date);

            //===== To check current state of the connection object. If it is closed open the connection
            //===== to execute the insert query.
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //===== Execute Query.
            cmd.ExecuteNonQuery();

            //===== close the connection.
            con.Close();
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
            
        }
    }
}