---
title: "VisualViewport: sự kiện scroll"
short-title: scroll
slug: Web/API/VisualViewport/scroll_event
page-type: web-api-event
browser-compat: api.VisualViewport.scroll_event
---

{{APIRef("CSSOM view API")}}

Sự kiện **`scroll`** của giao diện {{domxref("VisualViewport")}} được kích hoạt khi khung nhìn trực quan bị cuộn. Điều này cho phép bạn định vị các phần tử tương đối với khung nhìn trực quan khi nó được cuộn, thay vì neo vào khung nhìn bố cục.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("scroll", (event) => { })

onscroll = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} thông thường.

## Ví dụ

Xem trang đích [`VisualViewport`](/en-US/docs/Web/API/VisualViewport#examples) để xem bản trình diễn sử dụng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
