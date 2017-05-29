using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using ConnectToSqlServer.Models;

namespace ConnectToSqlServer.Controllers
{
    public class ProfesorController : ApiController
    {
        private ConnectToSqlServerContext db = new ConnectToSqlServerContext();

        // GET: api/Profesors
        public IQueryable<Profesor> GetProfesors()
        {
            return db.Profesors;
        }

        // GET: api/Profesors/5
        [ResponseType(typeof(Profesor))]
        public IHttpActionResult GetProfesor(string id)
        {
            Profesor profesor = db.Profesors.Find(id);
            if (profesor == null)
            {
                return NotFound();
            }

            return Ok(profesor);
        }

        // PUT: api/Profesors/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProfesor(string id, Profesor profesor)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != profesor.ID)
            {
                return BadRequest();
            }

            db.Entry(profesor).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProfesorExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Profesors
        [ResponseType(typeof(Profesor))]
        public IHttpActionResult PostProfesor(Profesor profesor)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Profesors.Add(profesor);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ProfesorExists(profesor.ID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = profesor.ID }, profesor);
        }

        // DELETE: api/Profesors/5
        [ResponseType(typeof(Profesor))]
        public IHttpActionResult DeleteProfesor(string id)
        {
            Profesor profesor = db.Profesors.Find(id);
            if (profesor == null)
            {
                return NotFound();
            }

            db.Profesors.Remove(profesor);
            db.SaveChanges();

            return Ok(profesor);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProfesorExists(string id)
        {
            return db.Profesors.Count(e => e.ID == id) > 0;
        }
    }
}