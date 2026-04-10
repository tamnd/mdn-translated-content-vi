---
title: "WebSocket: thuộc tính bufferedAmount"
short-title: bufferedAmount
slug: Web/API/WebSocket/bufferedAmount
page-type: web-api-instance-property
browser-compat: api.WebSocket.bufferedAmount
---

{{APIRef("WebSockets API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`WebSocket.bufferedAmount`** trả về số byte dữ liệu đã được xếp hàng bằng các lời gọi [`send()`](/en-US/docs/Web/API/WebSocket/send) nhưng chưa được truyền tới mạng. Giá trị này sẽ đặt lại về không khi toàn bộ dữ liệu đã xếp hàng được gửi xong. Giá trị này không đặt lại về không khi kết nối bị đóng; nếu bạn tiếp tục gọi [`send()`](/en-US/docs/Web/API/WebSocket/send), giá trị này sẽ tiếp tục tăng.

## Giá trị

Một `unsigned long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
