<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RightColuUC.ascx.cs" Inherits="ElMestakbal.Authors.RightColuUC" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div class="rightColu">
    <telerik:RadPanelBar ID="RadPanelBar1" runat="server" Width="200px">
        <Items>
            <telerik:RadPanelItem runat="server" Text="إدارة الأخبار" Expanded="True">
                <Items>
                    <telerik:RadPanelItem runat="server" Text="اضافة خبر" 
                        NavigateUrl="~/Manage/News/InsertNews.aspx">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="تعديل خبر" 
                        NavigateUrl="~/Manage/News/ModifyNews.aspx">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="تفعيل أو حذف تعليقات">
                    </telerik:RadPanelItem>
                </Items>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="الحساب الشخصي">
                <Items>
                    <telerik:RadPanelItem runat="server" Text="تعديل المعلومات الشخصية">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="تعديل كلمة المرور">
                    </telerik:RadPanelItem>
                </Items>
            </telerik:RadPanelItem>
        </Items>
    </telerik:RadPanelBar>
</div>