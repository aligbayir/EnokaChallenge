using BusinessLayer.AutoMappers.SiparisViewModels;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Abstract
{
    public interface ISiparisService
    {
        List<SiparisViewModel> GetAll();
        Siparis GetByID(int id);
        string Add(SiparisViewModel siparis);
        string Update(SiparisViewModel siparis);
        string Delete(int id);
    }
}
