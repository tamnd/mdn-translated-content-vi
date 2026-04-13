---
title: "Summarizer: thuộc tính format"
short-title: format
slug: Web/API/Summarizer/format
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Summarizer.format
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính **`format`** chỉ đọc của giao diện {{domxref("Summarizer")}} trả về định dạng văn bản mà các bản tóm tắt sẽ được trả về.

## Giá trị

Một giá trị liệt kê chỉ định định dạng của các bản tóm tắt được trả về. Các giá trị có thể là:

- `markdown`
  - : Các bản tóm tắt chứa định dạng markdown (tuân theo đặc tả [CommonMark](https://spec.commonmark.org/)).
- `plain-text`
  - : Các bản tóm tắt không chứa định dạng.

## Ví dụ

```js
const summarizer = await Summarizer.create({
  format: "plain-text",
  // ...
});

// Ghi log "plain-text"
console.log(summarizer.format);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
