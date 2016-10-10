using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FineUI;
using ISRC.Web.Code;

namespace ISRC.Web.TB
{
    public partial class AuditModify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnClose.OnClientClick = ActiveWindow.GetHideReference();
                PublicMethod.cycleList(ddlCycleList, ddlCycle.SelectedText.ToString().Trim());
            }
        }

        protected void ddlCycle_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = Convert.ToInt16(ddlCycle.SelectedIndex);
            PublicMethod.cycleList(ddlCycleList, ddlCycle.SelectedText.ToString().Trim());
            if (index == 3)
            {
                ddlCycleList.Hidden = true;
            }
        }
    }
}