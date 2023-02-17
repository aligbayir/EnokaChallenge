using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.AutoMappers.FirmaViewModel
{
    public class FirmaCreateViewModel
    {
        public int FirmaID { get; set; }
        public string FirmaAdi { get; set; }
        public bool OnayDurum { get; set; }
        public DateTime SiparisIzinBaslangicSaat { get; set; }
        public DateTime SiparisIzinBitisSaat { get; set; }
    }
}
