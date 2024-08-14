using BancoBase.Entities;

namespace BancoBase.Repository.Interfaces
{
    public interface IPaymentRepository
    {
        void SetConnectionString(string connectionString);
        Task<Payment?> GetPaymentByIdAsync(Guid id);
        Task<Guid> CreatePaymentAsync(Payment payment);
        Task<bool> UpdatePaymentStatusAsync(Guid id, int newStatusId);
    }
}
