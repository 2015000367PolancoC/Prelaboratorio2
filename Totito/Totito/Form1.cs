using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Totito
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        int juego;
        Button[] button;
        private void Inhabilitarcajas()
        {
            button1.Enabled = false;
            button2.Enabled = false;
            button3.Enabled = false;
            button4.Enabled = false;
            button5.Enabled = false;
            button6.Enabled = false;
            button7.Enabled = false;
            button8.Enabled = false;
            button9.Enabled = false;

        }
        private void Habilitarcajas()
        {
            button1.Enabled = true;
            button2.Enabled = true;
            button3.Enabled = true;
            button4.Enabled = true;
            button5.Enabled = true;
            button6.Enabled = true;
            button7.Enabled = true;
            button8.Enabled = true;
            button9.Enabled = true;
        }
        private void Verificarganador()
        {
            if (button1.Text != "" && button1.Text == button2.Text && button2.Text == button3.Text)
            {
                MessageBox.Show("El ganador es " + button1.Text);
                Inhabilitarcajas();
            }
            else if (button4.Text != "" && button4.Text == button5.Text && button5.Text == button6.Text)
            {
                MessageBox.Show("El ganador es " + button4.Text);
                Inhabilitarcajas();
            }
            else if (button7.Text != "" && button7.Text == button8.Text && button8.Text == button9.Text)
            { 
            MessageBox.Show("El ganador es  " + button7.Text);
                Inhabilitarcajas();
            }
            else if (button1.Text != "" && button1.Text == button4.Text && button4.Text == button7.Text)
            {   
                MessageBox.Show("El ganador es " + button1.Text);
                Inhabilitarcajas();
            }
            else if (button2.Text != "" && button2.Text == button5.Text && button5.Text == button8.Text)
              {  
                MessageBox.Show("El ganador es " + button2.Text);
                Inhabilitarcajas();
            }
            else if (button3.Text != "" && button3.Text == button6.Text && button6.Text == button9.Text)
            {  
                MessageBox.Show("El ganador es " + button3.Text);
                Inhabilitarcajas();
            }
            else if (button1.Text != "" && button1.Text == button5.Text && button5.Text == button9.Text)
            { 
                MessageBox.Show("El ganador es " + button1.Text);
                Inhabilitarcajas();
            }
            else if (button3.Text != "" && button3.Text == button5.Text && button5.Text == button7.Text)
            {  
                MessageBox.Show("El ganador es " + button3.Text);
                Inhabilitarcajas();
            }
            else if (TodosOcupados())
                MessageBox.Show("Empate");
        }
        private bool TodosOcupados()
        {
            return button1.Text != "" && button2.Text != "" && button3.Text != "" && button4.Text != "" && button5.Text != "" && button6.Text != "" && button7.Text != "" && button8.Text != "" && button9.Text != "";
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            Inhabilitarcajas();
            button = new Button[] { button1, button2, button3, button4, button5, button6, button7, button8, button9};
        }

        private void button10_Click(object sender, EventArgs e)
        {

            MessageBox.Show("Inicio de juego turno de: X");
            juego = 1;
            Habilitarcajas();
            button1.Text = null;
            button2.Text = null;
            button3.Text = null;
            button4.Text = null;
            button5.Text = null;
            button6.Text = null;
            button7.Text = null;
            button8.Text = null;
            button9.Text = null;
        }

        private void button_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;
            if (juego == 1)
            {
                button.Text = "X";
                juego = 0;
            }
            else
            {
                button.Text = "O";
                juego = 1;
            }
            button.Enabled = false;
            Verificarganador();
        }
    }
}