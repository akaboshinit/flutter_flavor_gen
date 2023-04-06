import 'package:flutter_flavor_gen_core/utils/logger.dart';

void errorLog({
  required String action,
  String? reason,
  Object? error,
  StackTrace? stackTrace,
}) {
  final message = '''
$action failed. ${reason != null ? "Reason: $reason" : null}

${error != null ? "Error: $error" : null}
${stackTrace != null ? "stackTrace: $stackTrace" : null}
''';
  L.log.err(message);
}
