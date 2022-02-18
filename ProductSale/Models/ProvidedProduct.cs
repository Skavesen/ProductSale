using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductSale.Models
{
    public class ProvidedProduct
    {
        public int Id_Provided{ get; set; }
        public int Id_Product { get; set; }
        public int Quantity { get; set; }
    }
}
