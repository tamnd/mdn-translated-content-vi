---
title: "NetworkInformation: sự kiện change"
short-title: change
slug: Web/API/NetworkInformation/change_event
page-type: web-api-event
browser-compat: api.NetworkInformation.change_event
---

{{apiref("Network Information API")}} {{AvailableInWorkers}}

Sự kiện **`change`** của giao diện {{domxref("NetworkInformation")}} được kích hoạt khi thông tin kết nối thay đổi, và sự kiện được nhận bởi đối tượng {{domxref("NetworkInformation")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
// Lấy loại kết nối.
const type = navigator.connection.type;

function changeHandler(e) {
  // Xử lý thay đổi loại kết nối tại đây.
}

// Đăng ký theo dõi các thay đổi sự kiện:
navigator.connection.onchange = changeHandler;

// Cách khác: navigator.connection.addEventListener('change', changeHandler);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
