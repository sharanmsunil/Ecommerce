class Detail{
  Detail({
      required this.title,
      required this.body,
      this.isExpanded = false,
});
  String title;
  String body;
  bool isExpanded;
}

List<Detail> getDetails() {
  return [
    Detail(title: 'The Details', body: 'The 80s b-ball icon returns with classic colours, crisp leather and throwback hoops flair. Channelling vintage style back onto the streets, its padded collar lets you take your game anywhere—in comfort.'),
    Detail(title: 'Size&Fit', body: 'Colour Shown: White/Platinum Tint/Pure Platinum/Light CarbonStyle: FJ4188-100'),
    Detail(title: 'Composition & Care', body: 'Leather upper softens and gains vintage character with wear.Foam midsole offers lightweight, responsive cushioning.Rubber outsole with classic hoops pivot circle adds durability and traction.'),
  ];
}