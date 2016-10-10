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
namespace ISRC.Web.T_Report
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
		ISRC.BLL.T_Report bll=new ISRC.BLL.T_Report();
		ISRC.Model.T_Report model=bll.GetModel(ID);
		this.lblID.Text=model.ID;
		this.lblCycle.Text=model.Cycle;
		this.lblYear.Text=model.Year;
		this.lblMonth.Text=model.Month;
		this.lblQuarter.Text=model.Quarter;
		this.lblSemiYear.Text=model.SemiYear;
		this.lblDeptID.Text=model.DeptID;
		this.lblUserID.Text=model.UserID;
		this.lblFillDate.Text=model.FillDate;
		this.lblDescription.Text=model.Description;
		this.lblStatus.Text=model.Status;

	}


    }
}
