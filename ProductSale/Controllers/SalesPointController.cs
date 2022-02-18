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
    public class SalesPointController : Controller
    {
        private readonly IConfiguration _configuration;
        public SalesPointController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        /// <remarks>Get all records from the SalesPoint table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpGet]
        public JsonResult Get()
        {
            string query = "SELECT \"SalesPoint\".id_sales_point, \"SalesPoint\".\"name\", \"SalesPoint\".id_provided FROM \"SalesPoint\"";
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
        /// <remarks>Add record to the SalesPoint table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpPost]
        public JsonResult Post(SalesPoint salesPoint)
        {
            string query = "INSERT INTO \"SalesPoint\" (name, id_provided) values(@Name, @Id_Provided)";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", salesPoint.Name);
                    command.Parameters.AddWithValue("@Id_Provided", salesPoint.Id_Provided);
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
            string query = "DELETE FROM \"SalesPoint\" WHERE \"SalesPoint\".id_sales_point = @Id_Sales_Point ";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_Sales_Point", id);
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
        ///     Put /SalesPoint
        ///     {        
        ///       "id_sales_point": 10,
        ///       "name": "Продуктовый",
        ///       "id_provided": "1"      
        ///     }
        /// </remarks>
        [HttpPut]
        public JsonResult Put(SalesPoint salesPoint)
        {
            string query = "UPDATE \"SalesPoint\" SET (name, id_provided) = (@Name, @Id_Provided) WHERE \"SalesPoint\".id_sales_point = @Id_Sales_Point";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_Sales_Point", salesPoint.Id_Sales_Point);
                    command.Parameters.AddWithValue("@Name", salesPoint.Name);
                    command.Parameters.AddWithValue("@Id_Provided", salesPoint.Id_Provided);
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
