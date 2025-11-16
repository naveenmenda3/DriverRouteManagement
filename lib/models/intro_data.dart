class IntroData {
  final String image;
  final String title;
  final String subtitle;

  IntroData({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  static List<IntroData> get introScreens => [
    IntroData(
      image: 'assets/images/introimg1.png',
      title: 'Deliver Fresh, Ironed Clothes',
      subtitle: 'Join quick wash Partner and deliver perfectly pressed clothes to customers with speed and reliability.',
    ),
    IntroData(
      image: 'assets/images/introimg2.png',
      title: 'Fast Deliveries. Fresh Ironing.',
      subtitle: 'Deliver freshly ironed clothes quickly and efficiently as an Partner.',
    ),
    IntroData(
      image: 'assets/images/introimg3.png',
      title: 'Reliable Ironing. On-Time Delivery',
      subtitle: 'Help deliver freshly pressed clothes, on time, every time.',
    ),
  ];
}
