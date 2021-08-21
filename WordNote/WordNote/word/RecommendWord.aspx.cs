using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WordNote.word
{
    public partial class RecommendWord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //xlsx > txt 유니코드 인코딩, 줄바꿈 문자를 <br/>로 지정함
            //모든 줄을 읽어 Label1에 출력
            string filepath = Request.PhysicalApplicationPath + @"dbDocs\";
            string filename = filepath + "words.txt";
            string filecontet = File.ReadAllText(filename);

  
            Label1.Text = filecontet;
        }
    }
    
}