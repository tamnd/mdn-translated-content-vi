---
title: "LanguageDetector: thuộc tính expectedInputLanguages"
short-title: expectedInputLanguages
slug: Web/API/LanguageDetector/expectedInputLanguages
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.LanguageDetector.expectedInputLanguages
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính chỉ đọc **`expectedInputLanguages`** của giao diện {{domxref("LanguageDetector")}} trả về các ngôn ngữ dự kiến sẽ được phát hiện trong văn bản đầu vào. Việc chỉ định các ngôn ngữ đầu vào dự kiến giúp cải thiện độ chính xác của việc phát hiện ngôn ngữ.

`expectedInputLanguages` của phiên bản `LanguageDetector` được đặt khi tạo nó thông qua lệnh gọi {{domxref("LanguageDetector.create_static", "create()")}}.

## Giá trị

Một mảng các chuỗi chỉ định các ngôn ngữ đầu vào dự kiến. Đây sẽ là các thẻ ngôn ngữ {{glossary("BCP 47 language tag", "BCP 47")}} hợp lệ.

## Ví dụ

```js
const detector = await LanguageDetector.create({
  expectedInputLanguages: ["en-US", "zh"],
});

// Logs ["en-US", "zh"]
console.log(detector.expectedInputLanguages);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
