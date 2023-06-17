<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro_user.aspx.cs" Inherits="Web_biblioteca.Registro_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    <title>Biblioteca</title>  
    <link href="Style.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/>
</head>
<body>
    <form id="form1" runat="server">
       <%-- navegador de la pagina--%>
        <div class="Nav">
     <nav class="navbar navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><img src="image/logo.svg.png"  class="img-thumbnail d-inline-block align-text-top h4" alt="Logo" width="30" height="30"/> Biblioteca - Jorge Isaacs </a> <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link"  href="Home.aspx">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  active" aria-current="page" href="Registro_user.aspx">Creacion de Usuarios</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Registro de Libros</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="Prestamos.aspx">Prestamo de Libros</a>
        </li>
      </ul>
    </div>
  </div>    
</nav>
 </div>
        
 <div class="container text-center">
  <div class="row align-items-start">
    <div class="col">
      <p>

      </p>
    </div>
  </div>
</div>

        <%--Cuerpo de la pagina--%>

          <%--Formulario de Registro--%>
       <center>
        <div class="row">          
   <div class="col-6">
  <div class="card mb-3 ms-3" style="width: 40rem;">
  <div class="card-header">
   <h3>Registro de Usuarios</h3>
  </div>
  <div class="card-body ">    
    <div class="mb-2"> 
        <div><asp:Label ID="Label1" runat="server" Text="Numero de Identificacion" class="mb-2"></asp:Label></div>
        <asp:TextBox ID="TextBox1"  runat="server"></asp:TextBox>
    </div>
      <div class="mb-2">
          <div><asp:Label ID="Label2" runat="server" Text="Nombres" class="mb-2"></asp:Label></div>
          <asp:TextBox ID="TextBox2"  runat="server"></asp:TextBox>
      </div>
      <div class="mb-2">
          <div><asp:Label ID="Label3" runat="server" Text="Apellidos" class="mb-2"></asp:Label></div>
          <asp:TextBox ID="TextBox3"  runat="server"></asp:TextBox></div>
      <div class="mb-2"> 
          <div><asp:Label ID="Label4" runat="server" Text="Contacto" class="mb-2"></asp:Label></div>
          <asp:TextBox ID="TextBox4"  runat="server"></asp:TextBox></div>
      <div class="mb-2"> 
          <div><asp:Label ID="Label5" runat="server" Text="Direccion" class="mb-2"></asp:Label></div>
          <asp:TextBox ID="TextBox5"  runat="server"></asp:TextBox></div>
      <div class="mb-2">
          <div><asp:Label ID="Label6" runat="server" Text="Correo" class="mb-2"></asp:Label></div>
          <asp:TextBox ID="TextBox6"  runat="server"></asp:TextBox></div>
      <div><asp:Button ID="Btn_registrar" runat="server" Text="Registrarse" /></div>      
  </div>
</div>
</div>
</div>
</center>
      <%--footer de la pagina--%>
       
        <footer>       
        <div class="container-fluid">
            <div class="row p-5 bg-dark text-white ">
                 <div class="col-xs-12 col-md-6 col-lg-3">
                     <p class="h4"><img src="image/logo.svg.png"  class="img-thumbnail d-inline-block align-text-top" alt="Logo" width="40" height="40"/>
                        Centro Nacional Colombo Alemán</p>
                     <p class="text-secondary"> Sede Metalmecaina</p>
                 </div>
                 <div class="col-xs-12 col-md-6 col-lg-3">
                      <p class="h5 mb-3"> Libros en Existencia</p>
                     <div class="mb-2">
                         <a class="text-secondary text-decoration-none" href="#">Antes de Diciembre</a>
                     </div>
                      <div class="mb-2">
                         <a class="text-secondary text-decoration-none" href="#">El Remolino</a>
                     </div>
                      <div class="mb-2">
                         <a class="text-secondary text-decoration-none" href="#">Perfectos Mentirosos</a>
                     </div>
                 </div>                
                <div class="col-xs-12 col-md-6 col-lg-3">
                     <p class="h5 mb-3">Links</p>
                    <div class="mb-2">
                         <a class="text-secondary text-decoration-none" href="#">Terminos & Condisiones</a>
                     </div>
                    <div class="mb-2">
                         <a class="text-secondary text-decoration-none" href="#">Politicas de Privacidad</a>
                     </div>
                    </div>

                    <div class="col-xs-12 col-md-6 col-lg-3">
                     <p class="h5 mb-3">Contacto</p>
                    <div class="mb-2">
                         <a class="text-secondary text-decoration-none" href="#">Instagram</a>
                     </div>
                    <div class="mb-2">
                         <a class="text-secondary text-decoration-none" href="#">Sena Sofia Plus</a>
                     </div>
                        </div>
                  <div class="col-xs-12">
                <p class="text-white text-center mt-2">Copyrigth - All rigth  Reserved 2023</p>
            </div>
                 </div>
          
            </div>
        
    </footer>
            
    </form>
</body>
</html>
