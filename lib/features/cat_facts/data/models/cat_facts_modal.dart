import 'package:flutter/widgets.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/domain/entities/cat_facts_entity.dart';

class CatFactsModal extends CatFactsEntity {
  final String text;
  final String createdAt;

  CatFactsModal({@required this.text, @required this.createdAt});

  factory CatFactsModal.fromJson(Map<String, dynamic> json) {
    return CatFactsModal(text: json['text'], createdAt: json['createdAt']);
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'createdAt': createdAt};
  }
}
