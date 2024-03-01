class UnbordingContent{
  String image;
  String title;
  String description;


  UnbordingContent({required this.image,required this.title,required this.description});
}

List<UnbordingContent> contents =[
  UnbordingContent(
    title: "Concevez vos actes",
    image: "asset_welcome/img1.jpg",
    description: "Faites concevoir vos actes dans notre application en toute securite a travers un plan d'action elabore pour vous faciliter la vie."
  ),
  UnbordingContent(
    title: "Gestion numerique des donnees",
    image: "asset_welcome/1.jpg",
    description: "Vos donnees personnels sont chiffrees ainsi que vos actions tout au long de l'utilisation de l'application"
  ),
  UnbordingContent(
      title: "Creation de compte et inscription",
      image: "images_projet/civils.png",
      description: "Creez votre compte ou connectez vous pour profiter de la meilleure experience possible!"



  ),
];