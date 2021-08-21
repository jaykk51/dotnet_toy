using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Forms;
using MessageBox = System.Windows.MessageBox;

namespace WordNote.word
{
    public partial class WordQuiz : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["memDB"].ConnectionString);
        int tmp2;
        int randTmp;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                conn.Open();
                string selectSql = "select eng from word_tbl where word_no=@word_no";
                SqlCommand cmd = new SqlCommand(selectSql, conn);


                //word_tbl 안 데이터 수를 저장하고 그 안에서 랜덤한 수 뽑기
                //뽑힌 난수를 @word_no에 할당,해당 word_no의 eng 데이터를 출력하게함
                string tmp = "SELECT COUNT(*) as cnt FROM word_tbl";

                SqlCommand cmdTmp = new SqlCommand(tmp, conn);
                SqlDataAdapter daTmp = new SqlDataAdapter();
                daTmp.SelectCommand = cmdTmp;
                DataSet dsTmp = new DataSet();
                daTmp.Fill(dsTmp, "tmp_table");



                foreach (DataRow dRow in dsTmp.Tables["tmp_table"].Rows)
                {
                    tmp2 = Int32.Parse(dRow["cnt"].ToString());
                    Random rand = new Random();
                    randTmp = rand.Next(1, tmp2 + 1);
                    cmd.Parameters.AddWithValue("@word_no", randTmp);
                }



                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                DataSet ds = new DataSet();
                da.Fill(ds, "word_table");

                foreach (DataRow dRow in ds.Tables["word_table"].Rows)
                {
                    lbleng.Text = dRow["eng"].ToString();
                }
                conn.Close();

            }

        }
      

        protected void btnExec_Click(object sender, EventArgs e)
        {
            conn.Open();

            string checkA = "SELECT * FROM word_tbl where eng=@eng"; //check answer

            SqlCommand cmdCheck = new SqlCommand(checkA, conn);
            SqlDataAdapter daCheck = new SqlDataAdapter();
            daCheck.SelectCommand = cmdCheck;
            cmdCheck.Parameters.AddWithValue("@eng", lbleng.Text);

            DataSet dsCheck = new DataSet();
            daCheck.Fill(dsCheck, "check_table");

            foreach (DataRow dRow in dsCheck.Tables["check_table"].Rows)
            {
                string answer = dRow["kor"].ToString();
                //Response.Write(answer);
                //Response.Write(txtkor.Text);
                if (answer.Equals(txtkor.Text))
                {
                    AlertPop("정답입니다!");
                    LinkButton1.Visible = true;
                }
                else
                {
                    txtkor.Text = "";
                    AlertPop("오답입니다..");
                }
            }
            conn.Close();
        }

        void AlertPop(string message)
        {
            string script = "alert('" + message + "');"; 
            Guid guidKey = Guid.NewGuid(); 
            Page.ClientScript.RegisterStartupScript(typeof(Page), guidKey.ToString(), script, true);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Server.TransferRequest(Request.Url.AbsolutePath, false); //페이지 리로딩
        }
    }
}

//Response.Redirect(Request.Url.PathAndQuery);
//Response.Redirect(Request.RawUrl);