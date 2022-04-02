<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="PublishPDF.aspx.cs" Inherits="ElMestakbal.Manage.News.PublishPDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
            function fileUploaded(sender, args) {
                __doPostBack('<%= UpdatePanel1.ClientID %>', 'customPostback');
            }

            function fileUploaded3(sender, args) {
                __doPostBack('<%= UpdatePanel3.ClientID %>', 'customPostback');
            }
        </script>
    </telerik:RadScriptBlock>
    <div>
        <h2>PDF Elaane upload</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>

                            <b>التاريخ</b>
                        </td>
                    </tr>
                    <tr>
                        <td>

                            <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Width="130px"></telerik:RadDatePicker>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>رفع الملف</b>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/App_DataPublic/PDF/images/page1_thumbnail.jpg" Visible="False" />
                            <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1"
                                MaxFileInputsCount="1"
                                OnFileUploaded="RadAsyncUpload1_FileUploaded"
                                OnClientFileUploaded="fileUploaded"
                                AllowedFileExtensions="pdf"
                                TemporaryFolder='<%# ElMestakbal.Global.PDFURL + "/RadUploadTemp" %>'
                                TemporaryFileExpiration="00:05:00">
                            </telerik:RadAsyncUpload>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />

        <asp:Panel ID="Panel1" runat="server">
            <table>
                <tr>
                    <td dir="ltr">
                        <b>FTP PDF</b>
                        <br />
                        Hoste: 	seaweed.arvixe.com
                <br />
                        Username: ftppdf
                <br />
                        Password : pdfWeb25694
                    </td>

                </tr>
            </table>
        </asp:Panel>

        <h2>المعنى</h2>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>

                            <b>التاريخ</b>
                        </td>
                    </tr>
                    <tr>
                        <td>

                            <telerik:RadDatePicker ID="RadDatePicker3" runat="server" Width="130px"></telerik:RadDatePicker>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>رفع الملف</b>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image3" runat="server" ImageUrl="djelfa.elmustakbal.com/App_DataPublic/PDF/images/page1_thumbnail.jpg" Visible="False" />
                            <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload3"
                                MaxFileInputsCount="1"
                                OnFileUploaded="RadAsyncUpload3_FileUploaded"
                                OnClientFileUploaded="fileUploaded3"
                                AllowedFileExtensions="pdf"
                                TemporaryFolder='<%# ElMestakbal.Global.PDFURL + "/RadUploadTemp" %>'
                                TemporaryFileExpiration="00:05:00">
                            </telerik:RadAsyncUpload>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />

        <asp:Panel ID="Panel3" runat="server">
            <table>
                <tr>
                    <td dir="ltr">
                        <b>FTP PDF</b>
                        <br />
                        Hoste: 	seaweed.arvixe.com
                <br />
                        Username: ftppdf
                <br />
                        Password : pdfWeb25694
                    </td>

                </tr>
            </table>
        </asp:Panel>

        <h2>PDF Djelfa upload</h2>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>

                            <b>التاريخ</b>
                        </td>
                    </tr>
                    <tr>
                        <td>

                            <telerik:RadDatePicker ID="RadDatePicker2" runat="server" Width="130px"></telerik:RadDatePicker>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>رفع الملف</b>

                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Image ID="Image2" runat="server" ImageUrl="djelfa.elmustakbal.com/App_DataPublic/PDF/images/page1_thumbnail.jpg" Visible="False" />
                            <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload2"
                                MaxFileInputsCount="1"
                                OnFileUploaded="RadAsyncUpload2_FileUploaded"
                                OnClientFileUploaded="fileUploaded"
                                AllowedFileExtensions="pdf"
                                TemporaryFolder='<%# ElMestakbal.Global.PDFURL + "/RadUploadTemp" %>'
                                TemporaryFileExpiration="00:05:00">
                            </telerik:RadAsyncUpload>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />

        <asp:Panel ID="Panel2" runat="server">
            <table>
                <tr>
                    <td dir="ltr">
                        <b>FTP PDF</b>
                        <br />
                        Hoste: 	seaweed.arvixe.com
                <br />
                        Username: ftppdf
                <br />
                        Password : pdfWeb25694
                    </td>

                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
