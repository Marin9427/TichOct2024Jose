using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Diccionario
{
    public class CRUDEstadosCapitales
    {
        private static Dictionary<int, Estados> _DiccionarioEstados = new Dictionary<int, Estados>();

        internal Dictionary<int, Estados> ConsultarTodo()
        {
            return _DiccionarioEstados;
        }

        internal Estados ConsultarSoloUni(int id )
        {
            return _DiccionarioEstados[id];
        }


    internal void Agregar(Estados estado)
    {
        _DiccionarioEstados.Add(estado.id, estado);
    }

        internal void Actualizar(Estados estado)
        {
            _DiccionarioEstados[estado.id] = estado;
        }

    internal void Eliminar(int id)
    {
        _DiccionarioEstados.Remove(id);
    }


}
}
