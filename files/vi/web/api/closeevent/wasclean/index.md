---
title: "CloseEvent: thuộc tính wasClean"
short-title: wasClean
slug: Web/API/CloseEvent/wasClean
page-type: web-api-instance-property
browser-compat: api.CloseEvent.wasClean
---

{{APIRef("Websockets API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`wasClean`** của giao diện {{domxref("CloseEvent")}} trả về `true` nếu kết nối đã được đóng sạch sẽ.

## Giá trị

Một giá trị boolean. `true` nếu kết nối đã được đóng sạch sẽ, ngược lại là `false`.

## Ví dụ

Ví dụ sau ghi giá trị của `wasClean` ra console.

```js
WebSocket.onclose = (event) => {
  console.log(event.wasClean);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
