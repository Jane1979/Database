using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Models;

namespace WebShop.Pages
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillPage();
        }

        private void FillPage()
        {
            if (Session["Cart"] != null)
            {
                List<CartModel> cart = (List<CartModel>)Session["Cart"];

                if (cart.Any())
                {
                    ListViewCart.DataSource = cart;
                    ListViewCart.DataBind();

                    LiteralTotal.Text = cart.Sum(x => x.Price * x.Quantity).ToString();

                    ButtonOrder.Visible = true;
                }
                else
                {
                    ButtonOrder.Visible = false;
                }
            }
        }

        protected void ButtonOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/OrderPage.aspx");
            
        }
    }
}