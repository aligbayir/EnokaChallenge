using BusinessLayer.Abstract;
using BusinessLayer.AutoMappers.FirmaViewModel;
using BusinessLayer.AutoMappers.SiparisViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EnokaChallenge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SiparisController : ControllerBase
    {
        private readonly ISiparisService _siparisService;

        public SiparisController(ISiparisService siparisService)
        {
            _siparisService = siparisService;
        }
        [HttpGet]
        public IActionResult GetAllFirma()
        {
            return Ok(_siparisService.GetAll());
        }
        [HttpPost]
        public IActionResult Add(SiparisViewModel siparis)
        {
            return Ok(_siparisService.Add(siparis));
        }
        [HttpPut]
        [Route("{id}")]
        public IActionResult Update([FromRoute] int id, [FromBody] SiparisViewModel updatedSiparis)
        {
            return Ok(_siparisService.Update(updatedSiparis));
        }

        [HttpDelete]
        [Route("{id}")]
        public IActionResult Delete([FromRoute] int id)
        {
            return Ok(_siparisService.Delete(id));
        }
    }
}
