using BancoBase.Entities;
using BancoBase.Repository.Interfaces;
using System.Data.SqlClient;
using System.Data;
using Dapper;

namespace BancoBase.Repository
{
    public class PaymentRepository : IPaymentRepository
    {
        public string ConnectionString { get; private set; }
        public void SetConnectionString(string connectionString)
        {
            ConnectionString = connectionString;
        }
        public async Task<Guid> CreatePaymentAsync(Payment payment)
        {
            if (payment is null)
            {
                return Guid.Empty;
            }
            var parameters = new DynamicParameters();
            parameters.Add("@ID", payment.ID);
            parameters.Add("@Concept", payment.Concept);
            parameters.Add("@QtyProducts", payment.QtyProducts);
            parameters.Add("@From", payment.From);
            parameters.Add("@To", payment.To);
            parameters.Add("@Total", payment.Total);
            parameters.Add("@StatusID", payment.StatusID);

            using (var conn = CreateConnection())
            {
               await conn.QueryFirstOrDefaultAsync<Guid>("dbo.sp_CreatePayment", parameters, commandType: CommandType.StoredProcedure);
               return payment.ID;
            }
        }

        public async Task<Payment?> GetPaymentByIdAsync(Guid id)
        {
            Payment? result;
            var parameters = new DynamicParameters();
            parameters.Add("@ID", id);
            using (var conn = CreateConnection())
            {
                result = await conn.QueryFirstOrDefaultAsync<Payment>("dbo.sp_GetPaymentByID", parameters, commandType: CommandType.StoredProcedure);
            }
            return result;
        }

        public async Task<bool> UpdatePaymentStatusAsync(Guid id, int newStatusId)
        {
            if (newStatusId == 0)
            {
                return false;
            }

            var parameters = new DynamicParameters();
            parameters.Add("@ID", id);
            parameters.Add("@StatusID", newStatusId);

            using (var conn = CreateConnection())
            {
                await conn.ExecuteScalarAsync("dbo.sp_UpdatePaymentStatus", parameters, commandType: CommandType.StoredProcedure);
                return true;
            }
        }
        private IDbConnection CreateConnection()
        {
            var connection = new SqlConnection(ConnectionString);
            connection.Open();
            return connection;
        }
    }
}