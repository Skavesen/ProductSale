using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Npgsql;
using ProductSale.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace ProductSale.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductController : Controller
    {
        private readonly IConfiguration _configuration;
        public ProductController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        /// <remarks>Get all records from the Product table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpGet]
        public JsonResult Get()
        {
            string query = "SELECT \"Product\".id_product, \"Product\".\"name\", \"Product\".price FROM \"Product\" ";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    reader = command.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    connection.Close();
                }
            }
            return new JsonResult(table);
        }
        /// <remarks>Add record to the Product table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpPost]
        public JsonResult Post(Product product)
        {
            string query = "INSERT INTO \"Product\" (name, price) values(@Name, @Price)";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", product.Name);
                    command.Parameters.AddWithValue("@Price", product.Price);
                    reader = command.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    connection.Close();
                }
            }
            return new JsonResult("Added Successfully");
        }
        /// <remarks>Delete record from the Product table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpDelete("{id}")]
        public JsonResult Delete(int id)
        {
            string query = "DELETE FROM \"Product\" WHERE \"Product\".id_product = @Id_product ";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_product", id);
                    reader = command.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    connection.Close();

                }
            }
            return new JsonResult("Deleted Successfully");
        }
        /// <remarks>Change record from the Product table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpPut]
        public JsonResult Put(Product product)
        {
            string query = "UPDATE \"Product\" SET (name, price) = (@Name, @Price) WHERE \"Product\".id_product = @Id_Product";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_Product", product.Id_Product);
                    command.Parameters.AddWithValue("@Name", product.Name);
                    command.Parameters.AddWithValue("@Price", product.Price);
                    reader = command.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    connection.Close();

                }
            }
            return new JsonResult("Updated Successfully");
        }
    }
}
