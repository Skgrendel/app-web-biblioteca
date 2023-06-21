using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using Web_biblioteca.Conexion;
using System.Security.Cryptography.X509Certificates;

namespace Web_biblioteca.Datos
{
    public class Cls_consultar_lib
    {
        Cls_conexion objconect = new Cls_conexion();
        private string str_mensaje;
        private string str_nombre;
        private string str_autor;
        private string str_editorial;
        private int    int_n_paginas;
        private string str_genero;
        private string str_fecha_p;
        private string str_estado;
        private int    int_cantidad;
        private string str_descripcion;
        private int existencia;

        public void fnt_consultar(string isbn)
        {
            if (isbn == "" )
            {
                str_mensaje = "Debe ingresar El isbn solicitado para ralizar la busqueda";
            }
            else
            {
                SqlCommand cmdValidar = new SqlCommand("Sp_Validar_libro", objconect.con);
                cmdValidar.CommandType = CommandType.StoredProcedure;
                cmdValidar.Parameters.AddWithValue("@isbn", isbn);
                objconect.con.Open();
                existencia = (int)cmdValidar.ExecuteScalar();
                objconect.con.Close();

                if (existencia < 1 )
                {
                    str_mensaje = "El libro con ISBN " + isbn + " No está registrado";
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("Sp_consultar_libro", objconect.con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@isbn", isbn);
                    objconect.con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        this.str_nombre = reader[0].ToString();
                        this.str_autor = reader[1].ToString();
                        this.str_editorial = reader[2].ToString();
                        this.int_n_paginas = (int)reader[3];
                        this.str_genero = reader[4].ToString();
                        this.str_fecha_p = reader[5].ToString();
                        this.str_estado = reader[6].ToString();
                        this.int_cantidad = (int)reader[7];
                        this.str_descripcion = reader[8].ToString();

                    }
                }

                
            }
            
                        
        }
        public string getmensaje() { return this.str_mensaje; }
        public string getnombre() { return  this.str_nombre; }
        public string getautor() { return this.str_autor; }
        public string geteditorial() { return this.str_editorial; }
        public int getpaginas() { return  this.int_n_paginas; }
        public string getgenero() { return this.str_genero; }
        public string getfecha_p() {  return this.str_fecha_p;}
        public string getestado() { return this.str_estado; }
        public int getcantidad() { return this.int_cantidad;}
        public string getdescripcion() {  return this.str_descripcion;}
        public int getexistencia() { return this.existencia; }

    }
}