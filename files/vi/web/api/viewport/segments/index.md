---
title: "Viewport: thuộc tính segments"
short-title: segments
slug: Web/API/Viewport/segments
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Viewport.segments
---

{{APIRef("Viewport Segments API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`segments`** của giao diện {{domxref("Viewport")}} trả về một mảng đối tượng {{domxref("DOMRect")}} đại diện cho vị trí và kích thước của mỗi phân đoạn viewport trong toàn bộ màn hình.

## Giá trị

Một mảng đối tượng {{domxref("DOMRect")}}.

## Ví dụ

### Cách dùng cơ bản `Viewport.segments`

Đoạn code này sẽ lặp qua từng phân đoạn trong viewport và ghi log một chuỗi vào console chi tiết số chỉ số, chiều rộng và chiều cao.

```js
const segments = window.viewport.segments;

segments.forEach((segment) =>
  console.log(
    `Segment ${segments.indexOf(segment)} is ${segment.width}px x ${segment.height}px`,
  ),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Viewport Segments API](/en-US/docs/Web/API/Viewport_segments_API)
- [CSSOM view API](/en-US/docs/Web/API/CSSOM_view_API)
- [Origin trial for Foldable APIs](https://developer.chrome.com/blog/foldable-apis-ot) qua developer.chrome.com (2024)
