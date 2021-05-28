<%@ Page Title="" Language="C#" MasterPageFile="~/MainDashBoard.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="SocialMediaWebApplication.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <link rel="stylesheet" href="userprofile.css"/>
    <div class="row d-flex justify-content-center padding">
    <div class="col-md-8">
        <!-- Column -->
        <div class="card">
            <img class="card-img-top" src="https://i.imgur.com/K7A78We.jpg" alt="Card image cap">
            <div class="card-body little-profile text-center">
                <div class="pro-img"><img src="https://i.imgur.com/8RKXAIV.jpg" alt="user"></div>
                <h3 class="m-b-0"><asp:Label runat="server" ID="lblUsername" Visible="false"></asp:Label></h3>
                <p>Web Designer &amp; Developer</p> 
                <a href="javascript:void(0)" class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded" data-abc="true">Follow</a>
                <div class="row text-center m-t-20">
                    <div class="col-lg-4 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light">10434</h3><small>Articles</small>
                    </div>
                    <div class="col-lg-4 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light">434K</h3><small>Followers</small>
                    </div>
                    <div class="col-lg-4 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light">5454</h3><small>Following</small>
                    </div>
                </div>
                <div class="row">
                     <div class="col">          
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
                                <asp:Button ID="btnPost" runat="server" Text="Post" CssClass="btn btn-outline-success" OnClick="btnPost_Click"/>  
                                <asp:Button ID="btnSave" runat="server" Text="Update" Visible="false" CssClass="btn btn-outline-success" OnClick="btnUpdate_Click"/>  
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
                    
               
                       <asp:HiddenField id="hfSelectedRecord" runat="server" />
                        <asp:Label runat="server" ID="UserID" Visible="false"></asp:Label>
                         <asp:Label runat="server" ID="lblGetusername" Visible="false"></asp:Label>
                       <asp:Repeater runat="server" ID="Repeater2" onitemcommand="Repeater1_ItemCommand">
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
                                         <asp:LinkButton class="dropdown-item" ID="lnkDelete" runat="server" onclientclick="javascript:return confirm('Are you sure to delete record?')" CommandArgument='<%#Eval("TweetID") %>' CommandName="Delete">Delete</asp:LinkButton>
                                        <asp:LinkButton runat="server" CssClass="dropdown-item" CommandName="Edit" CommandArgument='<%#Eval("TweetID") %>'>Edit</asp:LinkButton>
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
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
