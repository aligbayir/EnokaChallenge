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
        List<Firma> GetAll();
        void Add(Firma firma);
        void Update(Firma firma);
        void Delete(Firma firma);
    }
}
