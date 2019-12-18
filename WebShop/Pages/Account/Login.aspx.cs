using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Models;

namespace WebShop.Pages.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CustomerModel customerModel = new CustomerModel();
            List<Customer> customers = customerModel.GetAllCustomer();
            string username = TextBox1.Text;
            string password = TextBox2.Text;

            if (username != null && password != null)
            {
                foreach (Customer c in customers)
                {
                    var email = customers.Exists(x => x.Email == username);
                    var loginpass = customers.Exists(x => x.Password == password);

                    if (email == true && loginpass == true)
                    {
                        Session["Email"] = TextBox1.Text;
                        Session.Add("CustomerID", c.CustomerID);
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        Label1.Text = "You're username and word is incorrect";
                        Label1.ForeColor = System.Drawing.Color.Red;
                    }                    

                }
            }
            else 
            {
                Label1.Text = "You're username and word is incorrect";
                Label1.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}