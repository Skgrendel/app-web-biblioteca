using System;
using System.Timers;
using System.Web.UI.WebControls;
using Web_biblioteca.Datos;

namespace Web_biblioteca
{
    public partial class Registro_user : System.Web.UI.Page
    {
        private string str_mensaje;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void TimerElapsed(object sender, ElapsedEventArgs e)
        {
            // Ocultar el panel después de 3 segundos
            ms_error.Visible = false;
        }

        private void fnt_cancelar()
        {
            txt_id.Text =string.Empty;
            txt_nombre.Text = string.Empty;
            txt_apellido.Text = string.Empty;
            txt_correo.Text = string.Empty;
            txt_contacto.Text = string.Empty;
            txt_direccion.Text = string.Empty;
            lbl_mensaje.Text= string.Empty;
            ms_error.Visible = false;
            txt_id.Focus();
           
        }
        void fnt_timer()
        {
            ms_error.Visible = true; // Mostrar el panel

            Timer timer = new Timer(3000); // 3000 milisegundos = 3 segundos
            timer.Elapsed += (s, args) =>
            {
                ms_error.Visible = false; // Ocultar el panel después de 3 segundos
            };
            timer.AutoReset = false; // No se reinicia automáticamente después de que expire
            timer.Enabled = true;
        }

        protected void Btn_registrar_Click(object sender, EventArgs e)
        {
            Cls_registrar_us registrar_Us = new Cls_registrar_us();
            registrar_Us.fnt_crear(txt_id.Text,txt_nombre.Text,txt_apellido.Text,txt_contacto.Text,txt_direccion.Text,txt_correo.Text);
           lbl_mensaje.Text=registrar_Us.getMensaje(); 
            fnt_timer();
        }
        protected void Btn_cancelar_Click(object sender, EventArgs e)
        {
            fnt_cancelar();
        }
    }
}