import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:objectbox/objectbox.dart';
import 'package:postman/core/network/connection_checker.dart';
import 'package:postman/core/services/secure_store_service.dart';
import 'package:postman/objbox.dart';
import 'package:timezone/data/latest.dart' as tzlt;
import 'package:timezone/timezone.dart' as tz;

part 'init_dependencies.main.dart';
