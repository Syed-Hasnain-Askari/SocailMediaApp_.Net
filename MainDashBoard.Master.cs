using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace SocialMediaWebApplication
{
    public partial class MainDashBoard : System.Web.UI.MasterPage
    {
        string main = ConfigurationManager.ConnectionStrings["SocialApp"].ConnectionString;
        string date = DateTime.Now.ToString();
        int userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["New"]==null)
            {
                Response.Redirect("Login.aspx");
            }
            else
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
            lblname.Text = ds1.Tables[0].Rows[0]["Username"].ToString();
            lblname.Visible = true;
            con.Close();
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

    }
}