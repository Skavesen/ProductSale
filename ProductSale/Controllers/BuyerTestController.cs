using Microsoft.AspNetCore.Mvc;
using ProductSale.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductSale.Controllers
{
    public class BuyerTestController : Controller
    {
        IBuyer _inMemoryRepository;
        public BuyerTestController(IBuyer inMemoryRepository)
        {
            _inMemoryRepository = inMemoryRepository;
        }
        public IQueryable<BuyerTest> GetAll()
        {
            return _inMemoryRepository.GetAll();
        }
        public BuyerTest GetById(int id)
        {
            return _inMemoryRepository.GetById(id);
        }
        public IActionResult Add([FromBody] BuyerTest buyertest)
        {
            try
            {
                _inMemoryRepository.Add(buyertest);
                return Ok();
            }
            catch
            {
                return BadRequest();
            }
        }
        public IActionResult Deletee(int id)
        {
            try
            {
                _inMemoryRepository.Delete(id);
                return Ok();

            }
            catch
            {
                return BadRequest();
            }
        }
        public IActionResult Update([FromBody] BuyerTest buyertest)
        {
            try
            {
                _inMemoryRepository.Update(buyertest);
                return Ok();

            }
            catch
            {
                return BadRequest();
            }
        }
    }
}
