using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.AutoMappers.UrunViewModels
{
    public class UrunViewModel
    {
        public int UrunID { get; set; }
        public string UrunAdi { get; set; }
        public int Stok { get; set; }
        public double Fiyat { get; set; }

        public int FirmaID { get; set; }
    }
}
