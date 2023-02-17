using BusinessLayer.Abstract;
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

        public FirmaManager(IFirmaDal firmaDal)
        {
            _firmaDal = firmaDal;
        }

        public void Add(Firma firma)
        {
            _firmaDal.Add(firma);
        }

        public void Delete(Firma firma)
        {
            _firmaDal.Delete(firma);
        }

        public List<Firma> GetAll()
        {
            return _firmaDal.GetAll();
        }

        public void Update(Firma firma)
        {
            _firmaDal.Update(firma);
        }
    }
}
