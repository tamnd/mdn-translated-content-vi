---
title: session.end command
short-title: session.end
slug: Web/WebDriver/Reference/BiDi/Modules/session/end
page-type: webdriver-command
status:
  - experimental
browser-compat: webdriver.bidi.session.end
sidebar: webdriver
---

{{SeeCompatTable}}

Lệnh `session.end` của module [command](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules#commands) [`session`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session) kết thúc phiên BiDi hiện tại của client với trình duyệt.

## Cú pháp

```json-nolint
{
  "method": "session.end",
  "params": {}
}
```

### Tham số

Không có. Tuy nhiên, bạn phải bao gồm trường `params` và đặt nó thành một đối tượng rỗng (`{}`).

### Giá trị trả về

Trường `result` trong phản hồi là một đối tượng rỗng (`{}`).

## Ví dụ

### Kết thúc một phiên tự động hóa với trình duyệt

Khi đã thiết lập kết nối [WebDriver BiDi](/en-US/docs/Web/WebDriver/How_to/Create_BiDi_connection), hãy gửi thông điệp sau để kết thúc phiên hiện tại:

```json
{
  "id": 2,
  "method": "session.end",
  "params": {}
}
```

Trình duyệt sẽ phản hồi:

```json
{
  "id": 2,
  "type": "success",
  "result": {}
}
```

Phản hồi thành công được nhận trước khi kết nối WebSocket đóng lại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Lệnh [`session.new`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/new)
- Lệnh [`session.status`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/status)
