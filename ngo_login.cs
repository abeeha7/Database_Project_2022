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
    public partial class ngo_login : Form
    {

        const string constr = @"Data Source=DESKTOP-7IJDKOJ\SPARTA;Initial Catalog=donationdatabase;Integrated Security=True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public ngo_login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "select username,password from NGO where username=@username and password=@password";
            SqlCommand command = new SqlCommand(sql, con);
            command.Parameters.Add(new SqlParameter("@username", Convert.ToString(textBox1.Text)));
            command.Parameters.Add(new SqlParameter("@password", Convert.ToString(textBox2.Text)));
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                project_ngo view = new project_ngo();
                //this.Hide();
                view.ngname = Convert.ToString(textBox1.Text);
                 this.Visible = false;
                  view.ShowDialog();
            }
            else
            {
                MessageBox.Show("Wrong Username or Password. Please try again!");
            }
            con.Close();
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Create_account view = new Create_account();
            //this.Hide();
            this.Visible = false;
            view.ShowDialog();
        }

        private void ngo_login_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            startscreen view = new startscreen();
            this.Visible = false;
            view.ShowDialog();
        }
    }
}
