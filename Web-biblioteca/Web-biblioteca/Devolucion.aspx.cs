using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_biblioteca.Datos;

namespace Web_biblioteca
{
    public partial class Devolucion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Txt_fecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
        void fnt_consultar_us()
        {
            Cls_consultar_user consultar_User = new Cls_consultar_user();
            consultar_User.fnt_consultar(txt_id.Text);

            if (consultar_User.getexistencia() == 0)
            {
                lbl_mensaje.Visible = true;
                lbl_mensaje.Text = consultar_User.getmensaje();
            }
            else
            {
                Txt_nombre.Text = consultar_User.getnombre() + " " + consultar_User.getapellido();
                lbl_mensaje.Visible = false;
                lbl_mensaje.Text = "";
            }
        }
        void fnt_consultar_lib()
        {
            Cls_consultar_lib consultar_Lib = new Cls_consultar_lib();
            consultar_Lib.fnt_consultar(Txt_isbn.Text);
            if (consultar_Lib.getexistencia() == 0)
            {
                lbl_mensaje.Visible = true;
                lbl_mensaje.Text = consultar_Lib.getmensaje();
            }
            else
            {
                Txt_autor.Text = consultar_Lib.getautor();
                Txt_nombre_lib.Text = consultar_Lib.getnombre();
                Txt_existencias.Text = Convert.ToString(consultar_Lib.getcantidad());
                lbl_mensaje.Visible = false;
                lbl_mensaje.Text = "";
            }
        }
        void fnt_nuevo()
        {
            txt_id.Text = "";
            Txt_autor.Text = "";
            Txt_cantidad.Text = "0";
            Txt_existencias.Text = "0";
            Txt_fecha.Text = "";
            Txt_isbn.Text = "";
            Txt_nombre.Text = "";
            Txt_nombre_lib.Text = "";
            txt_id.Focus();

        }

        void fnt_devolucion()
        {
            Cls_devolucion devolucion = new Cls_devolucion();
            devolucion.fnt_devolucion(txt_id.Text, Txt_isbn.Text, Txt_fecha.Text, Convert.ToInt16(Txt_cantidad.Text));

            if (Convert.ToInt16(Txt_cantidad.Text) == 0 || Convert.ToInt16(Txt_existencias.Text) == 0)
            {
                lbl_mensaje.Visible = true;
                lbl_mensaje.Text = "debe ingresar todos los datos solicitados";
            }
            //else
            //{
            //    if (Convert.ToInt16(Txt_cantidad.Text) > Convert.ToInt16(Txt_existencias.Text))
            //    {
            //        lbl_mensaje.Visible = true;
            //        lbl_mensaje.Text = " La cantidad Solicitada Excede los libros en existencia";
            //    }
            //    else
            //    {
            lbl_mensaje.Visible = true;
            lbl_mensaje.Text = devolucion.getmensaje();
            //    }
            //}
        }

        protected void Btn_nuevo_Click(object sender, EventArgs e)
        {
            fnt_nuevo();
        }

        protected void Btn_registrar_Click(object sender, EventArgs e)
        {
            fnt_devolucion();
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            fnt_consultar_us();
        }

        protected void Btn_buscar_lib_Click(object sender, EventArgs e)
        {
            fnt_consultar_lib();
        }
    }
}