Future<void> delay(int seconds, Function()? computation) async {
  return await Future.delayed(
    const Duration(seconds: 2),
    computation,
  );
}
