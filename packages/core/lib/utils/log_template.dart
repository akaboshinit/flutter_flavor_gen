import 'package:flutter_flavor_gen_core/utils/logger.dart';
import 'package:mason_logger/mason_logger.dart';

void logIndent() {
  L.log.write('\n');
}

void logError({
  required String action,
  String? reason,
  Object? error,
  StackTrace? stackTrace,
  Progress? progress,
}) {
  final message = '''
$action failed. ${reason != null ? "Reason: $reason" : null}

${error != null ? "Error: $error" : null}
${stackTrace != null ? "stackTrace: $stackTrace" : null}
''';

  if (progress != null) {
    progress.fail(message);
    return;
  }

  L.log.err(message);
}
