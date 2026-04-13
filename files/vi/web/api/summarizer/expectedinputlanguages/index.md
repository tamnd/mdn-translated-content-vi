---
title: "Summarizer: thuộc tính expectedInputLanguages"
short-title: expectedInputLanguages
slug: Web/API/Summarizer/expectedInputLanguages
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Summarizer.expectedInputLanguages
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính **`expectedInputLanguages`** chỉ đọc của giao diện {{domxref("Summarizer")}} trả về các ngôn ngữ mà `Summarizer` nên hỗ trợ.

## Giá trị

Một mảng các chuỗi chỉ định các ngôn ngữ mà `Summarizer` nên hỗ trợ.

Các chuỗi phải là {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}} hợp lệ.

## Ví dụ

```js
const summarizer = await Summarizer.create({
  expectedInputLanguages: ["en-US", "fr"],
  // ...
});

// Ghi log "en-US"
console.log(summarizer.expectedInputLanguages[0]);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
