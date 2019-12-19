using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebShop.Models
{
    public class CreditCardModel
    {
        public static List<CreditCard> GetCreditCards(int customerId)
        {
            try
            {
                using (ProductEntities db = new ProductEntities())
                {
                    List<CreditCard> cards = (from x in db.CreditCards
                                                 where x.FK_CustomerID == customerId
                                                 select x).ToList();

                    return cards;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}