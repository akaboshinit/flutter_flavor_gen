import 'dart:async';

import 'package:args/args.dart';
import 'package:async/async.dart';
import 'package:flutter_flavor_gen_core/functions/copy_file.dart';
import 'package:flutter_flavor_gen_core/utils/log_template.dart';
import 'package:flutter_flavor_gen_core/utils/logger.dart';

Future<void> initializeScript(ArgResults arguments) async {
  L.log.success('🏁 🏁 🏁 flavor initialize start 🚙 🏍️ 🏎');

  final progress = L.log.progress('copy default flavor file');
  final safeCopyFileResult = await Result.capture(copyFile());
  if (safeCopyFileResult.isError) {
    logError(
      action: 'flavor initialize failed',
      error: safeCopyFileResult.asError!.error,
      progress: progress,
    );

    return;
  }
  progress.complete();
  L.log.success('🕺 💃 🕺 flavor initialize completed 💃 🕺 💃');
}
