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
    public partial class Login : System.Web.UI.Page
    {
        string main = ConfigurationManager.ConnectionStrings["SocialApp"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(main);
            con.Open();
            string checkuseremail = "select count(*) from Users_PakistaniTwitter where Email='" + txtEmail.Text + "'";
            SqlCommand cmd = new SqlCommand(checkuseremail, con);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            con.Close();
            if (temp == 1)
            {
                con.Open();
                Session["New"] = txtEmail.Text.Trim();
                string checkpasswordquery = "select Password from Users_PakistaniTwitter where Email='" + txtEmail.Text.Trim() + "'";
                SqlCommand compass = new SqlCommand(checkpasswordquery, con);
                string password = compass.ExecuteScalar().ToString();
                if (password == txtPassword.Text)
                {
                    Session["New"] = txtEmail.Text.Trim();
                    Response.Redirect("MainDashBoard.aspx");
                }
                else
                {
                    Response.Write("Invalid Pasword");
                }

            }
            else
            {
                Response.Write("Invalid UserName");
            }
            con.Close();
        }
    }
}