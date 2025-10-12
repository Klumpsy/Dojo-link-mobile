class WazaModel {
  final String wazaName;
  final String title;
  final String level;
  final String imagePath;
  final bool viewIsSelected;

  WazaModel({
    required this.wazaName,
    required this.title,
    required this.level,
    required this.imagePath,
    required this.viewIsSelected,
  });

  static List<WazaModel> getWaza() {
    List<WazaModel> waza = [];

    waza.add(
      WazaModel(
        wazaName: 'Deashi harai',
        title: 'Combinatie deashi harai',
        level: 'Beginner',
        imagePath: 'assets/images/de-ashi-barai.jpg',
        viewIsSelected: true,
      ),
    );

    waza.add(
      WazaModel(
        wazaName: 'Ippon seoi nage',
        title: 'Ippon seoi nage linker pakking',
        level: 'Intermediate',
        imagePath: 'assets/images/ippon-seoi-nage.jpg',
        viewIsSelected: false,
      ),
    );

    waza.add(
      WazaModel(
        wazaName: 'O goshi',
        title: 'O goshi met links doorstappen',
        level: 'Beginner',
        imagePath: 'assets/images/o-goshi.jpg',
        viewIsSelected: false,
      ),
    );

    return waza;
  }
}
