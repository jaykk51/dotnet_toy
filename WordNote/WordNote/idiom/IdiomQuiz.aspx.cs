using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WordNote.idiom
{
    public partial class IdiomQuiz : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["memDB"].ConnectionString);
        
        int tmp2;
        int randTmp;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                conn.Open();

                string selectSql = "select idiom_eng from idiom_tbl where idiom_no=@idiom_no";
                SqlCommand cmd = new SqlCommand(selectSql, conn);


                //idiom_tbl 안 데이터 수를 저장하고 그 안에서 랜덤한 수 뽑기
                //뽑힌 난수를 @idiom_no에 할당,해당 idiom_no의 eng 데이터를 출력하게함
                string tmp = "SELECT COUNT(*) as cnt FROM idiom_tbl";

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
                    cmd.Parameters.AddWithValue("@idiom_no", randTmp);
                }



                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                DataSet ds = new DataSet();
                da.Fill(ds, "idiom_table");

                foreach (DataRow dRow in ds.Tables["idiom_table"].Rows)
                {
                    lblidiomeng.Text = dRow["idiom_eng"].ToString();
                }
                conn.Close();

            }
            else
            {

            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {


            string checkA = "SELECT * FROM idiom_tbl where CONVERT(VARCHAR, idiom_eng)=@idiom_eng"; //check answer

            SqlCommand cmdCheck = new SqlCommand(checkA, conn);
            SqlDataAdapter daCheck = new SqlDataAdapter();
            daCheck.SelectCommand = cmdCheck;
            cmdCheck.Parameters.AddWithValue("@idiom_eng", lblidiomeng.Text);

            DataSet dsCheck = new DataSet();
            daCheck.Fill(dsCheck, "check_table");

            foreach (DataRow dRow in dsCheck.Tables["check_table"].Rows)
            {
                string answerKor = dRow["idiom_name"].ToString();
                //Response.Write(answerKor);
                //Response.Write(txtidiomkor.Text);
                if (txtidiomkor.Text.Equals(answerKor))
                {
                    AlertPop("정답입니다!");
                    LinkButton1.Visible = true;
                }
                else
                {
                    txtidiomkor.Text = "";
                    AlertPop("오답입니다..");
                }
            }
            

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();

            Response.Redirect(Request.Url.AbsoluteUri); //페이지 리로딩
        }

        void AlertPop(string message)
        {
            string script = "alert('" + message + "');";
            Guid guidKey = Guid.NewGuid();
            Page.ClientScript.RegisterStartupScript(typeof(Page), guidKey.ToString(), script, true);
        }


        protected void checkhint_CheckedChanged(object sender, EventArgs e)
        {
        
            if (checkhint.Checked)
            {
                conn.Open();
                string checkHint = "SELECT * FROM idiom_tbl where CONVERT(VARCHAR, idiom_eng)=@idiom_eng"; //check answer

                SqlCommand cmdHint = new SqlCommand(checkHint, conn);
                SqlDataAdapter daHint = new SqlDataAdapter();
                daHint.SelectCommand = cmdHint;
                cmdHint.Parameters.AddWithValue("@idiom_eng", lblidiomeng.Text);

                DataSet dsHint = new DataSet();
                daHint.Fill(dsHint, "hint_table");
                //Response.Write(lblidiomeng.Text);

                SqlDataReader dr = cmdHint.ExecuteReader();

                if (dr.Read())
                {
                    lblhint.Text = dr["idiom_kor"].ToString();
                }
         
            }
            else
            {
                lblhint.Text = "";
            }
      
        }
       
    }
    
}