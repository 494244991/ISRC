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
			string ID=this.txtID.Text;
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
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
