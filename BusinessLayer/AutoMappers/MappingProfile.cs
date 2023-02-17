using AutoMapper;
using BusinessLayer.AutoMappers.FirmaViewModel;
using BusinessLayer.AutoMappers.SiparisViewModels;
using BusinessLayer.AutoMappers.UrunViewModels;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.AutoMappers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Firma, FirmaCreateViewModel>();
            CreateMap<FirmaCreateViewModel, Firma>();
            CreateMap<Urun, UrunViewModel>();
            CreateMap<UrunViewModel, Urun>();
            CreateMap<Siparis, SiparisViewModel>();
            CreateMap<SiparisViewModel, Siparis>();
        }
    }
}
