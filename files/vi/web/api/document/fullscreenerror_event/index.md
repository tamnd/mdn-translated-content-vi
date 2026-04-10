---
title: "Document: sự kiện fullscreenerror"
short-title: fullscreenerror
slug: Web/API/Document/fullscreenerror_event
page-type: web-api-event
browser-compat: api.Document.fullscreenerror_event
---

{{APIRef("Fullscreen API")}}

Sự kiện **`fullscreenerror`** được kích hoạt khi trình duyệt không thể chuyển sang chế độ toàn màn hình.

Cũng như [sự kiện `fullscreenchange`](/en-US/docs/Web/API/Document/fullscreenchange_event), hai sự kiện `fullscreenerror` được kích hoạt; sự kiện đầu tiên được gửi đến {{domxref("Element")}} không thể thay đổi chế độ, và sự kiện thứ hai được gửi đến {{domxref("Document")}} sở hữu phần tử đó.

Để biết một số lý do khiến việc chuyển sang chế độ toàn màn hình có thể thất bại, xem [hướng dẫn về Fullscreen API](/en-US/docs/Web/API/Fullscreen_API/Guide).

Sự kiện này không thể hủy.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("fullscreenerror", (event) => { })

onfullscreenerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
const requestor = document.querySelector("div");

function handleError(event) {
  console.error("đã xảy ra lỗi khi chuyển sang chế độ toàn màn hình");
  console.log(event);
}

document.addEventListener("fullscreenerror", handleError);
// hoặc
document.onfullscreenerror = handleError;

requestor.requestFullscreen();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document/fullscreenchange_event", "fullscreenchange")}}
- {{domxref("Element")}}: sự kiện {{domxref("Element/fullscreenerror_event", "fullscreenerror")}}
- [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API)
- [Hướng dẫn sử dụng Fullscreen API](/en-US/docs/Web/API/Fullscreen_API/Guide)
