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

namespace ISRC.Web.T_DeptIndex
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        		protected void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txtT_DeptIndex.Text.Trim().Length==0)
			{
				strErr+="T_DeptIndex不能为空！\\n";	
			}
			if(this.txtIndexID.Text.Trim().Length==0)
			{
				strErr+="IndexID不能为空！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			string T_DeptIndex=this.txtT_DeptIndex.Text;
			string IndexID=this.txtIndexID.Text;

			ISRC.Model.T_DeptIndex model=new ISRC.Model.T_DeptIndex();
			model.DeptID=T_DeptIndex;
			model.IndexID=IndexID;

			ISRC.BLL.T_DeptIndex bll=new ISRC.BLL.T_DeptIndex();
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
