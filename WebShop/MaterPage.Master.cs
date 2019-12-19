using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebShop
{
    public partial class MaterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                var user = Session["Email"].ToString();

                if (user != null)
                {
                    litStatus.Text = Session["Email"].ToString();

                    lnkLogin.Visible = false;
                    lnkUser.Visible = false;

                    lnkLogout.Visible = true;
                    litStatus.Visible = true;
                    lnkCart.Visible = true;
                }
            }
            else
            {
                lnkLogin.Visible = true;
                lnkUser.Visible = true;

                lnkCart.Visible = false;
                lnkLogout.Visible = false;
                litStatus.Visible = false;
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Default.aspx");
        }
    }
}