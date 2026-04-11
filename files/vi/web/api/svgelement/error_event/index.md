---
title: "SVGElement: sự kiện error"
short-title: error
slug: Web/API/SVGElement/error_event
page-type: web-api-event
browser-compat: api.SVGElement.error_event
---

{{APIRef("SVG")}}

Sự kiện `error` được kích hoạt khi phần tử SVG không tải được đúng cách hoặc khi có lỗi xảy ra trong quá trình thực thi script.

Về cơ bản, sự kiện này triển khai sự kiện DOM `error` tiêu chuẩn.

Sự kiện này không thể hủy.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} thông thường.

## Ví dụ

```js
svgElem.addEventListener("error", () => {
  console.log("SVG not loaded properly.");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
