using System;
using System.Web;
using FineUI;


namespace ISRC.Web
{
    public class PageBase : System.Web.UI.Page
    {
        #region OnInit

        protected override void OnInit(EventArgs e)
        {
            var pm = PageManager.Instance;

            // 如果不是FineUI的AJAX回发（两种情况：1.页面第一个加载 2.页面非AJAX回发）
            if (pm != null && !pm.IsFineUIAjaxPostBack)
            {
                HttpCookie themeCookie = Request.Cookies["Theme_v4"];
                if (themeCookie != null)
                {
                    try
                    {
                        string themeValue = themeCookie.Value;
                        pm.Theme = (Theme)Enum.Parse(typeof(Theme), themeValue, true);
                    }
                    catch (Exception)
                    {
                        pm.Theme = FineUI.Theme.Neptune;
                    }
                }
                HttpCookie langCookie = Request.Cookies["Language_v4"];
                if (langCookie != null)
                {
                    try
                    {
                        string langValue = langCookie.Value;
                        pm.Language = (Language)Enum.Parse(typeof(Language), langValue, true);
                    }
                    catch (Exception)
                    {
                        pm.Language = Language.ZH_CN;
                    }
                }
            }


            base.OnInit(e);
        }

        private bool IsSystemTheme(string themeName)
        {
            themeName = themeName.ToLower();
            string[] themes = Enum.GetNames(typeof(Theme));
            foreach (string theme in themes)
            {
                if (theme.ToLower() == themeName)
                {
                    return true;
                }
            }
            return false;
        }

        #endregion


        #region 压缩ViewState

        //protected override object LoadPageStateFromPersistenceMedium()
        //{
        //    string gzippedState = Request.Form[StringUtil.GZIPPED_VIEWSTATE_ID];
        //    return StringUtil.LoadGzippedViewState(gzippedState);
        //}

        //protected override void SavePageStateToPersistenceMedium(object viewState)
        //{
        //    ClientScript.RegisterHiddenField(StringUtil.GZIPPED_VIEWSTATE_ID, StringUtil.GenerateGzippedViewState(viewState));
        //} 

        #endregion

        #region 实用函数

        /// <summary>
        /// 获取回发的参数
        /// </summary>
        /// <returns></returns>
        public string GetRequestEventArgument()
        {
            return Request.Form["__EVENTARGUMENT"];
        }

        #endregion

    }

}
