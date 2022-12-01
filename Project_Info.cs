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
    public partial class Project_Info : Form
    {
        public int nameof;
        public int projid;
        public string donor;

        const string constr = @"Data Source=DESKTOP-7IJDKOJ\SPARTA;Initial Catalog=donationdatabase;Integrated Security=True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public Project_Info()
        {
            InitializeComponent();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Donation_form view = new Donation_form();
            this.Visible = false;
            view.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            display_projects view= new display_projects();
            this.Visible = false;
            view.ShowDialog();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void Project_Info_Load(object sender, EventArgs e)
        {
            con.Open();


            string sql = "select NGO_Name from NGO where Ngoid= @ngo";
            var cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@ngo",nameof);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                textBox1.Text = sdr["NGO_Name"].ToString();
            }
            cm.Dispose();
            con.Close();

            con.Open();


            string sql2 = "select Name from Project where Project_id= @proj";
            var cm2= new SqlCommand(sql2, con);
            cm2.Parameters.AddWithValue("@proj", projid);
            SqlDataReader sdr2 = cm2.ExecuteReader();
            while (sdr2.Read())
            {
                textBox2.Text = sdr2["Name"].ToString();
            }
            cm2.Dispose();
            con.Close();

            con.Open();


            string sql3 = "select Name from Employee where NGO in (select Ngoid from NGO where Ngoid=@ngo)";
            var cm3 = new SqlCommand(sql3, con);
            cm3.Parameters.AddWithValue("@ngo", nameof);
            SqlDataReader sdr3 = cm3.ExecuteReader();
            while (sdr3.Read())
            {
                textBox3.Text = sdr3["Name"].ToString();
            }
            cm3.Dispose();
            con.Close();

            con.Open();
            string sql4 = "select Province from Areas_In_Need where ID in (select Area from Project where Project_id=@projj)";
            var cm4 = new SqlCommand(sql4, con);
            cm4.Parameters.AddWithValue("@projj", projid);
            SqlDataReader sdr4 = cm4.ExecuteReader();
            while (sdr4.Read())
            {
                textBox4.Text = sdr4["Province"].ToString();
            }
            cm4.Dispose();
            con.Close();

            con.Open();
            string sql5 = "select Username from NGO where Ngoid in (select Ngoid from NGO where Ngoid=@name)";
            var cm5 = new SqlCommand(sql5, con);
            cm5.Parameters.AddWithValue("@name", nameof);
            SqlDataReader sdr5 = cm5.ExecuteReader();
            while (sdr5.Read())
            {
                textBox5.Text = sdr5["Username"].ToString();
            }
            cm5.Dispose();
            con.Close();

            con.Open();
            string sql6 = "select Contact_Number from NGO where Ngoid in (select Ngoid from NGO where Ngoid=@name)";
            var cm6 = new SqlCommand(sql6, con);
            cm6.Parameters.AddWithValue("@name", nameof);
            SqlDataReader sdr6 = cm6.ExecuteReader();
            while (sdr6.Read())
            {
                textBox6.Text = sdr6["Contact_Number"].ToString();
            }
            cm6.Dispose();
            con.Close();

            con.Open();
            string sql7 = "select Description from Project where Project_id=@proj";
            var cm7 = new SqlCommand(sql7, con);
            cm7.Parameters.AddWithValue("@proj", projid);
            SqlDataReader sdr7 = cm7.ExecuteReader();
            while (sdr7.Read())
            {
                textBox7.Text = sdr7["Description"].ToString();
            }
            cm7.Dispose();
            con.Close();


        }

        private void label7_Click_1(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Donation_form view = new Donation_form();
            view.idofproj = projid;
            view.ngonames = nameof;
            view.donorname = donor;
            this.Visible = false;
            view.ShowDialog();
        }
    }
}
