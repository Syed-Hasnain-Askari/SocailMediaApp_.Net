using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace SocialMediaWebApplication
{
    public partial class Signup : System.Web.UI.Page
    {
        string main = ConfigurationManager.ConnectionStrings["SocialApp"].ConnectionString;
        string datetime = DateTime.Now.ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(main);
            string query = "insert into Users_PakistaniTwitter(UserName,Email,Password,Datetime) values(@username,@email,@password,@Datetime)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@Datetime", datetime);
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Redirect("DashBoard.aspx");
            con.Close();
        }
    }
}