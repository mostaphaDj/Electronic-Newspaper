<%@ Control Language="C#" CodeBehind="AuthorString_Edit.ascx.cs" Inherits="ElMestakbal.DynamicData.FieldTemplates.AuthorString_EditField" %>

<telerik:RadTextBox ID="RadTextBox1" Runat="server" 
    Text='<%# FieldValueEditString %>' ondatabinding="RadTextBox1_DataBinding">
</telerik:RadTextBox>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="RadTextBox1" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="RadTextBox1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="RadTextBox1" Display="Dynamic" />
