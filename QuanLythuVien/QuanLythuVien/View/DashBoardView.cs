using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLythuVien.View.Usercontrol;




namespace QuanLythuVien.View
{
    public partial class DashBoardView : Form
    {
        public DashBoardView()
        {
            InitializeComponent();
        }
        private void addUsercontroll( UserControl userControl) {
            userControl.Dock = DockStyle.Fill;
            panel_Dashboard.Controls.Clear();
            panel_Dashboard.Controls.Add(userControl);
            userControl.BringToFront();
        
        }

        private void btn_authorsDbView_Click(object sender, EventArgs e)
        {
            UC_Authors uC_Authors = new UC_Authors();
            addUsercontroll(uC_Authors);
        }

        private void btn_memberDbView_Click(object sender, EventArgs e)
        {
            UC_Member uC_member = new UC_Member();
            addUsercontroll(uC_member);
        }

        private void btn_bookDsview_Click(object sender, EventArgs e)
        {
            UC_book uC_Book = new UC_book();
            addUsercontroll(uC_Book);
        }

        private void btn_circulationDbView_Click(object sender, EventArgs e)
        {
            UC_circulation uC_Circulation = new UC_circulation();
            addUsercontroll(uC_Circulation);
        }

        private void btn_callcardDbView_Click(object sender, EventArgs e)
        {
            UC_callcard uC_Callcard = new UC_callcard();
            addUsercontroll(uC_Callcard);
        }

        private void btn_reportDbview_Click(object sender, EventArgs e)
        {
            UC_Report uC_Report = new UC_Report();
            addUsercontroll(uC_Report);
        }
    }
}
