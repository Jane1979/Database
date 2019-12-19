using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebShop.Models
{
    public class InvoiceModel
    {
        public string InsertInvoice(Invoice invoice, InvoiceLine invoiceLine)
        {
            try
            {
                ProductEntities db = new ProductEntities();
                db.Invoices.Add(invoice);
                db.InvoiceLines.Add(invoiceLine);
                db.SaveChanges();

                return "Invoice created";

            }
            catch(Exception e)
            {
                return "return Error: " + e;
            }
        }

        public static string InsertInvoice(List<CartModel> cart, int creditCardId)
        {
            try
            {
                using (ProductEntities db = new ProductEntities())
                {
                    Invoice invoice = new Invoice();
                    invoice.FK_CreditCardID = creditCardId;
                    invoice.DateTime = DateTime.Now;

                    db.Invoices.Add(invoice);

                    foreach(var item in cart)
                    {
                        InvoiceLine invoiceLine = new InvoiceLine();
                        invoiceLine.FK_InvoiceID = invoice.InvoiceID;
                        invoiceLine.FK_ProductID = item.ProductID;
                        invoiceLine.Quantity = item.Quantity;

                        db.InvoiceLines.Add(invoiceLine);
                    }

                    db.SaveChanges();
                }

                return "Invoice created";

            }
            catch (Exception e)
            {
                return "return Error: " + e;
            }
        }
    }
}