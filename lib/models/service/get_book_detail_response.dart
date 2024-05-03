// To parse this JSON data, do
//
//     final getBookDetailResponse = getBookDetailResponseFromJson(jsonString);

import 'dart:convert';

GetBookDetailResponse getBookDetailResponseFromJson(String str) => GetBookDetailResponse.fromJson(json.decode(str));

String getBookDetailResponseToJson(GetBookDetailResponse data) => json.encode(data.toJson());

class GetBookDetailResponse {
    String? kind;
    String? id;
    String? etag;
    String? selfLink;
    VolumeInfo? volumeInfo;
    SaleInfo? saleInfo;
    AccessInfo? accessInfo;

    GetBookDetailResponse({
        this.kind,
        this.id,
        this.etag,
        this.selfLink,
        this.volumeInfo,
        this.saleInfo,
        this.accessInfo,
    });

    factory GetBookDetailResponse.fromJson(Map<String, dynamic> json) => GetBookDetailResponse(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: json["volumeInfo"] == null ? null : VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: json["saleInfo"] == null ? null : SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: json["accessInfo"] == null ? null : AccessInfo.fromJson(json["accessInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo?.toJson(),
        "saleInfo": saleInfo?.toJson(),
        "accessInfo": accessInfo?.toJson(),
    };
}

class AccessInfo {
    String? country;
    String? viewability;
    bool? embeddable;
    bool? publicDomain;
    String? textToSpeechPermission;
    Epub? epub;
    Epub? pdf;
    String? webReaderLink;
    String? accessViewStatus;
    bool? quoteSharingAllowed;

    AccessInfo({
        this.country,
        this.viewability,
        this.embeddable,
        this.publicDomain,
        this.textToSpeechPermission,
        this.epub,
        this.pdf,
        this.webReaderLink,
        this.accessViewStatus,
        this.quoteSharingAllowed,
    });

    factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json["country"],
        viewability: json["viewability"],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"],
        epub: json["epub"] == null ? null : Epub.fromJson(json["epub"]),
        pdf: json["pdf"] == null ? null : Epub.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "viewability": viewability,
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermission,
        "epub": epub?.toJson(),
        "pdf": pdf?.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatus,
        "quoteSharingAllowed": quoteSharingAllowed,
    };
}

class Epub {
    bool? isAvailable;
    String? downloadLink;

    Epub({
        this.isAvailable,
        this.downloadLink,
    });

    factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
        downloadLink: json["downloadLink"],
    );

    Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "downloadLink": downloadLink,
    };
}

class SaleInfo {
    String? country;
    String? saleability;
    bool? isEbook;
    String? buyLink;

    SaleInfo({
        this.country,
        this.saleability,
        this.isEbook,
        this.buyLink,
    });

    factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
        buyLink: json["buyLink"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "saleability": saleability,
        "isEbook": isEbook,
        "buyLink": buyLink,
    };
}

class VolumeInfo {
    String? title;
    String? subtitle;
    List<String>? authors;
    String? publisher;
    String? publishedDate;
    ReadingModes? readingModes;
    int? pageCount;
    int? printedPageCount;
    Dimensions? dimensions;
    String? printType;
    String? maturityRating;
    bool? allowAnonLogging;
    String? contentVersion;
    PanelizationSummary? panelizationSummary;
    ImageLinks? imageLinks;
    String? language;
    String? previewLink;
    String? infoLink;
    String? canonicalVolumeLink;

    VolumeInfo({
        this.title,
        this.subtitle,
        this.authors,
        this.publisher,
        this.publishedDate,
        this.readingModes,
        this.pageCount,
        this.printedPageCount,
        this.dimensions,
        this.printType,
        this.maturityRating,
        this.allowAnonLogging,
        this.contentVersion,
        this.panelizationSummary,
        this.imageLinks,
        this.language,
        this.previewLink,
        this.infoLink,
        this.canonicalVolumeLink,
    });

    factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        subtitle: json["subtitle"],
        authors: json["authors"] == null ? [] : List<String>.from(json["authors"]!.map((x) => x)),
        publisher: json["publisher"],
        publishedDate: json["publishedDate"],
        readingModes: json["readingModes"] == null ? null : ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"],
        printedPageCount: json["printedPageCount"],
        dimensions: json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]),
        printType: json["printType"],
        maturityRating: json["maturityRating"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] == null ? null : PanelizationSummary.fromJson(json["panelizationSummary"]),
        imageLinks: json["imageLinks"] == null ? null : ImageLinks.fromJson(json["imageLinks"]),
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "authors": authors == null ? [] : List<dynamic>.from(authors!.map((x) => x)),
        "publisher": publisher,
        "publishedDate": publishedDate,
        "readingModes": readingModes?.toJson(),
        "pageCount": pageCount,
        "printedPageCount": printedPageCount,
        "dimensions": dimensions?.toJson(),
        "printType": printType,
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary?.toJson(),
        "imageLinks": imageLinks?.toJson(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
    };
}

class Dimensions {
    String? height;

    Dimensions({
        this.height,
    });

    factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
    };
}

class ImageLinks {
    String? smallThumbnail;
    String? thumbnail;
    String? small;
    String? medium;
    String? large;

    ImageLinks({
        this.smallThumbnail,
        this.thumbnail,
        this.small,
        this.medium,
        this.large,
    });

    factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
        "small": small,
        "medium": medium,
        "large": large,
    };
}

class PanelizationSummary {
    bool? containsEpubBubbles;
    bool? containsImageBubbles;

    PanelizationSummary({
        this.containsEpubBubbles,
        this.containsImageBubbles,
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

class ReadingModes {
    bool? text;
    bool? image;

    ReadingModes({
        this.text,
        this.image,
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
