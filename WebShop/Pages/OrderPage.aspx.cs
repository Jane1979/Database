using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Models;

namespace WebShop.Pages
{
    public partial class OrderPage : System.Web.UI.Page
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



                    DropDownListCreditCard.DataSource = CreditCardModel.GetCreditCards(cart.First().customerID);
                    DropDownListCreditCard.DataBind();
                }
            }
        }

        protected void ButtonPurchase_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
            {
                List<CartModel> cart = (List<CartModel>)Session["Cart"];
                int creditCardId;
                
                if (int.TryParse(DropDownListCreditCard.SelectedValue, out creditCardId) && cart.Any()) {
                    InvoiceModel.InsertInvoice(cart, creditCardId);

                    Session["Cart"] = null;
                }
                Response.Redirect("~/Default.aspx");
            }

        }
    }
}