---
title: WebDriver BiDi modules
short-title: Modules
slug: Web/WebDriver/Reference/BiDi/Modules
page-type: listing-page
browser-compat: webdriver.bidi
sidebar: webdriver
---

Giao thức WebDriver BiDi được tổ chức thành các module.
Mỗi module đại diện cho một tập hợp các [lệnh](#commands) và [sự kiện](#events) liên quan được dùng trong các trường hợp tự động hóa trình duyệt cụ thể.

Cả tên lệnh lẫn tên sự kiện đều dùng tên module làm tiền tố: `module_name.command_name` cho lệnh và `module_name.event_name` cho sự kiện.

## Danh sách module

{{SubpagesWithSummaries}}

## Lệnh

Một lệnh là một thao tác bất đồng bộ được gửi từ client tới trình duyệt. Mỗi thông điệp lệnh bạn gửi tới trình duyệt có ba trường:

- `id`: Một số do bạn gán cho lệnh. Không giống HTTP, nơi mỗi yêu cầu chờ phản hồi, một kết nối WebSocket có thể có nhiều lệnh đang bay cùng lúc và phản hồi có thể đến không theo thứ tự. `id` cho phép bạn khớp mỗi phản hồi với lệnh đã kích hoạt nó.
- `method`: Lệnh cần chạy, dưới dạng `module_name.command_name`.
- `params`: Một đối tượng chứa mọi thông tin bổ sung mà lệnh cần. Một số lệnh không cần tham số, nhưng vẫn phải gửi một đối tượng `params` rỗng (`{}`).

Ví dụ, để tạo một phiên mới, bạn sẽ gửi lệnh [`session.new`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/new) như sau:

```json
{
  "id": 1,
  "method": "session.new",
  "params": {}
}
```

Mỗi lệnh sẽ dẫn đến hoặc một phản hồi thành công chứa trường `result`, hoặc một phản hồi lỗi chứa trường `error`. Cấu trúc của `result` là riêng cho từng lệnh.

Tất cả các lệnh, ngoại trừ [`session.new`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/new) và [`session.status`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/status), đều yêu cầu một phiên WebDriver BiDi đang hoạt động.

## Sự kiện

Một sự kiện là một thông báo được trình duyệt gửi tới client khi có điều gì đó đáng chú ý xảy ra.
Để nhận sự kiện, client trước tiên phải đăng ký chúng bằng lệnh `session.subscribe`.

Client có thể đăng ký một sự kiện cụ thể hoặc tất cả sự kiện trong một module. Ví dụ, đăng ký `"browsingContext.contextCreated"` sẽ đăng ký client cho chỉ sự kiện đó, còn đăng ký `"browsingContext"` sẽ đăng ký client cho mọi sự kiện trong module `browsingContext`.

Sau đây là một thông điệp sự kiện mẫu được trình duyệt gửi khi client đã đăng ký `log.entryAdded` và một thông điệp console được ghi lại (một số trường đã được lược bớt để ngắn gọn):

```json
{
  "type": "event",
  "method": "log.entryAdded",
  "params": {
    "type": "console",
    "method": "log",
    "realm": null,
    "level": "info",
    "text": "Hello world",
    "timestamp": 1657282076037
  }
}
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebDriver BiDi web client](https://firefox-dev.tools/bidi-web-client/web/)
