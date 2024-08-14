using BancoBase.Entities;
using BancoBase.Repository.Interfaces;
using System.Data.SqlClient;
using System.Data;
using Dapper;

namespace BancoBase.Repository
{
    public class CatalogRepository : ICatalogRepository
    {
        public string ConnectionString { get; private set; }
        public void SetConnectionString(string connectionString)
        {
            ConnectionString = connectionString;
        }
        public async Task<IEnumerable<Catalog>> GetAllStatusAsync()
        {
            IEnumerable<Catalog> result;
            using (var conn = CreateConnection())
            {
                result = (await conn.QueryAsync<Catalog>("Catalog.sp_GetAllStatus", commandType: CommandType.StoredProcedure));
            }
            return result;
        }

        private IDbConnection CreateConnection()
        {
            var connection = new SqlConnection(ConnectionString);
            connection.Open();
            return connection;
        }
    }
}