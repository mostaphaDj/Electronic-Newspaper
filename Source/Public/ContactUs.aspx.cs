﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.Public
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            DetailsView1.EnableDynamicData(typeof(DataModels.ContactUs));
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}