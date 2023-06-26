using System;
using System.Timers;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_biblioteca.Datos;

namespace Web_biblioteca
{
    public partial class Registro_user : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        private void fnt_cancelar()
        {
            txt_id.Text = string.Empty;
            txt_nombre.Text = string.Empty;
            txt_apellido.Text = string.Empty;
            txt_correo.Text = string.Empty;
            txt_contacto.Text = string.Empty;
            txt_direccion.Text = string.Empty;
            lbl_mensaje.Text = string.Empty;
            ms_error.Visible = false;
            txt_id.Focus();

        }

        void script()
        {
            ms_error.Visible = true;
            string script = @"window.setTimeout(function() {
                 document.getElementById('" + ms_error.ClientID + @"').style.display = 'none';
                 }, 4000);";
                    ScriptManager.RegisterStartupScript(this, GetType(), "HideErrorPanel", script, true); // Ocultar el panel de error después de 3 segundos
                    fnt_cancelar();
        } 

        void fnt_registrar()
        {
            Cls_registrar_us registrar_Us = new Cls_registrar_us();
            if (registrar_Us.getExistencia() > 0)
            {
                lbl_mensaje.Text = registrar_Us.getMensaje();
                script();
            }
            else
            {
                registrar_Us.fnt_crear(txt_id.Text, txt_nombre.Text, txt_apellido.Text, txt_contacto.Text, txt_direccion.Text, txt_correo.Text);
                lbl_mensaje.Text = registrar_Us.getMensaje();
                script();
                fnt_cancelar();

            }
        }
        protected void Btn_registrar_Click(object sender, EventArgs e)
        {

            fnt_registrar();
           
            
        }
        protected void Btn_cancelar_Click(object sender, EventArgs e)
        {
            fnt_cancelar();
        }
    }
}