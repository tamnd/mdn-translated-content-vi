---
title: "CloseEvent: thuộc tính reason"
short-title: reason
slug: Web/API/CloseEvent/reason
page-type: web-api-instance-property
browser-compat: api.CloseEvent.reason
---

{{APIRef("Websockets API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`reason`** của giao diện {{domxref("CloseEvent")}} trả về [lý do đóng kết nối WebSocket](https://www.rfc-editor.org/rfc/rfc6455.html#section-7.1.6) mà máy chủ cung cấp khi đóng kết nối; tức là một lời giải thích ngắn gọn, dễ đọc cho con người về việc đóng kết nối.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ sau ghi giá trị của `reason` ra console.

```js
WebSocket.onclose = (event) => {
  console.log(event.reason);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [RFC 6455](https://www.rfc-editor.org/rfc/rfc6455.html) (đặc tả WebSocket Protocol)
