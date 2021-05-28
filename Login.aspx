<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SocialMediaWebApplication.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"/>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script type="text/javascript">
          function passwordfailedalert() {
              swal({
                  title: 'Sorry!',
                  text: 'password is not matched',
                  icon: "error",
              });
          }
          function emailfailedalert() {
              swal({
                  title: 'Sorry!',
                  text: 'Email is not matched',
                  icon: "error",
              });
          }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="font-sans min-h-screen antialiased bg-gray-900 pt-24 pb-5">
    <div class="flex flex-col justify-center sm:w-96 sm:m-auto mx-5 mb-5 space-y-8">
      <h1 class="font-bold text-center text-4xl text-yellow-500">Pakistan<span class="text-blue-500">Twitter</span></h1>
      
        <div class="flex flex-col bg-white p-10 rounded-lg shadow space-y-6">
          <h1 class="font-bold text-xl text-center">Sign in to your account</h1>

          <div class="flex flex-col space-y-1">
             <asp:TextBox ID="txtEmail" CssClass="border-2 rounded px-3 py-2 w-full focus:outline-none focus:border-blue-400 focus:shadow" TextMode="Email" placeholder="Email Address" runat="server"></asp:TextBox>
          </div>

          <div class="flex flex-col space-y-1">
              <asp:TextBox ID="txtPassword" CssClass="border-2 rounded px-3 py-2 w-full focus:outline-none focus:border-blue-400 focus:shadow" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
          </div>

          <div class="relative">
            <input type="checkbox" name="remember" id="remember" checked class="inline-block align-middle" />
            <label class="inline-block align-middle" for="remember">Remember me</label>
          </div>

          <div class="flex flex-col-reverse sm:flex-row sm:justify-between items-center">
            <a href="#" class="inline-block text-blue-500 hover:text-blue-800 hover:underline">Forgot your password?</a>
           <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="bg-blue-500 text-white font-bold px-5 py-2 rounded focus:outline-none shadow hover:bg-blue-700 transition-colors" OnClick="btnLogin_Click"></asp:Button>
            </div>
        </div>

      <div class="flex justify-center text-gray-500 text-sm">
        <p>&copy;2021. All right reserved.</p>
      </div>
    </div>
     </div>
       </form>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>
