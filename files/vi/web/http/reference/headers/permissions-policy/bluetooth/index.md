---
title: "Permissions-Policy: chỉ thị bluetooth"
short-title: bluetooth
slug: Web/HTTP/Reference/Headers/Permissions-Policy/bluetooth
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.bluetooth
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `bluetooth` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng [Web Bluetooth API](/en-US/docs/Web/API/Web_Bluetooth_API) hay không.

Cụ thể, khi một chính sách đã được xác định không cho phép sử dụng tính năng này, các phương thức của đối tượng {{domxref('Bluetooth')}} được trả về bởi {{domxref('Navigator.bluetooth')}} sẽ chặn quyền truy cập:

- {{DOMxRef("Bluetooth.getAvailability()")}} sẽ luôn hoàn thành {{jsxref("Promise")}} được trả về với giá trị `false`.
- {{DOMxRef("Bluetooth.getDevices()")}} sẽ từ chối {{jsxref("Promise")}} được trả về với `SecurityError` {{domxref("DOMException")}}.
- {{DOMxRef("Bluetooth.requestDevice()")}} sẽ từ chối {{jsxref("Promise")}} được trả về với `SecurityError` {{domxref("DOMException")}}.

## Cú pháp

```http
Permissions-Policy: bluetooth=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `bluetooth` là `self`. Ngữ cảnh duyệt web cấp cao nhất và các iframe cùng nguồn gốc được phép truy cập tính năng `bluetooth` theo mặc định.

## Ví dụ

### Sử dụng cơ bản

SecureCorp Inc. muốn vô hiệu hóa `bluetooth` trong tất cả các iframe cross-origin ngoại trừ những iframe có nguồn gốc là `https://example.com`. Họ có thể làm điều đó bằng cách gửi header phản hồi HTTP sau để định nghĩa Permissions Policy:

```http
Permissions-Policy: bluetooth=(self "https://example.com")
```

SecureCorp Inc. cũng phải bao gồm thuộc tính {{HTMLElement('iframe','allow','#Attributes')}} trên mỗi phần tử `<iframe>` mà `bluetooth` được phép:

```html
<iframe src="https://example.com/blue" allow="bluetooth"></iframe>
```

> [!NOTE]
> Chỉ định header `Permissions-Policy` theo cách này sẽ vô hiệu hóa `bluetooth` cho các nguồn gốc khác, ngay cả khi chúng được cho phép bởi thuộc tính `allow` của `<iframe>`.

### Sử dụng chính sách mặc định

Nếu danh sách cho phép cho `bluetooth` không được xác định bởi header phản hồi `Permissions-Policy`, các tác nhân người dùng sẽ áp dụng danh sách cho phép mặc định `self`. Trong chế độ này, `bluetooth` được tự động cho phép trong ngữ cảnh duyệt web cấp cao nhất và các iframe cùng nguồn gốc, nhưng không được phép trong các iframe cross-origin.

Để cho phép `bluetooth` trong một iframe cross-origin, hãy bao gồm thuộc tính {{HTMLElement('iframe','allow','#Attributes')}} trên phần tử `<iframe>`:

```html
<iframe src="https://other.com/blue" allow="bluetooth"></iframe>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
