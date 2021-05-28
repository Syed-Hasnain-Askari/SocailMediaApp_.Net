<%@ Page Title="" Language="C#" MasterPageFile="~/MainDashBoard.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="SocialMediaWebApplication.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
     <link rel="stylesheet" href="editprofile.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script type="text/javascript">
          function successalert() {
              swal({
                  title: 'Congratulations!',
                  text: 'Your message has been succesfully sent',
                  type: 'success'
              });
          }
    </script>
   <div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5 img-thumbnail" src="images/avatar.png" />
              <asp:Label ID="lblUsername" runat="server" CssClass="font-weight-bold"></asp:Label><asp:Label CssClass="text-black-50" runat="server" ID="lblUseremail"></asp:Label><span></span></div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
              
                <div class="row mt-3">
                      <div class="col-md-12"><label class="labels">Username</label><asp:TextBox runat="server" ID="txtUsername" CssClass="form-control"></asp:TextBox></div>
                    <div class="col-md-12"><label class="labels">Password</label><asp:TextBox runat="server" ID="txtPassword" CssClass="form-control"></asp:TextBox></div>
                    <div class="col-md-12"><label class="labels">ConfirmPassword</label><asp:TextBox runat="server" ID="txtConfirmpassword" CssClass="form-control"></asp:TextBox></div>
                    <div class="col-md-12"><label class="labels">Email Address</label><asp:TextBox runat="server" ID="txtemailaddress" CssClass="form-control"></asp:TextBox></div> 
                <div class="mt-5 text-center">
                    <asp:Button CssClass="btn btn-primary profile-button" runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click" />
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
</asp:Content>
