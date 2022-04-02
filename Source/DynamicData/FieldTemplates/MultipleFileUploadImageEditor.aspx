<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultipleFileUploadImageEditor.aspx.cs"
Inherits="ElMestakbal.DynamicData.FieldTemplates.MultipleFileUploadImageEditor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl" style="width:875px; height: 473px;">
    <head runat="server">
        <title></title>
    </head>
    <body style="width:875px; height: 473px;">
        <form id="form1" runat="server" style="width:875px; height: 473px;">
             <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                 <Scripts>
                     <asp:ScriptReference Assembly="Telerik.Web.UI" 
                         Name="Telerik.Web.UI.Common.Core.js">
                     </asp:ScriptReference>
                     <asp:ScriptReference Assembly="Telerik.Web.UI" 
                         Name="Telerik.Web.UI.Common.jQuery.js">
                     </asp:ScriptReference>
                     <asp:ScriptReference Assembly="Telerik.Web.UI" 
                         Name="Telerik.Web.UI.Common.jQueryInclude.js">
                     </asp:ScriptReference>
                 </Scripts>
             </telerik:RadScriptManager>
             <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadImageEditor1" LoadingPanelID="RadAjaxLoadingPanel1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Button1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadImageEditor1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadFileExplorer ID="RadFileExplorer1" runat="server" Width="160px" Height="442px"
                                     Style="float: right;" VisibleControls="Grid, Toolbar" OnClientItemSelected="FileExplorer_OnClientItemSelected"
                                     EnableCreateNewFolder="False" TreePaneWidth="180px" ClientIDMode="Predictable">
            </telerik:RadFileExplorer>
            <div style="width: 700px; float: right;">
                <telerik:RadImageEditor ID="RadImageEditor1" runat="server" Width="700px" Height="430px"
                                        OnClientSaved="ImageEditor_OnClientSaved" EnableResize="False">
                </telerik:RadImageEditor>
            </div>
            <br style="clear: both;" />
            <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
            <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
                <script type="text/javascript">
                    function FileExplorer_OnClientItemSelected(explorer, args) {
                        var item = args.get_item(); //get reference of the selected item
                        var path = item.get_path(); //get the path of the selected image
                        if (!item.isDirectory()) {
                            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                            ajaxManager.ajaxRequest(item.get_path()); //Invoke AJAX request to load the new image inside ImageEditor
                        }
                    }

                    function ImageEditor_OnClientSaved(imgEditor, args) {
                        var fileExplorer = $find("<%=RadFileExplorer1.ClientID %>");
                        fileExplorer.clearFolderCache(); //clear the folder cache to force RadFileExplorer repopulate the folders
                        fileExplorer.refresh(args.get_fileName()); //refresh the explorer to display newly saved image
                    }
                </script>
            </telerik:RadCodeBlock>
        </form>
    </body>
</html>
