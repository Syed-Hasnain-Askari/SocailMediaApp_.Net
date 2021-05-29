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
    public partial class UserProfile : System.Web.UI.Page
    {
        string main = ConfigurationManager.ConnectionStrings["SocialApp"].ConnectionString;
        string date = DateTime.Now.ToString();
        int UserID;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["New"] != null)
            {
                GetUserPost();
                SqlConnection con = new SqlConnection(main);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da1 = new SqlDataAdapter(cmd);
                DataSet ds1 = new DataSet();
                cmd.CommandText = "select * from [dbo].[Users_PakistaniTwitter] where Email= '" + Session["New"] + "'";
                cmd.Connection = con;
                da1.SelectCommand = cmd;
                da1.Fill(ds1);
                lblUsername.Text= ds1.Tables[0].Rows[0]["Username"].ToString();
                lblUsername.Visible = true;
                string ID = ds1.Tables[0].Rows[0]["UserID"].ToString();
                UserID = Convert.ToInt32(ID);
                lblGetusername.Text = Session["New"].ToString();
                con.Close();
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
            string ID = ds1.Tables[0].Rows[0]["UserID"].ToString();
            UserID = Convert.ToInt32(ID);
            con.Close();
        }

        public void GetUserPost()
        {
            SqlConnection con = new SqlConnection(main);
            con.Open();
            string query = "select * from [ Tweets_PakistaniTwitter]  order by Datetime DESC";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
           da.Fill(dt);
            Repeater2.DataSource = dt;
            Repeater2.DataBind();
            Username();
            con.Close();


        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(main);
            //======= Insert Query.
            string query = "INSERT INTO [dbo].[ Tweets_PakistaniTwitter] (Username,Post,Datetime,UserID) VALUES (@Username,@Post,@Datetime,@UserID)";

            //====== Providning information to SQL command object about which query to 
            //====== execute and from where to get database connection information.
            SqlCommand cmd = new SqlCommand(query, con);

            //===== Adding parameters/Values.
            cmd.Parameters.AddWithValue("@Username", lblUsername.Text);
            cmd.Parameters.AddWithValue("@Post", message.InnerText);
            cmd.Parameters.AddWithValue("@Datetime", date);
            cmd.Parameters.AddWithValue("@UserID", UserID);

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
        void bindEmployeeDetailToEdit(int id)
        {
            //====== Getting connection string defined in the web.config file. Pointed to the database we want to use.
            SqlConnection con = new SqlConnection(main);
            con.Open();

            //======= Parameterized select Query.
            string cmdText = "SELECT * FROM [dbo].[ Tweets_PakistaniTwitter] WHERE TweetID=@Id";

            //====== Providning information to SQL command object about which query to 
            //====== execute and from where to get database connection information.
            SqlCommand cmd = new SqlCommand(cmdText, con);

            //===== Adding parameters/Values.
            cmd.Parameters.AddWithValue("@Id", id);

            //===== To check current state of the connection object. If it is closed open the connection
            //===== to execute the insert query.
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //===== Execute Query.
            SqlDataReader dr = cmd.ExecuteReader();

            //===== Check if data present.
            if (dr.HasRows)
            {
                //===== Read data from datareader.
                dr.Read();

                //===== Bind values to textboxes.
                message.InnerText = dr["Post"].ToString();

                //==== Store primary key of the selected record in hiddenfield for future reference.
                //==== This will help us when we write update method.
                //hfSelectedRecord.Value = dr["id"].ToString();

            }
            dr.Dispose();

            //===== close the connection.
            con.Close();

        }
        //======== Edit,Delete buttons inside repeater.
        //===== Method to delete employee from database.
        void deletePost(int id)
        {
            //====== Getting connection string defined in the web.config file. Pointed to the database we want to use.
            SqlConnection con = new SqlConnection(main);


            //======= Delete Query.
            string cmdText = "DELETE FROM [dbo].[ Tweets_PakistaniTwitter] WHERE TweetID=@Id";


            SqlCommand cmd = new SqlCommand(cmdText, con);

            cmd.Parameters.AddWithValue("@Id", id);

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

            //===== Bind data to repeater so that repeater will display updated data.
            GetUserPost();
        }

        void editPost(int id)
        {
            SqlConnection con = new SqlConnection(main);
            //======= Parameterized select Query.
            string cmdText = "SELECT * FROM [dbo].[ Tweets_PakistaniTwitter] WHERE TweetID=@Id";

            SqlCommand cmd = new SqlCommand(cmdText, con);

            //===== Adding parameters/Values.
            cmd.Parameters.AddWithValue("@Id", id);

            //===== To check current state of the connection object. If it is closed open the connection
            //===== to execute the insert query.
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //===== Execute Query.
            SqlDataReader dr = cmd.ExecuteReader();

            //===== Check if data present.
            if (dr.HasRows)
            {
                //===== Read data from datareader.
                dr.Read();

                //===== Bind values to textboxes.
                message.InnerText = dr["Post"].ToString();


                //==== Store primary key of the selected record in hiddenfield for future reference.
                //==== This will help us when we write update method.
                hfSelectedRecord.Value = dr["TweetID"].ToString();

            }
            dr.Dispose();

            //===== close the connection.
            con.Close();

            //Show Update button and hide Save button.
            btnPost.Visible = false;
            btnSave.Visible = true;


        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //====== Getting connection string defined in the web.config file. Pointed to the database we want to use.
            SqlConnection con = new SqlConnection(main);

            //======= Insert Query.
            string cmdText = "UPDATE [dbo].[ Tweets_PakistaniTwitter] SET Post=@Post,Datetime=@Datetime WHERE TweetID=@Id";

            //====== Providning information to SQL command object about which query to 
            //====== execute and from where to get database connection information.
            SqlCommand cmd = new SqlCommand(cmdText, con);

            //===== Adding parameters/Values.
            cmd.Parameters.AddWithValue("@Post", message.InnerText);
            cmd.Parameters.AddWithValue("@Datetime", date);
            //====== Remember we have stored primary key in hiddenfield during 
            //====== binding values into textboxes method:(bindEmployeeDetailToEdit).
            //====== We will use same id to pass id parameter.
            cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(hfSelectedRecord.Value));


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

            //===== Bind data to repeater so that repeater will display updated data.
            GetUserPost();

            //===== Show Save button and hide update button.
            btnSave.Visible = false;
            btnPost.Visible = true;

            //===== Clear Hiddenfield
            hfSelectedRecord.Value = string.Empty;
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            switch (e.CommandName)
            {

                case ("Delete"):
                    //==== Getting id of the selelected record(We have passed on link button's command argument property).
                    int id = Convert.ToInt32(e.CommandArgument);

                    //==== Call delete method and pass id as argument.
                    deletePost(id);

                    break;
                case ("Edit"):
                    //==== Getting id of the selelected record(We have passed on link button's command argument property).
                    id = Convert.ToInt32(e.CommandArgument);

                    //==== Call delete method and pass id as argument.
                    editPost(id);

                    break;

            }
        }
    }
}