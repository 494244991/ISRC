using FineUI;
using ISRC.Web.CX.jsonModel;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;

namespace ISRC.Web.CX
{
    public partial class IndexList : System.Web.UI.Page
    {
        /// <summary>
        /// 供前台使用
        /// </summary>
        protected string jsonStr = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                BindDDLIndex();
                BindDDLYear();
            }
        }

        /// <summary>
        /// 指标下拉框数据绑定
        /// </summary>
        protected void BindDDLIndex() { 
        
        }

        /// <summary>
        /// 起始年份、结束年份下拉框数据绑定
        /// 2012年至当前时间的年份
        /// </summary>
        protected void BindDDLYear()
        {
            
        }

        /// <summary>
        /// 指标类型选择
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void reportType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //选择的是月报表
            if (ddlReportType.SelectedValue == "1")
            {
                startYear.Hidden = false;
                startMonth.Hidden = false;
                startQuarter.Hidden = true;
                startHalfYear.Hidden = true;

                endYear.Hidden = false;
                endMonth.Hidden = false;
                endQuarter.Hidden = true;
                endHalfYear.Hidden = true;
            }

            //选择的是季度报表
            if (ddlReportType.SelectedValue == "2")
            {
                startYear.Hidden = false;
                startMonth.Hidden = true;
                startQuarter.Hidden = false;
                startHalfYear.Hidden = true;

                endYear.Hidden = false;
                endMonth.Hidden = true;
                endQuarter.Hidden = false;
                endHalfYear.Hidden = true;
            }

            //选择的是半年度报表
            if (ddlReportType.SelectedValue == "3")
            {
                startYear.Hidden = false;
                startMonth.Hidden = true;
                startQuarter.Hidden = true;
                startHalfYear.Hidden = false;

                endYear.Hidden = false;
                endMonth.Hidden = true;
                endQuarter.Hidden = true;
                endHalfYear.Hidden = false;
            }

            //选择的是年报表
            if (ddlReportType.SelectedValue == "4")
            {
                startYear.Hidden = false;
                startMonth.Hidden = true;
                startQuarter.Hidden = true;
                startHalfYear.Hidden = true;

                endYear.Hidden = false;
                endMonth.Hidden = true;
                endQuarter.Hidden = true;
                endHalfYear.Hidden = true;
            }


            //无选择
            if (ddlReportType.SelectedValue == "-1")
            {
                startYear.Hidden = true;
                startMonth.Hidden = true;
                startQuarter.Hidden = true;
                startHalfYear.Hidden = true;

                endYear.Hidden = true;
                endMonth.Hidden = true;
                endQuarter.Hidden = true;
                endHalfYear.Hidden = true;
            }

        }
        
        /// <summary>
        /// 查询数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void queryBtn_Click(object sender, EventArgs e)
        {
            if (!checkForm()) return;

            DataTable dt = new DataTable();
            //创建列
            DataColumn dtc = new DataColumn("Time", typeof(string));
            dt.Columns.Add(dtc);

            dtc = new DataColumn("IndexName", typeof(string));
            dt.Columns.Add(dtc);

            dtc = new DataColumn("IndexValue", typeof(string));
            dt.Columns.Add(dtc);

            //创建行
            DataRow row1 = dt.NewRow();
            row1["Time"] = "2016年1月";
            row1["IndexName"] = "财政科技投入金额（亿元）";
            row1["IndexValue"] = 30;

            DataRow row2 = dt.NewRow();
            row2["Time"] = "2016年2月";
            row2["IndexName"] = "财政科技投入金额（亿元）";
            row2["IndexValue"] = 40;

            DataRow row3 = dt.NewRow();
            row3["Time"] = "2016年3月";
            row3["IndexName"] = "财政科技投入金额（亿元）";
            row3["IndexValue"] = 25;

            DataRow row4 = dt.NewRow();
            row4["Time"] = "2016年4月";
            row4["IndexName"] = "财政科技投入金额（亿元）";
            row4["IndexValue"] = 42;

            DataRow row5 = dt.NewRow();
            row5["Time"] = "2016年5月";
            row5["IndexName"] = "财政科技投入金额（亿元）";
            row5["IndexValue"] = 18;

            DataRow row6 = dt.NewRow();
            row6["Time"] = "2016年6月";
            row6["IndexName"] = "财政科技投入金额（亿元）";
            row6["IndexValue"] = 37;

            dt.Rows.InsertAt(row1, 0);
            dt.Rows.InsertAt(row2, 1);
            dt.Rows.InsertAt(row3, 2);
            dt.Rows.InsertAt(row4, 3);
            dt.Rows.InsertAt(row5, 4);
            dt.Rows.InsertAt(row6, 5);

            IndexJson jsonModel = new IndexJson();
            ArrayList indexNameArr = new ArrayList();
            indexNameArr.Add(dt.Rows[0]["IndexName"].ToString());
            jsonModel.IndexNameArr = indexNameArr;

            SortedList<string, ArrayList> data = new SortedList<string, ArrayList>();

            foreach (DataRow row in dt.Rows)
            {
                ArrayList multiIndexValueArr = new ArrayList();
                multiIndexValueArr.Add(row["IndexValue"].ToString());
                data.Add(row["Time"].ToString(), multiIndexValueArr);
            }

            jsonModel.Data = data;
            jsonStr = JsonConvert.SerializeObject(jsonModel);
        }

        /// <summary>
        /// 表单校验
        /// </summary>
        /// <returns></returns>
        protected bool checkForm()
        {
            if (ddlIndex.SelectedValue == "-1")
            {
                Alert.ShowInTop("请选择一项指标");
                return false;
            }
            if (ddlReportType.SelectedValue == "-1")
            {
                Alert.ShowInTop("请选择报表类型");
                return false;
            }

            if (int.Parse(startYear.SelectedValue) > int.Parse(endYear.SelectedValue))
            {
                Alert.ShowInTop("起始时间不能大于结束时间");
                return false;
            }


            if (int.Parse(startYear.SelectedValue) == int.Parse(endYear.SelectedValue))
            {
                if (ddlReportType.SelectedValue == "1" &&
                    int.Parse(startMonth.SelectedValue) > int.Parse(endMonth.SelectedValue))
                {
                    Alert.ShowInTop("起始时间不能大于结束时间");
                    return false;
                }
                if (ddlReportType.SelectedValue == "2" &&
                     int.Parse(startQuarter.SelectedValue) > int.Parse(endQuarter.SelectedValue))
                {
                    Alert.ShowInTop("起始时间不能大于结束时间");
                    return false;
                }
                if (ddlReportType.SelectedValue == "3" &&
                    int.Parse(startHalfYear.SelectedValue) > int.Parse(endHalfYear.SelectedValue))
                {
                    Alert.ShowInTop("起始时间不能大于结束时间");
                    return false;
                }
            }

            return true;
        }

        /// <summary>
        /// 查询条件
        /// </summary>
        /// <returns></returns>
        protected string getQueryCondition() {

            return "";
        }

    }
}