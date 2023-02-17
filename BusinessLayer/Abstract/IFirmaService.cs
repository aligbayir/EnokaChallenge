using BusinessLayer.AutoMappers.FirmaViewModel;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Abstract
{
    public interface IFirmaService
    {
        List<FirmaCreateViewModel> GetAll();
        Firma GetByID(int id);
        string Add(FirmaCreateViewModel firma);
        string Update(FirmaCreateViewModel firma);
        string Delete(int firmaid);
    }
}
