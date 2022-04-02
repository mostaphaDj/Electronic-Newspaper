z<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RightColuUC.ascx.cs" Inherits="ElMestakbal.Manage.RightColuUC" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="rightColu">
    <telerik:RadPanelBar ID="RadPanelBar1" runat="server" Width="200px">
        <Items>
            <telerik:RadPanelItem runat="server" Text="إدارة الأخبار" Expanded="True">
                <Items>
                    <telerik:RadPanelItem runat="server" Text="اضافة أخبار " 
                        NavigateUrl="~/Manage/News/InsertNews.aspx" Visible="False">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" NavigateUrl="~/Manage/News/NewsModify.aspx" Text="اضافة/تعديل/حذف الأخبار ">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="PDF" 
                        NavigateUrl="~/Manage/News/PublishPDF.aspx">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="خبر عاجل" 
                        NavigateUrl="~/Manage/News/BreakingNews.aspx">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="ضبط توقيت النشر" 
                        NavigateUrl="~/Manage/News/TimingOfThePublishing.aspx">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" 
                        NavigateUrl="~/Manage/News/Groups.aspx" Text="اضافة/تعديل/حذف تصنيفات">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="تفعيل أو حذف تعليقات" Visible="False">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Vidio" 
                        NavigateUrl="~/Manage/News/ChangeVideo.aspx">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" 
                        NavigateUrl="~/Manage/News/ChangePhotos.aspx" Text="ألبوم الصور">
                    </telerik:RadPanelItem>
                </Items>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="الخلفية / الاعلانات">
                <Items>
                    <telerik:RadPanelItem runat="server" Text="تعديل الاعلانات" NavigateUrl="~/Manage/Pub/Pub.aspx">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="الخلفية" NavigateUrl="~/Manage/Pub/Background.aspx">
                    </telerik:RadPanelItem>
                </Items>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server"  Text="ادارة حسابات المستخدمين" Value="RadPanelItemPersonalAccounts"
                Expanded="True" >
                <Items>
                    <telerik:RadPanelItem runat="server" Text="اضافة مستخدم جديد" 
                        NavigateUrl="~/Manage/Accounts/Register.aspx" Visible='<%# Roles.IsUserInRole("Account management")%>'>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="تعديل حسابات المستخدمين" Visible='<%# Roles.IsUserInRole("Account management")%>'
                        NavigateUrl="~/Manage/Accounts/ModifyUsers.aspx">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="ادارة مهام" 
                        NavigateUrl="~/Manage/Accounts/ManageTasks.aspx" Visible="False">
                    </telerik:RadPanelItem>
                </Items>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="ادارة الاستفتاءات" Visible="False">
                <Items>
                    <telerik:RadPanelItem runat="server" Text="اضافة استفتاء">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="حذف استفتاء">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="عرض جميع الإستفتاءات">
                    </telerik:RadPanelItem>
                </Items>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server"  Text="الحساب الشخصي" Expanded="True">
                <Items>
                    <telerik:RadPanelItem runat="server" Text="تعديل المعلومات الشخصية" NavigateUrl="~/Manage/Accounts/ModifyPersonalAccount.aspx">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="تعديل كلمة المرور" NavigateUrl="~/Manage/Accounts/ChangePassword.aspx">
                    </telerik:RadPanelItem>
                </Items>
            </telerik:RadPanelItem>
        </Items>
    </telerik:RadPanelBar>
</div>