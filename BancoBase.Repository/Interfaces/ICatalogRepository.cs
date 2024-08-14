using BancoBase.Entities;

namespace BancoBase.Repository.Interfaces
{
    public interface ICatalogRepository
    {
        void SetConnectionString(string connectionString);

        Task<IEnumerable<Catalog>> GetAllStatusAsync();

    }
}
