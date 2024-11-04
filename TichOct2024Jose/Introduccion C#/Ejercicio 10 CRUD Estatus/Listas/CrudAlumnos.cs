using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Listas
{

    public class CrudAlumnos
    {
        List<EstatusAlumno> _Alumnos = new List<EstatusAlumno>();


        internal List<EstatusAlumno> ListaCompleta()
        {
            return _Alumnos;
        }

        internal EstatusAlumno BusquedaIndividual(int id)
        {
            if (id < 0 || id > _Alumnos.Count)
            {
                throw new ArgumentOutOfRangeException(nameof(id), "El indice esta fuera del rango de la lista");
                    }
            return _Alumnos[id-1];
        }

        internal void Agregar( EstatusAlumno a)
        {
            if (a == null)
            {
                throw new ArgumentNullException(nameof(a), "El objeto EstatusAlumno no puede ser nulo.");
            }

            _Alumnos.Add(a);
        }

        internal void Eliminar(int id)
        {
            var est = _Alumnos.Find(e => e.id == id);
            _Alumnos.Remove(est);
        }

        internal void Actualizar(EstatusAlumno a)
        {
            _Alumnos[a.id-1] = a;
        }


    }
}
