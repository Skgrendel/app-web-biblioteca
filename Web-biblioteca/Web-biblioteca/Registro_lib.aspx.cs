using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Web_biblioteca.Conexion;
using Web_biblioteca.Datos;

namespace Web_biblioteca
{
    public partial class Registro_lib : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack==true)
            {
                CargarEstados();
            }
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
        void script()
        {
           
            string script = @"window.setTimeout(function() {
                 document.getElementById('" + ms_error.ClientID + @"').style.display = 'none';
                 }, 4000);";
            ScriptManager.RegisterStartupScript(this, GetType(), "HideErrorPanel", script, true); // Ocultar el panel de error después de 3 segundos  
        }

        void limpiar()
        {
            txt_isbn.Text = string.Empty;
            Txt_autor.Text = string.Empty;
            Txt_cantidad.Text = "0";
            Txt_descripcion.Text = string.Empty;
            Txt_editorial.Text = string.Empty;
            Txt_f_publicacion.Text = string.Empty;
            Txt_genero.Text = string.Empty;
            Txt_nombre.Text = string.Empty;
            Txt_n_paginas.Text = "0";
            cbx_estado.SelectedIndex = 0;
            txt_isbn.Focus();   
            ms_error.Visible = false;
        }
        private void fnt_registrar_lib() 
        {
            Cls_registrar_lib registrar_Lib = new Cls_registrar_lib();
            registrar_Lib.fnt_validar(txt_isbn.Text);

           
            if (registrar_Lib.getExistencia()==1)
            {
                ms_error.Visible = true;
                lbl_mensaje.Text = registrar_Lib.getMensaje();
                script();
                
            }

            if (registrar_Lib.getExistencia() == 0)          
            {
                script();
                registrar_Lib.fnt_crear(txt_isbn.Text, Txt_nombre.Text, Txt_autor.Text, Txt_editorial.Text, Convert.ToInt16(Txt_n_paginas.Text), cbx_estado.SelectedValue, Txt_genero.Text, Txt_f_publicacion.Text, Convert.ToInt16(Txt_cantidad.Text), Txt_descripcion.Text);
                lbl_mensaje.Text = registrar_Lib.getMensaje();               
                limpiar();
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            fnt_registrar_lib();
           
            
        }

        protected void Btn_cancelar_Click(object sender, EventArgs e)
        {
            limpiar();
        }
    }
}

    