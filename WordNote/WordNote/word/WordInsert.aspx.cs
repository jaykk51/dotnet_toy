using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WordNote.word
{
    public partial class WordInsert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["memDB"].ConnectionString);
            conn.Open();

            string selectNo = "select top 1 word_no from word_tbl order by word_no desc"; 

            SqlCommand selectNocmd = new SqlCommand(selectNo, conn);
            SqlDataReader dr = selectNocmd.ExecuteReader();
            int wordNo;
            if (dr.Read())
            {
                wordNo = int.Parse( dr["word_no"].ToString ());
                string insertSql = "DBCC CHECKIDENT(word_tbl, RESEED, @word_no) \n insert into word_tbl(eng, kor) values(@eng, @kor)";

                SqlCommand cmd = new SqlCommand(insertSql, conn);

                cmd.Parameters.AddWithValue("@word_no", wordNo);
                cmd.Parameters.AddWithValue("@eng", txteng.Text);
                cmd.Parameters.AddWithValue("@kor", txtkor.Text);
                dr.Close();

                cmd.ExecuteNonQuery();
                Response.Redirect("WordList.aspx");
            }
            
            conn.Close();

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("WordList.aspx");
        }
    }
}