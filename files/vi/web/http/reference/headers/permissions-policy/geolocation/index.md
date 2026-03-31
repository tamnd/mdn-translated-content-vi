---
title: "Permissions-Policy: chỉ thị geolocation"
short-title: geolocation
slug: Web/HTTP/Reference/Headers/Permissions-Policy/geolocation
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.geolocation
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `geolocation` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng giao diện {{domxref('Geolocation')}} hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các lần gọi {{domxref('Geolocation.getCurrentPosition','getCurrentPosition()')}} và {{domxref('Geolocation.watchPosition','watchPosition()')}} sẽ khiến các callback của các hàm đó được gọi với mã {{domxref('GeolocationPositionError')}} là `PERMISSION_DENIED`.

## Cú pháp

```http
Permissions-Policy: geolocation=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `geolocation` là `self`. Ngữ cảnh duyệt web cấp cao nhất và các iframe cùng nguồn gốc được phép truy cập tính năng `geolocation` theo mặc định.

## Ví dụ

### Sử dụng cơ bản

SecureCorp Inc. muốn vô hiệu hóa `geolocation` trong tất cả các iframe cross-origin ngoại trừ những iframe có nguồn gốc là `https://example.com`. Họ có thể làm điều đó bằng cách gửi header phản hồi HTTP sau để định nghĩa Permissions Policy:

```http
Permissions-Policy: geolocation=(self "https://example.com")
```

SecureCorp Inc. cũng phải bao gồm thuộc tính {{HTMLElement('iframe','allow','#Attributes')}} trên mỗi phần tử `<iframe>` mà `geolocation` được phép:

```html
<iframe src="https://example.com/map" allow="geolocation"></iframe>
```

> [!NOTE]
> Chỉ định header `Permissions-Policy` theo cách này sẽ vô hiệu hóa `geolocation` cho các nguồn gốc khác, ngay cả khi chúng được cho phép bởi thuộc tính `allow` của `<iframe>`.

### Sử dụng chính sách mặc định

Nếu danh sách cho phép cho `geolocation` không được xác định bởi header phản hồi `Permissions-Policy`, các tác nhân người dùng sẽ áp dụng danh sách cho phép mặc định `self`. Trong chế độ này, `geolocation` được tự động cho phép trong ngữ cảnh duyệt web cấp cao nhất và các iframe cùng nguồn gốc, nhưng không được phép trong các iframe cross-origin.

Để cho phép `geolocation` trong một iframe cross-origin, hãy bao gồm thuộc tính {{HTMLElement('iframe','allow','#Attributes')}} trên phần tử `<iframe>`:

```html
<iframe src="https://other.com/store-locator" allow="geolocation"></iframe>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
