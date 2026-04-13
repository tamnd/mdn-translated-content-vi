---
title: "Summarizer: thuộc tính type"
short-title: type
slug: Web/API/Summarizer/type
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Summarizer.type
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính **`type`** chỉ đọc của giao diện {{domxref("Summarizer")}} trả về loại bản tóm tắt sẽ được tạo bởi `Summarizer`.

## Giá trị

Một giá trị liệt kê chỉ định dạng mà bản tóm tắt sẽ được tạo; các giá trị có thể là:

- `headline`
  - : Một tiêu đề bài viết gồm một câu, nắm bắt điểm chính của văn bản đầu vào.
- `key-points`
  - : Một danh sách đầu dòng chỉ định các điểm quan trọng nhất được trình bày trong văn bản đầu vào.
- `teaser`
  - : Một đoạn "teaser" tóm tắt các điểm thú vị hoặc hấp dẫn nhất của văn bản đầu vào, được thiết kế để thu hút người đọc đọc tiếp.
- `tldr`
  - : Một tổng quan ngắn gọn, súc tích, được thiết kế như bản tóm tắt cho người đọc bận rộn.

## Ví dụ

```js
const summarizer = await Summarizer.create({
  type: "tldr",
  // ...
});

// Ghi log "tldr"
console.log(summarizer.type);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
