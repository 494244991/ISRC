using System;
using System.Data;

namespace ISRC.Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
            if (Session["AccountName"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //检测账户信息是否正确
            BLL.vw_SYS_Account bllAccount_vw = new BLL.vw_SYS_Account();
            string strWhere = "AccountName='" + txbUserName.Text + "' and Password='" + txbPassword.Text + "'";
            DataSet dsAccount = bllAccount_vw.GetList(strWhere);
            if (dsAccount.Tables[0].Rows.Count > 0)
            {
                Session["AccountName"] = txbUserName.Text;
                Session["AccountID"] = dsAccount.Tables[0].Rows[0]["ID"].ToString();
                Session["RoleName"] = dsAccount.Tables[0].Rows[0]["RoleName"].ToString();
                Response.Redirect("~/Default.aspx");
                return;
            }
            else
            {
                Response.Write("<script language=javascript>alert('用户名不存在或密码错误！');location.href='Login.aspx'</script>");
                Response.End();
            }
        }
    }
}