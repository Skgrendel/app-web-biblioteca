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
            if (id == "" || nombres == "" || apellidos == "" || contacto == "" || direccion == "" || correo == "")
            {
                str_mensaje = "Debe ingresar todos los datos solicitados";
            }
            else
            {
                try
                {
                    // Validar si el usuario ya está registrado
                    SqlCommand cmdValidar = new SqlCommand("Sp_Validar_usuario", objconect.con);
                    cmdValidar.CommandType = CommandType.StoredProcedure;
                    cmdValidar.Parameters.AddWithValue("@id", id);
                    objconect.con.Open();
                    int existencia = (int)cmdValidar.ExecuteScalar();
                    objconect.con.Close();

                    if (existencia > 0)
                    {
                        str_mensaje = "El Usuario con ID " + id + " ya está registrado";
                    }
                    else
                    {
                        // Insertar los datos del usuario en la base de datos
                        SqlCommand cmdInsertar = new SqlCommand("Sp_Registrar_usuarios", objconect.con);
                        cmdInsertar.CommandType = CommandType.StoredProcedure;
                        cmdInsertar.Parameters.AddWithValue("@id", id);
                        cmdInsertar.Parameters.AddWithValue("@nombre", nombres);
                        cmdInsertar.Parameters.AddWithValue("@apellido", apellidos);
                        cmdInsertar.Parameters.AddWithValue("@contacto", contacto);
                        cmdInsertar.Parameters.AddWithValue("@direccion", direccion);
                        cmdInsertar.Parameters.AddWithValue("@correo", correo);
                        objconect.con.Open();
                        cmdInsertar.ExecuteNonQuery();
                        objconect.con.Close();
                        str_mensaje = "El Usuario " + nombres + " " + apellidos + " ha sido registrado con éxito";
                    }
                }
                catch (Exception)
                {
                    str_mensaje = "Error al registrar los datos";
                }
            }
        }


        public string getMensaje() { return this.str_mensaje; }
    }
}
