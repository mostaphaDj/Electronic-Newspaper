<%@ Page Title="" Language="C#" MasterPageFile="~/NewsView/NestedMasterNewsView.master"
    AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="ElMestakbal.News.News" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <meta name="keywords" content="أخبار ، nouvelles" />
</asp:Content>
<%--<asp:Content ID="rightColuContent" ContentPlaceHolderID="rightColuContentPlaceHolder" runat="server">

</asp:Content>--%>
<%--<asp:Content ID="leftColuContent" ContentPlaceHolderID="leftColuContentPlaceHolder" runat="server">

</asp:Content>--%>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div style="padding: 12px; overflow: auto;">
        <asp:FormView ID="FormView1" runat="server" AllowPaging="false" DataKeyNames="Id"
            DataSourceID="EntityDataSource1" RenderOuterTable="False">
            <EmptyDataTemplate>
                &nbsp;  لم يعثر على الصفحة
            </EmptyDataTemplate>
            <ItemTemplate>
                <h4>
                    <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="Subtitle" />
                </h4>
                <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="Title" />
                <br />
                <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="MainImage" />
                <br />
                <asp:DynamicControl runat="server" DataField="AuthorString" />
                <br />
                <asp:DynamicControl runat="server" DataField="InsertDate" />
                <br />
                <asp:DynamicControl runat="server" DataField="Article" ShowHeader="False" />
                <br />

                <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                    <LoggedInTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Id", "/Manage/News/NewsModify.aspx?id={0}") %>'>
                           Edit
                        </asp:HyperLink>
                       
                        <asp:Button ID="ButtonDelete" runat="server" OnClick="ButtonDelete_Click" Text="Delete" OnClientClick="return confirm('هل تريد الحذف')" />
                        <br />
                    </LoggedInTemplate>
                </asp:LoginView>
                <%--
                <asp:DynamicControl runat="server" DataField="Likes" />
                <br />
                <asp:DynamicControl runat="server" DataField="Dislikes" />
                <br />
                
                <asp:DynamicControl runat="server" DataField="VisitsNumber" HeaderText="VisitsNumber" />
                <br />                
                --%>
            </ItemTemplate>
        </asp:FormView>
        <script type="text/javascript">
            function LogText(sender, args, network, socialAction) {
                var trackerId = sender.get_trackerId();
                var ssh1 = $find("<%= RadSocialShare1.ClientID %>");

                if (!sender._trackerSet) {
                    logEvent("_gaq.push processing : '[" + trackerId + "._setAccount," + sender.get_gaID() + "]");
                    logEvent("_gaq.push processing : '[" + trackerId + "._trackPageview]");
                    if (sender.get_id() == ssh1.get_id())
                        ssh1._trackerSet = true;
                }
                var command = (network == "Google") ? "._trackEvent," : "._trackSocial,";
                logEvent("_gaq.push processing : '[" + trackerId + command + network + "," + socialAction + "," + args.get_url() + "]'");
            }

            function OnFacebookLike(sender, args) {
                LogText(sender, args, "Facebook", "like");
            }

            function OnFacebookUnLike(sender, args) {
                LogText(sender, args, "Facebook", "unlike");
            }

            function OnFacebookSend(sender, args) {
                LogText(sender, args, "Facebook", "send");
            }

            function OnTweet(sender, args) {
                LogText(sender, args, "Twitter", "tweet");
            }

            function OnGooglePlusOneOff(sender, args) {
                LogText(sender, args, "Google", "offplusone");
            }

            function OnGooglePlusOneOn(sender, args) {
                LogText(sender, args, "Google", "onplusone");
            }

            function OnLinkedInShare(sender, args) {
                LogText(sender, args, "LinkedIn", "share");
            }

            function OnSocialButtonClicked(sender, args) {
                var network = args.get_socialNetType().replace("ShareOn", "");
                LogText(sender, args, network, "share");
            }
        </script>

        <telerik:RadSocialShare ID="RadSocialShare1" runat="server" OnFacebookLike="OnFacebookLike"
            OnFacebookUnLike="OnFacebookUnLike" OnTweet="OnTweet" OnGooglePlusOneOff="OnGooglePlusOneOff"
            OnGooglePlusOneOn="OnGooglePlusOneOn" OnFacebookSend="OnFacebookSend" OnSocialButtonClicked="OnSocialButtonClicked"
            OnLinkedInShare="OnLinkedInShare" GoogleAnalyticsUA="UA-XXXXX-YY" Width="100%">
            <MainButtons>
                <telerik:RadSocialButton SocialNetType="ShareOnFacebook" />
                <telerik:RadSocialButton SocialNetType="ShareOnTwitter" />
                <telerik:RadSocialButton SocialNetType="GoogleBookmarks" />
                <telerik:RadSocialButton SocialNetType="Blogger" />
                <telerik:RadSocialButton SocialNetType="Delicious" />
                <telerik:RadSocialButton SocialNetType="Digg" />
                <telerik:RadSocialButton SocialNetType="LinkedIn" />
                <telerik:RadSocialButton SocialNetType="MySpace" />
                <telerik:RadSocialButton SocialNetType="Reddit" />
                <telerik:RadSocialButton SocialNetType="StumbleUpon" />
                <%--<telerik:RadSocialButton SocialNetType="Tumblr" />--%>
                <%--<telerik:RadLinkedInButton CounterMode="Horizontal" ShowZeroCount="true" />--%>
                <telerik:RadGoogleButton AnnotationType="Bubble" ButtonSize="Medium" />
                <telerik:RadFacebookButton ButtonType="FacebookLike" ButtonLayout="ButtonCount" />
                <%--<telerik:RadFacebookButton ButtonType="FacebookSend" />--%>
                <telerik:RadTwitterButton CounterMode="Horizontal" />
            </MainButtons>
        </telerik:RadSocialShare>
        <br />
        <br />
        <div id="fb-root">
        </div>
       
        <script>
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/ar_AR/all.js#xfbml=1";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>
        <div class="fb-comments" data-href='<%= GetURL() %>' data-num-posts="2" data-width="480">
        </div>
    </div>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=NewsDBEntities"
        DefaultContainerName="NewsDBEntities" EnableDelete="True" EnableFlattening="False"
        EnableInsert="True" EnableUpdate="True" EntitySetName="News" Where="">
    </asp:EntityDataSource>

    <%--<telerik:RadFacebookButton ButtonType="FacebookSend" />--%>
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-33877441-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
</asp:Content>
