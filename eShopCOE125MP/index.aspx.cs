using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace eShopCOE125MP
{
    public partial class index : System.Web.UI.Page
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
            string sent = Request.QueryString["sent"];
            if (sent == "1")
            {
                lblDone.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#contact';", true);
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

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text != "" && txtMessage.Text != "")
            {
                string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("messageAdd", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@message", SqlDbType.Text);
                        cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);

                        cmd.Parameters["@email"].Value = txtEmail.Text;
                        cmd.Parameters["@message"].Value = txtMessage.Text;
                        con.Open();

                        cmd.ExecuteNonQuery();
                        
                        
                            Response.Redirect("~/index.aspx?sent=1");
                        
                    }

                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/search.aspx?search=" + txtSearch.Text);
        }

    }
}