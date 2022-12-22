class Tax {

  final int? taxName;


  Tax({
    required this.taxName,

  });

  Tax.fromMap(Map<String , dynamic>  res)
      :
        taxName = res["taxName"];


  Map<String, Object?> toMap(){
    return {
      'taxName' : taxName,

    };
  }
}