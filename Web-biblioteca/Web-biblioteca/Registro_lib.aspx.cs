using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Web_biblioteca.Conexion;
using Web_biblioteca.Datos;

namespace Web_biblioteca
{
    public partial class Registro_lib : System.Web.UI.Page
    {
        string str_mensaje;
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

        private void fnt_registrar_lib() 
        {
            Cls_registrar_lib registrar_Lib = new Cls_registrar_lib();         
            registrar_Lib.fnt_crear(txt_isbn.Text,Txt_nombre.Text,Txt_autor.Text,Txt_editorial.Text,Convert.ToInt16(Txt_n_paginas.Text),cbx_estado.SelectedValue,Txt_genero.Text,Txt_f_publicacion.Text,Convert.ToInt16(Txt_cantidad.Text),Txt_descripcion.Text);

        }

        protected void Btn_examinar_Click(object sender, EventArgs e)
        {
           


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            fnt_registrar_lib();
        }
    }
}

    