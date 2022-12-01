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
    public partial class Donation_form : Form
    {
        public int idofproj;
        public int ngonames;
        public string donorname;
        const string constr = @"Data Source=DESKTOP-7IJDKOJ\SPARTA;Initial Catalog=donationdatabase;Integrated Security=True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public Donation_form()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            update_amount();
            update_donor();
            string text1 = " Thank You for Donating!!!";
           DialogResult d= MessageBox.Show(text1);
            if (d==DialogResult.OK || d == DialogResult.Cancel)
            {
                this.Close();

            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Project_Info view = new Project_Info();
            this.Visible = false;
            view.ShowDialog();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            foreach(Form form in Application.OpenForms)
{

                form.Close();

            }
        }

        private void Donation_form_Load(object sender, EventArgs e)
        {

        }
        public  void update_amount()
        {

            con.Open();
            string sql1 = "update project set Amount_Collected = (select Amount_Collected from project where Project_id= @project_id) + @Donation where Project_id = @project_id;";
            // check sql query 
            SqlCommand command = new SqlCommand(sql1, con);
            command.Parameters.AddWithValue("@project_id", idofproj);
            command.Parameters.AddWithValue("@Donation", Convert.ToInt32(textBox1.Text));
            command.ExecuteNonQuery();
            con.Close();
        }
        public void update_donor()
        {
            con.Open();
            string sql2 = "Insert into Donor_History(User_id, NGO , Date_of_Donation, Donation_Given, Project) values((select Userid from Donor where UserName=@name), @ngo, (Cast(GETDATE() as varchar)), @amount, @proj)";
            SqlCommand command = new SqlCommand(sql2, con);
            command.Parameters.AddWithValue("@proj", idofproj);
            command.Parameters.AddWithValue("@amount", Convert.ToInt32(textBox1.Text));
            command.Parameters.AddWithValue("@ngo", ngonames);
            command.Parameters.AddWithValue("@name", donorname);
            command.ExecuteNonQuery();

            con.Close();
        }
    }
}
