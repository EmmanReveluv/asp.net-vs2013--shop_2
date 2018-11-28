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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["info"] != null)
            {
                Response.Redirect("~/index.aspx");
            }

            string reg = Request.QueryString["reg"];
            if (reg == "1")
            {
                lblHidden.Text = "Registration Success!";
                lblHidden.Visible = true;
            }
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            bool uniqueUsername = false;
            int size = 0;
            string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("selectSameUsername", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);

                    cmd.Parameters["@email"].Value = txtEmail.Text;
                    con.Open();

                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {
                        size++;
                    }
                    //cmd.ExecuteNonQuery();
                    con.Close();
                    if (size == 0)
                        uniqueUsername = true;
                }
            }

            if (txtName.Text != "" &&
                txtEmail.Text != "" &&
                txtPassword.Text != "" &&
                (txtPassword.Text == txtConfirmPassword.Text) &&
                txtContact.Text != "" &&
                uniqueUsername)
            {
                try
                {
                    int success = 0;
                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        using (SqlCommand cmd = new SqlCommand("userAdd", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                            cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);
                            cmd.Parameters.Add("@password", SqlDbType.VarChar, 50);
                            cmd.Parameters.Add("@phone", SqlDbType.VarChar, 50);
                            cmd.Parameters.Add("@ret", SqlDbType.Int).Direction = ParameterDirection.Output;

                            cmd.Parameters["@name"].Value = txtName.Text;
                            cmd.Parameters["@email"].Value = txtEmail.Text;
                            cmd.Parameters["@password"].Value = txtPassword.Text;
                            cmd.Parameters["@phone"].Value = txtContact.Text;
                            con.Open();

                            cmd.ExecuteNonQuery();
                            success = Convert.ToInt32(cmd.Parameters["@ret"].Value);
                            if (success == 1)
                            {
                                Response.Redirect("~/login.aspx?reg=1");
                                txtName.Text = "";
                                txtEmail.Text = "";
                                txtPassword.Text = "";
                                txtContact.Text = "";
                            }
                        }

                    }
                }
                catch
                {
                }

            }
            else if (!uniqueUsername)
            {
                lblHidden.Text = "Another account with the same e-mail is already registered.";
                lblHidden.ForeColor = System.Drawing.Color.Red;
                lblHidden.Visible=true;
            }
            else if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblHidden.Text = "Passwords do not match, please try again";
                lblHidden.ForeColor = System.Drawing.Color.Red;
                lblHidden.Visible=true;
            }
            else
            {
                lblHidden.Text = "Please fill up the required fields";
                lblHidden.ForeColor = System.Drawing.Color.Red;
                lblHidden.Visible = true;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                int login = 0;
                string userType = "0";
                string userName = "";
                string email = "";
                string constring = ConfigurationManager.ConnectionStrings["dbStoreConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("loginSelect", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);
                        cmd.Parameters.Add("@password", SqlDbType.VarChar, 50);
                        cmd.Parameters.Add("@login", SqlDbType.Int).Direction = ParameterDirection.Output;

                        cmd.Parameters["@email"].Value = txtLogEmail.Text;
                        cmd.Parameters["@password"].Value = txtLogPass.Text;
                        con.Open();

                        cmd.ExecuteNonQuery();
                        login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                        {
                            userType = dr["usertype"].ToString();
                            userName = dr["name"].ToString();
                            email = dr["email"].ToString();

                        }
                        if (login == 1)
                        {
                            Response.Cookies["info"]["userName"] = userName;
                            Response.Cookies["info"].Expires = DateTime.Now.AddDays(1);
                            Response.Cookies["user"]["email"] = email;
                            Response.Cookies["user"].Expires = DateTime.Now.AddDays(1);
                            if (userType == "1")
                                Response.Redirect("~/admininventory.aspx");
                            else
                                Response.Redirect("~/index.aspx");
                        }
                        else
                        {
                            lblError.Visible = true;
                            lblError.ForeColor = System.Drawing.Color.Red;
                            lblError.Text = "Invalid Username or Password";
                        }


                    }

                }
            }
            catch
            {
                lblError.Visible = true;
                lblError.Text = "Login Failed (Database Error)";
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