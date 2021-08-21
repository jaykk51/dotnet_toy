using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WordNote.word
{
    public partial class FrmView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["memDB"].ConnectionString);
            conn.Open();

            string selectSql = "select * from word_tbl where word_no=@word_no";

            SqlCommand cmd = new SqlCommand(selectSql, conn);

            string wordNo = Request.QueryString.ToString();  //Request.QueryString.Remove["No="]
            wordNo = wordNo.Substring(wordNo.IndexOf('=') + 1);  //가져온 쿼리스트링에서 "="이전(=포함)내용 삭제

            cmd.Parameters.AddWithValue("@word_no", wordNo);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds, "word_table");

            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();

            //SqlDataReader dr = cmd.ExecuteReader();

            ////if (dr.Read())
            ////{
            ////    txteng.Text = dr["eng"].ToString();
            ////    txtkor.Text = dr["kor"].ToString();
            ////}
            ////dr.Close();



            conn.Close();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["memDB"].ConnectionString);
            conn.Open();

            string updateSql = "update word_tbl set eng=@eng, kor=@kor where word_no=@word_no";

            SqlCommand cmd = new SqlCommand(updateSql, conn);

            string wordNo = Request.QueryString.ToString();  //Request.QueryString.Remove["No="]
            wordNo = wordNo.Substring(wordNo.IndexOf('=') + 1);  //가져온 쿼리스트링에서 "="이전(=포함)내용 삭제

            cmd.Parameters.AddWithValue("@eng", txteng.Text);
            cmd.Parameters.AddWithValue("@kor", txtkor.Text);
            cmd.Parameters.AddWithValue("@word_no", wordNo);

            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("WordList.aspx");

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["memDB"].ConnectionString);
            conn.Open();

            string deleteSql = "delete from word_tbl where word_no=@word_no";

            SqlCommand cmd = new SqlCommand(deleteSql, conn);

            string wordNo = Request.QueryString.ToString(); 
            wordNo = wordNo.Substring(wordNo.IndexOf('=') + 1);
            
            cmd.Parameters.AddWithValue("@word_no", wordNo);

            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("WordList.aspx");

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("WordList.aspx");

        }
    }
}