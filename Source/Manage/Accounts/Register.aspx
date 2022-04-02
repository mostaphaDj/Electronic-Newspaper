<%@ Page Title="Register" Language="C#" MasterPageFile="~/Manage/CPanelNestedMasterPage.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="ElMestakbal.Manage.Accounts.Register" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContentPlaceHolder2">
    <asp:CreateUserWizard ID="RegisterUser" runat="server" EnableViewState="False" RequireEmail="False"
        OnCreatedUser="RegisterUser_CreatedUser"
        CompleteSuccessText="لقد تم انشاء الحساب انقر على الزر للمتابعة"
        ContinueButtonText="متابعة"
        ContinueDestinationPageUrl="~/Manage/Accounts/Register.aspx"
        DuplicateEmailErrorMessage="البريد الإلكتروني الذي ادخلته مسجل الرجاء ادخال بريد الكتروني آخر"
        DuplicateUserNameErrorMessage="اسم مستخدم مختلف" LoginCreatedUser="False" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em">
        <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="#333333" HorizontalAlign="Center" />
        <LayoutTemplate>
            <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <ContinueButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#990000" />
        <CreateUserButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#990000" />
        <TitleTextStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <caption>
                            <strong>انشاء حساب</strong></caption>
                        <tr>
                            <td>
                                <asp:Label ID="FirstNameLabel" runat="server" Style="font-weight: bold">الإسم:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="FirstNameTextBox" runat="server" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirstNameTextBox"
                                    CssClass="failureNotification" ErrorMessage="يجب ادخال الإسم" ToolTip="يجب ادخال الإسم."
                                    ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Style="font-weight: bold">اسم العائلة:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="LastNameTextBox" runat="server" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastNameTextBox"
                                    CssClass="failureNotification" ErrorMessage="يجب ادخال اسم العائلة" ToolTip="يجب ادخال اسم العائلة."
                                    ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <%-- <tr>
                            <td>
                                <asp:Label ID="GenderLabel" runat="server">الجنس:</asp:Label>
                            </td>
                            <td>
                                <telerik:RadComboBox ID="GenderRadComboBox" runat="server" Width="50px">
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Text="ذكر" Value="<%# true %>" />
                                        <telerik:RadComboBoxItem runat="server" Text="أنثى" Value="<%# false %>" />
                                    </Items>
                                </telerik:RadComboBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="GenderRadComboBox"
                                    CssClass="failureNotification" ErrorMessage="لم تحدد الجنس" ToolTip="لم تحدد الجنس."
                                    ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="BirthDateLabel" runat="server">تاريخ الميلاد:</asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="BirthDateRadDatePicker" runat="server" MinDate="1950-01-01">
                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" 
                                        ViewSelectorText="x">
                                    </Calendar>
                                    <DateInput DateFormat="dd-MM-yyyy" DisplayDateFormat="dd-MM-yyyy" 
                                        EnableSingleInputRendering="True" LabelWidth="64px">
                                    </DateInput>
                                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="BirthDateRadDatePicker"
                                    CssClass="failureNotification" ErrorMessage="لم تدخل تاريخ الميلاد." ToolTip="لم تدخل تاريخ الميلاد."
                                    ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server">العنوان:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="AddressTextBox" runat="server" Width="250px" MaxLength="255"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server">البلد :</asp:Label>
                            </td>
                            <td>
                                <telerik:RadComboBox ID="CountryRadComboBox" runat="server">
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Text="RadComboBoxItem1" 
                                            Value="RadComboBoxItem1" />
                                        <telerik:RadComboBoxItem runat="server" Text="RadComboBoxItem2" 
                                            Value="RadComboBoxItem2" />
                                        <telerik:RadComboBoxItem runat="server" Selected="True" Text="الجزائر" 
                                            Value="3" />
                                    </Items>
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="phoneLabel" runat="server">رقم الهاتف :</asp:Label>
                            </td>
                            <td>
                                <telerik:RadNumericTextBox ID="phoneRadNumericTextBox" runat="server" MinValue="1"
                                    MaxValue="9999999999">
                                    <NumberFormat DecimalDigits="0" GroupSeparator=" " GroupSizes="2" 
                                        ZeroPattern="n" />
                                </telerik:RadNumericTextBox>
                            </td>
                        </tr--%>
                        <tr>
                            <td>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Style="font-weight: bold">اسم الدخول:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server" MaxLength="255"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    CssClass="failureNotification" ErrorMessage="يجب ادخال اسم الدخول" ToolTip="يجب ادخال اسم الدخول."
                                    ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <%--<tr>
                            <td>
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">الإميل:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server" MaxLength="255"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" Display="Dynamic"
                                    CssClass="failureNotification" ErrorMessage="يجب ادخال الإميل" ToolTip="يجب ادخال الإميل."
                                    ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
             <tr>
                            <td>
                                <asp:Label ID="ConfirmEmailLabel" runat="server" AssociatedControlID="Email">أعد كتابة الإميل:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmEmailTextBox" runat="server" MaxLength="255"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ConfirmEmailTextBox" Display="Dynamic"
                                    CssClass="failureNotification" ErrorMessage="لم تعد كتابة الإميل." ToolTip="لم تعد كتابة الإميل."
                                    ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
				     
                                <asp:CompareValidator ID="EmailCompare" runat="server" ControlToCompare="Email"
                                    ControlToValidate="ConfirmEmailTextBox" CssClass="failureNotification" Display="Dynamic"
                                    ErrorMessage="خطأ في تطابق كتابة الإيميل." ValidationGroup="RegisterUserValidationGroup"
                                    ToolTip="خطأ في تطابق كتابة الإيميل."></asp:CompareValidator>
                            </td>
                        </tr>--%>
                        <tr>
                            <td>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Style="font-weight: bold">كلمة المرور:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="127"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                    CssClass="failureNotification" ErrorMessage="يجب ادخال كلمة السر" ToolTip="يجب ادخال كلمة السر."
                                    ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword" Style="font-weight: bold">أعد كتابة كلمة المرور:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"
                                    MaxLength="127"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification"
                                    Display="Dynamic" ErrorMessage="يجب اعادة كتابة كلمة المرور." ID="ConfirmPasswordRequired"
                                    runat="server" ToolTip="يجب اعادة كتابة كلمة المرور." ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                    ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic"
                                    ErrorMessage="كلمتا المرور غير متطابقة." ValidationGroup="RegisterUserValidationGroup"
                                    ToolTip="كلمتا المرور غير متطابقة"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="CreateUserButton" runat="server" CommandName="MoveNext" Text="انشئ الحساب"
                                    ValidationGroup="RegisterUserValidationGroup" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <CustomNavigationTemplate>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
        <NavigationButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#990000" />
        <SideBarButtonStyle ForeColor="White" />
        <SideBarStyle BackColor="#990000" Font-Size="0.9em" VerticalAlign="Top" />
    </asp:CreateUserWizard>
</asp:Content>
