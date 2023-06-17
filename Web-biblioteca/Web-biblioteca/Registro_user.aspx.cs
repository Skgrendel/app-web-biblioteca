﻿using System;
using Web_biblioteca.Datos;

namespace Web_biblioteca
{
    public partial class Registro_user : System.Web.UI.Page
    {
        private string str_mensaje;
        protected void Page_Load(object sender, EventArgs e)
        {
            Lbl_mensaje.Visible = false;
        }

        private void fnt_cancelar()
        {
            txt_id.Text ="";
            txt_nombre.Text = "";
            txt_apellido.Text = "";
            txt_correo.Text = string.Empty;
            txt_contacto.Text = string.Empty;
            txt_direccion.Text = string.Empty;
            txt_id.Focus();
            Lbl_mensaje.Visible= false;
        }
        protected void Btn_registrar_Click(object sender, EventArgs e)
        {
            Cls_registrar_us registrar_Us = new Cls_registrar_us();
            registrar_Us.fnt_crear(txt_id.Text,txt_nombre.Text,txt_apellido.Text,txt_contacto.Text,txt_direccion.Text,txt_correo.Text);
            Lbl_mensaje.Text= registrar_Us.getMensaje();
            Lbl_mensaje.Visible = true;
        }
        protected void Btn_cancelar_Click(object sender, EventArgs e)
        {
            fnt_cancelar();
        }
    }
}