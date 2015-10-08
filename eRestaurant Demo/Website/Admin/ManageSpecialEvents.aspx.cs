using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageSpecialEvents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ProcessException(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            //We can dispaly a message
        }
    }
}