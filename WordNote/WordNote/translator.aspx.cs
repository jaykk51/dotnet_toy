using OfficeOpenXml.FormulaParsing.LexicalAnalysis.TokenSeparatorHandlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WordNote
{
    public partial class translator : System.Web.UI.Page
    {
        public string KeyWord
        {
            get { return txtin.Text; }

        }
      

        protected void Page_Load(object sender, EventArgs e)
        {
            

        }



        protected void btnExec1_Click1(object sender, EventArgs e)
        {
           

            string queryString = "KeyWord=" + Server.UrlEncode(txtin.Text);

            Response.Redirect("translator_rst.aspx?" + queryString);
            
        }

    }
}