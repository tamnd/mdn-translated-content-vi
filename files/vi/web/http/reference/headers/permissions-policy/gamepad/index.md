---
title: "Permissions-Policy: chỉ thị gamepad"
short-title: gamepad
slug: Web/HTTP/Reference/Headers/Permissions-Policy/gamepad
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.gamepad
spec-urls: https://www.w3.org/TR/gamepad/#permission-policy
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `gamepad` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng [Gamepad API](/en-US/docs/Web/API/Gamepad_API) hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các lần gọi {{domxref('Navigator.getGamepads()')}} sẽ ném `SecurityError` {{domxref('DOMException')}}. Ngoài ra, các sự kiện {{domxref("Window.gamepadconnected_event", "gamepadconnected")}} và {{domxref("Window.gamepaddisconnected_event", "gamepaddisconnected")}} sẽ không được kích hoạt.

## Cú pháp

```http
Permissions-Policy: gamepad=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `gamepad` là `*`.

## Ví dụ

### Ví dụ chung

SecureCorp Inc. muốn tắt Gamepad API trong tất cả các ngữ cảnh duyệt web ngoại trừ nguồn gốc của chính nó và những nguồn gốc có origin là `https://example.com`.
Họ có thể làm điều đó bằng cách gửi header phản hồi HTTP sau để định nghĩa Permissions Policy:

```http
Permissions-Policy: gamepad=(self "https://example.com")
```

### Với phần tử \<iframe>

FastCorp Inc. muốn tắt `gamepad` cho tất cả các frame con cross-origin, ngoại trừ một `<iframe>` cụ thể.
Họ có thể làm điều đó bằng cách gửi header phản hồi HTTP sau để định nghĩa Permissions Policy:

```http
Permissions-Policy: gamepad=(self)
```

Sau đó bao gồm thuộc tính {{HTMLElement('iframe','allow','#Attributes')}} trên phần tử `<iframe>`:

```html
<iframe src="https://other.com/game" allow="gamepad"></iframe>
```

Các thuộc tính iframe có thể bật tính năng có chọn lọc trong một số frame nhất định, và không bật trong các frame khác, ngay cả khi các frame đó chứa tài liệu từ cùng nguồn gốc.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
