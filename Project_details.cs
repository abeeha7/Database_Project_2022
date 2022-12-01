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
    public partial class Project_details : Form
    {
        public int projectid;
        public string ngooname;

        const string constr = @"Data Source=DESKTOP-7IJDKOJ\SPARTA;Initial Catalog=donationdatabase;Integrated Security=True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public Project_details()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            project_ngo view = new project_ngo();
            //this.Hide();
            view.projectid = projectid;
            view.ngname= ngooname;
            this.Visible = false;
            view.ShowDialog();
        }

        private void Project_details_Load(object sender, EventArgs e)
        {
            con.Open();


            string sql = "select Name from Project where Project_Id= @proj";
            var cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@proj", projectid);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                textBox2.Text = sdr["Name"].ToString();
            }
            cm.Dispose();
            con.Close();

            con.Open();


            string sql1 = "select Start_Date from Project where Project_Id= @proj";
            var cm1 = new SqlCommand(sql1, con);
            cm1.Parameters.AddWithValue("@proj", projectid);
            SqlDataReader sdr1 = cm1.ExecuteReader();
            while (sdr1.Read())
            {
                textBox1.Text = sdr1["Start_Date"].ToString();
            }
            cm.Dispose();
            con.Close();

            con.Open();


            string sql2 = "select End_Date from Project where Project_Id= @proj";
            var cm2 = new SqlCommand(sql2, con);
            cm2.Parameters.AddWithValue("@proj", projectid);
            SqlDataReader sdr2 = cm2.ExecuteReader();
            while (sdr2.Read())
            {
                textBox3.Text = sdr2["End_Date"].ToString();
            }
            cm.Dispose();
            con.Close();

            con.Open();


            string sql3 = "select Amount_Collected from Project where Project_Id= @proj";
            var cm3 = new SqlCommand(sql3, con);
            cm3.Parameters.AddWithValue("@proj", projectid);
            SqlDataReader sdr3 = cm3.ExecuteReader();
            while (sdr3.Read())
            {
                textBox4.Text = sdr3["Amount_Collected"].ToString();
            }
            cm.Dispose();
            con.Close();

            con.Open();


            string sql4 = "select Name from Employee where employee_id in (select lead_id from project where project_id=@proj)";
            var cm4 = new SqlCommand(sql4, con);
            cm4.Parameters.AddWithValue("@proj", projectid);
            SqlDataReader sdr4 = cm4.ExecuteReader();
            while (sdr4.Read())
            {
                textBox5.Text = sdr4["Name"].ToString();
            }
            cm.Dispose();
            con.Close();

            con.Open();


            string sql5 = "select Branch_id from Project where Project_Id= @proj";
            var cm5 = new SqlCommand(sql5, con);
            cm5.Parameters.AddWithValue("@proj", projectid);
            SqlDataReader sdr5= cm5.ExecuteReader();
            while (sdr5.Read())
            {
                textBox6.Text = sdr5["Branch_id"].ToString();
            }
            cm.Dispose();
            con.Close();

            con.Open();


            string sql7 = "select Category_Name from Category where Category_id in (select category from project where project_id=@proj)";
            var cm7 = new SqlCommand(sql7, con);
            cm7.Parameters.AddWithValue("@proj", projectid);
            SqlDataReader sdr7 = cm7.ExecuteReader();
            while (sdr7.Read())
            {
                textBox7.Text = sdr7["Category_Name"].ToString();
            }
            cm.Dispose();
            con.Close();

            con.Open();


            string sql8 = "select Area from Project where Project_Id= @proj";
            var cm8 = new SqlCommand(sql8, con);
            cm8.Parameters.AddWithValue("@proj", projectid);
            SqlDataReader sdr8 = cm8.ExecuteReader();
            while (sdr8.Read())
            {
                textBox8.Text = sdr8["Area"].ToString();
            }
            cm.Dispose();
            con.Close();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }
        
    }
}
