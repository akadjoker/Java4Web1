import os
import subprocess
import requests
from PyQt5.QtCore import QTimer
from PyQt5.QtWidgets import QApplication, QMainWindow, QLabel, QPushButton, QVBoxLayout, QWidget, QLineEdit
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

manager_user = "tomcat"
manager_password = "1478"
tomcat_path = "/home/djoker/code/cinel/apache-tomcat-10.1.8"



class JSPProjectBuilder(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("JSP Project Builder")
        self.setGeometry(300, 300, 300, 200)

        self.project_name = ""
        self.project_path = ""
        self.current_dir = ""

        self.label_name = QLabel("Nome do projeto:")
        self.textbox_name = QLineEdit()
        
        self.button_create = QPushButton("Criar Projeto")
        self.button_create.clicked.connect(self.create_project)
        self.button_build = QPushButton("Build")
        self.button_build.clicked.connect(self.build_project)
        self.button_update = QPushButton("Update")
        self.button_update.clicked.connect(self.update_project)
        self.button_restart = QPushButton("Reiniciar Tomcat")
        self.button_restart.clicked.connect(self.restart_tomcat)
        self.button_stop = QPushButton("Parar Tomcat")
        self.button_stop.clicked.connect(self.stop_tomcat)

        layout = QVBoxLayout()
        layout.addWidget(self.label_name)
        layout.addWidget(self.textbox_name)
        layout.addWidget(self.button_create)
        layout.addWidget(self.button_build)
        layout.addWidget(self.button_update)
        layout.addWidget(self.button_restart)
        layout.addWidget(self.button_stop)

        self.event_handler = FileSystemEventHandler()
        self.event_handler.on_any_event = self.handle_file_event
        self.observer = Observer()



        widget = QWidget()
        widget.setLayout(layout)
        self.setCentralWidget(widget)

    def create_project(self):
        self.project_name = self.textbox_name.text()
        self.project_path = os.path.abspath(self.project_name)
        if self.project_name:
                if os.path.exists(self.project_path):
                     self.label_name.setText(f"Projeto {self.project_name} defenido com sucesso.")
                else:
                    create_jsp_project(self.project_name)
                    self.project_path = os.path.abspath(self.project_name)
                    self.label_name.setText(f"Projeto {self.project_name} criado com sucesso.")
                self.start_file_monitoring()
        else:
            self.label_name.setText("Por favor, digite um nome para o projeto.")

    def build_project(self):
        if self.project_path:
            war_file = self.project_name+".war"
            current_dir = os.getcwd()
            os.chdir(f"{self.project_path}/WEB-INF/")
            command = f"jar -cvf {current_dir}/{war_file} ./*.*"
            result = subprocess.run(command, shell=True, capture_output=True, text=True)
            if result.returncode == 0:
                print(f"Arquivo {war_file} criado com sucesso.")
            else:
                print(f"Erro ao criar o arquivo {war_file}.")
            os.chdir(current_dir)
            if os.path.exists(f"{current_dir}/{war_file}"):
                move_command = f"mv  {current_dir}/{war_file} ~/code/cinel/apache-tomcat-10.1.8/webapps/"
                move_result = subprocess.run(move_command, shell=True, capture_output=True, text=True)
                if move_result.returncode == 0:
                    print(f"Arquivo {war_file} movido para webjapps com sucesso.")
                    self.update_project()
        
        

    def update_project(self):
        if self.project_path:
            tomcat_host = 'localhost'
            tomcat_port = 8080
            app_name = self.project_name
            url = f'http://{tomcat_host}:{tomcat_port}/manager/text/reload?path=/{app_name}'
            session = requests.Session()
            session.auth = (manager_user, manager_password)
            response = session.get(url)
            if response.status_code == 200:
                print(f"Aplicativo {app_name} recarregado com sucesso.")
            else:
                print(f"Erro ao recarregar o aplicativo {app_name}.")
                print(f"Código de status: {response.status_code}")
                self.stop_file_monitoring()

          

    def restart_tomcat(self):

        command = f"{tomcat_path}/bin/shutdown.sh"
        subprocess.run(command, shell=True)
        command = f"{tomcat_path}/bin/startup.sh"
        subprocess.run(command, shell=True)
        print("Tomcat reiniciado com sucesso.")
  

    def stop_tomcat(self):
        command = f"{tomcat_path}/bin/shutdown.sh"
        subprocess.run(command, shell=True)
        self.stop_file_monitoring()
        print("Tomcat parado com sucesso.")

    def start_file_monitoring(self):
        self.observer.schedule(self.event_handler, self.project_path, recursive=True)
        self.observer.start()
        print(f"Monitoramento iniciado para a pasta {self.project_path}")

    def stop_file_monitoring(self):
        self.observer.stop()
        self.observer.join()

    def handle_file_event(self, event):
        if event.event_type == "modified":
            print(f"Arquivo modificado: {event.src_path}")
            self.build_project()
       

    def closeEvent(self, event):
        self.stop_file_monitoring()




def create_jsp_project(project_name):
    os.makedirs(os.path.join(project_name, "WEB-INF"))
    os.makedirs(os.path.join(project_name, "WEB-INF", "classes"))
    os.makedirs(os.path.join(project_name, "WEB-INF", "lib"))

    web_xml_content = """<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
         http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
         version="3.1">
    <display-name>{}</display-name>
</web-app>
""".format(project_name)

    index_content = """
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Jave Web</title>
</head>
<body>

<%

out.print("Hello World");
%>

</body>
</html>
""".format(project_name)

    with open(os.path.join(project_name, "WEB-INF",  "web.xml"), "w") as web_xml_file:
        web_xml_file.write(web_xml_content)

    with open(os.path.join(project_name, "WEB-INF",  "index.jsp"), "w") as jsp_file:
        jsp_file.write(index_content)


if __name__ == "__main__":
    app = QApplication([])
    window = JSPProjectBuilder()
    window.show()
    app.exec_()
