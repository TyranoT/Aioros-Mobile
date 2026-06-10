import 'dart:convert';

import 'package:crypto/crypto.dart';

/// Gera o hash SHA-256 (hex) de uma senha em texto puro.
///
/// Suficiente para um app local; em um cenário com servidor, prefira um
/// algoritmo com sal e custo (bcrypt/argon2).
String hashSenha(String senha) => sha256.convert(utf8.encode(senha)).toString();

/// Verifica se [senha] corresponde a um [hash] previamente gerado.
bool verificarSenha(String senha, String hash) => hashSenha(senha) == hash;
