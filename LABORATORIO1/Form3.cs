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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }
        //Se limpian todas las cajas de texto, se almacena en una funcion
        private void limpiar()
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();
            textBox9.Clear();
            textBox10.Clear();
            textBox11.Clear();
        }
        private int n;

        private void button1_Click(object sender, EventArgs e)
        {
            //Se añaden los datos de las cajas de texto al CRUD
            dataGridView1.Rows.Add(textBox1.Text, textBox2.Text, textBox3.Text, 
                textBox4.Text, textBox5.Text, textBox6.Text, textBox7.Text, textBox8.Text,
                textBox9.Text, textBox10.Text, textBox11.Text);
            limpiar();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //Se actualizan los datos de las filas del CRUD
            n = dataGridView1.CurrentCell.RowIndex;
            DataGridViewRow newdata = dataGridView1.Rows[n];
            newdata.Cells[0].Value = textBox1.Text;
            newdata.Cells[1].Value = textBox2.Text;
            newdata.Cells[2].Value = textBox3.Text;
            newdata.Cells[3].Value = textBox4.Text;
            newdata.Cells[4].Value = textBox5.Text;
            newdata.Cells[5].Value = textBox6.Text;
            newdata.Cells[6].Value = textBox7.Text;
            newdata.Cells[7].Value = textBox8.Text;
            newdata.Cells[8].Value = textBox9.Text;
            newdata.Cells[9].Value = textBox10.Text;
            newdata.Cells[10].Value = textBox11.Text;
            limpiar();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //Elimina la fila de la celda seleccionada
            n = dataGridView1.CurrentCell.RowIndex;
            dataGridView1.Rows.RemoveAt(n);
            limpiar();
        }

        
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //Coloca los valores de las celdas en las cajas de texto
            n = dataGridView1.CurrentCell.RowIndex;
            DataGridViewRow data = dataGridView1.Rows[n];
            textBox1.Text = data.Cells[0].Value.ToString();
            textBox2.Text = data.Cells[1].Value.ToString();
            textBox3.Text = data.Cells[2].Value.ToString();
            textBox4.Text = data.Cells[3].Value.ToString();
            textBox5.Text = data.Cells[4].Value.ToString();
            textBox6.Text = data.Cells[5].Value.ToString();
            textBox7.Text = data.Cells[6].Value.ToString();
            textBox8.Text = data.Cells[7].Value.ToString();
            textBox9.Text = data.Cells[8].Value.ToString();
            textBox10.Text = data.Cells[9].Value.ToString();
            textBox11.Text = data.Cells[10].Value.ToString();
        }
    }
}
