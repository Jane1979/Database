using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebShop.Models
{
    public class CustomerModel
    {
        public Customer GetCustomer(int id)
        {
            try 
            { 
                using(ProductEntities db = new ProductEntities()) 
                {
                    Customer customer = db.Customers.Find(id);
                    return customer;
                }
            }
            catch(Exception) 
            {
                return null;
            }
        }

        public List<Customer>GetAllCustomer()
        {
            try
            {
                using(ProductEntities db = new ProductEntities())
                {
                    List<Customer> customer = (from x in db.Customers select x).ToList();

                    return customer;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

    }
}