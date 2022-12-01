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
    public partial class project_ngo : Form
    {
        public string ngname;
        public int projectid;

        const string constr = @"Data Source=DESKTOP-7IJDKOJ\SPARTA;Initial Catalog=donationdatabase;Integrated Security=True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public project_ngo()
        {
            InitializeComponent();
        }

        private void project_ngo_Load(object sender, EventArgs e)
        {
            con.Open();
            string sql = "select Project_id,Name from project where NGO in (select Ngoid from NGO where username = @username) ";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@username", ngname);
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();
            da.Fill(d);
            cm.Dispose();
            con.Close();
            comboBox1.DisplayMember = "name";
            comboBox1.ValueMember = "Project_id";
            comboBox1.DataSource = d;

            con.Open();
            string sql1 = "select Project_id,Name from project where project_id=@proj";
            var cm1 = new SqlCommand(sql1, con);
            cm1.Parameters.AddWithValue("@proj", projectid);
            SqlDataAdapter da1 = new SqlDataAdapter(cm1);
            DataTable d1 = new DataTable();
            da1.Fill(d1);
            cm1.Dispose();
            con.Close();
            comboBox1.DisplayMember = "name";
            comboBox1.ValueMember = "Project_id";
            comboBox1.DataSource = d;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Project_details view = new Project_details();
            //this.Hide();
            view.projectid = Convert.ToInt32(comboBox1.SelectedValue);
            view.ngooname = ngname;
            this.Visible = false;
            view.ShowDialog();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ngo_login view = new ngo_login();
            //this.Hide();
            this.Visible = false;
            view.ShowDialog();

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Add_project view = new Add_project();
            //this.Hide();
            view.username2 = ngname;
            this.Visible = false;
            view.ShowDialog();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
             ngo_login view = new ngo_login();
            this.Visible = false;
            view.ShowDialog();

        }
    }
}
