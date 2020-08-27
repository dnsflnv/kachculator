///  MacCallum fomula of body proportions
Map<String, double> mcCallum(double wristCm) {
  final double grud = wristCm * 6.5;
  final Map<String, double> res = {
    'Обхват груди': grud,
    'Обхват ягодиц': grud / 100.0 * 85.0,
    'Обхват талии': grud / 100.0 * 70.0,
    'Обхват бедра': grud / 100.0 * 53.0,
    'Обхват шеи': grud / 100.0 * 37.0,
    'Обхват бицепса': grud / 100.0 * 36.0,
    'Обхват голени': grud / 100.0 * 34.0,
    'Обхват предплечья': grud / 100.0 * 29.0,
  };
  return res;
}
