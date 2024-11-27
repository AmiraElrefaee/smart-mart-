class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({ required this.image,required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Discover a faster,\n Easier way to shop',
      image: 'assets/images/hong-kong-grocery-store-lead-image 2.png',
      discription: "Lorem ipsum dolor sit amet consectetur \n."
          " Neque vitae vulputate ute sit amet consectet neque fames et donec velit id."

  ),
  UnbordingContent(
      title: 'Scan items, add them \n to your cart Now',
      image: 'assets/images/hong-kong-grocery-store-lead-image 1.png',
      discription:"Lorem ipsum dolor sit amet consectetur \n."
          " Neque vitae vulputate ute sit amet consectet neque fames et donec velit id."
  ),
  UnbordingContent(
      title: 'Let’s go! Start exploring \n smarter shopping',
      image: 'assets/images/basket-jpg 1.png',
      discription: "Lorem ipsum dolor sit amet consectetur \n."
          " Neque vitae vulputate ute sit amet consectet neque fames et donec velit id. "
  ),
];