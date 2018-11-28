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
    public partial class admindeliveryview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string id = Request.QueryString["id"];
                string email = "", method = "", address = "", status = "", product = "";
                string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("deliveryadminSelect", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);

                        cmd.Parameters.Add("@did", SqlDbType.Int);

                        cmd.Parameters["@did"].Value = id;

                        con.Open();

                        //login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        foreach (DataRow dr in dt.Rows)
                        {
                            email = dr["email"].ToString();
                            method = dr["method"].ToString();
                            address = dr["address"].ToString();
                            status = dr["status"].ToString();
                            product = dr["product"].ToString();
                        }
                        //cmd.ExecuteNonQuery();

                        con.Close();
                    }
                    txtID.Text = id;
                    txtEmail.Text = email;
                    txtProduct.Text = product;
                    txtMethod.Text = method;
                    txtAddress.Text = address;
                    txtStatus.Text = status;

                }
                if (Request.Cookies["info"] != null)
                {
                    lblHello.Visible = true;
                    lblHello.Text = "Hello, " + Request.Cookies["info"]["userName"] + " ";
                    lnkLogin.Text = "Logout";
                    lnkLogin.ForeColor = System.Drawing.Color.Gray;
                }
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
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
                string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
                string id = Request.QueryString["id"];
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("deliveryUpdate", con))
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

                        cmd.Parameters.Add("@status", SqlDbType.VarChar, 50);                       
                        cmd.Parameters.Add("@did", SqlDbType.Int);
                       
                        cmd.Parameters["@status"].Value = txtStatus.Text;
                        cmd.Parameters["@did"].Value = id;
                        
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();  
                        //login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                       
                    }
                }

                Response.Redirect("adminorders.aspx");


        
        }
    }
}