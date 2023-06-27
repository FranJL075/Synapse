use synapse;
CREATE TABLE `Rol` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;articulousuario


-- -----------------------------------------------------
-- Table `synapse`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE `Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) NOT NULL,
  `tipo de documento` VARCHAR(20) NOT NULL,
  `numero de documento` VARCHAR(35) NOT NULL,
  `direccion` VARCHAR(70) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(20) NOT NULL,
  `idRol` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `idRol_idx` (`idRol` ASC) VISIBLE,
  CONSTRAINT `idRol`
    FOREIGN KEY (`idRol`)
    REFERENCES `synapse`.`Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `synapse`.`Ingreso`
-- -----------------------------------------------------
CREATE TABLE `Ingreso` (
  `idIngreso` INT NOT NULL AUTO_INCREMENT,
  `tipo de comprobante` VARCHAR(45) NOT NULL,
  `serie_comprobante` VARCHAR(45) NOT NULL,
  `num_comprobante` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `impuesto` DECIMAL(11,2) NOT NULL,
  `total` DECIMAL(11,2) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idIngreso`),
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `synapse`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `synapse`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE `Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `synapse`.`Articulo`
-- -----------------------------------------------------
CREATE TABLE `Articulo` (
  `idArticulo` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(50) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `precio_venta` DECIMAL(11,2) NOT NULL,
  `stock` INT NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(60) NOT NULL,
  `idCategoria` INT NOT NULL,
  PRIMARY KEY (`idArticulo`),
  INDEX `idCategoria_idx` (`idCategoria` ASC) VISIBLE,
  CONSTRAINT `idCategoria`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `synapse`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `synapse`.`Detalle_ingreso`
-- -----------------------------------------------------
CREATE TABLE`Detalle_ingreso` (
  `idDetalle_ingreso` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `precio` DECIMAL(11,2) NOT NULL,
  `idIngreso` INT NOT NULL,
  `idArticulo` INT NOT NULL,
  PRIMARY KEY (`idDetalle_ingreso`),
  INDEX `idIngreso_idx` (`idIngreso` ASC) VISIBLE,
  INDEX `idArticulo_idx` (`idArticulo` ASC) VISIBLE,
  CONSTRAINT `idIngreso`
    FOREIGN KEY (`idIngreso`)
    REFERENCES `synapse`.`Ingreso` (`idIngreso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idArticulo`
    FOREIGN KEY (`idArticulo`)
    REFERENCES `synapse`.`Articulo` (`idArticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `synapse`.`Persona`
-- -----------------------------------------------------
CREATE TABLE `Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `tipo_persona` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `tipo_documento` VARCHAR(20) NOT NULL,
  `numero_documento` VARCHAR(20) NOT NULL,
  `cuit` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `idIngreso` INT NOT NULL,
  PRIMARY KEY (`idPersona`),
  INDEX `idIngreso_idx` (`idIngreso` ASC) VISIBLE,
    FOREIGN KEY (`idIngreso`)
    REFERENCES `synapse`.`Ingreso` (`idIngreso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `synapse`.`Venta`
-- -----------------------------------------------------
CREATE TABLE `Venta` (
  `idVenta` INT NOT NULL AUTO_INCREMENT,
  `tipo_comprobante` VARCHAR(45) NOT NULL,
  `serie_comprobante` VARCHAR(45) NOT NULL,
  `num_comprobante` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `impuesto` DECIMAL(11,2) NOT NULL,
  `total` DECIMAL(11,2) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `idPersona` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `idPersona_idx` (`idPersona` ASC) VISIBLE,
  CONSTRAINT `idPersona`
    FOREIGN KEY (`idPersona`)
    REFERENCES `synapse`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `synapse`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `synapse`.`Detalle_venta`
-- -----------------------------------------------------
CREATE TABLE `Detalle_venta` (
  `idDetalle_venta` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `precio` DECIMAL(11,2) NOT NULL,
  `descuento` DECIMAL(11,2) NOT NULL,
  `idVenta` INT NOT NULL,
  `idArticulo` INT NOT NULL,
  PRIMARY KEY (`idDetalle_venta`),
  INDEX `idVenta_idx` (`idVenta` ASC) VISIBLE,
  INDEX `idArticulo_idx` (`idArticulo` ASC) VISIBLE,
  CONSTRAINT `idVenta`
    FOREIGN KEY (`idVenta`)
    REFERENCES `synapse`.`Venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idArticulo`
    FOREIGN KEY (`idArticulo`)
    REFERENCES `synapse`.`Articulo` (`idArticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

