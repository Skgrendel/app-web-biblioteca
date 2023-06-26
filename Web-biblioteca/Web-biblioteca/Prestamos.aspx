<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prestamos.aspx.cs" Inherits="Web_biblioteca.Prestamos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
<link href="Style.css" rel="stylesheet" />
    <title>Biblioteca</title>   
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <%-- navegador de la pagina--%>
        <div class="Nav nav-pills">
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
          <a class="nav-link " href="Seccion_libros.aspx">Seccion de Libros</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="Registro_lib.aspx">Registro de Libros</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Prestamos.aspx">Prestamo de Libros</a>
        </li>
           <li class="nav-item">
          <a class="nav-link " href="Devolucion.aspx">Devolucion de Libros</a>
        </li>
      </ul>
    </div>
  </div>    
</nav>
 </div>
</div>

        
  <%-- Cuerpo de la pagina  --%>

<div class="row">
  <div class="col-6 d-flex justify-content-center row mt-2">
    <div class="card" style="width: 40rem";>
   <div class="card-header text-center">
    Registro de Prestamos de libros
  </div>
      <div class="card-body">
          <div class="container me-2">             
          <div class=" d-flex justify-content-center mb-3">
               <asp:TextBox ID="txt_id" runat="server" class="form-control me-2" Width="250px" placeholder="Identificacion"/>
              <asp:TextBox ID="Txt_nombre" runat="server" class="form-control me-2 text-center" Width="250px" placeholder="Nombre" Enabled="false"/>
              <asp:Button ID="btn_buscar" runat="server" Text="Buscar" class="btn btn-outline-success  ms-2" OnClick="btn_buscar_Click" />
       </div>
          <div class="d-flex justify-content-center mb-3">
              <asp:TextBox ID="Txt_isbn" runat="server" class="form-control me-2" Width="250px" placeholder="Isbn del libro"/>
              <asp:TextBox ID="Txt_nombre_lib" runat="server" class="form-control me-2" Width="250px" placeholder="Nombre del libro" Enabled="false"/>
              <asp:Button ID="Btn_buscar_lib" runat="server" Text="Buscar" class="btn btn-outline-success ms-2" OnClick="Btn_buscar_lib_Click" />
       </div>
               <div class="d-flex justify-content-left  mb-3">              
              <asp:TextBox ID="Txt_autor" runat="server" class="form-control ps-4" Width="380px" placeholder="Autor" Enabled="false"/>
              <asp:TextBox ID="Txt_existencias" runat="server" class="form-control ms-2" Width="100px" placeholder="Existencias" Enabled="false"/>
                   
       </div>
              </div>
        <div class="container text-center">
             <div class="row align-items-center">
             <div class="col">
             <asp:Label ID="Label4" runat="server" Text="Cantidad" CssClass="form-label"></asp:Label>
               <asp:TextBox ID="Txt_cantidad" runat="server" class="form-control ms-2"  placeholder="" Enabled="true" Text="0" /> 
             </div>
             <div class="col">
             <asp:Label ID="Label1" runat="server" Text="Fecha final del prestamo" CssClass="form-label"></asp:Label>
              <asp:TextBox ID="Txt_fecha" runat="server" class="form-control" Enabled="true" TextMode="Date" Width="250px" />
          </div>
             </div>
             </div>          
                </div> 
        <div class="d-flex align-items-center align-text-top">
              <asp:Label ID="lbl_mensaje" runat="server" Text="" CssClass="h2 text-center" Visible="false"></asp:Label>
          </div>
              <div class="d-flex justify-content-center mb-3"> 
              <asp:Button ID="Btn_nuevo" runat="server" Text="Nuevo" class="btn btn-outline-success" OnClick="Btn_nuevo_Click"/>
              <asp:Button ID="Btn_registrar" runat="server" Text="Registrar" class="btn btn-outline-success  ms-2" OnClick="Btn_registrar_Click"/>
          </div>
      </div>
   
  </div>
   
    <div class="col-5 d-flex justify-content-center row mt-2">
    <div class="card" style="width: 40rem";>
        <div class="card-header text-center">
    Servicio de Prestamos a domicilio
  </div>
      <div class="card-body">
           <p class="card-text text-start">A partir de ahora podrás acceder a nuestro servicio de préstamo a domicilio a través del Catálogo en línea cuando escojas el recurso que quieras llevar a casa. Conoce cómo haciendo clic <asp:HyperLink ID="HyperLink2" runat="server" CssClass="text-style-none" NavigateUrl="#">Aqui</asp:HyperLink>.

Con este servicio gratuito puedes solicitar hasta 9 materiales, 6 libros y 3 audiovisuales de nuestro catálogo.<br /><br /> Ten en cuenta que disfrutar de nuestros servicios a domicilio es uno de los tantos beneficios que tienes por estar afiliado a la Red Distrital de Bibliotecas Públicas del Sena, si aún no lo estás, te invitamos a afiliarte haciendo clic <asp:HyperLink ID="HyperLink1" runat="server" CssClass="text-style-none" NavigateUrl="~/Registro_user.aspx">Aqui</asp:HyperLink>.<br /><br />

No pierdas la oportunidad de disfrutar de más de 600 mil recursos disponibles en todas las colecciones de las Bibliotecas Públicas del Sena.<br />

Para devolver el material, te ofrecemos las siguientes opciones:<br />

    <br /> * Comunícate a nuestro PBX 000000 opción 1
   <br />  * Acércate a tu biblioteca más cercana 
   <br />  * Haz uso de los buzones de devolución de las bibliotecas 
</p>
<br />
<br />
<br />            
      </div>
    </div>
  </div>
</div>
   
         <%--footer de la pagina--%>
       
        <footer>       
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
