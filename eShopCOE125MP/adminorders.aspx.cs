using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eShopCOE125MP
{
    public partial class adminorders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["info"] != null)
            {
                lblHello.Visible = true;
                lblHello.Text = "Hello, " + Request.Cookies["info"]["userName"] + " ";
                lnkLogin.Text = "Logout";
                lnkLogin.ForeColor = System.Drawing.Color.Gray;
            }
        }
        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["info"] != null)
            {
                HttpCookie aCookie;
                string cookieName;
                int limit = Request.Cookies.Count;
                for (int i = 0; i < limit; i++)
                {
                    cookieName = Request.Cookies[i].Name;
                    aCookie = new HttpCookie(cookieName);
                    aCookie.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(aCookie);
                }
            }
            Response.Redirect("~/login.aspx");
        }
    }
}