using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using Web_biblioteca.Conexion;

namespace Web_biblioteca.Datos
{
    public class Cls_editar_lib
    {
        Cls_conexion objconect = new Cls_conexion();
        private string str_mensaje;
        private int existencia;
        public void fnt_crear(string isbn, string nombres, string autor, string editorial, int num_p, string estado, string genero, string fecha_p, int canti, string descripcion)
        {
            if (isbn == "" || nombres == "" || autor == "" || editorial == "" || num_p <= 0 || genero == "" || canti <= 0 || descripcion == "")
            {
                str_mensaje = "Debe ingresar todos los datos solicitados";
            }
            else
            {        // Validar si el libro ya está registrado

                // Insertar los datos del libro en la base de datos
                SqlCommand cmdInsertar = new SqlCommand("sp_editar_lib", objconect.con);
                cmdInsertar.CommandType = CommandType.StoredProcedure;
                cmdInsertar.Parameters.AddWithValue("@isbn", isbn);
                cmdInsertar.Parameters.AddWithValue("@nombre", nombres);
                cmdInsertar.Parameters.AddWithValue("@autor", autor);
                cmdInsertar.Parameters.AddWithValue("@editorial", editorial);
                cmdInsertar.Parameters.AddWithValue("@numero_p", num_p);
                cmdInsertar.Parameters.AddWithValue("@genero", genero);
                cmdInsertar.Parameters.AddWithValue("@fecha_p", fecha_p);
                cmdInsertar.Parameters.AddWithValue("@estado", estado);
                cmdInsertar.Parameters.AddWithValue("@cantidad", canti);
                cmdInsertar.Parameters.AddWithValue("@descripcion", descripcion);
                objconect.con.Open();
                cmdInsertar.ExecuteNonQuery();
                objconect.con.Close();
                str_mensaje = "El libro con ISBN " + isbn + " ha sido Modificado con éxito";

            }
        }

        public string getMensaje() { return this.str_mensaje; }
    }
}