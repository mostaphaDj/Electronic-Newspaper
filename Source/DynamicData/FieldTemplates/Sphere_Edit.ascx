<%@ Control Language="C#" CodeBehind="Sphere_Edit.ascx.cs" Inherits="ElMestakbal.DynamicData.FieldTemplates.Sphere_EditField" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadComboBox ID="RadComboBox1" runat="server" 
    selectedvalue='<%# FieldValue %>'  EmptyMessage=" "
    DataSourceID="EntityDataSource1" DataTextField="Name" DataValueField="Id" 
    ondatabound="RadComboBox1_DataBound">
</telerik:RadComboBox>

<asp:EntityDataSource ID="EntityDataSource1" runat="server" 
    ConnectionString="name=NewsDBEntities" DefaultContainerName="NewsDBEntities" 
    EnableFlattening="False" EntitySetName="Spheres" Select="it.[Id], it.[Name]">
</asp:EntityDataSource>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="RadComboBox1" Display="Dynamic" Enabled="false"  CssClass="DDControl DDValidator" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="RadComboBox1" Display="Dynamic" Enabled="false"  CssClass="DDControl DDValidator" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="RadComboBox1" Display="Dynamic"  CssClass="DDControl DDValidator" />
