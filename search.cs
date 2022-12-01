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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace project_screen
{
    public partial class search : Form
    {
        public string user;
        public string projid;

        const string constr = @"Data Source=DESKTOP-7IJDKOJ\SPARTA;Initial Catalog=donationdatabase;Integrated Security=True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public search()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            display_projects view = new display_projects();
            view.ngoid = Convert.ToInt32(comboBox1.SelectedValue);
            view.catid = Convert.ToInt32(comboBox2.SelectedValue);
            view.name = user;
            //this.Hide();
            this.Visible = false;
            view.ShowDialog();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {
                    }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            userlogin view = new userlogin();
            //this.Hide();
            this.Visible = false;
            view.ShowDialog();
        }

        private void search_Load(object sender, EventArgs e)
        {
            con.Open();
            string sql2 = "select category_ID, category_name from category";
            var cm2 = new SqlCommand(sql2, con);
            SqlDataAdapter da2 = new SqlDataAdapter(cm2);
            DataTable d2 = new DataTable();
            da2.Fill(d2);
            cm2.Dispose();
            con.Close();
            comboBox2.DisplayMember = "Category_name";
            comboBox2.ValueMember = "Category_ID";
            comboBox2.DataSource = d2;

            con.Open();
            string sql = "select Ngoid, NGO_Name from NGO";
            var cm = new SqlCommand(sql, con);
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();
            da.Fill(d);
            cm.Dispose();
            con.Close();
            comboBox1.DisplayMember = "NGO_Name";
            comboBox1.ValueMember = "Ngoid";
            comboBox1.DataSource = d;

            con.Open();
            string sql3 = "select Project_id,Name,(select  sum(Donation_Given) from Donor_History where Project=Project_id and User_id in(select Userid from Donor where UserName=@username ) ) as 'Donation'from Project where Project_id in (select Project from Donor_History as D where D.User_id in (select userid from Donor where UserName=@username))";
            var cm3 = new SqlCommand(sql3, con);
            cm3.Parameters.AddWithValue("@username", user);
            SqlDataAdapter da3 = new SqlDataAdapter(cm3);
            DataTable d3 = new DataTable();
            da3.Fill(d3);
            cm3.Dispose();
            con.Close();
            
            dataGridView1.DataSource = d3;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            projid = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
        }
        public void delete_donor()
        {
            con.Open();
            string sql1 = "delete FROM [Donor_History] where project in (select project_id from Project where Name=@Project_id) and User_id in (select userid from Donor where Username=@User_id)";
            SqlCommand command = new SqlCommand(sql1, con);
            System.Diagnostics.Debug.WriteLine(projid);
            command.Parameters.AddWithValue("@User_id",user );
            command.Parameters.AddWithValue("@Project_id", projid);
            command.ExecuteNonQuery();
            con.Close();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            delete_donor();
            showitems();
            string text = "Your Donation has been deleted!";
            DialogResult d = MessageBox.Show(text);
        }
        public void showitems()
        {
            con.Open();
            string sql3 = "select Project_id,Name,(select  sum(Donation_Given) from Donor_History where Project=Project_id and User_id in(select Userid from Donor where UserName=@username ) ) as 'Donation' from Project where Project_id in (select Project from Donor_History as D where D.User_id in (select userid from Donor where UserName=@username))";
            //string sql3 = "select Project_id,Name from Project where Project_id in (select Project from Donor_History where User_id in (select userid from Donor where UserName=@username))";
            var cm3 = new SqlCommand(sql3, con);
            cm3.Parameters.AddWithValue("@username", user);
            SqlDataAdapter da3 = new SqlDataAdapter(cm3);
            DataTable d3 = new DataTable();
            da3.Fill(d3);
            cm3.Dispose();
            con.Close();

            dataGridView1.DataSource = d3;
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }
    }
}
