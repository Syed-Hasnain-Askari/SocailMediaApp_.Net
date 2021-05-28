<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="SocialMediaWebApplication.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<div class="container">
	<div class="registration mx-auto d-block w-100">
		<div class="page-header text-center">
			<h1>Sign up</h1>
		</div>
		
			<fieldset>
				<legend>User Registration</legend>
				<div class="form-group">
					<label for="exampleInputPassword1">User Name *</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="alert-danger" ErrorMessage="Please Enter your User Name" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password *</label>
					 <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="alert-danger" ErrorMessage="Please Enter your Password" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Confirm Password *</label>
					 <asp:TextBox ID="txtConfirmpassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="alert-danger" ErrorMessage="Please Enter your Confirm Password" ControlToValidate="txtConfirmpassword" Display="Dynamic"></asp:RequiredFieldValidator>
				     <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not Matched" CssClass="alert-danger" Display="Dynamic" ControlToCompare="txtPassword" ControlToValidate="txtConfirmpassword"></asp:CompareValidator>
                </div>
				<div class="form-group">
					<label for="exampleInputEmail1">Confirm Email Address *</label>
					 <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="alert-danger" ErrorMessage="Please Enter your Email Address"  ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Format" CssClass="alert-danger" Display="Dynamic" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
           
				</div>
				<div class="d-flex justify-content-between align-items-center">
					<div class="form-group d-flex justify-content-start">
                        <asp:Button ID="btnSignup" runat="server" CssClass="btn btn-primary" Text="SignUp" OnClick="btnSignup_Click"/>	
					</div>
					<div class="form-check form-group d-flex justify-content-end">
						<a href="#">Sign in instead</a>
					</div>
				</div>
			</fieldset>
	</div>
</div>
    </form>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>
