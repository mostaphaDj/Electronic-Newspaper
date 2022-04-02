<%@ Control Language="C#" CodeBehind="Author_Edit.ascx.cs" Inherits="ElMestakbal.DynamicData.FieldTemplates.Author_EditField" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<telerik:RadComboBox ID="RadComboBox1" runat="server" selectedvalue='<%# FieldValue %>'
    DataSourceID="EntityDataSource1" DataTextField="Name" 
    DataValueField="UserId" AllowCustomText="True" 
    EmptyMessage="حدد كاتب المقالة" Filter="Contains">

</telerik:RadComboBox>

<asp:EntityDataSource ID="EntityDataSource1" runat="server" 
    ConnectionString="name=NewsDBEntities" DefaultContainerName="NewsDBEntities" 
    EnableFlattening="False" EntitySetName="ViewAuthors">
</asp:EntityDataSource>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="RadComboBox1" Display="Dynamic" Enabled="false"  CssClass="DDControl DDValidator" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="RadComboBox1" Display="Dynamic" Enabled="false"  CssClass="DDControl DDValidator" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="RadComboBox1" Display="Dynamic"  CssClass="DDControl DDValidator"  />
