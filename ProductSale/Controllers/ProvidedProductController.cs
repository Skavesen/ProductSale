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
    public class ProvidedProductController : Controller
    {
        private readonly IConfiguration _configuration;
        public ProvidedProductController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        /// <remarks>Get all records from the ProvidedProduct table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpGet]
        public JsonResult Get()
        {
            string query = "SELECT \"ProvidedProduct\".id_provided, \"Product\".\"name\", \"ProvidedProduct\".quantity FROM \"ProvidedProduct\" INNER JOIN \"Product\" ON \"ProvidedProduct\".id_product = \"Product\".id_product";
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

        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        /// <remarks>
        /// Add record to the ProvidedProduct table.
        /// 
        /// Example Value:
        /// 
        ///     POST /ProvidedProduct
        ///     {        
        ///       "id_product": "1",
        ///       "quantity": "21"        
        ///     }
        /// </remarks>
        [HttpPost]
        public JsonResult Post(ProvidedProduct providedProduct)
        {
            string query = "INSERT INTO \"ProvidedProduct\" (id_product, quantity) values(@Id_Product, @Quantity)";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_Product", providedProduct.Id_Product);
                    command.Parameters.AddWithValue("@Quantity", providedProduct.Quantity);
                    reader = command.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    connection.Close();
                }
            }
            return new JsonResult("Added Successfully");
        }
        /// <remarks>Delete record from the ProvidedProduct table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpDelete("{id}")]
        public JsonResult Delete(int id)
        {
            string query = "DELETE FROM \"ProvidedProduct\" WHERE \"ProvidedProduct\".id_provided = @id_Provided ";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@id_Provided", id);
                    reader = command.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    connection.Close();

                }
            }
            return new JsonResult("Deleted Successfully");
        }
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        /// <remarks>
        /// Change record from the ProvidedProduct table.
        /// 
        /// Example Value:
        /// 
        ///     Put /ProvidedProduct
        ///     {        
        ///       "id_provided": "1",
        ///       "id_product": "1",
        ///       "quantity": "21"        
        ///     }
        /// </remarks>
        [HttpPut]
        public JsonResult Put(ProvidedProduct providedProduct)
        {
            string query = "UPDATE \"ProvidedProduct\" SET (id_product, quantity) = (@Id_Product, @Quantity) WHERE \"ProvidedProduct\".id_provided = @Id_Provided";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_Provided", providedProduct.Id_Provided);
                    command.Parameters.AddWithValue("@Id_Product", providedProduct.Id_Product);
                    command.Parameters.AddWithValue("@Quantity", providedProduct.Quantity);
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
