<%@ Control Language="C#" CodeBehind="Article.ascx.cs" Inherits="ElMestakbal.DynamicData.FieldTemplates.Article" %>

<div class="classArticle" style="text-align:justify;">
<asp:Literal runat="server" ID="Literal1" Text="<%# FieldValue %>" Mode="Transform" />
</div>

