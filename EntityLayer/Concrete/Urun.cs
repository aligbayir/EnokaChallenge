using CoreLayer.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityLayer.Concrete
{
    public class Urun: IEntity
    {
        public int UrunID { get; set; }
        public string UrunAdi { get; set; }
        public int Stok { get; set; }
        public double Fiyat { get; set; }

        public virtual int FirmaID { get; set; }
        public virtual Firma Firma { get; set; }
    }
}
