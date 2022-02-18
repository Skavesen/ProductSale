using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductSale.Models
{
    public class SalesData
    {
        public int Id_Sales_Data { get; set; }
        public int Id_Product { get; set; }
        public int Quantity { get; set; }
        public int Product_Amount { get; set; }
    }
}
