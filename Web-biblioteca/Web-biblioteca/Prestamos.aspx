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
        </div>
         <%--footer de la pagina--%>
        <div>
        <footer class="footer">       
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
    </div>
    </form>
</body>
</html>
