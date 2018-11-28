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
    public partial class adminadd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            } 
            if (Request.Cookies["info"] != null)
            {
                lblHello.Visible = true;
                lblHello.Text = "Hello, " + Request.Cookies["info"]["userName"] + " ";
                lnkLogin.Text = "Logout";
                lnkLogin.ForeColor = System.Drawing.Color.Gray;
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
            string id = Request.QueryString["id"];
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("productAdd", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    //@price decimal,
                    //@subcategory varchar(50),
                    //@category varchar(50),
                    //@name text,
                    //@description text,
                    //@reseller1location text,
                    //@reseller1phone int,
                    //@reseller1email varchar(50),
                    //@reseller1contactperson varchar(50),
                    //@reseller2location text,
                    //@reseller2phone int,
                    //@reseller2email varchar(50),
                    //@reseller2contactperson varchar(50),
                    //@pic1src text,
                    //@pic2src text,
                    //@isfeatured int

                    cmd.Parameters.Add("@price", SqlDbType.Decimal);
                    cmd.Parameters.Add("@subcategory", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@category", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@name", SqlDbType.Text);
                    cmd.Parameters.Add("@description", SqlDbType.Text);
                    cmd.Parameters.Add("@reseller1location", SqlDbType.Text);
                    cmd.Parameters.Add("@reseller1phone", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@reseller1email", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@reseller1contactperson", SqlDbType.VarChar, 40);
                    cmd.Parameters.Add("@reseller2location", SqlDbType.Text);
                    cmd.Parameters.Add("@reseller2phone", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@reseller2email", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@reseller2contactperson", SqlDbType.VarChar, 40);
                    cmd.Parameters.Add("@pic1src", SqlDbType.Text);
                    cmd.Parameters.Add("@pic2src", SqlDbType.Text);
                    cmd.Parameters.Add("@isfeatured", SqlDbType.Int);

                    cmd.Parameters["@price"].Value = Convert.ToDecimal(txtPrice.Text);
                    cmd.Parameters["@subcategory"].Value = txtSubCateg.Text;
                    cmd.Parameters["@category"].Value = txtCateg.Text;
                    cmd.Parameters["@name"].Value = txtName.Text;
                    cmd.Parameters["@description"].Value = txtDesc.Text;
                    cmd.Parameters["@reseller1location"].Value = txtRs1l.Text;
                    cmd.Parameters["@reseller1phone"].Value = txtRs1Pho.Text;
                    cmd.Parameters["@reseller1email"].Value = txtRs1E.Text;
                    cmd.Parameters["@reseller1contactperson"].Value = txtRs1Per.Text;
                    cmd.Parameters["@reseller2location"].Value = txtRs2l.Text;
                    cmd.Parameters["@reseller2phone"].Value = txtRs2Pho.Text;
                    cmd.Parameters["@reseller2email"].Value = txtRs2E.Text;
                    cmd.Parameters["@reseller2contactperson"].Value = txtRs2Per.Text;
                    cmd.Parameters["@pic1src"].Value = txtImg1.Text;
                    cmd.Parameters["@pic2src"].Value = txtImg2.Text;
                    cmd.Parameters["@isfeatured"].Value = Convert.ToInt32(txtFeat.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //login = Convert.ToInt32(cmd.Parameters["@login"].Value);

                }
            }

            Response.Redirect("admininventory.aspx");
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