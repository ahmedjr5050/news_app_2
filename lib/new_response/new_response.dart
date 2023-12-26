import 'article.dart';

class NewResponse {
	String? status;
	int? totalResults;
	List<Article>? articles;

	NewResponse({this.status, this.totalResults, this.articles});

	factory NewResponse.fromJson(Map<String, dynamic> json) => NewResponse(
				status: json['status'] as String?,
				totalResults: json['totalResults'] as int?,
				articles: (json['articles'] as List<dynamic>?)
						?.map((e) => Article.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'totalResults': totalResults,
				'articles': articles?.map((e) => e.toJson()).toList(),
			};
}
