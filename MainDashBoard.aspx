<%@ Page Title="" Language="C#" MasterPageFile="~/MainDashBoard.Master" AutoEventWireup="true" CodeBehind="MainDashBoard.aspx.cs" Inherits="SocialMediaWebApplication.MainDashBoard1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
         <div class="container-fluid ">
        <div class="row">
            <div class="col-md-3 col-lg-3 col-sm-12">
              
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
                                <asp:Button ID="btnPost" runat="server" Text="Post" CssClass="btn btn-outline-success" OnClick="btnPost_Click"/>                        
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
                       <asp:HiddenField id="hfSelectedRecord" runat="server" />
                        <asp:Label runat="server" ID="lblUsername" Visible="false"></asp:Label>
                       <asp:Repeater runat="server" ID="Repeater1">
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
                              <%--  <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                         <asp:LinkButton class="dropdown-item" ID="lnkDelete" runat="server" onclientclick="javascript:return confirm('Are you sure to delete record?')" CommandArgument='<%#Eval("TweetID") %>' CommandName="Delete">Delete</asp:LinkButton>
                                        <asp:LinkButton runat="server" CssClass="dropdown-item" CommandName="Edit" CommandArgument='<%#Eval("TweetID") %>'>Edit</asp:LinkButton>
                                        <a class="dropdown-item" href="#">Report</a>
                                    </div>
                                </div>--%>
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
    </div>
</asp:Content>
