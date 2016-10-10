<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ISRC.Web.TB.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="pageManager_01" runat="server" AutoSizePanelID="panelMain"></f:PageManager>
        <f:Panel ID="panelMain" runat="server" ShowBorder="false" ShowHeader="false" EnableCollapse="true" Layout="VBox">
            <Items>
                <f:Panel ID="panelTop" runat="server" BoxFlex="1" ShowHeader="false" ShowBorder="false" Layout="Fit">
                    <Items>
                        <f:Grid ID="girdTBFather" runat="server" Title="报表填报及维护" ShowBorder="false" AllowPaging="true" ShowHeader="true" IsDatabasePaging="true"
                                        DataKeyNames="ID" EnableCollapse="false" EnableCheckBoxSelect="true" PageSize="6" 
                                        EnableMultiSelect="false" EnableRowSelectEvent="true">
                            <Toolbars>
                                <f:Toolbar ID="toolbar_01" runat="server">
                                    <Items>
                                        <f:Button ID="btnAdd" runat="server" Text="新增" Icon="Add"></f:Button>
                                        <f:Button ID="btnDelete" runat="server" Text="删除所选项" Icon="Delete"></f:Button>
                                        <f:ToolbarSeparator ID="toolbarSeparator_01" runat="server"></f:ToolbarSeparator>
                                        <f:ToolbarSeparator ID="toolbarSeparator1" runat="server"></f:ToolbarSeparator>
                                        <f:NumberBox ID="nbxStartYear" runat="server" Label="起始年份" Width="180px" LabelWidth="70px" AutoPostBack="true" OnTextChanged="nbxStartYear_TextChanged"></f:NumberBox>
                                        <f:NumberBox ID="nbxEndYear" runat="server" Label="截止年份" Width="180px" LabelWidth="70px" AutoPostBack="true" OnTextChanged="nbxEndYear_TextChanged"></f:NumberBox>
                                        <f:Button ID="btnSearch" runat="server" Text="查询" Icon="SystemSearch"></f:Button>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
                            <Columns>
                                <f:WindowField Width="60px" WindowID="windowPop" TextAlign="Center" HeaderText="编辑" Icon="ApplicationEdit" ToolTip="编辑" />
                                <f:BoundField Width="100px" Hidden="true" ColumnID="ID" SortField="ID" DataField="ID" TextAlign="Center" HeaderText="ID"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="Cycle" SortField="Cycle" DataField="Cycle" TextAlign="Center" HeaderText="报表类型"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="Year" SortField="Year" DataField="Year" TextAlign="Center" HeaderText="年"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="Month" SortField="Month" DataField="Month" TextAlign="Center" HeaderText="月"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="Quarter" SortField="Quarter" DataField="Quarter" TextAlign="Center" HeaderText="季度"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="SemiYear" SortField="SemiYear" DataField="SemiYear" TextAlign="Center" HeaderText="半年度"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="FillDate" SortField="FillDate" DataField="FillDate" TextAlign="Center" HeaderText="填报日期"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="Status" SortField="Status" DataField="Status" TextAlign="Center" HeaderText="状态"></f:BoundField>
                                <f:BoundField Width="250px" ColumnID="Description" SortField="Description" DataField="Description" TextAlign="Center" HeaderText="说明"></f:BoundField>
                                
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Panel>
                <f:Panel ID="panelBottom" runat="server" BoxFlex="1" ShowHeader="false" ShowBorder="false" Layout="Fit">
                    <Items>
                        <f:Grid ID="gridTBIndex" runat="server" Title="填报指标" ShowBorder="false" AllowPaging="true" ShowHeader="true" IsDatabasePaging="true"
                                        DataKeyNames="ID" EnableCollapse="false" PageSize="6" 
                                        EnableMultiSelect="false" EnableRowSelectEvent="true">
                            <Columns>
                                <f:BoundField Width="100px" Hidden="true" ColumnID="sID" SortField="ID" DataField="ID" TextAlign="Center" HeaderText="ID"></f:BoundField>
                                <f:BoundField Width="100px" Hidden="true" ColumnID="ReportID" SortField="ReportID" DataField="ReportID" TextAlign="Center" HeaderText="父表ID"></f:BoundField>
                                <f:BoundField Width="100px" Hidden="true" ColumnID="IndexID" SortField="IndexID" DataField="IndexID" TextAlign="Center" HeaderText="填报指标"></f:BoundField>
                                <f:BoundField Width="150px" ColumnID="IndexName" SortField="IndexName" DataField="IndexName" TextAlign="Center" HeaderText="填报指标名"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="IndexValue" SortField="IndexValue" DataField="IndexValue" TextAlign="Center" HeaderText="指标值"></f:BoundField>
                                <f:BoundField Width="250px" ColumnID="sDescription" SortField="sDescription" DataField="sDescription" TextAlign="Center" HeaderText="说明"></f:BoundField>
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <f:Window ID="windowPop" runat="server" Title="编辑" EnableCollapse="false" Hidden="true" EnableIFrame="true" IFrameUrl="about:blank" CloseAction="HidePostBack" EnableMaximize="false"
                EnableResize="false" EnableClose="false" Target="Top" IsModal="true" Width="850px" Height="500px"></f:Window>
    </form>
</body>
</html>
