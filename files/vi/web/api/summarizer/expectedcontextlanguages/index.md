---
title: "Summarizer: thuộc tính expectedContextLanguages"
short-title: expectedContextLanguages
slug: Web/API/Summarizer/expectedContextLanguages
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Summarizer.expectedContextLanguages
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính **`expectedContextLanguages`** chỉ đọc của giao diện {{domxref("Summarizer")}} trả về các ngôn ngữ mà các chuỗi ngữ cảnh nên được viết bằng.

## Giá trị

Một mảng các chuỗi chỉ định các ngôn ngữ dự kiến của bất kỳ chuỗi ngữ cảnh nào được cung cấp (hoặc {{domxref("Summarizer.sharedContext")}}, hoặc `context` được chỉ định trong lần gọi {{domxref("Summarizer.summarize", "summarize()")}} hoặc {{domxref("Summarizer.summarizeStreaming", "summarizeStreaming()")}}).

Các chuỗi phải là {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}} hợp lệ.

## Ví dụ

```js
const summarizer = await Summarizer.create({
  expectedContextLanguages: ["en-US", "fr"],
  // ...
});

// Ghi log "en-US"
console.log(summarizer.expectedContextLanguages[0]);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
