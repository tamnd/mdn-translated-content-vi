---
title: "WebSocket: thuộc tính readyState"
short-title: readyState
slug: Web/API/WebSocket/readyState
page-type: web-api-instance-property
browser-compat: api.WebSocket.readyState
---

{{APIRef("WebSockets API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`WebSocket.readyState`** trả về trạng thái hiện tại của kết nối {{domxref("WebSocket")}}.

## Giá trị

Một số nguyên là một trong bốn hằng trạng thái được định nghĩa trên giao diện {{domxref("WebSocket")}}:

- `WebSocket.CONNECTING` (0)
  - : Socket đã được tạo. Kết nối chưa mở.
- `WebSocket.OPEN` (1)
  - : Kết nối đang mở và sẵn sàng giao tiếp.
- `WebSocket.CLOSING` (2)
  - : Kết nối đang trong quá trình đóng.
- `WebSocket.CLOSED` (3)
  - : Kết nối đã đóng hoặc không thể được mở.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
