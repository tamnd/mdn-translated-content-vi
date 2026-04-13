---
title: "WebSocketStream: thuộc tính url"
short-title: url
slug: Web/API/WebSocketStream/url
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.WebSocketStream.url
---

{{APIRef("WebSockets API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`url`** của giao diện {{domxref("WebSocketStream")}} trả về URL của máy chủ WebSocket mà thể hiện `WebSocketStream` được tạo với.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const wss = new WebSocketStream("wss://example.com/wss");

// Ghi "example.com/wss" ra console
console.log(wss.url);
```

## Thông số kỹ thuật

Hiện chưa thuộc bất kỳ đặc tả nào. Xem https://github.com/whatwg/websockets/pull/48 để theo dõi tiến trình chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebSocketStream: tích hợp streams với WebSocket API](https://developer.chrome.com/docs/capabilities/web-apis/websocketstream), developer.chrome.com (2020)
