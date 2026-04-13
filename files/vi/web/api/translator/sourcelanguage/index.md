---
title: "Translator: sourceLanguage property"
short-title: sourceLanguage
slug: Web/API/Translator/sourceLanguage
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Translator.sourceLanguage
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính chỉ đọc **`sourceLanguage`** của giao diện {{domxref("Translator")}} trả về ngôn ngữ dự kiến của văn bản đầu vào cần dịch.

`sourceLanguage` của một đối tượng `Translator` được đặt khi tạo nó qua lời gọi {{domxref("Translator.create_static", "create()")}}.

## Giá trị

Một chuỗi chỉ định ngôn ngữ nguồn. Đây sẽ là {{glossary("BCP 47 language tag")}} hợp lệ.

## Ví dụ

```js
const translator = await Translator.create({
  sourceLanguage: "en",
  targetLanguage: "ja",
});

// Logs "en"
console.log(translator.sourceLanguage);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator và Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
