
import mysql.connector

## crear la bases de datos

# def crear_db ():
#     """
#     Crear la base de datos tienda_clase
#     """
#     ## 1. Crear la conexion con mysql 
#     ## Ejecutar la query: crear una bases de datos

#     cnx = mysql.connector.connect(
#         host = "localhost", ## 127.0.0.1
#         user = "root",
#         password = "")
#     cursor = cnx.cursor()
#     print ("""Conexión exitosa a la base de datos""")   

#     try: 
#         cursor.execute(queries.crear_bd)
#         cursor.close()
#         print("Base de datos creada exitosamente")
#     except mysql.connector.Error as err:
#         print(f"Error: '{err}'")
#         print("Error al crear la base de datos")
#         print("SQLSTATE: ", err.sqlstate)
#         print ("Error: ", err.msg)
#         cursor.close()
 

# ## crear las tablas

# def crear_tablas_clientes():
#      ## 1. Crear la conexion con mysql 
#     ## Ejecutar la query: crear una bases de datos

#     cnx = mysql.connector.connect(
#         host = "localhost", ## 127.0.0.1
#         user = "root",
#         password = "")
#     cursor = cnx.cursor()
#     print ("""Conexión exitosa a la base de datos""")   

#     try: 
#         cursor.execute(queries.crear_tabla_clientes)
#         cursor.close()
#         print("Base de datos creada exitosamente")
#     except mysql.connector.Error as err:
#         print(f"Error: '{err}'")
#         print("Error al crear la base de datos")
#         print("SQLSTATE: ", err.sqlstate)
#         print ("Error: ", err.msg)
#         cursor.close()
 

## funcion general para ejecutar queries
def ejecutar_query (query):
     ## 1. Crear la conexion con mysql 
    ## Ejecutar la query: crear una bases de datos

    cnx = mysql.connector.connect(
        host = "localhost", ## 127.0.0.1
        user = "root",
        password = "")
    cursor = cnx.cursor()
    print ("""Conexión exitosa a la base de datos""")   

    try: 
        cursor.execute(query)
        cnx.close()
        print("Consulta creada exitosamente")
    except mysql.connector.Error as err:
        print(f"Error: '{err}'")
        print("Error al crear la base de datos")
        print("SQLSTATE: ", err.sqlstate)
        print ("Error: ", err.msg)
        cnx.close()



## insertar en valores en las tablas
def insertar_valores (query ,lista_insertar):
    cnx = mysql.connector.connect(
        host = "localhost", ## 127.0.0.1
        user = "root",
        password = "")
    cursor = cnx.cursor()
    print ("""Conexión exitosa a la base de datos""")   


    try:
        cursor.executemany(query, lista_insertar)
        cnx.commit()
        cnx.close()
    except mysql.connector.Error as err:
        print(f"Error: '{err}'")
        print("Error al crear la base de datos")
        print("SQLSTATE: ", err.sqlstate)
        print ("Error: ", err.msg)
        cnx.close()

