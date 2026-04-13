---
title: "WebSocket: thuộc tính protocol"
short-title: protocol
slug: Web/API/WebSocket/protocol
page-type: web-api-instance-property
browser-compat: api.WebSocket.protocol
---

{{APIRef("WebSockets API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`WebSocket.protocol`** trả về tên của [giao thức phụ](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#subprotocols) mà máy chủ đã chọn; đây sẽ là một trong các chuỗi được chỉ định trong tham số [`protocols`](/en-US/docs/Web/API/WebSocket/WebSocket#protocols) khi tạo đối tượng {{domxref("WebSocket")}}, hoặc chuỗi rỗng nếu chưa thiết lập kết nối.

## Giá trị

Một chuỗi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{httpheader("Sec-WebSocket-Protocol")}}
