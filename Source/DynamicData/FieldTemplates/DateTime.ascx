<%@ Control Language="C#" CodeBehind="DateTime.ascx.cs" Inherits="ElMestakbal.DateTimeField" %>

<asp:Literal runat="server" ID="Literal1" Text='<%# (FieldValue as DateTime?).Value.ToString("HH:mm yyyy/MM/dd") %>' />


