using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace CSCI3321_ASPNET_FinalProject
{
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BuildBookTable();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            if (txtBookTitle.Text.Trim() != "" && txtPrice.Text.Trim() != "" && txtPublishDate.Text.Trim() != "")
            {

                cmd.CommandText = "INSERT INTO Books VALUES ('" + txtBookTitle.Text + "', " +
                    ddlAuthor.SelectedValue + ", " + txtPrice.Text + ", '" + txtPublishDate.Text +
                    "', " + ddlPublisher.SelectedValue + ", " + ddlGenre.SelectedValue + ", NULL" + ")";

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                this.lblResults.Visible = true;
            }

            BuildBookTable();
        }

        public void BuildBookTable()
        {
            /// TODO: Dynamiclly build your book collection with the following information
            /// 1. Book title
            /// 2. Author's LastName and FirstName
            /// 3. Price
            /// 4. Publish date
            /// 5. Publisher's name
            /// 6. Genre
            /// 
            // 1. Create a SqlConnection object
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            // 2. Create a SqlCommand object using the above connection object
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT Title, FirstName, LastName, Price, PublishDate, PublisherName, GenreName FROM Books " +
                "INNER JOIN Authors ON Books.AuthorID = Authors.AuthorID " +
                "INNER JOIN Publishers ON Books.PublisherID = Publishers.PublisherID " +
                "INNER JOIN Genres ON Books.GenreID = Genres.GenreID";

            // 3. Open the connection and execute the command
            // store the returned data in a SqlDataReader object
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    TableRow tr = new TableRow();
                    TableCell tc = new TableCell();
                    tc.Text = reader["Title"].ToString();
                    tr.Cells.Add(tc);

                    tc = new TableCell();
                    tc.Text = reader["FirstName"].ToString();
                    tr.Cells.Add(tc);

                    tc = new TableCell();
                    tc.Text = reader["LastName"].ToString();
                    tr.Cells.Add(tc);

                    tc = new TableCell();
                    tc.Text = reader["Price"].ToString();
                    tr.Cells.Add(tc);

                    tc = new TableCell();
                    tc.Text = reader["PublishDate"].ToString();
                    tr.Cells.Add(tc);

                    tc = new TableCell();
                    tc.Text = reader["PublisherName"].ToString();
                    tr.Cells.Add(tc);

                    tc = new TableCell();
                    tc.Text = reader["GenreName"].ToString();
                    tr.Cells.Add(tc);

                    tblBookList.Rows.Add(tr);
                }
            }
        }
    }
}
        
    
