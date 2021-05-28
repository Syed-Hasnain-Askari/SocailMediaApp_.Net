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
    public partial class DashBoard : System.Web.UI.Page
    {
        string main = ConfigurationManager.ConnectionStrings["SocialApp"].ConnectionString;
        string date = DateTime.Now.ToString();
        int userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            
                GetUserPost();          
        }

        public void GetUserPost()
        {
            if (Session["New"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            SqlConnection con = new SqlConnection(main);
            con.Open();
            string query = "select * from  [dbo].[ Tweets_PakistaniTwitter]";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            Username();
            con.Close();
            
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
            lblUsername.Text = ds1.Tables[0].Rows[0]["Username"].ToString();
            lblUsername.Visible = true;
            string ID= ds1.Tables[0].Rows[0]["UserID"].ToString();
            userID = Convert.ToInt32(ID);
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
            cmd.Parameters.AddWithValue("@Username", lblname.Text);
            cmd.Parameters.AddWithValue("@Post", message.InnerText);
            cmd.Parameters.AddWithValue("@Datetime",date);
            cmd.Parameters.AddWithValue("@UserID", userID);

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
    void deleteEmployee(int id)
    {
        //====== Getting connection string defined in the web.config file. Pointed to the database we want to use.
        SqlConnection con = new SqlConnection(main);
        
 
        //======= Delete Query.
        string cmdText = "DELETE FROM [dbo].[ Tweets_PakistaniTwitter] WHERE TweetID=@Id";
 
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
        cmd.ExecuteNonQuery();
 
        //===== close the connection.
        con.Close();
 
        //===== Bind data to repeater so that repeater will display updated data.
          GetUserPost();
    }
 
    //===== Method to bind relevant data into form fields when edit button is clicked.
   
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //====== Here we use switch state to distinguish which link button is clicked based 
        //====== on command name supplied to the link button.
        switch (e.CommandName)
        {
            //==== This case will fire when link button placed
            //==== inside repeater having command name "Delete" is clicked.
 
            case ("Delete"):
                //==== Getting id of the selelected record(We have passed on link button's command argument property).
                int id = Convert.ToInt32(e.CommandArgument);
 
                //==== Call delete method and pass id as argument.
                deleteEmployee(id);
 
                break;
 
        }
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }

      

    }

}