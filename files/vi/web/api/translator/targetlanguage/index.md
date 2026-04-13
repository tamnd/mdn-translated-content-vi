---
title: "Translator: targetLanguage property"
short-title: targetLanguage
slug: Web/API/Translator/targetLanguage
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Translator.targetLanguage
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính chỉ đọc **`targetLanguage`** của giao diện {{domxref("Translator")}} trả về ngôn ngữ mà văn bản đầu vào sẽ được dịch sang.

`targetLanguage` của một đối tượng `Translator` được đặt khi tạo nó qua lời gọi {{domxref("Translator.create_static", "create()")}}.

## Giá trị

Một chuỗi chỉ định ngôn ngữ đích. Đây sẽ là {{glossary("BCP 47 language tag")}} hợp lệ.

## Ví dụ

```js
const translator = await Translator.create({
  sourceLanguage: "en",
  targetLanguage: "ja",
});

// Logs "ja"
console.log(translator.targetLanguage);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator và Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
