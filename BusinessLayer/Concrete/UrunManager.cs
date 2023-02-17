using AutoMapper;
using BusinessLayer.Abstract;
using BusinessLayer.AutoMappers.FirmaViewModel;
using BusinessLayer.AutoMappers.UrunViewModels;
using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete.EntityFramework;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Concrete
{
    public class UrunManager : IUrunService
    {
        private readonly IUrunDal _urunDal;
        private readonly IMapper _mapper;

        public UrunManager(IUrunDal urunDal, IMapper mapper)
        {
            _urunDal = urunDal;
            _mapper = mapper;
        }

        public string Add(UrunViewModel urun)
        {
            var urn = _mapper.Map<Urun>(urun);
            _urunDal.Add(urn);
            return "Ürün Başarıyla Eklendi";
        }

        public string Delete(int id)
        {
            var bulunan = _urunDal.Get(x => x.UrunID == id);
            _urunDal.Delete(bulunan);
            return "Başarıyla Silme İşlemi Gerçekleştirildi.";
        }

        public List<UrunViewModel> GetAll()
        {
            return _urunDal.GetAll().Select(x => _mapper.Map<UrunViewModel>(x)).ToList();
        }

        public Urun GetByID(int id)
        {
            return _urunDal.Get(x => x.UrunID == id);
        }

        public string Update(UrunViewModel urun)
        {
            var existingUrun = _urunDal.Get(x => x.UrunID == urun.UrunID);
            if (existingUrun != null)
            {
                existingUrun.FirmaID=urun.FirmaID;
                existingUrun.UrunAdi = urun.UrunAdi;
                existingUrun.Fiyat = urun.Fiyat;
                existingUrun.Stok = urun.Stok;
                _urunDal.Update(existingUrun);
                return "Ürün Bilgileri Başarıyla Güncellendi";
            }
            return "Ürün Bulunamadı";
        }
    }
}
