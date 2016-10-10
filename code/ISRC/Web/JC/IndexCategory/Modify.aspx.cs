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

namespace ISRC.Web.T_IndexCategory
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
		ISRC.BLL.T_IndexCategory bll=new ISRC.BLL.T_IndexCategory();
		ISRC.Model.T_IndexCategory model=bll.GetModel(ID);
		this.lblID.Text=model.ID;
		this.txtName.Text=model.Name;
		this.txtFatherID.Text=model.FatherID;

	}

		public void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txtName.Text.Trim().Length==0)
			{
				strErr+="Name不能为空！\\n";	
			}
			if(this.txtFatherID.Text.Trim().Length==0)
			{
				strErr+="FatherID不能为空！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			string ID=this.lblID.Text;
			string Name=this.txtName.Text;
			string FatherID=this.txtFatherID.Text;


			ISRC.Model.T_IndexCategory model=new ISRC.Model.T_IndexCategory();
			model.ID=ID;
			model.Name=Name;
			model.FatherID=FatherID;

			ISRC.BLL.T_IndexCategory bll=new ISRC.BLL.T_IndexCategory();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
