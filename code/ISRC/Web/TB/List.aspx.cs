﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISRC.Web.TB
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnAdd.OnClientClick = windowPop.GetShowReference("Add.aspx", "新增报表");
                nbxStartYear.Text = DateTime.Now.Year.ToString();
                nbxEndYear.Text = DateTime.Now.Year.ToString();
            }
        }

        protected void nbxStartYear_TextChanged(object sender, EventArgs e)
        {
            if (nbxStartYear.Text == "")
            {
                nbxStartYear.Text = DateTime.Now.Year.ToString();
            }
        }

        protected void nbxEndYear_TextChanged(object sender, EventArgs e)
        {
            if (nbxEndYear.Text == "")
            {
                nbxEndYear.Text = DateTime.Now.Year.ToString();
            }
        }

    }
}