using Microsoft.AspNetCore.Mvc;
using BancoBase.Repository.Interfaces;
using BancoBase.DTOs;
using BancoBase.Entities;
using Microsoft.Extensions.Logging;

namespace BancoBase.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentController : ControllerBase
    {
        private readonly ILogger<PaymentController> _logger;
        private readonly IPaymentRepository _paymentRepository;
        private readonly ICatalogRepository _catalogRepository;
        private readonly IConfiguration _configuration;
        public PaymentController(ILogger<PaymentController> logger, IConfiguration configuration, IPaymentRepository paymentRepository, ICatalogRepository catalogRepository)
        {
            _logger = logger;
            _configuration = configuration;
            _paymentRepository = paymentRepository;
            _paymentRepository.SetConnectionString(configuration["connectionStrings:defaultConnection"]);
            _catalogRepository = catalogRepository;
            _catalogRepository.SetConnectionString(configuration["connectionStrings:defaultConnection"]);

        }
        /// <summary>
        /// Crea un pago
        /// </summary>
        /// <param name="paymentDto"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> CreatePayment([FromBody] PaymentDto paymentDto)
        {
            var results = paymentDto.Validate();
            if (results != null)
            {
               return BadRequest(results);
            }

            var newPayment = new Payment
            {
                ID = Guid.NewGuid(),
                Concept = paymentDto.Concept,
                QtyProducts = paymentDto.QtyProducts,
                From = paymentDto.From,
                To = paymentDto.To,
                Total = paymentDto.Total,
                StatusID = 1,
            };
            try
            {
                var result = await _paymentRepository.CreatePaymentAsync(newPayment);

                return Ok($"Pago creado correctamente id:{result}");
            }
            catch (Exception ex)
            {
                _logger?.LogError(ex.Message);
                return StatusCode(503, ex.Message);
            }

        }
        /// <summary>
        /// Obtiene el estatus de un pago 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("{id}/status")]
        public async Task<IActionResult> GetPaymentStatus(Guid id)
        {
            if (id == Guid.Empty) return BadRequest();
            try
            {
                var payment = await _paymentRepository.GetPaymentByIdAsync(id);
                if (payment == null)
                {
                    return NotFound("Pago no encontrado");
                }

                var statuses = await _catalogRepository.GetAllStatusAsync();
                var result = statuses.FirstOrDefault(s => s.ID == payment.StatusID).Name;
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger?.LogError(ex.Message);
                return StatusCode(503, ex.Message);
            }
        }
        /// <summary>
        /// Actualiza el estatus de un pago
        /// </summary>
        /// <param name="id"></param>
        /// <param name="newStatus"></param>
        /// <returns></returns>
        [HttpPut("{id}/status")]
        public async Task<IActionResult> UpdatePaymentStatus(Guid id, [FromBody] int newStatus)
        {
            if (id == Guid.Empty || newStatus == 0) return BadRequest();

            try
            {
                var payment = await _paymentRepository.GetPaymentByIdAsync(id);
                if (payment == null)
                {
                    return NotFound("Pago no encontrado");
                }

                payment.StatusID = newStatus;
                await _paymentRepository.UpdatePaymentStatusAsync(id, newStatus);

                return Ok("Estatus del pago actualizado correctamente");
            }
            catch (Exception ex)
            {
                _logger?.LogError(ex.Message);
                return StatusCode(503, ex.Message);
            }
        }
    }
}
