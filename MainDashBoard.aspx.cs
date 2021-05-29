using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SocialMediaWebApplication
{
    public partial class MainDashBoard1 : System.Web.UI.Page
    {
        string main = ConfigurationManager.ConnectionStrings["SocialApp"].ConnectionString;
        string date = DateTime.Now.ToString();
        int UserID;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["New"] != null)
            {
                GetUserPost();
                GetUser();
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
                string ID = ds1.Tables[0].Rows[0]["UserID"].ToString();
                UserID = Convert.ToInt32(ID);
                con.Close();
            }

           
          
        }
 
        public void GetUserPost()
        {
            SqlConnection con = new SqlConnection(main);
            con.Open();
            string query = "select * from  [dbo].[ Tweets_PakistaniTwitter]  order by Datetime DESC";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            con.Close();
            

        }
        public void GetUser()
        {
            SqlConnection con = new SqlConnection(main);
            con.Open();
            string query = "select * from  [dbo].[Users_PakistaniTwitter]  order by Datetime DESC";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            Repeater2.DataSource = dt;
            Repeater2.DataBind();
            con.Close();


        }
      
        protected void btnPost_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(main);
            //======= Insert Query.
            string query = "INSERT INTO [dbo].[ Tweets_PakistaniTwitter] (Username,Post,datetime,UserID) VALUES (@Username,@Post,@Datetime,@UserID)";

            //====== Providning information to SQL command object about which query to 
            //====== execute and from where to get database connection information.
            SqlCommand cmd = new SqlCommand(query, con);

            //===== Adding parameters/Values.
            cmd.Parameters.AddWithValue("@Username",lblUsername.Text);
            cmd.Parameters.AddWithValue("@Post", message.InnerText);
            cmd.Parameters.AddWithValue("@Datetime", date);
            cmd.Parameters.AddWithValue("@UserID",UserID);

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

            //===== Clear text from textboxes
            message.InnerText = string.Empty;


            GetUserPost();

        }
      
     
    }
}