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
    public partial class cart : System.Web.UI.Page
    {
        decimal netPrice;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCart.Text = "no";
            string ret = Request.QueryString["ret"];
            if (ret == "1")
            {
                lblAdded.Visible = true;
            }
            if (Request.Cookies["info"] != null)
            {
                string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
            
                string del = Request.QueryString["delete"];
            
                if (del != null)
                {
                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        using (SqlCommand cmd = new SqlCommand("cartItemDelete", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            SqlDataAdapter da = new SqlDataAdapter(cmd);

                            cmd.Parameters.Add("@cartnum", SqlDbType.Int);

                            cmd.Parameters["@cartnum"].Value = del;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }



                lblHello.Visible = true;
                lblHello.Text = "Hello, " + Request.Cookies["info"]["userName"] + " ";
                lnkLogin.Text = "Logout";
                lnkLogin.ForeColor = System.Drawing.Color.Gray;

                string cart = "";
                int size = 0;
                string pid = "";
                decimal price = 0;
                string pd = "", pn = "", pp = "", pc = "", pi = "", pq = "";
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("cartSelect", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);

                        cmd.Parameters.Add("@email", SqlDbType.VarChar, 40);

                        cmd.Parameters["@email"].Value = Request.Cookies["user"]["email"];
                        con.Open();

                        //login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        dt.Columns.Add("name", typeof(string));
                        dt.Columns.Add("price", typeof(string));

                        con.Close();
                        foreach (DataRow dr in dt.Rows)
                        {
                            using (SqlConnection con2 = new SqlConnection(constring))
                            {
                                using (SqlCommand cmd2 = new SqlCommand("productSelect", con2))
                                {
                                    cmd2.CommandType = CommandType.StoredProcedure;
                                    SqlDataAdapter da2 = new SqlDataAdapter(cmd2);

                                    cmd2.Parameters.Add("@id", SqlDbType.Int);

                                    cmd2.Parameters["@id"].Value = dr["cid"].ToString();

                                    con2.Open();

                                    //login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                                    DataTable dt2 = new DataTable();
                                    da2.Fill(dt2);

                                    foreach (DataRow dr2 in dt2.Rows)
                                    {
                                        pn = dr2["name"].ToString();
                                        pp = dr2["price"].ToString();
                                        pd = dr2["description"].ToString();
                                        pc = dr2["category"].ToString();
                                        pi = dr2["pic1src"].ToString();
                                    }
                                    dt.Rows[size]["name"] = pn;
                                    dt.Rows[size]["price"] = pp;
                                    price += Convert.ToDecimal(pp);

                                    con2.Close();
                                }
                            }

                            size++;
                        }
                        //cmd.ExecuteNonQuery();
                        cart = size.ToString();
                        netPrice = price;
                        lblCart.Text = cart;
                        lblTotal.Text = "PHP " + price.ToString();
                        lblTotal1.Text = "PHP " + price.ToString();
                        lblTotal2.Text = "PHP " + price.ToString();
                        ListView1.DataSource = dt;
                        ListView1.DataBind();
                        btnCheckout.Visible = true;
                        if (size == 0)
                        {
                            lblCart.Text = cart;
                            btnCheckout.Visible = false;
                        }
                    }
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


        protected void btnCheckout_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/checkout.aspx");
        }

        
    }
}