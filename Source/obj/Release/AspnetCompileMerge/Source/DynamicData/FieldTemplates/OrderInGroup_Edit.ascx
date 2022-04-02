<%@ Control Language="C#" CodeBehind="OrderInGroup_Edit.ascx.cs" Inherits="ElMestakbal.DynamicData.FieldTemplates.OrderInGroup_EditField" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadNumericTextBox ID="RadNumericTextBox1" runat="server" 
    NumberFormat-DecimalDigits="0" ShowSpinButtons="true" 
    Text="<%# FieldValueEditString %>" MinValue="1" MaxValue="255" Width="50px" 
    ondatabinding="RadNumericTextBox1_DataBinding" Value="1">
</telerik:RadNumericTextBox>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="RadNumericTextBox1" Display="Dynamic" Enabled="false"  CssClass="DDControl DDValidator" />
<asp:CompareValidator runat="server" ID="CompareValidator1" ControlToValidate="RadNumericTextBox1" Display="Dynamic"
    Operator="DataTypeCheck" Type="Integer" CssClass="DDControl DDValidator" />

<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="RadNumericTextBox1" Display="Dynamic" Enabled="false"  CssClass="DDControl DDValidator" />
<asp:RangeValidator runat="server" ID="RangeValidator1" ControlToValidate="RadNumericTextBox1" Type="Integer"
    Enabled="false" EnableClientScript="true" MinimumValue="0" MaximumValue="100" Display="Dynamic"  CssClass="DDControl DDValidator" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="RadNumericTextBox1" Display="Dynamic"  CssClass="DDControl DDValidator" />