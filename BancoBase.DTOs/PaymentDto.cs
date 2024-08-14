namespace BancoBase.DTOs
{
    public class PaymentDto
    {
        public string Concept { get; set; }
        public int QtyProducts { get; set; }
        public string From { get; set; }
        public string To { get; set; }
        public double Total { get; set; }


        public string? Validate()
        {
            if (string.IsNullOrEmpty(this.Concept)){
                return "Concepto no puede ser nulo";
            }
            if (this.QtyProducts <= 0)
            {
                return "Cantidad de productos debe mayor a 0";
            }
            if (string.IsNullOrEmpty(this.From))
            {
                return "Cuenta origen no puede estar vacía";
            }
            if (string.IsNullOrEmpty(this.To))
            {
                return "Cuenta destino no puede estar vacía";
            }
            if (this.From == this.To)
            {
                return "La cuenta origen debe ser diferente a la cuenta destino";
            }
            if (Total <= 0)
            {
                return "El total debe ser mayor a 0";
            }
            return null;
        }

    }
}
