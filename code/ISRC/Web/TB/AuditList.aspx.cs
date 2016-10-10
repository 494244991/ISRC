using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ISRC.Web.Code;

namespace ISRC.Web.TB
{
    public partial class AuditList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                nbxYear.Text = DateTime.Now.Year.ToString();
            }
        }

        protected void ddlCycle_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = Convert.ToInt16(ddlCycle.SelectedIndex);
            int month = Convert.ToInt16(DateTime.Now.Month);
            PublicMethod.cycleList(ddlCycleList, ddlCycle.SelectedText.ToString().Trim());
            if (index == 0 || index == 4)
            {
                ddlCycleList.Hidden = true;
            }
            else if (index == 1)
            {
                ddlCycleList.SelectedIndex = month - 1;
            }
            else if (index == 2)
            {
                if (month >= 1 && month <= 3)
                {
                    ddlCycleList.SelectedIndex = 0;
                }
                else if (month >= 4 && month <= 6)
                {
                    ddlCycleList.SelectedIndex = 1;
                }
                else if (month >= 7 && month <= 9)
                {
                    ddlCycleList.SelectedIndex = 2;
                }
                else if (month >= 10 && month <= 12)
                {
                    ddlCycleList.SelectedIndex = 3;
                }
            }
            else if (index == 3)
            {
                if (month >= 1 && month <= 6)
                {
                    ddlCycleList.SelectedIndex = 1;
                }
                else if (month >= 7 && month <= 12)
                {
                    ddlCycleList.SelectedIndex = 1;
                }
            }
        }

        protected void nbxYear_TextChanged(object sender, EventArgs e)
        {
            if (nbxYear.Text == "")
            {
                nbxYear.Text = DateTime.Now.Year.ToString();
            }
        }
    }
}