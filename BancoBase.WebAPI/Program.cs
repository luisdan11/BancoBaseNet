using BancoBase.Repository;
using BancoBase.Repository.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo
    {
        Title = "Documentación BancoBase.WebAPI",
        Version = "v1",
        Description = "API REST Pagos BANCO BASE ",
        Contact = new Microsoft.OpenApi.Models.OpenApiContact()
        {
            Name = "Luis Daniel Estrada Ramos",
            Email = "daniel.estrada-87@outlook.com"
        }
    });
});
//Inyección de dependencia de tipo IoC Control de Inversiones
builder.Services.Add(
    new ServiceDescriptor(
        typeof(IPaymentRepository),
        typeof(PaymentRepository),
        ServiceLifetime.Transient)
);
builder.Services.Add(
    new ServiceDescriptor(
        typeof(ICatalogRepository),
        typeof(CatalogRepository),
        ServiceLifetime.Singleton)
);
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
