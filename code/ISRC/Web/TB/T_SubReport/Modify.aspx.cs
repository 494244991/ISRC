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

namespace ISRC.Web.T_SubReport
{
    public partial class Modify : Page
    {       

        		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
				{
					string ID= Request.Params["id"];
					ShowInfo(ID);
				}
			}
		}
			
	private void ShowInfo(string ID)
	{
		ISRC.BLL.T_SubReport bll=new ISRC.BLL.T_SubReport();
		ISRC.Model.T_SubReport model=bll.GetModel(ID);
		this.lblID.Text=model.ID;
		this.txtReportID.Text=model.ReportID;
		this.txtIndexID.Text=model.IndexID;
		this.txtIndexValue.Text=model.IndexValue;
		this.txtDescription.Text=model.Description;

	}

		public void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txtReportID.Text.Trim().Length==0)
			{
				strErr+="ReportID不能为空！\\n";	
			}
			if(this.txtIndexID.Text.Trim().Length==0)
			{
				strErr+="IndexID不能为空！\\n";	
			}
			if(this.txtIndexValue.Text.Trim().Length==0)
			{
				strErr+="IndexValue不能为空！\\n";	
			}
			if(this.txtDescription.Text.Trim().Length==0)
			{
				strErr+="Description不能为空！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			string ID=this.lblID.Text;
			string ReportID=this.txtReportID.Text;
			string IndexID=this.txtIndexID.Text;
			string IndexValue=this.txtIndexValue.Text;
			string Description=this.txtDescription.Text;


			ISRC.Model.T_SubReport model=new ISRC.Model.T_SubReport();
			model.ID=ID;
			model.ReportID=ReportID;
			model.IndexID=IndexID;
			model.IndexValue=IndexValue;
			model.Description=Description;

			ISRC.BLL.T_SubReport bll=new ISRC.BLL.T_SubReport();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
