// Перелік типів контенту
enum ContentTypeEnum {
  movies('movie'),
  tvShows('tv');

  // Конструктор для переліку типів контенту
  const ContentTypeEnum(this.value);

  final String value;
}
