using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace project_screen
{
    public partial class startscreen : Form
    {

        const string constr = @"Data Source=DESKTOP-7IJDKOJ\\SPARTA;Initial Catalog=donationdatabase;Integrated Security=True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public startscreen()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            userlogin view = new userlogin();
            this.Visible = false;
            view.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ngo_login view = new ngo_login();
            //this.Hide();
            this.Visible = false;
            view.ShowDialog();
        }

        private void startscreen_Load(object sender, EventArgs e)
        {

        }
    }
}
