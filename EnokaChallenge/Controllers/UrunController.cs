using BusinessLayer.Abstract;
using BusinessLayer.AutoMappers.FirmaViewModel;
using BusinessLayer.AutoMappers.UrunViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EnokaChallenge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UrunController : ControllerBase
    {
        private readonly IUrunService _urunService;

        public UrunController(IUrunService urunService)
        {
            _urunService = urunService;
        }
        [HttpGet]
        public IActionResult GetAllFirma()
        {
            return Ok(_urunService.GetAll());
        }
        [HttpPost]
        public IActionResult Add(UrunViewModel urun)
        {
            return Ok(_urunService.Add(urun));
        }
        [HttpPut]
        [Route("{id}")]
        public IActionResult Update([FromRoute] int id, [FromBody] UrunViewModel updatedUrun)
        {
            return Ok(_urunService.Update(updatedUrun));
        }

        [HttpDelete]
        [Route("{id}")]
        public IActionResult Delete([FromRoute] int id)
        {
            return Ok(_urunService.Delete(id));
        }
    }
}
