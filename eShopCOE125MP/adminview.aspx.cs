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
    public partial class adminview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string id = Request.QueryString["id"];
                string name = "", desc = "", price = "", image1 = "", image2 = "";
                string rs1loc = "", rs1phone = "", rs1email = "", rs1person = "";
                string rs2loc = "", rs2phone = "", rs2email = "", rs2person = "";
                string categ = "", subcateg = "", isfeat = "";
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
                            isfeat = dr["isfeatured"].ToString();
                        }
                        //cmd.ExecuteNonQuery();

                        con.Close();
                    }

                    txtName.Text = name;
                    txtCateg.Text = categ;
                    txtSubCateg.Text = subcateg;
                    txtPrice.Text = price;
                    txtID.Text = id;
                    txtRs1E.Text = rs1email;
                    txtRs1l.Text = rs1loc;
                    txtRs1Per.Text = rs1person;
                    txtRs1Pho.Text = rs1phone;
                    txtRs2E.Text = rs2email;
                    txtRs2l.Text = rs2loc;
                    txtRs2Per.Text = rs2person;
                    txtRs2Pho.Text = rs2phone;
                    txtImg1.Text = image1;
                    txtImg2.Text = image2;
                    txtFeat.Text = isfeat;
                    txtDesc.Text = desc;

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
            txtDesc.Text = txtDesc.Text.Replace(System.Environment.NewLine, "<br />" + System.Environment.NewLine);

            string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
            string id = Request.QueryString["id"];
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("basicUpdateProduct", con))
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
                    cmd.Parameters.Add("@id", SqlDbType.Int);

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
                    cmd.Parameters["@id"].Value = id;

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //login = Convert.ToInt32(cmd.Parameters["@login"].Value);

                }
            }

            Response.Redirect("admininventory.aspx");
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {

            string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
            string id = Request.QueryString["id"];
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("productDelete", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    cmd.Parameters.Add("@id", SqlDbType.Int);

                    cmd.Parameters["@id"].Value = id;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("~/admininventory.aspx");
                }
            }
        }


    }
}