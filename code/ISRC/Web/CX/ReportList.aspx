<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportList.aspx.cs" Inherits="ISRC.Web.CX.ReportList" %>

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
                        <f:Grid ID="girdAudit" runat="server" Title="报表查询" ShowBorder="false" AllowPaging="true" ShowHeader="true" IsDatabasePaging="true"
                                        DataKeyNames="ID" AllowSorting="true" EnableCollapse="false" PageSize="6" 
                                        EnableMultiSelect="false" EnableRowSelectEvent="true">
                            <Toolbars>
                                <f:Toolbar ID="toolbar_01" runat="server">
                                    <Items>
                                        <f:DropDownList ID="ddlCycle" runat="server" Label="报表类型" Width="220px" LabelWidth="70px" AutoPostBack="true" OnSelectedIndexChanged="ddlCycle_SelectedIndexChanged">
                                            <f:ListItem Text="请选择报表类型" Selected="true" />
                                            <f:ListItem Text="月报表" Value="1" />
                                            <f:ListItem Text="季报表" Value="2" />
                                            <f:ListItem Text="半年报表" Value="3" />
                                            <f:ListItem Text="年报表" Value="4" />
                                        </f:DropDownList>
                                        <f:NumberBox ID="nbxYear" runat="server" Label="年份" Width="150px" LabelWidth="40px" AutoPostBack="true" OnTextChanged="nbxYear_TextChanged"></f:NumberBox>
                                        <f:DropDownList ID="ddlCycleList" runat="server" Hidden="true" Width="180px" LabelWidth="60px" AutoPostBack="true"></f:DropDownList>
                                        <f:DropDownList ID="ddlStatus" runat="server" Label="状态" Width="150px" LabelWidth="40px">
                                            <f:ListItem Text="请选择状态" Selected="true" />
                                            <f:ListItem Text="未提交" />
                                            <f:ListItem Text="已提交" />
                                            <f:ListItem Text="退审" />
                                        </f:DropDownList>
                                        <f:Button ID="btnSearch" runat="server" Text="查询" Icon="SystemSearch"></f:Button>  
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
                            <Columns>
                                <f:BoundField Width="100px" Hidden="true" ColumnID="ID" SortField="ID" DataField="ID" TextAlign="Center" HeaderText="ID"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="DeptID" SortField="DeptID" DataField="DeptID" TextAlign="Center" HeaderText="填报单位"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="UserID" SortField="UserID" DataField="UserID" TextAlign="Center" HeaderText="填报用户"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="IndexID" SortField="IndexID" DataField="IndexID" TextAlign="Center" HeaderText="填报指标"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="IndexValue" SortField="IndexValue" DataField="IndexValue" TextAlign="Center" HeaderText="指标值"></f:BoundField>
                                <f:BoundField Width="100px" ColumnID="Status" SortField="Status" DataField="Status" TextAlign="Center" HeaderText="状态"></f:BoundField>
                                <f:BoundField Width="250px" ColumnID="Description" SortField="Description" DataField="Description" TextAlign="Center" HeaderText="说明"></f:BoundField>
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
    </form>
</body>
</html>
