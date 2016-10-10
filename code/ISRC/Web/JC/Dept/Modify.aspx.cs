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

namespace ISRC.Web.T_Dept
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
		ISRC.BLL.T_Dept bll=new ISRC.BLL.T_Dept();
		ISRC.Model.T_Dept model=bll.GetModel(ID);
		this.lblID.Text=model.ID;
		this.txtName.Text=model.Name;
		this.txtQuality.Text=model.Quality;
		this.txtRegionID.Text=model.RegionID;
		this.txtContactor.Text=model.Contactor;
		this.txtTel.Text=model.Tel;
		this.txtOderID.Text=model.OderID;

	}

		public void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txtName.Text.Trim().Length==0)
			{
				strErr+="Name不能为空！\\n";	
			}
			if(this.txtQuality.Text.Trim().Length==0)
			{
				strErr+="Quality不能为空！\\n";	
			}
			if(this.txtRegionID.Text.Trim().Length==0)
			{
				strErr+="RegionID不能为空！\\n";	
			}
			if(this.txtContactor.Text.Trim().Length==0)
			{
				strErr+="Contactor不能为空！\\n";	
			}
			if(this.txtTel.Text.Trim().Length==0)
			{
				strErr+="Tel不能为空！\\n";	
			}
			if(this.txtOderID.Text.Trim().Length==0)
			{
				strErr+="OderID不能为空！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			string ID=this.lblID.Text;
			string Name=this.txtName.Text;
			string Quality=this.txtQuality.Text;
			string RegionID=this.txtRegionID.Text;
			string Contactor=this.txtContactor.Text;
			string Tel=this.txtTel.Text;
			string OderID=this.txtOderID.Text;


			ISRC.Model.T_Dept model=new ISRC.Model.T_Dept();
			model.ID=ID;
			model.Name=Name;
			model.Quality=Quality;
			model.RegionID=RegionID;
			model.Contactor=Contactor;
			model.Tel=Tel;
			model.OderID=OderID;

			ISRC.BLL.T_Dept bll=new ISRC.BLL.T_Dept();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
