using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_biblioteca.Datos;

namespace Web_biblioteca
{
    public partial class Seccion_libros : System.Web.UI.Page
    {
        private int val;
        private bool editar;
        private string str_mensaje;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack == true)
            {
                CargarEstados();

            }
        }
        void script()
        {
          
            
                string script = @"window.setTimeout(function() {
                 document.getElementById('" + ms_error.ClientID + @"').style.display = 'none';
                 }, 3000);";
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
       
            void limpiar()
            {                
                Txt_autor.Text = string.Empty;
                Txt_cantidad.Text = "0";
                Txt_descripcion.Text = string.Empty;
                Txt_editorial.Text = string.Empty;
                Txt_f_publicacion.Text = string.Empty;
                Txt_genero.Text = string.Empty;
                Txt_nombre.Text = string.Empty;
                Txt_n_paginas.Text = "0";
                cbx_estado.SelectedIndex = 0;
                txt_busqueda.Focus();
                ms_error.Visible= false;
            }

       
        private void fnt_consultar()
        {

            
            Cls_consultar_lib consultar_Lib = new Cls_consultar_lib();
            consultar_Lib.fnt_consultar(txt_busqueda.Text);
            val = consultar_Lib.getexistencia();

            if (val == 0)
            {
                script();               
                lbl_mensaje.Text = consultar_Lib.getmensaje();
                ms_error.Visible = true;
               

                //limpiar();
            }
            if (val == 1)
            {
                ms_error.Visible = false;               
                Txt_nombre.Text = consultar_Lib.getnombre();
                Txt_autor.Text = consultar_Lib.getautor();
                Txt_editorial.Text = consultar_Lib.geteditorial();
                Txt_n_paginas.Text = Convert.ToString(consultar_Lib.getpaginas());
                Txt_genero.Text = consultar_Lib.getgenero();
                Txt_f_publicacion.Text = consultar_Lib.getfecha_p();
                cbx_estado.SelectedItem.Text = Convert.ToString(consultar_Lib.getestado());
                Txt_cantidad.Text = Convert.ToString(consultar_Lib.getcantidad());
                Txt_descripcion.Text = consultar_Lib.getdescripcion();               
                Cb_editar.Enabled = true;


            }



        }
        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            fnt_consultar();          
        }
        void habilitar()
        {
            script();
            txt_busqueda.Enabled = false;
            Txt_nombre.Enabled = true;
            Txt_genero.Enabled = true;
            Txt_autor.Enabled = true;
            Txt_f_publicacion.Enabled = true;
            Txt_f_publicacion.TextMode = TextBoxMode.Date;
            Txt_editorial.Enabled = true;
            cbx_estado.Enabled = true;
            Txt_n_paginas.Enabled = true;
            Txt_cantidad.Enabled = true;
            Txt_descripcion.Enabled = true;
            Btn_editar.Enabled = true;
            CargarEstados();
        }

        void inahilitar()
        {
            txt_busqueda.Enabled = true;
            Txt_nombre.Enabled = false;
            Txt_genero.Enabled = false;
            Txt_autor.Enabled = false;
            Txt_f_publicacion.Enabled = false;
            Txt_f_publicacion.TextMode = TextBoxMode.DateTime;
            Txt_editorial.Enabled = false;
            cbx_estado.Enabled = false;
            Txt_n_paginas.Enabled = false;
            Txt_cantidad.Enabled = false;
            Txt_descripcion.Enabled = false;            
            Btn_editar.Enabled = false;
        }

        protected void Btn_editar_Click(object sender, EventArgs e)
        {
            Cls_editar_lib editar_Lib = new Cls_editar_lib();
            editar_Lib.fnt_crear(txt_busqueda.Text, Txt_nombre.Text, Txt_autor.Text, Txt_editorial.Text, Convert.ToInt16(Txt_n_paginas.Text), cbx_estado.SelectedValue, Txt_genero.Text, Txt_f_publicacion.Text, Convert.ToInt16(Txt_cantidad.Text), Txt_descripcion.Text);
            

            
                script();
                str_mensaje = editar_Lib.getMensaje();
                ms_error.Visible = true;
                lbl_mensaje.Text = str_mensaje;

                  
            
            
        }

        protected void Cb_editar_CheckedChanged(object sender, EventArgs e)
        {
            if (Cb_editar.Checked==true)
            {
                habilitar();
                               
            }
            else
            {
                inahilitar();
                ms_error.Visible = false;
            }
            
        }
       

        protected void Bnt_limpiar_Click(object sender, EventArgs e)
        {
            limpiar();  
        }
    }
}