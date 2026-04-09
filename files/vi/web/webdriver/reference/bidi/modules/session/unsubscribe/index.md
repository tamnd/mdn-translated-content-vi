---
title: session.unsubscribe command
short-title: session.unsubscribe
slug: Web/WebDriver/Reference/BiDi/Modules/session/unsubscribe
page-type: webdriver-command
browser-compat: webdriver.bidi.session.unsubscribe
sidebar: webdriver
---

Lệnh `session.unsubscribe` của module [command](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules#commands) [`session`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session) hủy các đăng ký sự kiện đã được tạo trước đó bằng [`session.subscribe`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/subscribe), theo ID subscription hoặc theo tên sự kiện.

## Cú pháp

Để hủy đăng ký bằng ID subscription:

```json-nolint
{
  "method": "session.unsubscribe",
  "params": {
    "subscriptions": ["<subscription ID>"]
  }
}
```

Để hủy đăng ký bằng tên sự kiện:

```json-nolint
{
  "method": "session.unsubscribe",
  "params": {
    "events": ["<event name>"]
  }
}
```

### Tham số

Trường `params` chứa một trong các trường sau:

- `subscriptions`
  - : Một mảng gồm một hoặc nhiều ID subscription chỉ định các subscription cần hủy, bao gồm cả subscription toàn cục và subscription giới hạn theo context.
- `events`
  - : Một mảng gồm một hoặc nhiều chuỗi chỉ định tên sự kiện để hủy các subscription.
    Mỗi chuỗi có thể là một tên sự kiện cụ thể, chẳng hạn `"log.entryAdded"`, hoặc tên module, chẳng hạn `"log"`, để hủy đăng ký client khỏi tất cả sự kiện trong module đó.
    Chỉ các subscription toàn cục mới có thể được xóa bằng tên sự kiện; các subscription được tạo bằng [`contexts`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/subscribe#contexts) hoặc [`userContexts`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/subscribe#usercontexts) thì không thể.

### Giá trị trả về

Trường `result` trong phản hồi là một đối tượng rỗng (`{}`).

### Lỗi

- [`invalid argument`](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidArgument)
  - : Khi hủy đăng ký bằng ID, một ID subscription không được tìm thấy.
    Khi hủy đăng ký bằng tên sự kiện, mảng `events` rỗng hoặc bị bỏ qua, hoặc một tên sự kiện không khớp với bất kỳ subscription toàn cục đang hoạt động nào.

## Ví dụ

### Hủy đăng ký bằng ID subscription

Với một subscription đang hoạt động, hãy gửi thông điệp sau để hủy nó bằng ID:

```json
{
  "id": 3,
  "method": "session.unsubscribe",
  "params": {
    "subscriptions": ["c7b7b3a2-1f4b-4b4e-8a1f-2a3b4c5d6e7f"]
  }
}
```

Sau khi hủy đăng ký thành công, trình duyệt phản hồi như sau:

```json
{
  "id": 3,
  "type": "success",
  "result": {}
}
```

### Hủy đăng ký một sự kiện ở phạm vi toàn cục bằng tên sự kiện

Khi đang có subscription toàn cục cho `log.entryAdded`, hãy gửi thông điệp sau để ngừng nhận sự kiện đó:

```json
{
  "id": 4,
  "method": "session.unsubscribe",
  "params": {
    "events": ["log.entryAdded"]
  }
}
```

Sau khi hủy đăng ký thành công, trình duyệt phản hồi như sau:

```json
{
  "id": 4,
  "type": "success",
  "result": {}
}
```

### Hủy đăng ký nhiều sự kiện ở phạm vi toàn cục bằng tên sự kiện

Khi đang có các subscription toàn cục, hãy gửi thông điệp sau để hủy đăng ký khỏi tất cả sự kiện trong module `log` và một sự kiện cụ thể từ module `network`:

```json
{
  "id": 5,
  "method": "session.unsubscribe",
  "params": {
    "events": ["log", "network.beforeRequestSent"]
  }
}
```

Sau khi hủy đăng ký thành công, trình duyệt phản hồi như sau:

```json
{
  "id": 5,
  "type": "success",
  "result": {}
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Lệnh [`session.subscribe`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/subscribe)
- Lệnh [`session.new`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/new)
- Lệnh [`session.end`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/end)
