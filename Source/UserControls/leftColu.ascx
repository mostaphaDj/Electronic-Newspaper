<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="leftColu.ascx.cs" Inherits="ElMestakbal.UserControls.leftColu" %>
<%@ Register Src="SlideshowImages.ascx" TagName="SlideshowImages" TagPrefix="uc1" %>

<%@ Register Src="../Columns/SDF.ascx" TagName="SDF" TagPrefix="uc1" %>
<%@ Register Src="../Columns/LettersWithoutPoints.ascx" TagName="LettersWithoutPoints"
    TagPrefix="uc2" %>
<%@ Register Src="../Columns/LikeFacebook.ascx" TagName="LikeFacebook" TagPrefix="uc3" %>

<%@ Register Src="../Columns/Tell.ascx" TagName="Tell" TagPrefix="uc4" %>

<div class="leftColu">
    <style type="text/css">
        .leftColu ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

            .leftColu ul li {
                list-style: none;
                margin: 0;
                padding: 0;
            }

                .leftColu ul li img {
                    -webkit-box-shadow: 0 0 6px black;
                    -moz-box-shadow: 0 0 6px #000;
                    box-shadow: 0 0 6px black;
                    border-style: none;
                    border-bottom-width: 0;
                }

                .leftColu ul li a {
                    text-decoration: none;
                }

        .leftColu .Listdiv ul li h6 {
            margin: 18px 0 6px 0;
        }

        .leftColu .Listdiv ul li p {
        }

        .leftColu .Listdiv ul li p {
        }

        .leftColu .Listdiv ul li.classname {
            margin: 0 0 6px 0;
            border: #3F3F3F solid 2px;
            box-shadow: 0 0 6px black;
            -webkit-box-shadow: 0 0 6px black;
            -moz-box-shadow: 0 0 6px black;
        }
    </style>



    <div class="Listdiv">


        <%--        <div class="ColumnsContainer">
            <uc1:SDF ID="SDF1" runat="server" />
            <uc2:LettersWithoutPoints ID="LettersWithoutPoints1" runat="server" />
            <uc4:Tell ID="Tell1" runat="server" />--%>
        <%--<uc3:LikeFacebook ID="LikeFacebook1" runat="server" />--%>
        <%--        </div>--%>
        <% IsExist(); %>
        <asp:Panel ID="PanelPub" runat="server">
            <iframe
                class="BannerPub BannerPubSquare" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"
                src='<%=GetPub() %>'></iframe>
        </asp:Panel>
        <div class="clear"></div>
        <ul>
            <li>
                <div style="margin-top: 6px;" class="TitelButton">
                    ألبوم جريدة الآن
                </div>
                <uc1:SlideshowImages ID="SlideshowImages1" runat="server" />
            </li>
            <li>
                <%--<h4><%= GetVideoTitle() %></h4>--%>
                <iframe width="295" height="227" src="<%= GetVideo() %>" frameborder="0" allowfullscreen></iframe>
            </li>
            <li>
                <div id="fb-root">
                </div>
                <script>
                    (function (d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s); js.id = id;
                        js.src = "//connect.facebook.net/ar_AR/all.js#xfbml=1";
                        fjs.parentNode.insertBefore(js, fjs);
                    }
                    (document, 'script', 'facebook-jssdk'));
                </script>
                <div class="fb-like-box" data-href="https://www.facebook.com/pages/%D8%AC%D8%B1%D9%8A%D8%AF%D8%A9-%D8%A7%D9%84%D8%A2%D9%86/1025888534088927?__mref=message_bubble"
                    data-width="295" data-show-faces="true" data-stream="false" data-header="false">
                </div>
            </li>
        </ul>
    </div>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=NewsDBEntities"
        DefaultContainerName="NewsDBEntities" EntitySetName="News" OrderBy="it.OrderInGroup"
        EnableFlattening="False">
    </asp:EntityDataSource>
</div>
