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
    public class SaleController : Controller
    {
        private readonly IConfiguration _configuration;
        public SaleController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        /// <remarks>Get all records from the Sale table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpGet]
        public JsonResult Get()
        {
            string query = "SELECT \"Sale\".id_sale, \"Sale\".\"date\", \"Sale\".\"time\", \"SalesPoint\".\"name\" as \"Магазин\", \"Buyer\".\"name\" as \"Покупатель\", \"Product\".\"name\" as \"Товар\", \"Sale\".total_amount FROM \"Sale\" INNER JOIN \"SalesPoint\" ON \"Sale\".id_sales_point = \"SalesPoint\".id_sales_point LEFT JOIN \"Buyer\" ON \"Sale\".id_buyer = \"Buyer\".id_buyer INNER JOIN \"SalesData\" ON \"Sale\".id_sales_data = \"SalesData\".id_sales_data INNER JOIN \"Product\" ON \"SalesData\".id_product = \"Product\".id_product";
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
        /// Add record to the Sale table.
        /// 
        /// Example Value:
        /// 
        ///     POST /Sale{1,2,3}
        ///     {               
        ///     }
        /// </remarks>
        [HttpPost("{id_buyer}, {id_sales_point}, {id_sales_data}")]
        public JsonResult Post(int id_buyer, int id_sales_point, int id_sales_data)
        {
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                NpgsqlCommand command = new NpgsqlCommand("SELECT insert_into_sale ('" + DateTime.Now.ToString("dd/MM/yyyy") + "','" + DateTime.Now.ToString("HH:mm:ss") + "', " + id_sales_point + ", " + id_buyer + ", " + id_sales_data + ");", connection);
                command.ExecuteNonQuery();

                connection.Close();
            }
            return new JsonResult("Added Successfully");
        }

        /// <remarks>Delete record from the Sale table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpDelete("{id}")]
        public JsonResult Delete(int id)
        {
            string query = "DELETE FROM \"Sale\" WHERE \"Sale\".id_sale = @id_Sale ";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@id_Sale", id);
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
        /// Change record from the Sale table.
        /// 
        /// Example Value:
        /// 
        ///     Put /Sale
        ///     {   
        ///     "id_Sale": 0,
        ///     "id_Sales_Point": 0,
        ///     "id_Buyer": 0,
        ///     "id_Sales_Data": 0
        ///     }
        /// </remarks>
        [HttpPut]
        public JsonResult Put(Sale sale)
        {
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                NpgsqlCommand command = new NpgsqlCommand("UPDATE \"Sale\" SET (date, time, id_sales_point, id_buyer, id_sales_data) =('" + DateTime.Now.ToString("dd/MM/yyyy") + "','" + DateTime.Now.ToString("HH:mm:ss") + "', " + sale.Id_Sales_Point + ", " + sale.Id_Buyer + ", " + sale.Id_Sales_Data + ") WHERE id_sale = " + sale.Id_Sale + ";", connection);
                command.ExecuteNonQuery();

                connection.Close();
            }
            return new JsonResult("Updated Successfully");
        }
    }
}
