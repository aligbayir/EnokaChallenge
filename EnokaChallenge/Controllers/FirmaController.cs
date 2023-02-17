using AutoMapper;
using BusinessLayer.Abstract;
using BusinessLayer.AutoMappers.FirmaViewModel;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EnokaChallenge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FirmaController : ControllerBase
    {
        private readonly IFirmaService _firmaService;

        public FirmaController(IFirmaService firmaService)
        {
            _firmaService = firmaService;
        }
        [HttpGet]
        public  IActionResult GetAllFirma()
        {
            return Ok(_firmaService.GetAll());
        }
        [HttpPost]
        public IActionResult Add(FirmaCreateViewModel firma)
        {
            return Ok(_firmaService.Add(firma));
        }
        [HttpPut]
        [Route("{id}")]
        public IActionResult Update([FromRoute] int id, [FromBody] FirmaCreateViewModel updatedFirma)
        {
            return Ok(_firmaService.Update(updatedFirma));
        }

        [HttpDelete]
        [Route("{id}")]
        public IActionResult Delete([FromRoute] int id)
        {
            return Ok(_firmaService.Delete(id));
        }

    }
}
