---
title: "IdentityCredential: disconnect() static method"
short-title: disconnect()
slug: Web/API/IdentityCredential/disconnect_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.IdentityCredential.disconnect_static
---

{{APIRef("FedCM API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức tĩnh **`disconnect()`** của giao diện {{domxref("IdentityCredential")}} ngắt kết nối tài khoản đăng nhập liên kết được chỉ định khỏi {{glossary("Identity provider", "IdP")}} được sử dụng để lấy thông tin xác thực.

Sau đó, việc sử dụng tài khoản đó để đăng nhập liên kết yêu cầu phải bắt đầu lại quy trình đăng nhập liên kết.

## Cú pháp

```js-nolint
IdentityCredential.disconnect(options)
```

### Tham số

- `options`
  - : Đối tượng tùy chọn, có thể chứa các thuộc tính sau:
    - `accountHint`
      - : Một chuỗi chỉ định gợi ý tài khoản mà IdP sử dụng để xác định tài khoản cần ngắt kết nối.
    - `clientId`
      - : Một chuỗi chỉ định định danh client của {{glossary("Relying party", "RP")}}.
    - `configURL`
      - : Một chuỗi chỉ định URL tệp cấu hình của IdP.

### Giá trị trả về

Một {{jsxref("Promise")}} hoàn thành với {{jsxref("undefined")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `configURL` của IdP không hợp lệ hoặc thiếu `disconnect_endpoint`.
- `NetworkError` {{domxref("DOMException")}}
  - : Được ném ra nếu trình duyệt không thể kết nối với IdP.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `<iframe>` nhúng không có [Permissions-Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{httpheader("Permissions-Policy/identity-credentials-get", "identity-credentials-get")}} được đặt để cho phép sử dụng `disconnect()`.

## Ví dụ

### Sử dụng cơ bản `disconnect()`

RP có thể ngắt kết nối tài khoản đăng nhập liên kết được chỉ định khỏi IdP liên kết bằng cách gọi `disconnect()`:

```js
IdentityCredential.disconnect({
  configURL: "https://idp.example.com/config.json",
  clientId: "rp123",
  accountHint: "account456",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management API](https://developer.chrome.com/docs/identity/fedcm/overview) trên developer.chrome.com (2023)
