using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using Maticsoft.Common;

namespace ISRC.Web.T_Report
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        		protected void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txtID.Text.Trim().Length==0)
			{
				strErr+="ID不能为空！\\n";	
			}
			if(this.txtCycle.Text.Trim().Length==0)
			{
				strErr+="Cycle不能为空！\\n";	
			}
			if(this.txtYear.Text.Trim().Length==0)
			{
				strErr+="Year不能为空！\\n";	
			}
			if(this.txtMonth.Text.Trim().Length==0)
			{
				strErr+="Month不能为空！\\n";	
			}
			if(this.txtQuarter.Text.Trim().Length==0)
			{
				strErr+="Quarter不能为空！\\n";	
			}
			if(this.txtSemiYear.Text.Trim().Length==0)
			{
				strErr+="SemiYear不能为空！\\n";	
			}
			if(this.txtDeptID.Text.Trim().Length==0)
			{
				strErr+="DeptID不能为空！\\n";	
			}
			if(this.txtUserID.Text.Trim().Length==0)
			{
				strErr+="UserID不能为空！\\n";	
			}
			if(this.txtFillDate.Text.Trim().Length==0)
			{
				strErr+="FillDate不能为空！\\n";	
			}
			if(this.txtDescription.Text.Trim().Length==0)
			{
				strErr+="Description不能为空！\\n";	
			}
			if(this.txtStatus.Text.Trim().Length==0)
			{
				strErr+="Status不能为空！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			string ID=this.txtID.Text;
			string Cycle=this.txtCycle.Text;
			string Year=this.txtYear.Text;
			string Month=this.txtMonth.Text;
			string Quarter=this.txtQuarter.Text;
			string SemiYear=this.txtSemiYear.Text;
			string DeptID=this.txtDeptID.Text;
			string UserID=this.txtUserID.Text;
			string FillDate=this.txtFillDate.Text;
			string Description=this.txtDescription.Text;
			string Status=this.txtStatus.Text;

			ISRC.Model.T_Report model=new ISRC.Model.T_Report();
			model.ID=ID;
			model.Cycle=Cycle;
			model.Year=Year;
			model.Month=Month;
			model.Quarter=Quarter;
			model.SemiYear=SemiYear;
			model.DeptID=DeptID;
			model.UserID=UserID;
			model.FillDate=FillDate;
			model.Description=Description;
			model.Status=Status;

			ISRC.BLL.T_Report bll=new ISRC.BLL.T_Report();
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
