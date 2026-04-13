---
title: "Summarizer: thuộc tính sharedContext"
short-title: sharedContext
slug: Web/API/Summarizer/sharedContext
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Summarizer.sharedContext
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính **`sharedContext`** chỉ đọc của giao diện {{domxref("Summarizer")}} trả về một chuỗi mô tả ngữ cảnh mà các đoạn văn bản cần tóm tắt đang được sử dụng trong đó. Điều này giúp `Summarizer` tạo ra các bản tóm tắt phù hợp hơn.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const summarizer = await Summarizer.create({
  sharedContext:
    "A general summary to help a user decide if the text is worth reading",
  // ...
});

// Ghi log "A general summary to help a user ..."
console.log(summarizer.sharedContext);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
