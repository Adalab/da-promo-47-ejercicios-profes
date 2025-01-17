# Repaso Git

- Creo repositorio --> New repository
- Clonar un repo --> Copio <> Code --> Me voy a VS, Terminal y git clone + url
- Entrar dentro de la carpeta creada


# ¿Cómo subo a mi repo de Git un archivo que no es un Jupyter?
- En nuestro ordenador, en la carpeta que sea el repo clonado, arrastramos el archivo para meterlo
- Nos vamos a visual, abrimos esa carpeta y en la Terminal hacemos un git status: ahí nos dirá los nuevos archivos que hemos metido
- Si queremos que se guarden en nuestro repo de github, hacemos git add, commit y push.


# Problemas a la hora de hacer pull
- Guardar antes nuestros cambios, si es lo que queremos hacer
- - git checkout -- nombres archivos que tienen modificaciones --> Si no queremos guardar nuestros cambios


# Creación de ramas
- Cuando trabajéis en proyectos reales, a veces tendréis que trabajar en ramas diferentes.
- git branch --> para ver en qué rama estamos. Nosotras en nuestros proyectos siempre trabajaremos en la rama main, la principal.
- git checkout -b nombre_rama --> Para crear nueva rama y pasarnos a ella
- git checktout nombre_rama --> para cambiar de rama
- git push origin nombre_rama --> Para subir los cambios desde esa rama (los cambios solo se muestran si guardamos)
- git checkout main --> me vuelvo a la principal
- git merge nombre_rama --> hago una unión con los cambios de la segunda rama
- si hay algún conflicto, lo resolvemos de forma manual
- git push origin main --> he actualizado los cambios y subo la versión de main

# EJERCICIO

- Crea un repositorio nuevo en GitHub
- Clónalo en tu escritorio
- Entra y crea un archivo jupyter en él. Escribe la funcion:
    def multiplicar_por_dos(numero):
    return numero * 2
- Guarda los cambios y súbelos
- Crea una rama llamada nueva_rama y cámbiate a esa rama
- Haz un cambio en el jupyter y añade esto después de la función
    resultado = multiplicar_por_dos(5)
    print(resultado)
- Guarda cambios y súbelos (recuerda, al hacer push tendrás que hacer origin nueva_rama)
- Cámbiate a la rama principal
- Haz un merge con los cambios de la nueva_rama
- Sube esos cambios (recuerda que ahora el origin es main)
- Sube el repo al drive de clase (Curso intensivo y en el word Ejercicio Git y Dudas)







