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
    public class SalesDataController : Controller
    {
        private readonly IConfiguration _configuration;
        public SalesDataController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        /// <remarks>Get all records from the Sales Data table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpGet]
        public JsonResult Get()
        {
            string query = "SELECT \"SalesData\".id_sales_data, \"Product\".\"name\", \"SalesData\".quantity, \"SalesData\".product_amount FROM \"SalesData\" INNER JOIN \"Product\" ON \"SalesData\".id_product = \"Product\".id_product";
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
        /// <remarks>Add record to the SalesData table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpPost]
        public JsonResult Post(SalesData salesData)
        {
            string query = "INSERT INTO \"SalesData\" (id_product, quantity, product_amount) values(@Id_Product, @Quantity, @Product_Amount)";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_Product", salesData.Id_Product);
                    command.Parameters.AddWithValue("@Quantity", salesData.Quantity);
                    command.Parameters.AddWithValue("@Product_Amount", salesData.Product_Amount);
                    reader = command.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    connection.Close();
                }
            }
            return new JsonResult("Added Successfully");
        }
        /// <remarks>Delete record from the SalesData table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpDelete("{id}")]
        public JsonResult Delete(int id)
        {
            string query = "DELETE FROM \"SalesData\" WHERE \"SalesData\".id_sales_data = @Id_Sales_Data ";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_Sales_Data", id);
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
        /// Change record from the SalesData table.
        /// 
        /// Example Value:
        /// 
        ///     Put /SalesData
        ///     {        
        ///       "id_sales_data": "1",
        ///       "id_product": "1",
        ///       "quantity": "10",
        ///       "product_amount": "210"        
        ///     }
        /// </remarks>
        [HttpPut]
        public JsonResult Put(SalesData salesData)
        {
            string query = "UPDATE \"SalesData\" SET (id_product, quantity, product_amount) = (@Id_Product, @Quantity, @Product_Amount) WHERE \"SalesData\".id_sales_data = @Id_Sales_Data";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_Sales_Data", salesData.Id_Sales_Data);
                    command.Parameters.AddWithValue("@Id_Provided", salesData.Id_Product);
                    command.Parameters.AddWithValue("@Id_Product", salesData.Quantity);
                    command.Parameters.AddWithValue("@Quantity", salesData.Product_Amount);
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
