using System.Data;
using System.Data.SqlClient;

namespace project_screen
{
    public partial class userlogin : Form
    {

        const string constr = @"Data Source=DESKTOP-7IJDKOJ\SPARTA;Initial Catalog=donationdatabase;Integrated Security=True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public userlogin()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Create_account view = new Create_account();
            //this.Hide();
            this.Visible = false;
            view.ShowDialog();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "select username,password from Donor where username=@username and password=@password";
            SqlCommand command = new SqlCommand(sql, con);
            command.Parameters.Add(new SqlParameter("@username", Convert.ToString(textBox1.Text)));
            command.Parameters.Add(new SqlParameter("@password", Convert.ToString(textBox2.Text)));
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                search view = new search();
                //this.Hide();
                view.user = Convert.ToString(textBox1.Text);
                this.Visible = false;
                view.ShowDialog();
            }
            else
            {
                MessageBox.Show("Wrong Username or Password. Please try again!");
            }
            con.Close();

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click_1(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click_2(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void userlogin_Load(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

            //this.Hide();
            startscreen view = new startscreen();
            this.Visible = false;
            view.ShowDialog();

        }
    }
}