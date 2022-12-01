using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace project_screen
{
    public partial class display_projects : Form
    {
        public string name;
        public string projid;
        public string id;
        public int ngoid;
        public int catid;
        const string constr = @"Data Source=DESKTOP-7IJDKOJ\SPARTA;Initial Catalog=donationdatabase;Integrated Security=True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public display_projects()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Project_Info view = new Project_Info();
            view.nameof = ngoid;
            view.projid = Convert.ToInt32(id);
            view.donor = name;
            this.Visible = false;
            view.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            search view = new search();
            view.user = name;
            
            this.Visible = false;
            view.ShowDialog();
        }

        private void display_projects_Load(object sender, EventArgs e)
        {
            con.Open();
            string sql2 = "select Project_id, Name, Description from Project where NGO=@ngo and Category=@category";
            var cm2 = new SqlCommand(sql2, con);
            cm2.Parameters.AddWithValue("@ngo", ngoid);
            cm2.Parameters.AddWithValue("@category", catid);
            SqlDataAdapter da2 = new SqlDataAdapter(cm2);
            DataTable d2 = new DataTable();
            da2.Fill(d2);
            cm2.Dispose();
            con.Close();
            dataGridView1.DataSource = d2;

           
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox2.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
             id = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();


        }
    }
}
