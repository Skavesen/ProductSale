using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductSale.Models
{
    public class Sale
    {
        public int Id_Sale { get; set; }
        public DateTime Date { get; set; }
        public DateTime Time { get; set; }
        public int Id_Sales_Point { get; set; }
        public int Id_Buyer { get; set; }
        public int Id_Sales_Data { get; set; }
        public int Total_Amount { get; set; }
    }
}
