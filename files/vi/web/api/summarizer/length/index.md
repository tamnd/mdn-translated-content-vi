---
title: "Summarizer: thuộc tính length"
short-title: length
slug: Web/API/Summarizer/length
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Summarizer.length
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính **`length`** chỉ đọc của giao diện {{domxref("Summarizer")}} trả về độ dài tương đối của các bản tóm tắt được tạo.

## Giá trị

Một giá trị liệt kê chỉ định độ dài tương đối của các bản tóm tắt được tạo, tính chất chính xác của nó phụ thuộc vào giá trị {{domxref("Summarizer.type", "type")}} của `Summarizer`.

Các giá trị có thể là:

- `short`
  - : Bản tóm tắt "ngắn"
    - Đối với `type` `tldr` và `teaser`, bản tóm tắt nên vừa trong một câu.
    - Đối với `type` `key-points`, bản tóm tắt nên không quá ba điểm đầu dòng.
    - Đối với `type` `headline`, bản tóm tắt nên không quá 12 từ.
- `medium`
  - : Bản tóm tắt "trung bình"
    - Đối với `type` `tldr` và `teaser`, bản tóm tắt nên vừa trong một đoạn ngắn.
    - Đối với `type` `key-points`, bản tóm tắt nên không quá năm điểm đầu dòng.
    - Đối với `type` `headline`, bản tóm tắt nên không quá 17 từ.
- `long`
  - : Bản tóm tắt "dài"
    - Đối với `type` `tldr` và `teaser`, bản tóm tắt nên vừa trong một đoạn.
    - Đối với `type` `key-points`, bản tóm tắt nên không quá bảy điểm đầu dòng.
    - Đối với `type` `headline`, bản tóm tắt nên không quá 22 từ.

## Ví dụ

```js
const summarizer = await Summarizer.create({
  length: "medium",
  // ...
});

// Ghi log "medium"
console.log(summarizer.length);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
