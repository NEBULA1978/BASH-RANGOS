# import openai  # pip install openai
# import typer  # pip install "typer[all]"
# from rich import print  # pip install rich
# from rich.table import Table

# """
# Webs de interés:
# - Módulo OpenAI: https://github.com/openai/openai-python
# - Documentación API ChatGPT: https://platform.openai.com/docs/api-reference/chat
# - Typer: https://typer.tiangolo.com
# - Rich: https://rich.readthedocs.io/en/stable/
# """


# def main():

#     # Configuración de la API de OpenAI
#     openai.api_key = "TU_API_KEY creada en https://platform.openai.com"

#     # Mensaje de bienvenida
#     print("💬 [bold green]ChatGPT API en Python[/bold green]")

#     # Tabla de comandos
#     table = Table("Comando", "Descripción")
#     table.add_row("exit", "Salir de la aplicación")
#     table.add_row("new", "Crear una nueva conversación")

#     print(table)

#     # Contexto del asistente
#     context = {"role": "system",
#                "content": "Eres un asistente muy útil."}

#     # Historial de mensajes de la conversación
#     messages = [context]

#     while True:

#         # Obtener el mensaje del usuario
#         content = __prompt()

#         if content == "new":
#             # Si se solicita una nueva conversación, se limpia el historial de mensajes
#             print("🆕 Nueva conversación creada")
#             messages = [context]
#             content = __prompt()

#         # Se agrega el mensaje del usuario al historial
#         messages.append({"role": "user", "content": content})

#         # Se envía la solicitud a la API de OpenAI para obtener la respuesta del asistente
#         response = openai.ChatCompletion.create(
#             model="gpt-3.5-turbo", messages=messages)

#         # Se obtiene el contenido de la respuesta
#         response_content = response.choices[0].message.content

#         # Se agrega la respuesta del asistente al historial
#         messages.append({"role": "assistant", "content": response_content})

#         # Se muestra la respuesta del asistente en la consola
#         print(f"[bold green]> [/bold green] [green]{response_content}[/green]")


# def __prompt() -> str:
#     # Función privada para solicitar el mensaje del usuario
#     prompt = typer.prompt("\n¿Sobre qué quieres hablar? ")

#     if prompt == "exit":
#         # Si el usuario quiere salir, se confirma
#         exit = typer.confirm("✋ ¿Estás seguro?")
#         if exit:
#             # Si se confirma la salida, se muestra un mensaje de despedida y se interrumpe la ejecución
#             print("👋 ¡Hasta luego!")
#             raise typer.Abort()

#         # Si no se confirma la salida, se solicita de nuevo el mensaje del usuario
#         return __prompt()

#     return prompt


# if __name__ == "__main__":
#     # Se inicia la aplicación usando el módulo Typer
#     typer.run(main)

# El código proporcionado implementa una interfaz de consola para interactuar con la API de OpenAI y su modelo ChatGPT. El usuario puede enviar mensajes al asistente virtual y recibir respuestas generadas por el modelo de lenguaje. La aplicación se ejecuta en un bucle infinito hasta que el usuario decide salir. Además, se implementan comandos adicionales para crear una nueva conversación y para salir de la aplicación. El código utiliza la librería Typer para gestionar la entrada del usuario por consola y la librería Rich para dar formato a la salida en la consola. También se proporcionan comentarios en el código para entender su funcionamiento y referencias a la documentación de las librerías y la API de OpenAI utilizadas.
