// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

BooksModel booksModelFromJson(String str) => BooksModel.fromJson(json.decode(str));

String booksModelToJson(BooksModel data) => json.encode(data.toJson());

class BooksModel {
    String kind;
    int totalItems;
    List<Item> items;

    BooksModel({
        required this.kind,
        required this.totalItems,
        required this.items,
    });

    factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Kind kind;
    String id;
    String etag;
    String selfLink;
    VolumeInfo volumeInfo;
    SaleInfo saleInfo;
    AccessInfo accessInfo;

    Item({
        required this.kind,
        required this.id,
        required this.etag,
        required this.selfLink,
        required this.volumeInfo,
        required this.saleInfo,
        required this.accessInfo,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: kindValues.map[json["kind"]]!,
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: AccessInfo.fromJson(json["accessInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kindValues.reverse[kind],
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo.toJson(),
        "saleInfo": saleInfo.toJson(),
        "accessInfo": accessInfo.toJson(),
    };
}

class AccessInfo {
    Country country;
    Viewability viewability;
    bool embeddable;
    bool publicDomain;
    TextToSpeechPermission textToSpeechPermission;
    Epub epub;
    Epub pdf;
    String webReaderLink;
    AccessViewStatus accessViewStatus;
    bool quoteSharingAllowed;

    AccessInfo({
        required this.country,
        required this.viewability,
        required this.embeddable,
        required this.publicDomain,
        required this.textToSpeechPermission,
        required this.epub,
        required this.pdf,
        required this.webReaderLink,
        required this.accessViewStatus,
        required this.quoteSharingAllowed,
    });

    factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: countryValues.map[json["country"]]!,
        viewability: viewabilityValues.map[json["viewability"]]!,
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: textToSpeechPermissionValues.map[json["textToSpeechPermission"]]!,
        epub: Epub.fromJson(json["epub"]),
        pdf: Epub.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: accessViewStatusValues.map[json["accessViewStatus"]]!,
        quoteSharingAllowed: json["quoteSharingAllowed"],
    );

    Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "viewability": viewabilityValues.reverse[viewability],
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermissionValues.reverse[textToSpeechPermission],
        "epub": epub.toJson(),
        "pdf": pdf.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatusValues.reverse[accessViewStatus],
        "quoteSharingAllowed": quoteSharingAllowed,
    };
}

enum AccessViewStatus {
    NONE,
    SAMPLE
}

final accessViewStatusValues = EnumValues({
    "NONE": AccessViewStatus.NONE,
    "SAMPLE": AccessViewStatus.SAMPLE
});

enum Country {
    ID
}

final countryValues = EnumValues({
    "ID": Country.ID
});

class Epub {
    bool isAvailable;
    String? acsTokenLink;

    Epub({
        required this.isAvailable,
        this.acsTokenLink,
    });

    factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
        acsTokenLink: json["acsTokenLink"],
    );

    Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "acsTokenLink": acsTokenLink,
    };
}

enum TextToSpeechPermission {
    ALLOWED
}

final textToSpeechPermissionValues = EnumValues({
    "ALLOWED": TextToSpeechPermission.ALLOWED
});

enum Viewability {
    NO_PAGES,
    PARTIAL
}

final viewabilityValues = EnumValues({
    "NO_PAGES": Viewability.NO_PAGES,
    "PARTIAL": Viewability.PARTIAL
});

enum Kind {
    BOOKS_VOLUME
}

final kindValues = EnumValues({
    "books#volume": Kind.BOOKS_VOLUME
});

class SaleInfo {
    Country country;
    Saleability saleability;
    bool isEbook;

    SaleInfo({
        required this.country,
        required this.saleability,
        required this.isEbook,
    });

    factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: countryValues.map[json["country"]]!,
        saleability: saleabilityValues.map[json["saleability"]]!,
        isEbook: json["isEbook"],
    );

    Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "saleability": saleabilityValues.reverse[saleability],
        "isEbook": isEbook,
    };
}

enum Saleability {
    NOT_FOR_SALE
}

final saleabilityValues = EnumValues({
    "NOT_FOR_SALE": Saleability.NOT_FOR_SALE
});

class VolumeInfo {
    String title;
    String? subtitle;
    List<String>? authors;
    String publishedDate;
    List<IndustryIdentifier> industryIdentifiers;
    ReadingModes readingModes;
    int pageCount;
    PrintType printType;
    MaturityRating maturityRating;
    bool allowAnonLogging;
    String contentVersion;
    PanelizationSummary? panelizationSummary;
    Language language;
    String previewLink;
    String infoLink;
    String canonicalVolumeLink;
    String? publisher;
    String? description;
    List<String>? categories;
    double? averageRating;
    int? ratingsCount;
    ImageLinks? imageLinks;

    VolumeInfo({
        required this.title,
        this.subtitle,
        this.authors,
        required this.publishedDate,
        required this.industryIdentifiers,
        required this.readingModes,
        required this.pageCount,
        required this.printType,
        required this.maturityRating,
        required this.allowAnonLogging,
        required this.contentVersion,
        this.panelizationSummary,
        required this.language,
        required this.previewLink,
        required this.infoLink,
        required this.canonicalVolumeLink,
        this.publisher,
        this.description,
        this.categories,
        this.averageRating,
        this.ratingsCount,
        this.imageLinks,
    });

    factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        subtitle: json["subtitle"],
        authors: json["authors"] == null ? [] : List<String>.from(json["authors"]!.map((x) => x)),
        publishedDate: json["publishedDate"],
        industryIdentifiers: List<IndustryIdentifier>.from(json["industryIdentifiers"].map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"],
        printType: printTypeValues.map[json["printType"]]!,
        maturityRating: maturityRatingValues.map[json["maturityRating"]]!,
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] == null ? null : PanelizationSummary.fromJson(json["panelizationSummary"]),
        language: languageValues.map[json["language"]]!,
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
        publisher: json["publisher"],
        description: json["description"],
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
        averageRating: json["averageRating"]?.toDouble(),
        ratingsCount: json["ratingsCount"],
        imageLinks: json["imageLinks"] == null ? null : ImageLinks.fromJson(json["imageLinks"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "authors": authors == null ? [] : List<dynamic>.from(authors!.map((x) => x)),
        "publishedDate": publishedDate,
        "industryIdentifiers": List<dynamic>.from(industryIdentifiers.map((x) => x.toJson())),
        "readingModes": readingModes.toJson(),
        "pageCount": pageCount,
        "printType": printTypeValues.reverse[printType],
        "maturityRating": maturityRatingValues.reverse[maturityRating],
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary?.toJson(),
        "language": languageValues.reverse[language],
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
        "publisher": publisher,
        "description": description,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
        "imageLinks": imageLinks?.toJson(),
    };
}

class ImageLinks {
    String smallThumbnail;
    String thumbnail;

    ImageLinks({
        required this.smallThumbnail,
        required this.thumbnail,
    });

    factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
    };
}

class IndustryIdentifier {
    Type type;
    String identifier;

    IndustryIdentifier({
        required this.type,
        required this.identifier,
    });

    factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
        type: typeValues.map[json["type"]]!,
        identifier: json["identifier"],
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "identifier": identifier,
    };
}

enum Type {
    ISBN_10,
    ISBN_13,
    OTHER
}

final typeValues = EnumValues({
    "ISBN_10": Type.ISBN_10,
    "ISBN_13": Type.ISBN_13,
    "OTHER": Type.OTHER
});

enum Language {
    EN
}

final languageValues = EnumValues({
    "en": Language.EN
});

enum MaturityRating {
    NOT_MATURE
}

final maturityRatingValues = EnumValues({
    "NOT_MATURE": MaturityRating.NOT_MATURE
});

class PanelizationSummary {
    bool containsEpubBubbles;
    bool containsImageBubbles;

    PanelizationSummary({
        required this.containsEpubBubbles,
        required this.containsImageBubbles,
    });

    factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
    );

    Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
    };
}

enum PrintType {
    BOOK
}

final printTypeValues = EnumValues({
    "BOOK": PrintType.BOOK
});

class ReadingModes {
    bool text;
    bool image;

    ReadingModes({
        required this.text,
        required this.image,
    });

    factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
