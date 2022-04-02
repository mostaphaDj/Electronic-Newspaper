<%@ Control Language="C#" CodeBehind="Article_Edit.ascx.cs" Inherits="ElMestakbal.DynamicData.FieldTemplates.Article_EditField" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator" ControlToValidate="RadEditor1" Display="Static" Enabled="false">*
</asp:RequiredFieldValidator>

<asp:CustomValidator runat="server" ID="CustomValidator1" 
    CssClass="DDControl DDValidator" ControlToValidate="RadEditor1" 
    ClientValidationFunction="checkLength" 
    ErrorMessage="القالة قصيرة جدا ينبغي ألا تقل عن 100 حرف" Text="*"></asp:CustomValidator>  

<script type="text/javascript">
    var limitNum = 100;

    function checkLength(sender, args) {
        //Note that sender is NOT the RadEditor. sender is the <span> of the validator. 
        //The content is contained in the args.Value variable     
        var editorText = args.Value;
        args.IsValid = editorText.length > limitNum;
    }  
</script>

<link href="/Styles/RadEditor_RTL/Editor_RTL.css" rel="stylesheet" type="text/css" />

<telerik:RadEditor ID="RadEditor1" runat="server" DialogsCssFile="/Styles/RadEditor_RTL/RadEditor_Dialogs_RTL.css"
    ContentAreaCssFile="/Styles/RadEditor_RTL/EditorContentArea_RTL.css" Language="ar-DZ"
    Width="100%" Html="<%# FieldValueEditString %>" NewLineBr="False"
    AutoResizeHeight="True"
     EnableResize="False" ExternalDialogsPath='<%# ElMestakbal.Global.ResourcesNewsPath %>'
    StripFormattingOptions="MSWordNoFonts, MSWordRemoveAll, ConvertWordLists, MSWordNoMargins" StripFormattingOnPaste="MSWordNoFonts, MSWordRemoveAll, ConvertWordLists, MSWordNoMargins">
    <Tools>
        <telerik:EditorToolGroup Tag="MainToolbar">
            <telerik:EditorTool Name="ToggleScreenMode" />
            <telerik:EditorTool Name="InsertImage" />
            <telerik:EditorTool Name="ImageManager" ShortCut="CTRL+M" />
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="InsertExternalVideo" />
            <telerik:EditorTool Name="MediaManager" />
            <telerik:EditorTool Name="FlashManager" />
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="DocumentManager" />
            <telerik:EditorTool Name="TemplateManager" />
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="InsertLink" />
            <telerik:EditorTool Name="LinkManager" />
            <telerik:EditorTool Name="Unlink" />
            <telerik:EditorSeparator />
            <telerik:EditorSplitButton Name="InsertSymbol">
            </telerik:EditorSplitButton>
        </telerik:EditorToolGroup>
        <telerik:EditorToolGroup Tag="InsertToolbar">
            <telerik:EditorTool Name="InsertTableLight" />
            <telerik:EditorToolStrip Name="InsertTable">
            </telerik:EditorToolStrip>
            <telerik:EditorTool Name="SetTableProperties" />
            <telerik:EditorTool Name="SetCellProperties" />
            <telerik:EditorTool Name="InsertRowAbove" />
            <telerik:EditorTool Name="InsertRowBelow" />
            <telerik:EditorTool Name="DeleteRow" />
            <telerik:EditorTool Name="InsertColumnLeft" />
            <telerik:EditorTool Name="InsertColumnRight" />
            <telerik:EditorTool Name="DeleteColumn" />
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="MergeColumns" />
            <telerik:EditorTool Name="MergeRows" />
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="SplitCellHorizontal" />
            <telerik:EditorTool Name="SplitCell" />
            <telerik:EditorTool Name="DeleteCell" />
        </telerik:EditorToolGroup>
        <telerik:EditorToolGroup>
            <telerik:EditorSplitButton Name="Undo">
            </telerik:EditorSplitButton>
            <telerik:EditorSplitButton Name="Redo">
            </telerik:EditorSplitButton>
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="SelectAll" />
            <telerik:EditorTool Name="Cut" />
            <telerik:EditorTool Name="Copy" />
            <telerik:EditorTool Name="Paste" ShortCut="CTRL+V" />
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="PasteFromWord" />
            <telerik:EditorTool Name="PasteFromWordNoFontsNoSizes" />
            <telerik:EditorTool Name="PastePlainText" />
            <telerik:EditorToolStrip Name="FormatStripper">
            </telerik:EditorToolStrip>
            <telerik:EditorSeparator />
        </telerik:EditorToolGroup>
        <telerik:EditorToolGroup>
            <telerik:EditorTool Name="Bold" />
            <telerik:EditorTool Name="Italic" />
            <telerik:EditorTool Name="Underline" />
            <telerik:EditorTool Name="StrikeThrough" />
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="JustifyLeft" />
            <telerik:EditorTool Name="JustifyCenter" />
            <telerik:EditorTool Name="JustifyRight" />
            <telerik:EditorTool Name="JustifyFull" />
            <telerik:EditorTool Name="JustifyNone" />
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="Superscript" />
            <telerik:EditorTool Name="Subscript" />
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="Indent" />
            <telerik:EditorTool Name="Outdent" />
            <telerik:EditorTool Name="InsertOrderedList" />
            <telerik:EditorTool Name="InsertUnorderedList" />
        </telerik:EditorToolGroup>
        <telerik:EditorToolGroup Tag="DropdownToolbar">
            <telerik:EditorSplitButton Name="ForeColor">
            </telerik:EditorSplitButton>
            <telerik:EditorSplitButton Name="BackColor">
            </telerik:EditorSplitButton>
            <telerik:EditorSeparator />
            <telerik:EditorDropDown Name="FontName">
            </telerik:EditorDropDown>
            <telerik:EditorDropDown Name="FontSize">
            </telerik:EditorDropDown>
            <telerik:EditorDropDown Name="RealFontSize">
            </telerik:EditorDropDown>
            <telerik:EditorDropDown Name="ApplyClass">
            </telerik:EditorDropDown>
            <telerik:EditorDropDown Name="FormatBlock">
            </telerik:EditorDropDown>
            <telerik:EditorDropDown Name="Zoom">
            </telerik:EditorDropDown>
        </telerik:EditorToolGroup>
        <telerik:EditorToolGroup>
            <telerik:EditorTool Name="FindAndReplace" />
            <telerik:EditorTool Name="Print" />
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="InsertParagraph" />
            <telerik:EditorTool Name="InsertHorizontalRule" />
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="InsertDate" />
            <telerik:EditorTool Name="InsertTime" />
        </telerik:EditorToolGroup>
        <telerik:EditorToolGroup>
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="PageProperties" />
            <telerik:EditorSeparator />
            <telerik:EditorTool Name="StyleBuilder" />
            <telerik:EditorTool Name="TrackChangesDialog" />
        </telerik:EditorToolGroup>
    </Tools>
    <Content>
    

    
</Content>
    <ImageManager DeletePaths="~/NewsView/Images"
        UploadPaths="~/NewsView/Images" ViewPaths="~/NewsView/Images" />
    <DocumentManager DeletePaths="~/NewsView/Images" UploadPaths="~/NewsView/Images" ViewPaths="~/NewsView/Images" />
    <FlashManager DeletePaths="~/NewsView/Images" UploadPaths="~/NewsView/Images" ViewPaths="~/NewsView/Images" />
    <SilverlightManager DeletePaths="~/NewsView/Images" UploadPaths="~/NewsView/Images" ViewPaths="~/NewsView/Images" />
    <MediaManager DeletePaths="~/NewsView/Images" UploadPaths="~/NewsView/Images" ViewPaths="~/NewsView/Images" />

<TrackChangesSettings CanAcceptTrackChanges="False"></TrackChangesSettings>
</telerik:RadEditor>




<%--<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="RadEditor1"
    Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="RadEditor1"
    Display="Dynamic" />--%>
