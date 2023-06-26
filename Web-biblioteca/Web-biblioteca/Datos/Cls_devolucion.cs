﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using Web_biblioteca.Conexion;

namespace Web_biblioteca.Datos
{
    public class Cls_devolucion
    {
        Cls_conexion conexion = new Cls_conexion();
        private string str_mensaje;

        public void fnt_devolucion(string id, string isbn, string fecha_e, int cantidad)
        {
            if (id == "" || isbn == "" || fecha_e == "" || cantidad == 0)
            {
                str_mensaje = "Debe ingresar todos los datos solicitados";
            }
            else
            {

                SqlCommand cmdInsertar = new SqlCommand("sp_devolucion_lib", conexion.con);
                cmdInsertar.CommandType = CommandType.StoredProcedure;
                cmdInsertar.Parameters.AddWithValue("@id", id);
                cmdInsertar.Parameters.AddWithValue("@isbn", isbn);
                cmdInsertar.Parameters.AddWithValue("@entrega", fecha_e);
                cmdInsertar.Parameters.AddWithValue("@cantidad", cantidad);
                conexion.con.Open();
                cmdInsertar.ExecuteNonQuery();
                conexion.con.Close();
                str_mensaje = "La devolucion ha sido registrada con éxito";
            }
        }

        public string getmensaje() { return str_mensaje; }
    }
}