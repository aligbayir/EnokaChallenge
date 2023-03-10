using CoreLayer.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityLayer.Concrete
{
    public class Siparis:IEntity
    {
        public int SiparisID { get; set; }
        public string SiparisVerenKisiAdi { get; set; }
        public DateTime SiparisTarihi { get; set; }

        public int FirmaID { get; set; }

        public virtual int UrunID { get; set; }
        public virtual Urun Urun { get; set; }
    }
}
