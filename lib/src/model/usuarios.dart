class Usuarios {
  String id, nombre, apellido, clave, correo, idEmpresa, nombreEmpresa;
  String telefono, tipoUsuario;

  Usuarios(
      {this.nombre,
      this.apellido,
      this.clave,
      this.correo,
      this.idEmpresa,
      this.nombreEmpresa,
      this.telefono,
      this.tipoUsuario,
      this.id});

  Usuarios.fromMap(dynamic obj) {
    this.nombre = obj['nombre'];
    this.apellido = obj['apellido'];
    this.correo = obj['correo'];
    this.clave = obj['password'];
    this.idEmpresa = obj['idEmpresa'];
    this.telefono = obj['telefono'];
    this.tipoUsuario = obj['tipoUsuario'];
    this.id = obj['id'];
  }

  /*Usuarios.fromMap(Map<String, dynamic> map) {
    nombre = map['nombre'];
    apellido = map['apellido'];
    correo = map['correo'];
    clave = map['password'];
    idEmpresa = map['idEmpresa'];
    telefono = map['telefono'];
    tipoUsuario = map['tipoUsuario'];
    id = map['id'];
  }*/

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'clave': clave,
      'correo': correo,
      'idEmpresa': idEmpresa,
      'nombreEmpresa': nombreEmpresa,
      'telefono': telefono,
      'tipoUsuario': tipoUsuario,
    };
  }

  @override
  String toString() {
    return 'Usuarios{id: $id, name: $nombre, apellido: $apellido, clave: $clave, correo: $correo, idEmpresa: $idEmpresa, nombreEmpresa: $nombreEmpresa, telefono: $telefono, tipoUsuario: $tipoUsuario,}';
  }

  static List<Usuarios> usuarios = [
    Usuarios(
        id: '1',
        nombre: "Manuel Felipe",
        apellido: "Vanegas Prieto",
        clave: "clave123",
        correo: "mvanegasp@ucentral.edu.co",
        telefono: '3154412265',
        tipoUsuario: '0'),
    Usuarios(
        id: '2',
        nombre: "Variedades ",
        apellido: "Don William",
        clave: "clave123",
        correo: "wguarino@ucentral.edu.co",
        telefono: '3188975693',
        tipoUsuario: '1'),
  ];
}
