---
title: "HTMLButtonElement: thuộc tính commandForElement"
short-title: commandForElement
slug: Web/API/HTMLButtonElement/commandForElement
page-type: web-api-instance-property
browser-compat: api.HTMLButtonElement.commandForElement
---

{{APIRef("Invoker Commands API")}}

Thuộc tính **`commandForElement`** của giao diện {{domxref("HTMLButtonElement")}} lấy và đặt phần tử được điều khiển thông qua nút này.

Nó là bản tương đương JavaScript của thuộc tính HTML [`commandfor`](/en-US/docs/Web/HTML/Reference/Elements/button#commandfor).

## Giá trị

Tham chiếu đến một {{domxref("Element")}} hiện có mà nút điều khiển.

## Ví dụ

```js
const popover = document.getElementById("mypopover");
const toggleBtn = document.getElementById("toggleBtn");

toggleBtn.commandForElement = popover;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Invoker Commands API", "Invoker Commands API", "", "nocode")}}
- {{domxref("HTMLButtonElement.command")}}
- {{domxref("CommandEvent")}}
