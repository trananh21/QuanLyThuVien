using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QuanLythuVien.View.Usercontrol
{
    public partial class UC_book : UserControl
    {
        public UC_book()
        {
            InitializeComponent();
            showdata();
        }

        private String cn = @"Data Source=VICTORE\\SQLEXPRESS;Initial Catalog=QLTV;Integrated Security=True";

        void showdata()
        {
            try
            {
                SqlConnection connection = new SqlConnection(cn);
                connection.Open();
                string query = "select * from Sach";

                SqlCommand sqlCommand = new SqlCommand(query, connection);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);

                dtgv_bookUC_View.DataSource = dataTable;

                connection.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show("fix: " + e.Message);
            }

        }

        
    }
}
