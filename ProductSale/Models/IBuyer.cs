using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductSale.Models
{
    public interface IBuyer
    {
        IQueryable<BuyerTest> GetAll();
        BuyerTest GetById(int id);
        void Add(BuyerTest entity);
        void Delete(int id);
        void Update(BuyerTest entity);
    }
}
