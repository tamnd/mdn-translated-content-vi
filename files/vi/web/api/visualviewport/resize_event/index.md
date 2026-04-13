---
title: "VisualViewport: sự kiện resize"
short-title: resize
slug: Web/API/VisualViewport/resize_event
page-type: web-api-event
browser-compat: api.VisualViewport.resize_event
---

{{APIRef("CSSOM view API")}}

Sự kiện **`resize`** của giao diện {{domxref("VisualViewport")}} được kích hoạt khi khung nhìn trực quan bị thay đổi kích thước. Điều này cho phép bạn định vị các phần tử tương đối với khung nhìn trực quan khi nó được thu phóng, thay vì neo vào khung nhìn bố cục.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("resize", (event) => { })

onresize = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} thông thường.

## Ví dụ

Xem trang đích [`VisualViewport`](/en-US/docs/Web/API/VisualViewport#examples) để xem bản trình diễn sử dụng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
