<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelNestedMasterPage.master"
    AutoEventWireup="true" CodeBehind="TimingOfThePublishing.aspx.cs" Inherits="ElMestakbal.Manage.News.TimingOfThePublishing" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server">

                    <strong>حدد مجال العرض</strong>
 <br />
                    <strong>
                   
                    الى</strong>
 
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <telerik:RadDateTimePicker ID="RadDateTimePicker2" runat="server" Culture="ar-DZ">
                                <TimeView Columns="4" Culture="ar-DZ" RenderDirection="Vertical" >
                                </TimeView>
                                <DateInput EmptyMessage = "غير محدد">
                                
                                </DateInput>
                            </telerik:RadDateTimePicker>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="Button4" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="Button6" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
            
                    <asp:Button ID="Button3" runat="server" Text="نهاية نهار اليوم" 
                        CausesValidation="False" onclick="Button3_Click"
                         />
                    
                    <asp:Button ID="Button4" runat="server" Text="نهاية نهار غد" CausesValidation="False"
                        OnClick="Button4_Click" />
                    <asp:Button ID="Button6" runat="server" Text="غير محدد" 
                        onclick="Button6_Click" />

        <br /><br />
        <asp:Button ID="Button5" runat="server" Text="حفظ" OnClick="Button5_Click" />
    </asp:Panel>
</asp:Content>
