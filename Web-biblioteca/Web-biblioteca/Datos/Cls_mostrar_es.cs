using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Web_biblioteca.Conexion;

namespace Web_biblioteca.Datos
{
    public class Cls_mostrar_es
    {
       
        private DataTable dt;
        Cls_conexion conn = new Cls_conexion();

        public void mostrarEstados() {
            SqlDataAdapter da = new SqlDataAdapter("Sp_Mostrar_estados",conn.con);
            dt = new DataTable();
            conn.con.Open();
            da.SelectCommand.CommandType= CommandType.StoredProcedure;
            da.Fill(dt);
            conn.con.Close();        
        }
        public DataTable getEstados() { return dt; }
    }
}

