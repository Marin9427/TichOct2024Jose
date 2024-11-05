using CrudEstatusAlumnoForms.ADO;
using CrudEstatusAlumnoForms.Entidades;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CrudEstatusAlumnoForms
{
    public partial class Form1 : Form
    {
        ADOEstatusAlumno crud = new ADOEstatusAlumno();
        int opcionGuardad = 0;
        public Form1()
        {
            InitializeComponent();
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            //Configuracion que carga de la base de datos al comboBox

            List<EstatusAlumno> listEstatuss = crud.Consultar();
            cbEstatus.DataSource = listEstatuss;
            cbEstatus.ValueMember = "id"; // selecciona el id
            cbEstatus.DisplayMember = "Nombre"; // muestra en la caja

            dgbEstatus.DataSource = listEstatuss;
            pnlIngresar.Visible = false;

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            opcionGuardad = 1;
            pnlIngresar.Visible = true;
            LimpiarCuadros();
            DesactivarBotones();


        }
        private void btnCancelar_Click(object sender, EventArgs e)
        {
            pnlIngresar.Visible = false;
            btnAgregar.Enabled = true;
            btnActualizar.Enabled = true;
            btnEliminar.Enabled = true;
        }
        private void btnActualizar_Click(object sender, EventArgs e)
        {
            opcionGuardad = 2;
            DesactivarBotones();
            pnlIngresar.Visible = true;
            int id = Convert.ToInt16(cbEstatus.SelectedValue);
            EstatusAlumno estado = crud.Consultar(id);
            txtNombre.Text = estado.nombre.ToString();
            txtClave.Text = estado.clave.ToString();
        }
        private void btnEliminar_Click(object sender, EventArgs e)
        {
            opcionGuardad = 3;
            DesactivarBotones();
            pnlIngresar.Visible = true;
            int id = Convert.ToInt16(cbEstatus.SelectedValue);
            EstatusAlumno estado = crud.Consultar(id);
            txtNombre.Text = estado.nombre.ToString();
            txtClave.Text = estado.clave.ToString();
            txtNombre.Enabled = false;
            txtClave.Enabled = false;
            btnComodin.Text = "borrar";
        }
        private void btnComodin_Click(object sender, EventArgs e)
        {                   
            switch(opcionGuardad)
            {
                case 1:
                    string nombre = txtNombre.Text;
                    string clave = txtClave.Text;
                    EstatusAlumno GuardarEstatus = new EstatusAlumno(clave, nombre);
                    crud.Agregar(GuardarEstatus);
                    LimpiarCuadros();
                    pnlIngresar.Visible = false;
                    ActivarBotones();
                    ActualizarDataGridView();
                    break;
                case 2:
                    int id = Convert.ToInt16(cbEstatus.SelectedValue);
                    string nombreActualizado = txtNombre.Text;
                    string claveActualizada = txtClave.Text;
                    EstatusAlumno ActualizarEstatus = new EstatusAlumno(id,claveActualizada, nombreActualizado);
                    crud.Actualizar(ActualizarEstatus);
                    LimpiarCuadros();
                    pnlIngresar.Visible = false;
                    ActivarBotones();
                    ActualizarDataGridView();
                    break;
                case 3:
                    int idEliminar = Convert.ToInt16(cbEstatus.SelectedValue);
                    crud.Eliminar(idEliminar);
                    LimpiarCuadros();
                    pnlIngresar.Visible = false;
                    ActivarBotones();
                    ActualizarDataGridView();
                    break;
            }
        }
        private void ActualizarDataGridView()
        {         
            List<EstatusAlumno> listEstatuss = crud.Consultar();       
            dgbEstatus.DataSource = null;
            dgbEstatus.DataSource = listEstatuss;          
            cbEstatus.DataSource = null; 
            cbEstatus.DataSource = listEstatuss;
            cbEstatus.ValueMember = "id";  
            cbEstatus.DisplayMember = "Nombre";
        }



        public void ActivarBotones()
        {
            btnAgregar.Enabled = true;
            btnActualizar.Enabled = true;
            btnEliminar.Enabled = true;
        }
        public void DesactivarBotones()
        {
            btnAgregar.Enabled = false;
            btnActualizar.Enabled = false;
            btnEliminar.Enabled = false;
        }
        public void LimpiarCuadros()
        {
            txtNombre.Text = string.Empty;
            txtClave.Text = string.Empty;
        }       
    }
}
