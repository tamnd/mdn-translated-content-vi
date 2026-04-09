---
title: webSocketUrl
slug: Web/WebDriver/Reference/Capabilities/webSocketUrl
page-type: webdriver-capability
sidebar: webdriver
---

Khi capability `webSocketUrl` được đặt thành `true`, một máy chủ WebSocket sẽ được khởi chạy trong trình duyệt, hỗ trợ giao tiếp hai chiều bằng giao thức [WebDriver BiDi](https://w3c.github.io/webdriver-bidi/).
Khi [yêu cầu New Session](/en-US/docs/Web/WebDriver/Reference/Commands/NewSession) có capability `webSocketUrl` được đặt thành `true`, và phiên khởi tạo thành công, giá trị của trường `capabilities` trong phản hồi sẽ có thuộc tính `webSocketUrl` được đặt thành URL của máy chủ WebSocket.

## Ví dụ

Yêu cầu URL WebSocket bằng cách đặt capability `webSocketUrl` thành `true`:

Yêu cầu:

```http
POST /session HTTP/1.1
{"capabilities": {"alwaysMatch": {"webSocketUrl": true}}}
```

Phản hồi:

```json
{
  "value": {
    "capabilities": {
      "webSocketUrl": "ws://localhost:9222/session/571f206f-c3fe-794c-9218-77fa89595eb9"
    },
    "sessionId": "571f206f-c3fe-794c-9218-77fa89595eb9"
  }
}
```

## Xem thêm

- [Danh sách các capability WebDriver](/en-US/docs/Web/WebDriver/Reference/Capabilities)
- Lệnh [New Session](/en-US/docs/Web/WebDriver/Reference/Commands/NewSession)
- [Thiết lập kết nối WebDriver BiDi](https://w3c.github.io/webdriver-bidi/#establishing)
