<%@ Control Language="C#" CodeBehind="MultilineText_Edit.ascx.cs" Inherits="ElMestakbal.MultilineText_EditField" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<telerik:RadTextBox ID="TextBox1" runat="server" TextMode="MultiLine" Text='<%# FieldValueEditString %>' Columns="80" Rows="3" Width="80%"/>


<asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:DynamicValidator runat="server" id="DynamicValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Static" />




