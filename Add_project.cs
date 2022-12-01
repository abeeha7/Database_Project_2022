using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Drawing;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using System.Security.Cryptography;
using System.Xml.Linq;

namespace project_screen
{
    public partial class Add_project : Form
    {
        public string username2;
        const string constr = @"Data Source=DESKTOP-7IJDKOJ\SPARTA;Initial Catalog=donationdatabase;Integrated Security=True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public Add_project()
        {
            InitializeComponent();
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void dateTimePicker2_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Add_Projects();
            string text = "Your Project has been added";
            DialogResult d = MessageBox.Show(text);
            if (d == DialogResult.OK || d == DialogResult.Cancel)
            {
                project_ngo view = new project_ngo();
                view.ngname = username2;
                this.Visible = false;
                view.ShowDialog();
            }
        }

        private void Add_project_Load(object sender, EventArgs e)
        {
            con.Open();
            string sql = "select Employee_id,name from Employee";
            cm = new SqlCommand(sql, con);
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();
            da.Fill(d);
            cm.Dispose();
            //con.Close();
            comboBox1.DisplayMember = "name";
            comboBox1.ValueMember = "name";
            comboBox1.DataSource = d;

            //con.Open();
            string sql1 = "select Branch_ID from Branch_of_NGO where NGO in (select ngoid from NGO where username = @username)";
            var cm1 = new SqlCommand(sql1, con);
            cm1.Parameters.Add(new SqlParameter("@username", Convert.ToString(username2)));
            SqlDataAdapter da1 = new SqlDataAdapter(cm1);
            DataTable d1 = new DataTable();
            da1.Fill(d1);
            cm.Dispose();
            //con.Close();
            comboBox2.DisplayMember = "Branch_ID";
            comboBox2.ValueMember = "Branch_ID";
            comboBox2.DataSource = d1;

            //con.Open();
            string sql2 = "select category_ID, category_name from category";
            var cm2 = new SqlCommand(sql2, con);
            SqlDataAdapter da2 = new SqlDataAdapter(cm2);
            DataTable d2 = new DataTable();
            da2.Fill(d2);
            cm.Dispose();
            //con.Close();
            comboBox3.DisplayMember = "Category_name";
            comboBox3.ValueMember = "Category_name";
            comboBox3.DataSource = d2;

            //con.Open();
            string sql3 = "select ID,name from City";
            var cm3 = new SqlCommand(sql3, con);
            SqlDataAdapter da3 = new SqlDataAdapter(cm3);
            DataTable d3 = new DataTable();
            da3.Fill(d3);
            cm.Dispose();
            con.Close();
            comboBox4.DisplayMember = "name";
            comboBox4.ValueMember = "name";
            comboBox4.DataSource = d3;

           

        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public void Add_Projects()
        {
            con.Open();
            System.Diagnostics.Debug.WriteLine("inside Add Projects");
            //Console.WriteLine("inside Add projects");
            string sql = "Insert into project (Name, NGO, Start_Date, End_Date, Amount_Collected, Goal, Lead_Id, Branch_Id, Category, Area, Description) values(@name, (select Ngoid from NGO where username =@username),@start,Null,0,@goal,(select Employee_id from Employee where Name = @lead),@branch,(select Category_Id from category where Category_Name = @category),(select Id from Areas_In_Need where City in (select ID from City where Name = @city) and Province = @province),@desc)";
            //string sql = "Insert into Project (Name,NGO,Start_Date,End_Date,Amount_Collected,Goal,Lead_Id,Branch_Id,Category,Area,Description) values ('TEST',(select Ngoid from NGO where username = 'Chhippa1020@gmail.com'),'29/11/2022',Null,0,560000,(select Employee_Id from Employee where Name='Mishal'),2074,(select Category_Id from category where Category_Name='Flood Donation'),(select Id from Areas_In_Need where City in (select ID from City where Name='Karachi') and Province='Sindh'),'This project aims to save lives ');";
            //string sql = " Insert into project (Name, NGO, Start_Date, End_Date, Amount_Collected, Goal, Lead_Id, Branch_Id, Category, Area, Description) values(@name, (select Ngoid from NGO where username = @username),@start,'Null',0,@goal,(select Employee_id from Employee where Name = @lead),@branch,(select Category_Id from category where Category_Name = @category),(select Id from Areas_In_Need where City in (select ID from City where Name = @city) and Province = @province),@desc)";
            System.Diagnostics.Debug.WriteLine(sql);
            System.Diagnostics.Debug.WriteLine(comboBox1.SelectedValue);
            System.Diagnostics.Debug.WriteLine(comboBox1.SelectedItem.ToString());
            System.Diagnostics.Debug.WriteLine(comboBox1.SelectedText.ToString());
            SqlCommand command = new SqlCommand(sql, con);
            command.Parameters.AddWithValue("@name", textBox2.Text);
            command.Parameters.AddWithValue("@start", Convert.ToString(dateTimePicker1.Value));
            command.Parameters.AddWithValue("@goal", Convert.ToInt32(textBox1.Text));
            command.Parameters.AddWithValue("@lead", (comboBox1.SelectedValue));
            //command.Parameters.AddWithValue("@lead", comboBox1.SelectedText.ToString());

            command.Parameters.AddWithValue("@category", comboBox3.SelectedValue);
            command.Parameters.AddWithValue("@city", comboBox4.SelectedValue);
            command.Parameters.AddWithValue("@province", comboBox5.SelectedItem.ToString());
            command.Parameters.AddWithValue("@desc", textBox3.Text);
            command.Parameters.AddWithValue("@branch", comboBox2.SelectedValue);
            command.Parameters.AddWithValue("@username", Convert.ToString(username2));
            command.ExecuteNonQuery();
            con.Close();
        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }
    }
}

