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
        <div>
       <%-- navegador de la pagina--%>
        <div class="Nav nav-pills mb-3">
     <nav class="navbar navbar navbar-expand-lg navbar-dark bg-dark ">
  <div class="container-fluid">
    <a class="navbar-brand" href="Home.aspx"><img src="image/biblioteca.png"  class="img-thumbnail d-inline-block align-text-top h4" alt="Logo" width="30" height="30"/> Biblioteca - Jorge Isaacs </a> <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
      </ul>
    </div>
  </div>    
</nav>
 </div>
      </div>
        

        <%--Cuerpo de la pagina--%>
        <div class="container text-center ">
  <div class="row align-items-center">
    <div class="col">      
    </div>
    <div class="col">
        <div class="card">
  <h5 class="card-header">Registro de Nuevos  Usuarios</h5>
   <div class="card-body">
      <div class="mb-2"> 
        <div><asp:Label ID="Label1" runat="server" Text="Numero de Identificacion" class="form-label mb-2"></asp:Label></div>
        <asp:TextBox ID="txt_id" class="form-control"  runat="server"></asp:TextBox>
    </div>
      <div class="mb-2">
          <div><asp:Label ID="Label2" runat="server" Text="Nombres" class="form-label mb-2"></asp:Label></div>
          <asp:TextBox ID="txt_nombre" class="form-control"   runat="server"></asp:TextBox>
      </div>
      <div class="mb-2">
          <div><asp:Label ID="Label3" runat="server" Text="Apellidos" for="txt_apellido" class="form-label mb-2"></asp:Label></div>
          <asp:TextBox ID="txt_apellido" class="form-control"  runat="server"></asp:TextBox></div>
      <div class="mb-2"> 
          <div><asp:Label ID="Label4" runat="server" Text="Contacto" class="form-label mb-2"></asp:Label></div>
          <asp:TextBox ID="txt_contacto" class="form-control"  runat="server"></asp:TextBox></div>
      <div class="mb-2"> 
          <div><asp:Label ID="Label5" runat="server" Text="Direccion" class="form-label mb-2"></asp:Label></div>
          <asp:TextBox ID="txt_direccion" class="form-control"  runat="server"></asp:TextBox></div>
      <div class="mb-2">
          <div><asp:Label ID="Label6" runat="server" Text="Correo" class="form-label mb-2"></asp:Label></div>
          <asp:TextBox ID="txt_correo" class="form-control"  runat="server"></asp:TextBox></div>
      <div class="mt-2">
          <asp:Button ID="Btn_registrar" runat="server" class="btn btn-outline-success" Text="Registrarse"  Onclick="Btn_registrar_Click1" />
           <asp:Button ID="Btn_cancelar" runat="server" class="btn btn-outline-success" Text="Cancelar" OnClick="Btn_cancelar_Click" />
      </div> 
  </div>
</div>
    </div>
    <div class="col">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="ms_error" runat="server" Visible="false">           
<div class="col-sm-6 text-center">
    <div class="card border-warning mb-3 mt-3" style="width: 20rem;height:10rem">
  <div class="card-header">Precaucion</div>
  <div class="card-body">
      <asp:Label ID="lbl_mensaje" runat="server" Text=""></asp:Label>
  </div>
    </div>
   </div>
        </asp:Panel>
    </div>
  </div>
</div>
        
        

      <%--footer de la pagina--%>
       
        <footer >       
        <div class="container-fluid">
            <div class="row p-5 bg-dark text-white ">
                 <div class="col-xs-12 col-md-6 col-lg-3">
                     <div class="position-absolute top-0 start-50 translate-middle">
                         <asp:ImageButton ID="btn_scroll" runat="server" Cssclass="img-thumbnail d-inline-block align-text-top" alt="Logo" width="50" height="50"  ImageUrl="~/image/logo.svg.png" PostBackUrl="~/Home.aspx" /></div>
                     <p class="h4">Centro Nacional <br />Colombo Alemán</p>
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
