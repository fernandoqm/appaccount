import 'package:meta/meta.dart';

class Cuentas {
  final int id_cuenta;
  final String nombre_cuenta;
  final String numero_cuenta;
  final String banco;
  final double saldo;
  final String estado;

  Cuentas(
      {required this.id_cuenta,
      required this.nombre_cuenta,
      required this.numero_cuenta,
      required this.banco,
      required this.saldo,
      required this.estado});

  Map<String, dynamic> toMap() {
    return {
      'idCuenta': id_cuenta,
      'nombreCuenta': nombre_cuenta,
      'numeroCuenta': numero_cuenta,
      'banco': banco,
      'saldo': saldo,
      'estado': estado
    };
  }
}
