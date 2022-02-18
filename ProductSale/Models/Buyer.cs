using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductSale.Models
{
    public class Buyer
    {
        public int Id_Buyer { get; set; }
        public string Name { get; set; }
        public int[] Mas_Id_Sale { get; set; }
        public string Login { get; set; }
    }
}
