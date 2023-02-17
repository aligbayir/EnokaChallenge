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
        List<Siparis> GetAll();
        void Add(Siparis siparis);
        void Update(Siparis siparis);
        void Delete(Siparis siparis);
    }
}
