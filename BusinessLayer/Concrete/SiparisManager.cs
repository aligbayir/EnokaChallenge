using BusinessLayer.Abstract;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Concrete
{
    public class SiparisManager : ISiparisService
    {
        private readonly ISiparisService _siparisService;

        public SiparisManager(ISiparisService siparisService)
        {
            _siparisService = siparisService;
        }

        public void Add(Siparis siparis)
        {
            _siparisService.Add(siparis);
        }

        public void Delete(Siparis siparis)
        {
            _siparisService.Delete(siparis);
        }

        public List<Siparis> GetAll()
        {
            return _siparisService.GetAll();
        }

        public void Update(Siparis siparis)
        {
           _siparisService.Update(siparis);
        }
    }
}
