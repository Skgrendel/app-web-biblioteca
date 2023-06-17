using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using Web_biblioteca.Conexion;

namespace Web_biblioteca.Datos
{
    public class Cls_registrar_us
    {
        Cls_conexion objconect = new Cls_conexion();
        private string str_mensaje;
        public void fnt_crear(string id, string nombres, string apellidos, string contacto, string direccion, string correo)
        {
            if (id==""||nombres==""||apellidos==""||contacto==""||direccion==""||correo=="")
            {
                str_mensaje = "Debe ingresar todos los datos solicitados";
            }
            else
            {
                try
                {
                    SqlCommand con = new SqlCommand("Sp_Registrar_usuarios", objconect.con);
                    con.CommandType = CommandType.StoredProcedure;
                    con.Parameters.AddWithValue("@id", id);
                    con.Parameters.AddWithValue("@nombre", nombres);
                    con.Parameters.AddWithValue("@apellido", apellidos);
                    con.Parameters.AddWithValue("@contacto", contacto);
                    con.Parameters.AddWithValue("@direccion", direccion);
                    con.Parameters.AddWithValue("@correo", correo);
                    objconect.con.Open();
                    con.ExecuteNonQuery();
                    objconect.con.Close();
                    str_mensaje = "El Usuario " + nombres + " " + apellidos + " Ha sido Registrado Con Exito";
                }
                catch (Exception)
                {

                    str_mensaje = "Error Al Registrar Los Datos";
                }
            }
            

        }
        public string getMensaje() { return this.str_mensaje; }
    }
}
