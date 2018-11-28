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
    public partial class checkout : System.Web.UI.Page
    {
        decimal netPrice;
        decimal discount, reduced, total;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["info"] != null)
            {

                lblHello.Visible = true;
                lblHello.Text = "Hello, " + Request.Cookies["info"]["userName"] + " ";
                lnkLogin.Text = "Logout";
                lnkLogin.ForeColor = System.Drawing.Color.Gray;

                string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;


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
                        if (!Page.IsPostBack)
                        {



                        lblDiscount.Text = "PHP 0";
                        lblTotal1.Text = "PHP " + price.ToString();
                        lblTotal2.Text = "PHP " + price.ToString();
                        }

                        if (size == 0)
                        {
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
            string items = "items: ";
            bool verified = false;

            //credit card verification
            if (ddlCCProvider.Text == "Visa" && txtCCNum.Text.StartsWith("4") && (txtCCNum.Text.Length == 13 || txtCCNum.Text.Length == 16))
            {
                verified = true;
            }
            else if (ddlCCProvider.Text == "Mastercard" && txtCCNum.Text.StartsWith("5") && (txtCCNum.Text.Length == 16))
            {
                verified = true;
            }
            else if (ddlCCProvider.Text == "Discover" && (txtCCNum.Text.StartsWith("6011") || txtCCNum.Text.StartsWith("644") || txtCCNum.Text.StartsWith("65")) && txtCCNum.Text.Length == 16)
            {
                verified = true;
            }
            else if (ddlCCProvider.Text == "American Express" && (txtCCNum.Text.StartsWith("3") || txtCCNum.Text.StartsWith("37")) && txtCCNum.Text.Length == 15)
            {
                verified = true;
            }
            else
                verified = false;


            if (txtAddress.Text != ""
                && txtCCNum.Text != ""
                && ddlCCProvider.Text != ""
                && txtDelivery.Text != ""
                && txtDeliveryMethod.Text != ""
                && txtEmail.Text != ""
                && txtExdate.Text != ""
                && txtName.Text != ""
                && txtSecCode.Text != ""
                && verified)
            {
                string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
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
                        DataTable dt3 = new DataTable();
                        da.Fill(dt3);
                        dt3.Columns.Add("name", typeof(string));
                        dt3.Columns.Add("price", typeof(string));

                        con.Close();
                        foreach (DataRow dr3 in dt3.Rows)
                        {
                            using (SqlConnection con2 = new SqlConnection(constring))
                            {
                                using (SqlCommand cmd2 = new SqlCommand("productSelect", con2))
                                {
                                    cmd2.CommandType = CommandType.StoredProcedure;
                                    SqlDataAdapter da3 = new SqlDataAdapter(cmd2);

                                    cmd2.Parameters.Add("@id", SqlDbType.Int);


                                    cmd2.Parameters["@id"].Value = dr3["cid"].ToString();

                                    con2.Open();

                                    //login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                                    DataTable dt4 = new DataTable();
                                    da3.Fill(dt4);

                                    foreach (DataRow dr4 in dt4.Rows)
                                    {
                                        pn = dr4["name"].ToString();
                                        pp = dr4["price"].ToString();
                                        pd = dr4["description"].ToString();
                                        pc = dr4["category"].ToString();
                                        pi = dr4["pic1src"].ToString();
                                    }
                                    dt3.Rows[size]["name"] = pn;
                                    dt3.Rows[size]["price"] = pp;
                                    price += Convert.ToDecimal(pp);
                                    items = items + pn + "<br />";
                                    con2.Close();
                                }
                            }
                            //add to delivery
                            using (SqlConnection con3 = new SqlConnection(constring))
                            {
                                using (SqlCommand cmd3 = new SqlCommand("deliveryAdd", con3))
                                {
                                    cmd3.CommandType = CommandType.StoredProcedure;

                                    cmd3.Parameters.Add("@email", SqlDbType.VarChar, 50);
                                    cmd3.Parameters.Add("@method", SqlDbType.VarChar, 50);
                                    cmd3.Parameters.Add("@address", SqlDbType.Text);
                                    cmd3.Parameters.Add("@cartnum", SqlDbType.Int);
                                    cmd3.Parameters.Add("@product", SqlDbType.Text);


                                    cmd3.Parameters["@email"].Value = Request.Cookies["user"]["email"];
                                    cmd3.Parameters["@method"].Value = txtDeliveryMethod.Text;
                                    cmd3.Parameters["@address"].Value = txtDelivery.Text;
                                    cmd3.Parameters["@cartnum"].Value = dr3["cartnum"].ToString();
                                    cmd3.Parameters["@product"].Value = pn;

                                    con3.Open();
                                    cmd3.ExecuteNonQuery();
                                    con3.Close();
                                }
                            }
                            size++;
                        }
                    }
                }
                lblRecipt.Text = "**Digital Recipt** <br />Customer email: " + Request.Cookies["user"]["email"] + "<br />Delivery Method: "
                                    + txtDeliveryMethod.Text + "<br />Delivery Address: " + txtDelivery.Text + "<br />Number of items: "
                                    + size.ToString() + "<br /> " + items + "<br />Total Price: PHP " + lblTotal2.Text + "<br />**SCREENCAP/SAVE THIS PAGE AS PROOF OF PURCHASE**";
                //Response.Redirect("orderstatus.aspx");
                pnlForm.Visible = false;
                pnlRecipt.Visible = true;
            }

            else
            {
                lblError.Visible = true;
            }
            if (!verified)
                lblError.Text = "Invalid Credit Card Information";
        }
        protected void btnDiscount_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
            string disc = "";
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("discountSelect", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    cmd.Parameters.Add("@code", SqlDbType.VarChar, 50);

                    cmd.Parameters["@code"].Value = txtCode.Text;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    //login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                    DataTable dt = new DataTable();

                    da.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        disc = dr["discount"].ToString();
                    }
                    discount = Convert.ToDecimal(disc);
                    reduced = (discount / 100) * netPrice;
                    total = netPrice - reduced;
                    decimal.Round(reduced, 2, MidpointRounding.AwayFromZero);

                    lblTotal1.Text = "PHP " + netPrice.ToString();
                    lblDiscount.Text = "-PHP " + reduced.ToString("F");
                    lblTotal2.Text = "PHP " + total.ToString("F");
                }
            }

        }

    }
}