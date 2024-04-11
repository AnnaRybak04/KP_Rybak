// Клас з константами для розмірів елементів і анімацій.

abstract class DimensionConstants {
  // Загальні
  static const double appBarHeight = 50; // Висота панелі програми
  static const double webTopNavigationBarHeight =
      80; // Висота верхньої панелі навігації для веб-версії
  static const double expandedTopNavigationBarHeight =
      90; // Розширена висота верхньої панелі навігації
  static const int animationDuration = 220; // Тривалість анімації

  // Іконки
  static const double iconExtraSmall = 12; // Дуже маленька іконка
  static const double iconSmall = 14; // Маленька іконка
  static const double iconNormal = 16; // Нормальна іконка
  static const double iconMedium = 18; // Середня іконка
  static const double iconLarge = 24; // Велика іконка
  static const double iconExtraLarge = 48; // Дуже велика іконка
  static const double iconImmense = 60; // Величезна іконка
  static const double iconExtraImmense = 80; // Дуже велика величезна іконка
}

// Клас з константами для відступів.

abstract class PaddingConstants {
  static const double extraSmall = 4; // Дуже малий відступ
  static const double small = 6; // Малий відступ
  static const double normal = 8; // Нормальний відступ
  static const double medium = 12; // Середній відступ
  static const double large = 16; // Великий відступ
  static const double extraLarge = 24; // Дуже великий відступ
  static const double immense = 32; // Величезний відступ
  static const double extraImmense = 40; // Дуже величезний відступ
  static const double extraImmensePlus = 60; // Дуже величезний відступ +
}

// Клас  з константами для радіусів закруглення.

abstract class BorderRadiusConstants {
  static const double superSmall = 2; // Дуже маленький радіус закруглення
  static const double extraSmall = 4; // Дуже маленький радіус закруглення
  static const double small = 6; // Малий радіус закруглення
  static const double normal = 8; // Нормальний радіус закруглення
  static const double medium = 12; // Середній радіус закруглення
  static const double large = 16; // Великий радіус закруглення
  static const double extraLarge = 24; // Дуже великий радіус закруглення
  static const double superLarge = 36; // Дуже великий радіус закруглення
}
