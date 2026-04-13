---
title: "EventSource: phương thức close()"
short-title: close()
slug: Web/API/EventSource/close
page-type: web-api-instance-method
browser-compat: api.EventSource.close
---

{{APIRef("Server Sent Events")}}{{AvailableInWorkers}}

Phương thức **`close()`** của giao diện {{domxref("EventSource")}} đóng kết nối, nếu có, và đặt thuộc tính {{domxref("EventSource.readyState")}} thành `2` (closed).

> [!NOTE]
> Nếu kết nối đã đóng, phương thức này không làm gì cả.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const button = document.querySelector("button");
const evtSource = new EventSource("sse.php");

button.onclick = () => {
  console.log("Connection closed");
  evtSource.close();
};
```

> [!NOTE]
> Bạn có thể tìm thấy một ví dụ đầy đủ trên GitHub, xem [Simple SSE demo using PHP](https://github.com/mdn/dom-examples/tree/main/server-sent-events).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("EventSource")}}
