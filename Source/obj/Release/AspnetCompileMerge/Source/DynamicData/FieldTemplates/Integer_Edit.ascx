<%@ Control Language="C#" CodeBehind="Integer_Edit.ascx.cs" Inherits="ElMestakbal.Integer_EditField" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<telerik:RadNumericTextBox ID="RadNumericTextBox1" runat="server" NumberFormat-DecimalDigits="0" ShowSpinButtons="true" Text="<%# FieldValue %>"></telerik:RadNumericTextBox>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="RadNumericTextBox1" Display="Dynamic" Enabled="false" />
<asp:CompareValidator runat="server" ID="CompareValidator1" ControlToValidate="RadNumericTextBox1" Display="Dynamic"
    Operator="DataTypeCheck" Type="Integer"/>

<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="RadNumericTextBox1" Display="Dynamic" Enabled="false" CssClass="DDControl DDValidator"  />
<asp:RangeValidator runat="server" ID="RangeValidator1" ControlToValidate="RadNumericTextBox1" Type="Integer"
    Enabled="false" EnableClientScript="true" MinimumValue="0" MaximumValue="100" Display="Dynamic" CssClass="DDControl DDValidator"  />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="RadNumericTextBox1" Display="Dynamic"  CssClass="DDControl DDValidator"  />