using AutoMapper;
using BusinessLayer.Abstract;
using BusinessLayer.AutoMappers.FirmaViewModel;
using BusinessLayer.AutoMappers.SiparisViewModels;
using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete.EntityFramework;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Concrete
{
    public class SiparisManager : ISiparisService
    {
        private readonly ISiparisDal _siparisDal;
        private readonly IFirmaDal _firmaDal;
        private readonly IMapper _mapper;

        public SiparisManager(ISiparisDal siparisDal, IMapper mapper, IFirmaDal firmaDal)
        {
            _siparisDal = siparisDal;
            _mapper = mapper;
            _firmaDal = firmaDal;
        }

        public string Add(SiparisViewModel siparis)
        {
            var firma = _firmaDal.Get(x => x.FirmaID == siparis.FirmaID);
            if (firma != null)
            {
                if (firma.OnayDurum == false)
                {
                    return "Firma Onaylı Değil";
                }else
                {
                    var siparisBaslangic = firma.SiparisIzinBaslangicSaat;
                    var siparisBitis = firma.SiparisIzinBitisSaat;
                    var siparisTarihi = siparis.SiparisTarihi;
                    if (siparisBaslangic.TimeOfDay <= siparisTarihi.TimeOfDay && siparisBitis.TimeOfDay >= siparisTarihi.TimeOfDay)
                    {
                        var sprs = _mapper.Map<Siparis>(siparis);
                        _siparisDal.Add(sprs);
                        return "Sipariş Başarıyla Eklendi";
                    }
                    else
                    {
                        return "Sipariş Saati Firma İzin Saatleri Dışındadır. "+ siparisBaslangic + " - " + siparisBitis;
                    }
                }
            }
            return "Firma Bulunamadı";
        }

        public string Delete(int id)
        {
            var siparisbulunan = _siparisDal.Get(x => x.SiparisID == id);
            _siparisDal.Delete(siparisbulunan);
            return "Başarıyla Silme İşlemi Gerçekleştirildi.";
        }

        public List<SiparisViewModel> GetAll()
        {
            return _siparisDal.GetAll().Select(x => _mapper.Map<SiparisViewModel>(x)).ToList();
        }

        public Siparis GetByID(int id)
        {
            return _siparisDal.Get(x => x.SiparisID == id);
        }

        public string Update(SiparisViewModel siparis)
        {
            var existingSiparis = _siparisDal.Get(x => x.SiparisID == siparis.SiparisID);
            if (existingSiparis != null)
            {
                existingSiparis.FirmaID = siparis.FirmaID;
                existingSiparis.UrunID = siparis.UrunID;
                existingSiparis.SiparisVerenKisiAdi = siparis.SiparisVerenKisiAdi;
                existingSiparis.SiparisTarihi = siparis.SiparisTarihi;
                _siparisDal.Update(existingSiparis);
                return "Sipariş Bilgileri Güncellendi";
            }
            return "Sipariş Bulunamadı";
        }
    }
}
