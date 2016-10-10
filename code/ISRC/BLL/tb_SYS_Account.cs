﻿/**  版本信息模板在安装目录下，可自行修改。
* tb_SYS_Account.cs
*
* 功 能： N/A
* 类 名： tb_SYS_Account
*
* Ver    变更日期             负责人  变更内容
* ───────────────────────────────────
* V0.01  2016/1/17 15:38:33   N/A    初版
*
* Copyright (c) 2012 Maticsoft Corporation. All rights reserved.
*┌──────────────────────────────────┐
*│　此技术信息为本公司机密信息，未经本公司书面同意禁止向第三方披露．　│
*│　版权所有：动软卓越（北京）科技有限公司　　　　　　　　　　　　　　│
*└──────────────────────────────────┘
*/
using System;
using System.Data;
using System.Collections.Generic;
using Maticsoft.Common;
using ISRC.Model;
namespace ISRC.BLL
{
	/// <summary>
	/// tb_SYS_Account
	/// </summary>
	public partial class tb_SYS_Account
	{
		private readonly ISRC.DAL.tb_SYS_Account dal=new ISRC.DAL.tb_SYS_Account();
		public tb_SYS_Account()
		{}
		#region  BasicMethod
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(string ID)
		{
			return dal.Exists(ID);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(ISRC.Model.tb_SYS_Account model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(ISRC.Model.tb_SYS_Account model)
		{
			return dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(string ID)
		{
			
			return dal.Delete(ID);
		}
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool DeleteList(string IDlist )
		{
			return dal.DeleteList(Maticsoft.Common.PageValidate.SafeLongFilter(IDlist,0) );
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public ISRC.Model.tb_SYS_Account GetModel(string ID)
		{
			
			return dal.GetModel(ID);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中
		/// </summary>
		public ISRC.Model.tb_SYS_Account GetModelByCache(string ID)
		{
			
			string CacheKey = "tb_SYS_AccountModel-" + ID;
			object objModel = Maticsoft.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(ID);
					if (objModel != null)
					{
						int ModelCache = Maticsoft.Common.ConfigHelper.GetConfigInt("ModelCache");
						Maticsoft.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (ISRC.Model.tb_SYS_Account)objModel;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<ISRC.Model.tb_SYS_Account> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<ISRC.Model.tb_SYS_Account> DataTableToList(DataTable dt)
		{
			List<ISRC.Model.tb_SYS_Account> modelList = new List<ISRC.Model.tb_SYS_Account>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				ISRC.Model.tb_SYS_Account model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = dal.DataRowToModel(dt.Rows[n]);
					if (model != null)
					{
						modelList.Add(model);
					}
				}
			}
			return modelList;
		}

        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPage(string sqlWhere, string order, int pageSize, int pageIndex, out long totalRecord)
        {
            return dal.GetListByPage(sqlWhere, order, pageSize, pageIndex, out totalRecord);
        }

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

