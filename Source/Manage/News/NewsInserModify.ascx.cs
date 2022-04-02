using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Xml;

namespace ElMestakbal.Manage.News
{
    public partial class NewsInserModify : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Set datasource here…
            if (!IsUserControlPostBack)
            {
                ViewState["IsUserControlPostBack"] = true;
                // التصفية
                // تاريخ الإضافة
                // rgs

                this.RadGrid1.MasterTableView.FilterExpression = "it.InsertDate >= DATETIME '" + DateTime.Now.AddHours(-12).ToString("yyyy-MM-dd HH:mm") + "'";

                // Set current filter function and value on [Date]
                GridColumn insertDate = this.RadGrid1.MasterTableView.GetColumnSafe("InsertDate");
                insertDate.CurrentFilterFunction = GridKnownFunction.GreaterThanOrEqualTo;
                insertDate.CurrentFilterValue = DateTime.Now.AddHours(-18).ToString();

                // تاريخ النشر
                // Set initial filter on [RadGrid]
                // this.RadGrid1.MasterTableView.FilterExpression = (Global.FromDate.HasValue) ? "it.PublishDate >= DATETIME '" + Global.FromDate.Value.ToString("yyyy-MM-dd HH:mm") + "'" : null;

                // Set current filter function and value on [Date]
                GridColumn publishDate = this.RadGrid1.MasterTableView.GetColumnSafe("PublishDate");
                publishDate.CurrentFilterFunction = GridKnownFunction.GreaterThanOrEqualTo;
                // publishDate.CurrentFilterValue = Global.FromDate.ToString();

                // تاريخ انتهاء النشر
                // Set initial filter on [RadGrid]
                // this.RadGrid1.MasterTableView.FilterExpression = (Global.ToDate.HasValue) ? "it.EndPublishDate >= DATETIME '" + Global.ToDate.Value.ToString("yyyy-MM-dd HH:mm") + "'" : null;

                // Set current filter function and value on [Date]
                GridColumn endPublishDate = this.RadGrid1.MasterTableView.GetColumnSafe("EndPublishDate");
                endPublishDate.CurrentFilterFunction = GridKnownFunction.LessThanOrEqualTo;
                // endPublishDate.CurrentFilterValue = Global.ToDate.ToString();
                //--------------------------

                string v = Request.QueryString["Id"];
                if (v != null)
                {
                    int id;
                    bool isNumeric = int.TryParse(v, out id);

                    if (isNumeric)
                        if ((id >= 0) && (id <= int.MaxValue))
                        {
                            DetailsView1.ChangeMode(DetailsViewMode.Edit);
                            EntityDataSource1.Where = (isNumeric) ? "it.Id == " + id : "itk.Id == -1";
                            EntityDataSource1.DataBind();
                        }
                }
            }
        }

        protected bool IsUserControlPostBack
        {
            get
            {
                return this.ViewState["IsUserControlPostBack"] != null;
            }
        }

        public System.Web.UI.WebControls.DetailsViewMode DefaultMode
        {
            get
            {
                return this.DetailsView1.DefaultMode;
            }
            set
            {
                this.DetailsView1.DefaultMode = value;
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            DetailsView1.EnableDynamicData(typeof(DataModels.News));
        }

        protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if ((e.CommandName == "Cancel") && (DetailsView1.CurrentMode == DetailsViewMode.Insert) && (Session["NewDirectoryName"] != null))
            {
                System.IO.Directory.Delete(Global.ResourcesNewsPath + (string)Session["NewDirectoryName"], true);
                Session["NewDirectoryName"] = null;
            }
            else if (e.CommandName == "Edit")
            {
                EntityDataSource1.Where = (RadGrid1.SelectedValue != null) ? "it.Id == " + RadGrid1.SelectedValue.ToString() : "it.Id == -1";
                EntityDataSource1.DataBind();
            }
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            XmlDocument XmlDoc = new XmlDocument();
            XmlDoc.Load(Server.MapPath("~/App_Data/Config.xml"));
            XmlNode xmlNode = XmlDoc.SelectSingleNode("/config/OldDirectory/Name");

            xmlNode.InnerText = "";
            xmlNode.ParentNode.ReplaceChild(xmlNode, xmlNode);
            XmlDoc.Save(Server.MapPath("~/App_Data/Config.xml"));

            RadGrid1.Rebind();
            if (RadGrid1.MasterTableView.Items.Count > 0)
                RadGrid1.MasterTableView.Items[RadGrid1.MasterTableView.Items.Count - 1].Selected = true;
            EntityDataSource1.Where = (RadGrid1.SelectedValue != null) ? "it.Id == " + RadGrid1.SelectedValue.ToString() : "it.Id == -1";
            EntityDataSource1.DataBind();
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            RadGrid1.Rebind();
        }

        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (Session["NewDirectoryName"] != null)
            {
                System.IO.Directory.Delete(Global.ResourcesNewsPath + (string)Session["NewDirectoryName"], true);
                Session["NewDirectoryName"] = null;
            }
            RadGrid1.Rebind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DetailsView1.ChangeMode(DetailsViewMode.Insert);
        }

        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            if (!IsPostBack)
            {
                //التصفية
                //  تاريخ الإضافة
                // Set initial filter on [RadGrid]
                this.RadGrid1.MasterTableView.FilterExpression = "it.InsertDate >= DATETIME '" + DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") + "'";

                // Set current filter function and value on [Date]
                GridColumn insertDate = this.RadGrid1.MasterTableView.GetColumnSafe("InsertDate");
                insertDate.CurrentFilterFunction = GridKnownFunction.GreaterThanOrEqualTo;
                insertDate.CurrentFilterValue = DateTime.Today.ToString();

                //  تاريخ النشر
                // Set initial filter on [RadGrid]
                this.RadGrid1.MasterTableView.FilterExpression = "it.PublishDate >= DATETIME '" + DateTime.Today.AddDays(-1).ToString("yyyy/MM/dd HH:mm:ss") + "'";

                // Set current filter function and value on [Date]
                GridColumn publishDate = this.RadGrid1.MasterTableView.GetColumnSafe("PublishDate");
                publishDate.CurrentFilterFunction = GridKnownFunction.GreaterThanOrEqualTo;
                publishDate.CurrentFilterValue = DateTime.Today.AddDays(-1).ToString();

                //  تاريخ انتهاء النشر
                // Set initial filter on [RadGrid]
                this.RadGrid1.MasterTableView.FilterExpression = (Global.ToDate.HasValue) ? "it.EndPublishDate >= DATETIME '" + Global.ToDate.Value.ToString("yyyy/MM/dd HH:mm:ss") + "'" : null;

                // Set current filter function and value on [Date]
                GridColumn endPublishDate = this.RadGrid1.MasterTableView.GetColumnSafe("EndPublishDate");
                endPublishDate.CurrentFilterFunction = GridKnownFunction.LessThanOrEqualTo;
                endPublishDate.CurrentFilterValue = Global.ToDate.ToString();
                //--------------------------
            }
        }

        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
            EntityDataSource1.Where = (RadGrid1.SelectedValue != null) ? "it.Id == " + RadGrid1.SelectedValue.ToString() : "it.Id == -1";
            EntityDataSource1.DataBind();
        }

        protected void RadGrid1_RowDrop(object sender, GridDragDropEventArgs e)
        {
            if (string.IsNullOrEmpty(e.HtmlElement))
            {
                if (e.DraggedItems[0].OwnerGridID == RadGrid1.ClientID)
                {
                    // items are drag from pending to shipped grid 
                    if (e.DestDataItem != null && e.DestDataItem.OwnerGridID == RadGrid1.ClientID)
                    {
                        using (DataModels.NewsDBEntities newsDBEntities = new DataModels.NewsDBEntities())
                        {
                            DataModels.News news;
                            int x;
                            if (e.DropPosition == GridItemDropPosition.Below)
                                x = 1;
                            else
                                x = 0;

                            foreach (GridDataItem DraggedItem in e.DraggedItems)
                            {
                                //Get the specific employee from Database
                                int DraggedItemId = (int)DraggedItem.GetDataKeyValue("Id");
                                news = (from e1 in newsDBEntities.News
                                        where e1.Id == DraggedItemId
                                        select e1).First();

                                // اذا تم تغيير مكان الخبر
                                if ((DraggedItem["PlaceId"].Text != e.DestDataItem["PlaceId"].Text) && (!string.IsNullOrEmpty(e.DestDataItem["PlaceId"].Text)))
                                {
                                    news.PlaceId = int.Parse(e.DestDataItem["PlaceId"].Text);
                                    if (e.DestDataItem["PlaceId"].Text != "1")// Radgrid يضع بدل null سبايس
                                    {
                                        news.GroupId = 1;
                                    }
                                }

                                // اذا تم تغيير الصنف
                                if ((DraggedItem["GroupId"].Text != e.DestDataItem["GroupId"].Text) && (!string.IsNullOrEmpty(e.DestDataItem["GroupId"].Text)))
                                {
                                    news.GroupId = int.Parse(e.DestDataItem["GroupId"].Text);
                                }

                                // الترتيب
                                news.OrderInGroup = int.Parse(e.DestDataItem["OrderInGroup"].Text) + x;

                                x++;
                            }

                            //------------ زيادة في ترتيب جميع الحقول الاحقة
                            string group;
                            if (e.DestDataItem["PlaceId"].Text == "1")
                                group = "GroupId";// اذا كان داخل في المكان الرئيسي يتم الترتيب في المجموعات
                            else
                                group = "PlaceId";// اذا لم يكن في المكان الرئيسي ترتيب حسب المكان

                            int index = e.DestDataItem.ItemIndex;// index في الجدول
                            int orderInGroup = int.Parse(e.DestDataItem["OrderInGroup"].Text) + 1;// الترتيب في المجموعة

                            while ((index <= RadGrid1.Items.Count - 1) && (RadGrid1.Items[index][group].Text == e.DestDataItem[group].Text))
                            {
                                if (e.DraggedItems.IndexOf(RadGrid1.Items[index]) != -1)
                                {
                                    index++;
                                    continue;
                                }
                                int NextItemId = (int)RadGrid1.Items[index].GetDataKeyValue("Id");
                                DataModels.News news2 = (from e1 in newsDBEntities.News
                                                         where e1.Id == NextItemId
                                                         select e1).First();

                                news2.OrderInGroup = orderInGroup;

                                index++;// index في الجدول
                                orderInGroup++;// الترتيب في المجموعة
                            }

                            //Save to database
                            newsDBEntities.SaveChanges();
                        }
                    }
                    RadGrid1.Rebind();

                    for (int i = 0; i < e.DraggedItems.Count; i++)
                    {
                        if (e.DropPosition == GridItemDropPosition.Above)
                        {
                            RadGrid1.Items[e.DestDataItem.ItemIndex + i].Selected = true;
                        }
                        else
                        {
                            RadGrid1.Items[e.DestDataItem.ItemIndex - e.DraggedItems.Count + i + 1].Selected = true;
                        }
                    }
                    //foreach (GridDataItem DraggedItem in e.DraggedItems)
                    //{
                    //    DraggedItem.Selected = true;
                    //}
                }
            }
        }
    }
}