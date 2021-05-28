<%@ Page Title="" Language="C#" MasterPageFile="~/Social.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="SocialMediaWebApplication.DashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <nav class="navbar navbar-expand-xl navbar-dark bg-dark">
	<a href="#" class="navbar-brand"><i class="fa fa-cube"></i>Brand<b>Name</b></a>  		
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
		<span class="navbar-toggler-icon"></span>
	</button>
	<!-- Collection of nav links, forms, and other content for toggling -->
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">		
		<div class="navbar-form form-inline">
			<div class="input-group search-box">								
				<input type="text" id="search" class="form-control" placeholder="Search here...">
				<span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
			</div>
		</div>
		<div class="navbar-nav ml-auto">
			<a href="#" class="nav-item nav-link active"><i class="fa fa-home"></i><span>Home</span></a>
			<a href="#" class="nav-item nav-link"><i class="fa fa-gears"></i><span>Projects</span></a>
			<a href="#" class="nav-item nav-link"><i class="fa fa-users"></i><span>Team</span></a>
			<a href="#" class="nav-item nav-link"><i class="fa fa-pie-chart"></i><span>Reports</span></a>
			<a href="#" class="nav-item nav-link"><i class="fa fa-briefcase"></i><span>Careers</span></a>
			<a href="#" class="nav-item nav-link"><i class="fa fa-envelope"></i><span>Messages</span></a>		
			<a href="#" class="nav-item nav-link"><i class="fa fa-bell"></i><span>Notifications</span></a>
			<div class="nav-item dropdown">
				<a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle user-action"><img src="https://www.tutorialrepublic.com/examples/images/avatar/3.jpg" class="avatar" alt="Avatar"><asp:Label runat="server" Visible="false" ID="lblname"></asp:Label><b class="caret"></b></a>
				<div class="dropdown-menu">
					<a href="UserProfile.aspx" class="dropdown-item"><i class="fa fa-user-o"></i><asp:Label runat="server" Text="Profile"></asp:Label></a>
					<a href="#" class="dropdown-item"><i class="fa fa-calendar-o"></i> Calendar</a>
					<a href="#" class="dropdown-item"><i class="fa fa-sliders"></i> Settings</a>
					<div class="divider dropdown-divider"></div>
                    <a class="dropdown-item">
                        <i class="material-icons">&#xE8AC;</i>
                        <asp:Button runat="server" Text="Logout" OnClick="logout_Click" CssClass="border-0 bg-transparent position-relative ml-0 mr-5" />
           
                    </a>
				</div>
			</div>
		</div>
	</div>
</nav>
    <div class="container-fluid ">
        <div class="row">
            <div class="col-md-3 col-lg-3 col-sm-12">
                <div class="rounded rounded-t-lg overflow-hidden shadow max-w-xs my-3">
  	                <img src="https://i.imgur.com/dYcYQ7E.png" class="w-full" />
                    <div class="flex justify-center -mt-8">
                        <img src="https://i.imgur.com/8Km9tLL.jpg" class="rounded-full border-solid border-white border-2 -mt-3">		
                    </div>
	                <div class="text-center px-3 pb-6 pt-2">
		                <h3 class="text-black text-sm bold font-sans"><asp:Label runat="server" ID="lblUsername"></asp:Label></h3>
		                <p class="mt-2 font-sans font-light text-grey-dark">Hello, i'm from another the other side!</p>
	                </div>
  	                <div class="flex justify-center pb-3 text-grey-dark">
                      <div class="text-center mr-3 border-r pr-3">
                        <h2>34</h2>
                        <span>Photos</span>
                      </div>
                      <div class="text-center">
                        <h2>42</h2>
                        <span>Friends</span>
                      </div>
  	                </div>
                </div>
            </div>
               
            <div class="col-md-6 gedf-main">

                <div class="card gedf-card">
                   
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                <div class="form-group">
                                    <label class="sr-only" for="message">post</label>
                                    <textarea class="form-control" runat="server" id="message" placeholder="What are you thinking?"></textarea>
                            
                                </div>

                            </div>
                         
                        </div>
                        <div class="btn-toolbar justify-content-between">
                            <div class="btn-group">
                                <asp:Button ID="btnPost" runat="server" Text="Post" OnClick="btnPost_Click"/>  
                            </div>
                            <div class="btn-group">
                                <button id="btnGroupDrop1" type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    <i class="fa fa-globe"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="btnGroupDrop1">
                                    <a class="dropdown-item" href="#"><i class="fa fa-globe"></i> Public</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-users"></i> Friends</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-user"></i> Just me</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            
                       <asp:Repeater runat="server" ID="Repeater1" onitemcommand="Repeater1_ItemCommand">
                       <ItemTemplate>
                            <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0"><%#DataBinder.Eval(Container,"DataItem.Username")%>  </div>
                                  <%--  <a class="h7 text-muted"><asp:Label runat="server" ID="lblPosterusername"></asp:Label></a>--%>
                                </div>
                            </div>
                            <div>
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                         <asp:LinkButton class="dropdown-item" ID="lnkEdit" runat="server" onclientclick="javascript:return confirm('Are you sure to delete record?')" CommandArgument='<%#Eval("TweetID") %>' CommandName="Delete">Delete</asp:LinkButton>
                                        <a class="dropdown-item" href="#">Hide</a>
                                        <a class="dropdown-item" href="#">Report</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                                       
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i><%#DataBinder.Eval(Container,"DataItem.datetime")%>  </div>
                        <p class="card-text">
                            <%#DataBinder.Eval(Container,"DataItem.Post")%>  
                        </p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                    </div>
                 </ItemTemplate>
               </asp:Repeater>
                <!-- Post /////-->
           
            </div>
            <div class="col-md-3">
                <div class="card gedf-card">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                            card's content.</p>
                        <a href="#" class="card-link">Card link</a>
                        <a href="#" class="card-link">Another link</a>
                    </div>
                </div>
                <div class="card gedf-card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                                card's content.</p>
                            <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</asp:Content>
