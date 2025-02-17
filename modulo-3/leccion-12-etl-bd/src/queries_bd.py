crear_bd = "create database if not exists tienda_clase;"

crear_tabla_clientes = """
            use tienda_clase;
            CREATE TABLE IF NOT EXISTS `clientes` (
            `idclientes` INT NOT NULL AUTO_INCREMENT,
            `first_name` VARCHAR(45) NULL,
            `last_name` VARCHAR(45) NULL,
            `email` VARCHAR(45) NULL,
            `gender` VARCHAR(45) NULL,
            `city` VARCHAR(45) NULL,
            `country` VARCHAR(45) NULL,
            `address` VARCHAR(45) NULL,
            PRIMARY KEY (`idclientes`));"""


crear_tabla_ventas = """
        use tienda_clase;
        CREATE TABLE IF NOT EXISTS `ventas` (
        `idventas` INT NOT NULL AUTO_INCREMENT,
        `fecha_venta` VARCHAR(45) NULL,
        `cantidad` VARCHAR(45) NULL,
        `total` VARCHAR(45) NULL,
        `id_cliente` INT NOT NULL,
        PRIMARY KEY (`idventas`),
        CONSTRAINT `fk_ventas_clientes`
            FOREIGN KEY (`id_cliente`)
            REFERENCES `mydb`.`clientes` (`idclientes`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION)
"""


query_insertar_clientes = """
INSERT INTO `tienda_clase`.`clientes` (`first_name`, `last_name`, `email`, `gender`, `city`, `country`, `address`)  VALUES (%s, %s, %s, %s, %s, %s, %s);
""" 


