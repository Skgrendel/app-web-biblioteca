﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Web_biblioteca.Conexion
{
    public class Cls_conexion
    {
        public SqlConnection con = new SqlConnection("Data Source=DESKTOP-QBO7P3V\\SQLEXPRESS;Initial Catalog=dbs_biblioteca;Integrated Security=True");
    }
}