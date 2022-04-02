<%@ Control Language="C#" CodeBehind="Type_Edit.ascx.cs" Inherits="ElMestakbal.DynamicData.FieldTemplates.Type_EditField" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadComboBox ID="RadComboBox1" runat="server" EmptyMessage=" "
    SelectedValue='<%# FieldValue %>' ondatabound="RadComboBox1_DataBound">
    <Items>
        <telerik:RadComboBoxItem runat="server" Owner="RadComboBox1" 
            Text="أخبار وطنية" Value="True" />
        <telerik:RadComboBoxItem runat="server" Owner="RadComboBox1" 
            Text="أخبار دولية" Value="False" />
    </Items>
</telerik:RadComboBox>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="RadComboBox1"
    Display="Dynamic" Enabled="false" CssClass="DDControl DDValidator"  />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="RadComboBox1"
    Display="Dynamic" Enabled="false"  CssClass="DDControl DDValidator" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="RadComboBox1"
    Display="Dynamic"  CssClass="DDControl DDValidator" />
