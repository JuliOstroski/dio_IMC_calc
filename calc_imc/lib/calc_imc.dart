import 'dart:convert';
import 'dart:io';
import 'package:calc_imc/classes/pessoa.dart';
import 'package:calc_imc/classes/utils.dart';
import 'package:calc_imc/exception/nome_invalido_exception.dart';

void execute() {
  print("Bem vindos a nossa calculadora de IMC!");
  String nome = Utils.lerStringComTexto("Digite o nome da pessoa:");
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } catch (NomeInvalidoException) {
    nome = "Nome Padrão";
    print(NomeInvalidoException);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

  print("Digite o peso em quilos:");
  var line = stdin.readLineSync(encoding: utf8);
  var peso = double.parse(line ?? "0");

  print("Digite a altura em metros:");
  line = stdin.readLineSync(encoding: utf8);
  var altura = double.parse(line ?? "0");

  double IMC = (peso / (altura * altura));
  if (IMC < 16) {
    print("A pessoa $nome tem magreza grave com IMC: $IMC");
  } else if ((IMC == 16) || (IMC < 17)) {
    print("A pessoa $nome tem magreza moderada com IMC: $IMC");
  } else if ((IMC == 17) || (IMC < 18.5)) {
    print("A pessoa $nome tem magreza leve com IMC: $IMC");
  } else if ((IMC == 18.5) || (IMC < 25)) {
    print("A pessoa $nome é saudável com IMC: $IMC");
  } else if ((IMC == 25) || (IMC < 30)) {
    print("A pessoa $nome tem sobrepeso com IMC: $IMC");
  } else if ((IMC == 30) || (IMC < 35)) {
    print("A pessoa $nome tem obesidade grau I com IMC: $IMC");
  } else if ((IMC == 35) || (IMC < 40)) {
    print("A pessoa $nome tem obesidade grau II (severa) com IMC: $IMC");
  } else if (IMC >= 40) {
    print("A pessoa $nome tem obesidade grau III (mórbida) com IMC: $IMC");
  }
}
