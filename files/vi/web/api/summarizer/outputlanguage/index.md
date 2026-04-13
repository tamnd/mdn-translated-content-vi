---
title: "Summarizer: thuộc tính outputLanguage"
short-title: outputLanguage
slug: Web/API/Summarizer/outputLanguage
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Summarizer.outputLanguage
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính **`outputLanguage`** chỉ đọc của giao diện {{domxref("Summarizer")}} trả về ngôn ngữ mà bản tóm tắt sẽ được tạo bằng.

## Giá trị

Một chuỗi chỉ định ngôn ngữ mà bản tóm tắt sẽ được tạo bằng.

Chuỗi phải là {{glossary("BCP 47 language tag")}} hợp lệ.

## Ví dụ

```js
const summarizer = await Summarizer.create({
  outputLanguage: "en-US",
  // ...
});

// Ghi log "en-US"
console.log(summarizer.outputLanguage);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
