using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_biblioteca.Datos;

namespace Web_biblioteca
{
    public partial class Seccion_libros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack == true)
            {
                CargarEstados();
            }
        }
        void script()
        {
            ms_error.Visible = true;
            string script = @"window.setTimeout(function() {
                 document.getElementById('" + ms_error.ClientID + @"').style.display = 'none';
                 }, 4000);";
            ScriptManager.RegisterStartupScript(this, GetType(), "HideErrorPanel", script, true); // Ocultar el panel de error después de 3 segundos
            
        }
        private void CargarEstados()
        {
            Cls_mostrar_es Mostrar_Es = new Cls_mostrar_es();
            Mostrar_Es.mostrarEstados();
            cbx_estado.DataSource = Mostrar_Es.getEstados();
            cbx_estado.DataValueField = "Pkcodigo";
            cbx_estado.DataTextField = "Nombre";
            cbx_estado.DataBind();
        }
        private void fnt_consultar()
        {

            
            Cls_consultar_lib consultar_Lib = new Cls_consultar_lib();
                consultar_Lib.fnt_consultar(txt_busqueda.Text);

            if (consultar_Lib.getexistencia() < 1)
            {
                script();
                lbl_mensaje.Text = consultar_Lib.getmensaje();

            }
            else
            {
                
                Txt_nombre.Text = consultar_Lib.getnombre();
                Txt_autor.Text = consultar_Lib.getautor();
                Txt_editorial.Text = consultar_Lib.geteditorial();
                Txt_n_paginas.Text = Convert.ToString(consultar_Lib.getpaginas());
                Txt_genero.Text = consultar_Lib.getgenero();
                Txt_f_publicacion.Text = consultar_Lib.getfecha_p();
                cbx_estado.SelectedItem.Text = Convert.ToString(consultar_Lib.getestado());
                Txt_cantidad.Text = Convert.ToString(consultar_Lib.getcantidad());
                Txt_descripcion.Text = consultar_Lib.getdescripcion();
            }
            
           

        }
        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            fnt_consultar();
           
           
        }
    }
}