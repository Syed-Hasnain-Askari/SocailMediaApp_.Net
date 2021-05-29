<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="SocialMediaWebApplication.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"/>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <title></title>
       <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script type="text/javascript">
          function signupalert() {
              swal({
                  title: 'Congratulations!',
                  text: 'You have been SignUp successfully',
                  icon: "success"
              });
          }
        
    </script>
</head>
<body class="bg-white">
    <form id="form1" runat="server">
     <!-- url('/img/hero-pattern.svg') -->
    <div class="flex min-h-screen bg-white">

        <div class="w-1/2 bg-cover md:block hidden" style="background-image:  url(https://images.unsplash.com/photo-1520243947988-b7b79f7873e9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDd8fGJsYWNrJTIwZm9yZXN0fGVufDB8fDB8eWVsbG93&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60)"></div>
        <!-- <div class="bg-no-repeat bg-right bg-cover max-w-max max-h-8 h-12 overflow-hidden">
            <img src="log_in.webp" alt="hey">
        </div> -->


        <div class="md:w-1/2 max-w-lg mx-auto my-24 px-4 py-5 shadow-none">

            <div class="text-left p-0 font-sans">
                
                <h1 class=" text-gray-800 text-3xl font-medium">Create an account for free</h1>
                <h3 class="p-1 text-gray-700">Free forever. No payment needed.</h3>
            </div>
                 <div class="mt-5">
                    <asp:TextBox runat="server" ID="txtUsername" CssClass="block w-full p-2 border rounded border-gray-300 focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-transparent " placeholder="User-name"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter User Name" CssClass="text-red text-xs italic" Display="Dynamic" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                </div>
                <div class="mt-5">

                    <!-- <label for="email" class="sc-bqyKva ePvcBv">Email</label> -->
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="block w-full p-2 border rounded border-gray-300 focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-transparent " TextMode="Email" placeholder="Email"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtEmail" runat="server" ErrorMessage="Please Enter User Email" CssClass="text-red text-xs italic" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="text-red text-xs italic" ControlToValidate="txtEmail" runat="server" ErrorMessage="Invalid Email Format" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>

                <div class="mt-5">
                   <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="block w-full p-2 border rounded border-gray-300 focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-transparent " placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtPassword" runat="server" ErrorMessage="Please Enter Your Password" CssClass="text-red text-xs italic" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="mt-5">
                   <asp:TextBox runat="server" ID="txtConfirmpassword" TextMode="Password" CssClass="block w-full p-2 border rounded border-gray-300 focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-transparent " placeholder="Confirm Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtConfirmpassword" runat="server" ErrorMessage="Please Enter User Confirm Password" CssClass="text-red text-xs italic" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtConfirmpassword" runat="server"  CssClass="text-red text-xs italic" ErrorMessage="Password not matched" ControlToCompare="txtPassword"></asp:CompareValidator>
                </div>

                <div class="mt-6 block p-5 text-sm md:font-sans text-xs text-gray-800">
                    <input type="checkbox" class="inline-block border-0  ">
                    <span display="inline" class="">By creating an account you are agreeing to our 
                        <a class="" href="/s/terms" target="_blank" data-test="Link">
                        <span class="underline ">Terms and Conditions</span> </a> and
                    <a class="" href="/s/privacy" target="_blank" data-test="Link">
                        <span class="underline">Privacy Policy</span> </a>
                    </span>
                </div>

                <div class="mt-10">
                    <asp:Button runat="server" CssClass="py-3 bg-green-500 text-white w-full rounded hover:bg-green-600" Text="SignUp" OnClick="btnSignup_Click" />
                </div>
           
            <a class="" href="Login.aspx" data-test="Link"><span class="block  p-5 text-center text-gray-800  text-xs ">Already have an account?</span></a>
        </div>


    </div>
    </form>

</body>
</html>
 