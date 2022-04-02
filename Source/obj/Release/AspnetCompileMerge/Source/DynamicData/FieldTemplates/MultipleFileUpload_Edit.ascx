<%@ Control Language="C#" CodeBehind="MultipleFileUpload_Edit.ascx.cs" Inherits="ElMestakbal.DynamicData.FieldTemplates.MultipleFileUpload_EditField"
AutoEventWireup="true" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">
        function fileUploaded(sender, args) {
            __doPostBack('<%= UpdatePanel1.ClientID %>', 'customPostback');
        }

        function validationFailed(sender, args) {
            $telerik.$(".invalid")
            .html("Invalid extension, please choose an image file");
            sender.deleteFileInputAt(0);
        }
    </script>
</telerik:RadScriptBlock>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <telerik:RadListView ID="RadListView1" runat="server" OnSelectedIndexChanged="RadListView1_SelectedIndexChanged">
            <LayoutTemplate>
                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
            </LayoutTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:RadioButton ID="RadioButton1" runat="server" Enabled="false" />
                        </td>
                        <td>
                            <%--<asp:Label ID="Label3" runat="server" Text='<%#  ((long)Eval("Length") / 1024).ToString("{0} KB") %>'></asp:Label>--%>
                            <asp:LinkButton ID="LinkButton1" runat="server"  CommandName="Select"
                                            Enabled='<%# IsImage((String)Eval("Name")) %>' ClientIDMode="AutoID" CausesValidation="False">
                                <telerik:RadBinaryImage ID="RadBinaryImage1" runat="server" AlternateText="BinaryImage"
                                                        Width="50" Height="50" ResizeMode="Fit" CropPosition="Center" DataValue='<%# ImageSizing((IsImage((String)Eval("FullName"))) ? (String)Eval("FullName") : Server.MapPath("~/Images/file_add.png")) %>' />
                            </asp:LinkButton>
                        </td>
                        <td>
                            <div style="margin-right: 12px;">
                                اسم الصورة:&nbsp;
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            <%--                                <br />
                            Length&nbsp;
                            <asp:Label ID="Label2" runat="server" Text='<%# ((long)Eval("Length") / 1024).ToString("{0} KB") %>'></asp:Label>--%>
                            </div>
                        </td>
                        <td>
                            <asp:ImageButton ID="ButtonRemove" runat="server" OnClick="ButtonRemove_Click" ToolTip="حذف"
                                             ImageUrl="~/Images/Delete.png" CausesValidation="False" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemTemplate>
                <div style="background-color: White;">
                    <table>
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton1" runat="server" Checked="true" />
                            </td>
                            <td>
                                <%--<asp:Label ID="Label3" runat="server" Text='<%#  ((long)Eval("Length") / 1024).ToString("{0} KB") %>'></asp:Label>--%>
                                <telerik:RadBinaryImage ID="RadBinaryImage1" runat="server" AlternateText="BinaryImage"
                                                        Width="150" Height="150" ResizeMode="Fit" CropPosition="Center" DataValue='<%# ImageSizing((IsImage((String)Eval("FullName"))) ? (String)Eval("FullName") : Server.MapPath("~/Images/file_add.png")) %>' />
                            </td>
                            <td>
                                <div style="margin-right: 12px; font-weight: bold; color: Black;">
                                    الصورة الرئيسية<br />
                                    اسم الصورة&nbsp;
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                <%-- <br />
                                Length&nbsp;
                                <asp:Label ID="Label2" runat="server" Text='<%# ((long)Eval("Length") / 1024).ToString("{0} KB") %>'></asp:Label>--%>
                                </div>
                            </td>
                            <td>
                                <asp:ImageButton ID="ButtonRemove" runat="server" OnClick="ButtonRemove_Click" ToolTip="حذف"
                                                 ImageUrl="~/Images/Delete.png" CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                </div>
            </SelectedItemTemplate>
        </telerik:RadListView>
        <br />
        <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MaxFileInputsCount="1"
                                OnClientFileUploaded="fileUploaded" OnClientValidationFailed="validationFailed"
                                TargetFolder='<%# ElMestakbal.Global.ResourcesNewsPath %>' OnFileUploaded="RadAsyncUpload1_FileUploaded" TemporaryFolder='<%# ElMestakbal.Global.ResourcesNewsPath + "/RadUploadTemp" %>'
                                TemporaryFileExpiration="00:05:00">
            <Localization Select="Choose Avatar" />
        </telerik:RadAsyncUpload>
    </ContentTemplate>
</asp:UpdatePanel>
<span id="invalid"></span>
<telerik:RadWindow runat="server" ID="RadWindow_NavigateUrl" NavigateUrl="MultipleFileUploadImageEditor.aspx"
                   Modal="True" RestrictionZoneID="NavigateUrlZone" OpenerElementID='<%# Button4.ClientID %>'
                   AutoSize="True">
</telerik:RadWindow>
<asp:Button ID="Button4" Text="open the window" runat="server" OnClientClick="openWinNavigateUrl();

            return false;" />
<script type="text/javascript">
    function openWinNavigateUrl() {
        $find("RadWindow_NavigateUrl").show();
    }
</script>
