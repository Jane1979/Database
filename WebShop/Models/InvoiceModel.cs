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
    }
}