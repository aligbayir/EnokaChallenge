using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.AutoMappers.SiparisViewModels
{
    public class SiparisViewModel
    {
        public int SiparisID { get; set; }
        public string SiparisVerenKisiAdi { get; set; }
        public DateTime SiparisTarihi { get; set; }
        public int FirmaID { get; set; }
        public virtual int UrunID { get; set; }
    }
}
