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
namespace ISRC.Web.T_Dept
{
    public partial class Show : Page
    {        
        		public string strid=""; 
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
				{
					strid = Request.Params["id"];
					string ID= strid;
					ShowInfo(ID);
				}
			}
		}
		
	private void ShowInfo(string ID)
	{
		ISRC.BLL.T_Dept bll=new ISRC.BLL.T_Dept();
		ISRC.Model.T_Dept model=bll.GetModel(ID);
		this.lblID.Text=model.ID;
		this.lblName.Text=model.Name;
		this.lblQuality.Text=model.Quality;
		this.lblRegionID.Text=model.RegionID;
		this.lblContactor.Text=model.Contactor;
		this.lblTel.Text=model.Tel;
		this.lblOderID.Text=model.OderID;

	}


    }
}
