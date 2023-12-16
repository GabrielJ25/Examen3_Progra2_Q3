using System;
using System.Data.SqlClient;

namespace EncuestaApp
{
    class Program
    {
        static void Main(string[] args)
        {
            // Solicitar información de la encuesta al usuario
            Console.WriteLine("Encuesta Política");
            Console.Write("Nombre: ");
            string nombre = Console.ReadLine();

            Console.Write("Edad: ");
            int edad = int.Parse(Console.ReadLine());

            Console.Write("Correo Electrónico: ");
            string correo = Console.ReadLine();

            Console.Write("Partido Político (PLN, PUSC, PAC): ");
            string partido = Console.ReadLine();

            // Validar la entrada
            if (edad < 18 || edad > 50 || !ValidarCorreoElectronico(correo) || !ValidarPartidoPolitico(partido))
            {
                Console.WriteLine("Entrada no válida. Verifica los datos e intenta nuevamente.");
                return;
            }

            // Conectar a la base de datos (reemplazar con tus propios datos de conexión)
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=EncuestasDB;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Abrir la conexión
                connection.Open();

                // Insertar la encuesta en la base de datos
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Encuestas (Nombre, Edad, CorreoElectronico, PartidoPolitico) VALUES (@Nombre, @Edad, @Correo, @Partido)", connection))
                {
                    cmd.Parameters.AddWithValue("@Nombre", nombre);
                    cmd.Parameters.AddWithValue("@Edad", edad);
                    cmd.Parameters.AddWithValue("@Correo", correo);
                    cmd.Parameters.AddWithValue("@Partido", partido);

                    cmd.ExecuteNonQuery();
                }

                // Cerrar la conexión
                connection.Close();
            }

            Console.WriteLine("Encuesta enviada correctamente. ¡Gracias por participar!");
        }

        // Método para validar el formato del correo electrónico
        static bool ValidarCorreoElectronico(string correo)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(correo);
                return addr.Address == correo;
            }
            catch
            {
                return false;
            }
        }

        // Método para validar el partido político
        static bool ValidarPartidoPolitico(string partido)
        {
            return partido == "PLN" || partido == "PUSC" || partido == "PAC";
        }
    }
}
