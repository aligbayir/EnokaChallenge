using BusinessLayer.AutoMappers.UrunViewModels;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Abstract
{
    public interface IUrunService
    {
        List<UrunViewModel> GetAll();
        Urun GetByID(int id);
        string Add(UrunViewModel urun);
        string Update(UrunViewModel urun);
        string Delete(int id);
    }
}
