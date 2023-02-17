using AutoMapper;
using BusinessLayer.Abstract;
using BusinessLayer.AutoMappers.FirmaViewModel;
using DataAccessLayer.Abstract;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Concrete
{
    public class FirmaManager : IFirmaService
    {
        private readonly IFirmaDal _firmaDal;
        private readonly IMapper _mapper;

        public FirmaManager(IFirmaDal firmaDal, IMapper mapper)
        {
            _firmaDal = firmaDal;
            _mapper = mapper;
        }

        public string Add(FirmaCreateViewModel firma)
        {
            var frm = _mapper.Map<Firma>(firma);
            _firmaDal.Add(frm);
            return "Firma Eklendi";
        }

        public string Delete(int firmaid)
        {
            var firmabulunan = _firmaDal.Get(x=>x.FirmaID==firmaid);
            _firmaDal.Delete(firmabulunan);
            return "Başarıyla Silme İşlemi Gerçekleştirildi.";
        }

        public List<FirmaCreateViewModel> GetAll()
        {
            return _firmaDal.GetAll().Select(x=>_mapper.Map<FirmaCreateViewModel>(x)).ToList();
        }

        public Firma GetByID(int id)
        {
            return _firmaDal.Get(x=>x.FirmaID==id);
        }

        public string Update(FirmaCreateViewModel firma)
        {
            var existingFirma = _firmaDal.Get(x => x.FirmaID == firma.FirmaID);
            if (existingFirma !=null)
            {
                existingFirma.OnayDurum = firma.OnayDurum;
                existingFirma.SiparisIzinBaslangicSaat = firma.SiparisIzinBaslangicSaat;
                existingFirma.SiparisIzinBitisSaat = firma.SiparisIzinBitisSaat;
                _firmaDal.Update(existingFirma);
                return "Firma Bilgileri Güncellendi";
            }
            return "Firma Bulunamadı";
        }
    }
}
