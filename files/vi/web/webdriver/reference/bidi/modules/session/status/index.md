---
title: session.status command
short-title: session.status
slug: Web/WebDriver/Reference/BiDi/Modules/session/status
page-type: webdriver-command
browser-compat: webdriver.bidi.session.status
sidebar: webdriver
---

Lệnh `session.status` của module [command](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules#commands) [`session`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session) trả về thông tin về việc trình duyệt có thể tạo các phiên BiDi mới hay không, và cũng có thể bao gồm thêm thông tin meta tùy ý.

Vì lệnh này được dùng để kiểm tra trạng thái của trình duyệt trước khi tạo một phiên mới, nó chạy mà không có phiên nào đang hoạt động sẵn. (Trong BiDi, một lệnh như vậy được gọi là lệnh tĩnh.)

## Cú pháp

```json-nolint
{
  "method": "session.status",
  "params": {}
}
```

### Tham số

Không có. Tuy nhiên, bạn phải bao gồm trường `params` và đặt nó thành một đối tượng rỗng (`{}`).

### Giá trị trả về

Đối tượng `result` trong phản hồi với các trường sau:

- `ready`
  - : Một giá trị boolean cho biết trình duyệt có sẵn sàng tạo các phiên mới hay không.
    - `true`
      - : Trình duyệt sẵn sàng tạo một phiên mới.
    - `false`
      - : Trình duyệt không thể chấp nhận phiên mới vì nó đã có một phiên đang hoạt động hoặc đang ở trạng thái khác khiến việc tạo phiên sẽ thất bại.
- `message`
  - : Một chuỗi chứa thông tin về trạng thái hiện tại của trình duyệt.

## Ví dụ

### Kiểm tra trạng thái trình duyệt trước khi tạo một phiên

Khi đã thiết lập kết nối [WebDriver BiDi](/en-US/docs/Web/WebDriver/How_to/Create_BiDi_connection), hãy gửi thông điệp sau để kiểm tra xem trình duyệt có sẵn sàng tạo một phiên mới hay không:

```json
{
  "id": 1,
  "method": "session.status",
  "params": {}
}
```

Khi trình duyệt sẵn sàng, nó phản hồi như sau:

```json
{
  "id": 1,
  "type": "success",
  "result": {
    "ready": true,
    "message": ""
  }
}
```

Nếu trình duyệt đã có một phiên đang hoạt động, phản hồi có thể như sau:

```json
{
  "id": 1,
  "type": "success",
  "result": {
    "ready": false,
    "message": "Session already started"
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Lệnh [`session.new`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/new)
- Lệnh [`session.end`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/end)
