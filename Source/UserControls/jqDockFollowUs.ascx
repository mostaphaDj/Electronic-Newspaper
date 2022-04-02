<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="jqDockFollowUs.ascx.cs"
Inherits="ElMestakbal.UserControls.jqDockFollowUs" %>
<style type="text/css">
    /*position and hide the menu initially - leave room for menu items to expand...*/
    #jqDockFollowUs
    {
        float: left;
        width: 250px
    }
    
    #jqDockMenu
    {
        position: relative;
        top: 0;
        left: 0;
        display: none;
    }
    /*dock styling...*/
    /*...centre the dock...*/
    #jqDockMenu div.jqDockWrap
    {
        margin: 3px auto;
    }
    * /*label styling...*/ div.jqDockLabel
    {
        font-weight: bold;
        font-style: italic;
        white-space: nowrap;
        color: #ffffff;
        cursor: default;
    }
</style>
<div id="jqDockFollowUs">
    <ul id="jqDockMenu" class='jqDockAuto' data-jqdock-align='top' data-jqdock-labels='true'>
        <li>
            <a href="http://www.facebook.com/pages/%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D9%82%D8%A8%D9%84-%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A-Elmoustakbalelarabi/339669856044639">
                <img src="/images/FollowUs/facebook.png" title='facebook' alt='facebook' />
            </a>
        </li>
        <li>
            <a href="http://www.youtube.com/channel/UCu66C6Q9wDG6nJe8LfvOS9A?gl=DZ">
                <img src='/images/FollowUs/Youtube.png' title='Youtube' alt='Youtube' />
            </a>
        </li>
        <li>
            <a href="https://plus.google.com/u/0/110940189758201012663/posts">
                <img src='/images/FollowUs/google.png' title='google+' alt='google+' />
            </a>
        </li>
        <li>
            <a href="#">
                <img src='/images/FollowUs/twitter.png' title='twitter' alt='twitter' />
            </a>
        </li>
        <li>
            <a href="#">
                <img src='/images/FollowUs/rss.png' title='RSS' alt='RSS' />
            </a>
        </li>
        <li>
            <a href="#">
                <img src='/images/FollowUs/Send_Message.png' title='اتصل بنا' alt='اتصل بنا' />
            </a>
        </li>
    </ul>
</div>