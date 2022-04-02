<%@ Control Language="C#" Inherits="ElMestakbal.Decimal_EditField" CodeBehind="Decimal_Edit.ascx.cs"%>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<telerik:RadNumericTextBox runat="server" ID="RadNumericTextBox1" Text='<%# FieldValueEditString %>'></telerik:RadNumericTextBox>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="RadNumericTextBox1" Display="Dynamic" Enabled="false" />
<asp:CompareValidator runat="server" ID="CompareValidator1" ControlToValidate="RadNumericTextBox1" Display="Dynamic"
    Operator="DataTypeCheck" Type="Double"/>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="RadNumericTextBox1" Display="Dynamic" Enabled="false"  CssClass="DDControl DDValidator" />
<asp:RangeValidator runat="server" ID="RangeValidator1" ControlToValidate="RadNumericTextBox1" Type="Double"
    Enabled="false" EnableClientScript="true" MinimumValue="0" MaximumValue="100" Display="Dynamic"  CssClass="DDControl DDValidator" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="RadNumericTextBox1" Display="Dynamic"  CssClass="DDControl DDValidator" />