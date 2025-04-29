using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LABORATORIO1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //Muestra el formulario creditos
            Form2 creditos = new Form2();
            creditos.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Verifica si las credenciales son correctas, caso contrario muestra un message box
            //si las credenciales son correctas muestra el formulario datagridview
            if (textBox1.Text == "Oscar" && textBox2.Text == "1234567")
            {
                Form3 datagridview = new Form3();
                datagridview.Show();
            }
            else
            {
                MessageBox.Show("Datos incorrectos");
            }

        }
    }
}
