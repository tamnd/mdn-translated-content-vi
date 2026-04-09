---
title: session.subscribe command
short-title: session.subscribe
slug: Web/WebDriver/Reference/BiDi/Modules/session/subscribe
page-type: webdriver-command
browser-compat: webdriver.bidi.session.subscribe
sidebar: webdriver
---

Lệnh `session.subscribe` của module [command](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules#commands) [`session`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session) đăng ký để client nhận các sự kiện không đồng bộ, theo từng sự kiện hoặc theo từng module, ở phạm vi toàn cục hoặc giới hạn cho các context cụ thể.

## Cú pháp

```json-nolint
{
  "method": "session.subscribe",
  "params": {
    "events": ["<event name>"]
  }
}
```

### Tham số

Trường `params` chứa:

- `events`
  - : Một mảng gồm một hoặc nhiều chuỗi tên sự kiện. Dùng tên module, chẳng hạn `"log"`, để đăng ký tất cả sự kiện trong module đó, hoặc một tên sự kiện cụ thể, chẳng hạn `"log.entryAdded"`, để chỉ đăng ký sự kiện đó.
- `contexts` {{optional_inline}}
  - : Một mảng gồm một hoặc nhiều mã định danh context ([UUIDs](/en-US/docs/Glossary/UUID)), mỗi mã tương ứng với một tab hoặc frame.
    Nếu được chỉ định, sự kiện chỉ được nhận cho các context đó và các context con của chúng.
    Nếu mã context tương ứng với một frame, subscription sẽ được tạo cho context cấp cao nhất (tab) sở hữu frame đó.

    Trường này không thể dùng nếu `userContexts` cũng được chỉ định.

- `userContexts` {{optional_inline}}
  - : Một mảng gồm một hoặc nhiều mã định danh user context, mỗi mã tương ứng với một browser context hoặc container.
    Nếu được chỉ định, sự kiện chỉ được nhận cho các user context đó.

    Trường này không thể dùng nếu `contexts` cũng được chỉ định.

Nếu không cung cấp `contexts` cũng không cung cấp `userContexts`, subscription là toàn cục, nên sự kiện được nhận cho tất cả các context.

### Giá trị trả về

Trường `result` trong phản hồi là một đối tượng với trường sau:

- `subscription`
  - : Một chuỗi chứa mã định danh duy nhất cho subscription này.

### Lỗi

- [`invalid argument`](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidArgument)
  - : Được ném trong bất kỳ trường hợp nào sau đây:
    - Mảng `events` rỗng, bị bỏ qua, hoặc chứa tên sự kiện không được nhận diện.
    - `contexts` hoặc `userContexts` được cung cấp nhưng rỗng.
    - Cả `contexts` và `userContexts` đều được cung cấp trong cùng một yêu cầu.
    - Một giá trị tham số có kiểu không hợp lệ.

## Ví dụ

### Đăng ký một sự kiện ở phạm vi toàn cục

Khi đã thiết lập kết nối [WebDriver BiDi](/en-US/docs/Web/WebDriver/How_to/Create_BiDi_connection) và có một [phiên đang hoạt động](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/new), hãy gửi thông điệp sau để đăng ký sự kiện `log.entryAdded` cho tất cả context:

```json
{
  "id": 2,
  "method": "session.subscribe",
  "params": {
    "events": ["log.entryAdded"]
  }
}
```

Trình duyệt phản hồi bằng một ID subscription như sau:

```json
{
  "id": 2,
  "type": "success",
  "result": {
    "subscription": "c7b7b3a2-1f4b-4b4e-8a1f-2a3b4c5d6e7f"
  }
}
```

### Đăng ký nhiều sự kiện ở phạm vi toàn cục

Khi đã thiết lập kết nối [WebDriver BiDi](/en-US/docs/Web/WebDriver/How_to/Create_BiDi_connection) và có một [phiên đang hoạt động](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/new), hãy gửi thông điệp sau để đăng ký tất cả sự kiện trong module `log` và một sự kiện cụ thể từ module `network`:

```json
{
  "id": 3,
  "method": "session.subscribe",
  "params": {
    "events": ["log", "network.beforeRequestSent"]
  }
}
```

Trình duyệt phản hồi bằng một ID subscription như sau:

```json
{
  "id": 3,
  "type": "success",
  "result": {
    "subscription": "e9d0a5c4-3h6d-6d6g-0c3h-4c5d6e7f8g9h"
  }
}
```

### Đăng ký sự kiện giới hạn theo một tab

Giả sử quá trình tự động hóa của bạn có hai tab đang mở - một cho trang chủ và một cho trang thanh toán. Để nhận các sự kiện `log.entryAdded` chỉ từ tab Checkout, hãy gửi thông điệp sau với mã định danh context của tab đó:

```json
{
  "id": 4,
  "method": "session.subscribe",
  "params": {
    "events": ["log.entryAdded"],
    "contexts": ["9b4e2f1a-3c7d-4b8e-a2f5-6d1c9e3b7f4a"]
  }
}
```

Trình duyệt phản hồi bằng một ID subscription như sau:

```json
{
  "id": 4,
  "type": "success",
  "result": {
    "subscription": "a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d"
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Lệnh [`session.unsubscribe`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/unsubscribe)
- Lệnh [`session.new`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/new)
- Lệnh [`session.end`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/end)
