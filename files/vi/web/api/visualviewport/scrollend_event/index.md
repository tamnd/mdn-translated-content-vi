---
title: "VisualViewport: sự kiện scrollend"
short-title: scrollend
slug: Web/API/VisualViewport/scrollend_event
page-type: web-api-event
browser-compat: api.VisualViewport.scrollend_event
---

{{APIRef("CSSOM view API")}}

Sự kiện **`scrollend`** của giao diện {{domxref("VisualViewport")}} được kích hoạt khi thao tác cuộn trên khung nhìn trực quan kết thúc. Điều này cho phép bạn cập nhật một phần tử khi thao tác cuộn hoàn tất. Ví dụ, bạn có thể sử dụng các sự kiện {{domxref("VisualViewport/resize_event", "resize")}} và {{domxref("VisualViewport/scroll_event", "scroll")}} để giữ một phần tử cố định với khung nhìn trực quan khi nó được thu phóng nhéo ngón tay và cuộn, và cập nhật nó bằng nội dung mới khi cuộn kết thúc thông qua `scrollend`.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("scrollend", (event) => { })

onscrollend = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} thông thường.

## Ví dụ

Xem trang đích [`VisualViewport`](/en-US/docs/Web/API/VisualViewport#examples) để xem bản trình diễn sử dụng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
