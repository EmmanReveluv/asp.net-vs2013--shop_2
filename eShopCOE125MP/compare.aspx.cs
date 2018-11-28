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
    public partial class compare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["info"] != null)
            {

                lblHello.Visible = true;
                lblHello.Text = "Hello, " + Request.Cookies["info"]["userName"] + " ";
                lnkLogin.Text = "Logout";
                lnkLogin.ForeColor = System.Drawing.Color.Gray;
                string pid1 ="", pid2="";
                string name = "", desc = "", price = "";
                string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("compareSelect", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);

                        cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);

                        cmd.Parameters["@email"].Value = Request.Cookies["user"]["email"];
                        con.Open();
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                        {
                            pid1 = dr["compareitem1"].ToString();
                            pid2 = dr["compareitem2"].ToString();
                        }
                    }
                }
                SqlDataSource1.SelectParameters["id"].DefaultValue = pid1;
                SqlDataSource2.SelectParameters["id"].DefaultValue = pid2;
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