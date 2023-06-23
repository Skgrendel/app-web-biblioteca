using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using Web_biblioteca.Conexion;

namespace Web_biblioteca.Datos
{
    public class Cls_consultar_user
    {
        Cls_conexion objconect = new Cls_conexion();
        private string str_mensaje;
        private string str_nombre;
        private string str_apellido;
        private int existencia;

        public void fnt_consultar(string id)
        {

            if (id == "")
            {
                str_mensaje = "Debe ingresar El ID solicitado para ralizar la busqueda";
            }
            else
            {
                SqlCommand cmdValidar = new SqlCommand("Sp_Validar_usuario", objconect.con);
                cmdValidar.CommandType = CommandType.StoredProcedure;
                cmdValidar.Parameters.AddWithValue("@id",id);
                objconect.con.Open();
                existencia = (int)cmdValidar.ExecuteScalar();
                objconect.con.Close();

                if (existencia == 0)
                {
                    str_mensaje = "El documento de Identidad numero: " + id + " No está registrado";
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("Sp_consultar_usuario", objconect.con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", id);
                    objconect.con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        this.str_nombre = reader[0].ToString();
                        this.str_apellido = reader[1].ToString();                        

                    }
                }


            }


        }
        public string getmensaje() { return this.str_mensaje; }
        public string getnombre() { return this.str_nombre; }
        public string getapellido() { return this.str_apellido;}

        public int getexistencia() { return this.existencia; }
    }
}