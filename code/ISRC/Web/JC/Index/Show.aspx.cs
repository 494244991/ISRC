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
namespace ISRC.Web.T_Index
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
		ISRC.BLL.T_Index bll=new ISRC.BLL.T_Index();
		ISRC.Model.T_Index model=bll.GetModel(ID);
		this.lblID.Text=model.ID;
		this.lblName.Text=model.Name;
		this.lblDescription.Text=model.Description;
		this.lblOderID.Text=model.OderID;

	}


    }
}
