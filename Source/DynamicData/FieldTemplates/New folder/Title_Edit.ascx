<%@ Control Language="C#" CodeBehind="Title_Edit.ascx.cs" Inherits="ElMestakbal.Title_EditField" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<telerik:RadTextBox runat="server" ID="RadTextBox1" 
    Text='<%# FieldValueEditString %>' Width="350px" ></telerik:RadTextBox>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="RadTextBox1" Display="Dynamic" Enabled="false"  CssClass="DDControl DDValidator" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="RadTextBox1" Display="Dynamic" Enabled="false"  CssClass="DDControl DDValidator" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="RadTextBox1" Display="Dynamic"  CssClass="DDControl DDValidator" />




