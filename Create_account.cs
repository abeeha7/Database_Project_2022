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
    public partial class Create_account : Form
    {
        public string donorr;
        const string constr = @"Data Source=DESKTOP-7IJDKOJ\SPARTA;Initial Catalog=donationdatabase;Integrated Security=True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public Create_account()
        {
            InitializeComponent();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            createaccount();
            string text = "Congratulations!!! Your Account has been created.";
            DialogResult d= MessageBox.Show(text);
            if (d==DialogResult.OK || d==DialogResult.Cancel)
            {
                search view = new search();
                view.user = donorr;
                this.Visible = false;
                view.ShowDialog();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //search view = new search();
            //this.Visible = false;
            //view.ShowDialog();
        }

        private void Create_account_Load(object sender, EventArgs e)
        {

        }
        public void createaccount()
        {
            con.Open();
            string sql = "Insert into Donor (UserName,Password,PhoneNumber,EmailAddress,Province,City) values (@username,@password,@phoneno,@email,@province,(select Id from City where Name=@city))";
            SqlCommand command = new SqlCommand(sql, con);
            command.Parameters.Add(new SqlParameter("@username", Convert.ToString(textBox1.Text)));
            donorr = Convert.ToString(textBox1.Text);
            command.Parameters.Add(new SqlParameter("@password", Convert.ToString(textBox4.Text)));
            command.Parameters.Add(new SqlParameter("@phoneno", Convert.ToString(textBox2.Text)));
            command.Parameters.Add(new SqlParameter("@email", Convert.ToString(textBox3.Text)));
            command.Parameters.Add(new SqlParameter("@city", Convert.ToString(textBox5.Text)));
            command.Parameters.Add(new SqlParameter("@province", Convert.ToString(textBox6.Text)));
            command.ExecuteNonQuery();
            con.Close();



        }

        private void label5_Click(object sender, EventArgs e)
        {

        }
    }
}
