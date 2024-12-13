import os.path

from google.auth.transport.requests import Request
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
import os
from googleapiclient.http import MediaFileUpload

# If modifying these scopes, delete the file token.json.
SCOPES = ["https://www.googleapis.com/auth/drive"]

creds = None
# The file token.json stores the user's access and refresh tokens, and is
# created automatically when the authorization flow completes for the first
# time.
flow = InstalledAppFlow.from_client_secrets_file("credentials.json", SCOPES)
creds = flow.run_local_server(port=0)

service = build("drive", "v3", credentials=creds)


def uploadFiles(id_directory, name_directory, files, path):
    for file in files:
        
        file_metadata = {"name": file, "parents": [id_directory]}
        media = MediaFileUpload(path+'/'+name_directory+'/'+file, mimetype="video/webm")
        service.files().create(body=file_metadata, media_body=media).execute()

def listar_arquivos_e_diretorios(caminho):
    evidencias = []

    files = []
    folder_id = "1zPEV3jwmdjiIXlyQwT77lQ_ZXHDX-z2Y"

    for root, dirs, files in os.walk(caminho):
        if files:
            evidencias.append(
                {
                    "diretorio": os.path.basename(root),  # Nome da pasta atual
                    "files": files,  # Lista de arquivos dentro do diretório
                }
            )
        # print(f"Diretório: {root}")
        # print("Subdiretórios:", dirs)
        # print("Arquivos:", files)
        # print("-" * 100)
    for evidencia in evidencias[1:]:
        file_metadata = {
            "name": evidencia["diretorio"],
            "mimeType": "application/vnd.google-apps.folder",
            "parents": [folder_id],
        }

        directory = service.files().create(body=file_metadata, fields="id").execute()
        uploadFiles(directory.get("id"), evidencia["diretorio"], evidencia["files"], caminho)


# Substitua pelo caminho desejado
caminho_inicial = "../../results"
listar_arquivos_e_diretorios(caminho_inicial)
