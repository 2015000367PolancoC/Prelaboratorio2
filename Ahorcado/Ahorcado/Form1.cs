using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ahorcado
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        public string[] palabras = { "papa", "mama", "casa", "gato", "pelo" };
        public string palabraSecreta = "";
        public int intentosRestantes = 0;
        public int juegoFinal = 0;

        private void button2_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            palabraSecreta = palabras[r.Next(palabras.Length)];
            intentosRestantes = 6;
            label2.Text = "Vidas: " + intentosRestantes;
            textBox5.Enabled = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox5.Text.Length == 1 && char.IsLetter(textBox5.Text[0]))
            {
                char letraIngresada = char.ToLower(textBox5.Text[0]);
                bool letraExiste = palabraSecreta.Contains(letraIngresada);

                if (letraExiste)
                {
                    MessageBox.Show("La letra '" + letraIngresada + "' está en la palabra.");
                    if (palabraSecreta[0] == letraIngresada)
                    {
                        textBox1.Text = letraIngresada.ToString().ToUpper();
                        juegoFinal = juegoFinal + 1;
                    }
                    if (palabraSecreta[1] == letraIngresada)
                    {
                        textBox2.Text = letraIngresada.ToString().ToUpper();
                        juegoFinal = juegoFinal + 1;
                    }
                    if (palabraSecreta[2] == letraIngresada)
                    {
                        textBox3.Text = letraIngresada.ToString().ToUpper();
                        juegoFinal = juegoFinal + 1;
                    }
                    if (palabraSecreta[3] == letraIngresada)
                    {
                        textBox4.Text = letraIngresada.ToString().ToUpper();
                        juegoFinal = juegoFinal + 1;
                    }
                    if (juegoFinal == 4)
                    {
                        MessageBox.Show("¡GANASTE!");
                        textBox1.Enabled = false;
                        textBox1.Text = " ";
                        textBox2.Text = " ";
                        textBox3.Text = " ";
                        textBox4.Text = " ";
                    }
                }
                else
                {
                    MessageBox.Show("La letra '" + letraIngresada + "' no está en la palabra.");
                    intentosRestantes = intentosRestantes - 1;
                    label2.Text = "" + intentosRestantes;
                    if (intentosRestantes == 0)
                    {
                        MessageBox.Show("Has perdido, inicia de nuevo");
                        textBox1.Enabled = false;
                    }
                }
            }
            else
            {
                MessageBox.Show("Ingresa solo una letra válida.");
            }

            textBox5.Clear();
            textBox5.Focus();
        }
    }
}
