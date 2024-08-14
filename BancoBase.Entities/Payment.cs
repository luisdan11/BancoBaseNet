namespace BancoBase.Entities
{
    public class Payment
    {
        public Guid ID { get; set; }
        public string Concept { get; set; }
        public int QtyProducts { get; set; }
        public string From { get; set; }
        public string To { get; set; }
        public double Total { get; set; }
        public int StatusID { get; set; }
    }
}
