using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Documents;

namespace WordNote
{
    public partial class translator_rst : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink1.Text = Request.QueryString["KeyWord"] + "";
            string url = "https://papago.naver.com/?sk=auto&tk=ko&hn=0&st=";

            url += Server.UrlEncode(HyperLink1.Text);
            HyperLink1.NavigateUrl = url;
        }
    }
}