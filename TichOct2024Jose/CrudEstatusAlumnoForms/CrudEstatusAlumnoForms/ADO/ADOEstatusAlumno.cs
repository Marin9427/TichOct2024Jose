using CrudEstatusAlumnoForms.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient; //Espacio de nombres
using System.Configuration;
using System.Data;
using System.Collections;
using System.Net.NetworkInformation;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;


namespace CrudEstatusAlumnoForms.ADO
{
    internal class ADOEstatusAlumno : ICRUD
    {
        string _cnnConexion = ConfigurationManager.ConnectionStrings["InstitutoConnection"].ConnectionString;

        SqlCommand _command;


        public void Actualizar(EstatusAlumno estatus)
        {
            string query = $"update EstatusAlumnos set Clave='{estatus.clave}' ,Nombre='{estatus.nombre}'  where id={estatus.id}";

            using (SqlConnection con = new SqlConnection(_cnnConexion))
            {
                _command = new SqlCommand(query, con);
                _command.CommandType = CommandType.Text;
                con.Open();
                _command.ExecuteNonQuery();
                con.Close();
            }
        }

        public int Agregar(EstatusAlumno estatus)
        {
            int id = 0;
            string query = $"AgregarEstatusAlumno";
            using (SqlConnection con = new SqlConnection(_cnnConexion))
            {
                _command = new SqlCommand(query, con);
                _command.CommandType = CommandType.StoredProcedure;
                _command.Parameters.AddWithValue("@Clave", estatus.clave);// se agrega clave valor
                _command.Parameters.AddWithValue("@Nombre", estatus.nombre);
                con.Open();
                id = (Int32)_command.ExecuteScalar();
                con.Close();
            }
            return id;
        }

        public List<EstatusAlumno> Consultar()
        {
            List<EstatusAlumno> listEstatus = new List<EstatusAlumno>();
            listEstatus = new List<EstatusAlumno>();
            string query = $"select * from EstatusAlumnos";
            using (SqlConnection con = new SqlConnection(_cnnConexion))
            {
                _command = new SqlCommand(query, con);
                _command.CommandType = CommandType.Text;
                con.Open();
                SqlDataReader reader = _command.ExecuteReader();
                while (reader.Read())
                {
                    listEstatus.Add(new EstatusAlumno()
                    {
                        id = Convert.ToInt32(reader["id"]),
                        clave = reader["Clave"].ToString(),
                        nombre = reader["Nombre"].ToString()
                    }
                );
                }
                con.Close();
            }
            return listEstatus;
        }

        public EstatusAlumno Consultar(int id)
        {
            EstatusAlumno estatus = new EstatusAlumno();
            string query = $"select * from EstatusAlumnos where id={id}";
            using (SqlConnection con = new SqlConnection(_cnnConexion))
            {
                _command = new SqlCommand(query, con);
                _command.CommandType = CommandType.Text;
                con.Open();
                SqlDataReader reader = _command.ExecuteReader();
                while (reader.Read())
                {
                    estatus = (new EstatusAlumno()
                    {
                        id = Convert.ToInt32(reader["id"]),
                        clave = reader["Clave"].ToString(),
                        nombre = reader["Nombre"].ToString()
                    }
                );
                }
                con.Close();
            }
            return estatus;
        }

        public void Eliminar(int id)
        {
                string query = $"delete EstatusAlumnos  where id={id}";

                using (SqlConnection con = new SqlConnection(_cnnConexion))
                {
                    _command = new SqlCommand(query, con);
                    _command.CommandType = CommandType.Text;
                    con.Open();
                    _command.ExecuteNonQuery();
                    con.Close();
                }
            }
    }
}
