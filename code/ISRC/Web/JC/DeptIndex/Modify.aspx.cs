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
    public partial class Modify : Page
    {       

        		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				string T_DeptIndex = "";
				if (Request.Params["id0"] != null && Request.Params["id0"].Trim() != "")
				{
					T_DeptIndex= Request.Params["id0"];
				}
				string IndexID = "";
				if (Request.Params["id1"] != null && Request.Params["id1"].Trim() != "")
				{
					IndexID= Request.Params["id1"];
				}
				#warning 代码生成提示：显示页面,请检查确认该语句是否正确
				ShowInfo(T_DeptIndex,IndexID);
			}
		}
			
	private void ShowInfo(string DeptID,string IndexID)
	{
		ISRC.BLL.T_DeptIndex bll=new ISRC.BLL.T_DeptIndex();
		ISRC.Model.T_DeptIndex model=bll.GetModel(DeptID, IndexID);
		this.lblT_DeptIndex.Text=model.DeptID;
		this.lblIndexID.Text=model.IndexID;

	}

		public void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			string DeptID = this.lblT_DeptIndex.Text;
			string IndexID=this.lblIndexID.Text;


			ISRC.Model.T_DeptIndex model=new ISRC.Model.T_DeptIndex();
			model.DeptID= DeptID;
			model.IndexID=IndexID;

			ISRC.BLL.T_DeptIndex bll=new ISRC.BLL.T_DeptIndex();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
