<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageSpecialEvents.aspx.cs" Inherits="Admin_ManageSpecialEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <!--.row.col-md-12>h1>span //Code to quick create div-column-... in visual studio-->
    
        
    <div class="row col-md-12">
        <h1>Manage Special Events
            <span class ="glyphicon glyphicon-glass"></span>
        </h1>
   

    <!-- ObjectDataSource control to do the underlying communication with my BLL and my list view control-->

        <asp:ObjectDataSource ID="SpecialEventsDataSource" runat="server"
            TypeName="eRestaurant.Framework.BLL.RestaurantAdminController"
            SelectMethod="ListAllSpecialEvents"
            DataObjectTypeName="eRestaurant.Framework.Entities.SpecialEvent"
            OldValuesParameterFormatString="original_{0}"
            UpdateMethod="UpdateSpecialEvent"
            DeleteMethod="DeleteSpecialEvent"
            InsertMethod="AddSpecialEvent">
            
        </asp:ObjectDataSource>

        

    <%--<asp:Gridview ID="SpecialEventsGridView" runat ="server"
        DataSourceID="SpecialEventsDataSource">
    </asp:GridView>--%>
        <asp:ListView ID="SpecialEventsListView" runat="server"
            DataSourceId="SpecialEventsDataSource"
            DataKeyNames ="EventCode" InsertItemPosition="LastItem" >
            <EditItemTemplate>
            <div style="">
                <asp:LinkButton runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                &nbsp;&nbsp;
                <asp:LinkButton runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                &nbsp;&nbsp;&nbsp;
                EventCode:
                <asp:TextBox Text='<%# Bind("EventCode") %>' runat="server" ID="EventCodeTextBox" />
                Description:
                <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" />
                <asp:CheckBox Checked='<%# Bind("Active") %>' runat="server" ID="ActiveCheckBox" Text="Active" />
            </div>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <div style="">
                <asp:LinkButton runat="server" CommandName="Insert" ID="InsertButton">Insert <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                &nbsp;&nbsp;
                <asp:LinkButton runat="server" CommandName="Cancel" ID="CancelButton">Clear <span class="glyphicon glyphicon-refresh"></span></asp:LinkButton>
                &nbsp;&nbsp;&nbsp;

                <asp:CheckBox Checked='<%# Bind("Active") %>' runat="server" ID="ActiveCheckBox" Text="Active" />
                &mdash;

                <asp:Label ID="Label3" runat="server" AssociatedControlID="EventCodeTextBox" CssClass="control-label">Event Code</asp:Label>
                <asp:TextBox Text='<%# Bind("EventCode") %>' runat="server" ID="EventCodeTextBox" />
                &mdash;

                <asp:Label ID="Label4" runat="server" AssociatedControlID="DescriptionTextBox" CssClass="control-label">Description</asp:Label>
                <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" />
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <div style="">
                <asp:LinkButton runat="server" CommandName="Edit" ID="EditButton">Edit <span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                &nbsp;&nbsp;
                <asp:LinkButton runat="server" CommandName="Delete" ID="DeleteButton">Delete <span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                &nbsp;&nbsp;&nbsp;
                <asp:CheckBox Checked='<%# Eval("Active") %>' runat="server" ID="ActiveCheckBox" Enabled="false" Text="Active" />
                &mdash;
                <asp:Label ID="Label1" runat="server" AssociatedControlID="EventCodeLabel" CssClass="control-label">Event Code</asp:Label>
                <asp:Label Text='<%# Eval("EventCode") %>' runat="server" ID="EventCodeLabel" />
                &mdash;
                <asp:Label ID="Label2" runat="server" AssociatedControlID="DescriptionLabel" CssClass="control-label">Description</asp:Label>
                <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" />
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <fieldset runat="server" id="itemPlaceholderContainer">
                <div runat="server" id="itemPlaceholder" />
            </fieldset>
        </LayoutTemplate>

        </asp:ListView>
       
    <asp:ListView ID ="SpecialEventsListView2" runat="server"
        DataSourceId="SpecialEventsDataSource">
        <LayoutTemplate>
            <fieldset runat="server" id="itemPlaceholderContainer">
                <div runat="server" id="itemPlaceholder" />
            </fieldset>
        </LayoutTemplate>

        <ItemTemplate>
            <div>
                <asp:LinkButton runat="server" CommandName="Insert"
                    ID="EditButton">
                    Edit
                    <span class="glyphicon glyphicon-pencil">
                    </span>
                </asp:LinkButton>

                &nbsp;&nbsp
                <asp:LinkButton runat="server" CommandName="Delete"
                    ID="DeleteButton">
                    Insert
                    <span class="glyphicon glyphicon-trash">
                    </span>
                </asp:LinkButton>
                 &nbsp;&nbsp;&nbsp

                <asp:CheckBox Checked ='<%# Eval("Active") %>'
                    runat="server" ID="ActiveCheckBox"
                    Enabled ="false" Text="Active"/>
                &mdash;
                <asp:Label ID ="Label1" runat="server"
                    AssociatedControlID="EventCodeData"
                    CssClass="control-label"> Event Code
                </asp:Label>

                <asp:Label ID ="EventCodeData" runat="server"
                    Text='<%# Eval("EventCode")%>'/>
                &mdash;
                <asp:Label ID ="DescriptionData" runat="server"
                    Text='<%# Eval("Description")%>'/>

            </div>
         </ItemTemplate>
    </asp:ListView>

   </div>
</asp:Content>

