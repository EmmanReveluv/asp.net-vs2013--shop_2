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
    public partial class view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            string name ="", desc="", price="", image1="", image2="";
            string rs1loc = "", rs1phone = "", rs1email = "", rs1person = "";
            string rs2loc = "", rs2phone = "", rs2email = "", rs2person = "";
            string categ = "", subcateg = "";
            string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("productSelect", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    cmd.Parameters.Add("@id", SqlDbType.Int);

                    cmd.Parameters["@id"].Value = id;

                    con.Open();

                    //login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {
                        name = dr["name"].ToString();
                        desc = dr["description"].ToString();
                        price = dr["price"].ToString();
                        image1 = dr["pic1src"].ToString();
                        image2 = dr["pic2src"].ToString();
                        categ = dr["category"].ToString();
                        subcateg = dr["subcategory"].ToString();
                        rs1loc = dr["reseller1location"].ToString();
                        rs1email = dr["reseller1email"].ToString();
                        rs1phone = dr["reseller1phone"].ToString();
                        rs1person = dr["reseller1contactperson"].ToString();
                        rs2loc = dr["reseller2location"].ToString();
                        rs2email = dr["reseller2email"].ToString();
                        rs2phone = dr["reseller2phone"].ToString();
                        rs2person = dr["reseller2contactperson"].ToString();
                    }
                    //cmd.ExecuteNonQuery();
                    
                    con.Close();
                }
                lblDesc.Text = desc;
                lblPrice.Text = price;
                imgOne.ImageUrl = image1;
                img1st.ImageUrl = image1;
                img2nd.ImageUrl = image2;
                lblName.Text = name;

                //resellers
                lblRs1loc.Text = "Location: " + rs1loc;
                lblRs1email.Text = "Email: " + rs1email;
                lblRs1phone.Text = "Phone: " + rs1phone;
                lblRs1person.Text = "Contact Person: " + rs1person;


                lblRs2loc.Text = "Location: " + rs2loc;
                lblRs2email.Text = "Email: " + rs2email;
                lblRs2phone.Text = "Phone: " + rs2phone;
                lblRs2person.Text = "Contact Person: " + rs2person;

            }

            if (Request.Cookies["info"] != null)
            {
                lblHello.Visible = true;
                lblHello.Text = "Hello, " + Request.Cookies["info"]["userName"] + " ";
                lnkLogin.Text = "Logout";
                lnkLogin.ForeColor = System.Drawing.Color.Gray;
                lblNoLogon.Visible = false;
                btnAddCart.Visible = true;
                btnCompare1.Visible = true;
                btnCompare2.Visible = true;
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

        protected void img1st_Click(object sender, ImageClickEventArgs e)
        {
            imgOne.ImageUrl = img1st.ImageUrl;
        }

        protected void img2nd_Click(object sender, ImageClickEventArgs e)
        {
            imgOne.ImageUrl = img2nd.ImageUrl;
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/search.aspx?search=" + txtSearch.Text);
        }

        protected void btnAddCart_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            int ret;
            string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("cartAdd", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@cid", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@ret", SqlDbType.Int).Direction = ParameterDirection.Output;

                    cmd.Parameters["@email"].Value = Request.Cookies["user"]["email"];
                    cmd.Parameters["@cid"].Value = Request.QueryString["id"];
                    con.Open();

                    cmd.ExecuteNonQuery();
                    ret = Convert.ToInt32(cmd.Parameters["@ret"].Value);
                    con.Close();
                    if (ret == 1)
                    {
                        Response.Redirect("~/cart.aspx?ret=1");
                    }

                }

            }
        }

        protected void btnCompare1_Click(object sender, EventArgs e)
        {
            string pid = Request.QueryString["id"];
            string email = Request.Cookies["user"]["email"];
            string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("compare1Insert", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@compareitem1", SqlDbType.Int);

                    cmd.Parameters["@email"].Value = email;
                    cmd.Parameters["@compareitem1"].Value = pid;
                    con.Open();

                    cmd.ExecuteNonQuery();

                }

            }
            Response.Redirect("~/compare.aspx");
        }

        protected void btnCompare2_Click(object sender, EventArgs e)
        {
            string pid = Request.QueryString["id"];
            string email = Request.Cookies["user"]["email"];
            string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("compare2Insert", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@compareitem2", SqlDbType.Int);

                    cmd.Parameters["@email"].Value = email;
                    cmd.Parameters["@compareitem2"].Value = pid;
                    con.Open();

                    cmd.ExecuteNonQuery();

                }

            }

            Response.Redirect("~/compare.aspx");
        }
    }
}