---
title: "FederatedCredential: FederatedCredential() constructor"
short-title: FederatedCredential()
slug: Web/API/FederatedCredential/FederatedCredential
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.FederatedCredential.FederatedCredential
---

{{APIRef("Credential Management API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Hàm khởi tạo **`FederatedCredential()`** tạo một đối tượng {{domxref("FederatedCredential")}} mới. Trong các trình duyệt hỗ trợ, một phiên bản của lớp này có thể được truyền vào `credential` nhận được từ đối tượng `init` cho hàm toàn cục {{domxref("Window/fetch", "fetch()")}}.

## Cú pháp

```js-nolint
new FederatedCredential(data)
```

### Tham số

- `data`
  - : Đối tượng {{domxref("FederatedCredentialInit")}}. Một đối tượng với các thuộc tính sau:
    - `name` {{optional_inline}}
      - : Chuỗi đại diện cho tên người dùng của thông tin xác thực.
    - `iconURL` {{optional_inline}}
      - : Chuỗi đại diện cho URL của biểu tượng hoặc ảnh đại diện liên kết với thông tin xác thực.
    - `origin`
      - : Chuỗi đại diện cho nguồn gốc của thông tin xác thực. Các đối tượng {{domxref("FederatedCredential")}} bị ràng buộc theo nguồn gốc, vì vậy chúng chỉ có thể sử dụng trên nguồn gốc được chỉ định ở đây.
    - `provider`
      - : Chuỗi xác định nhà cung cấp danh tính liên kết của thông tin xác thực, được chỉ định là nguồn gốc mà nhà cung cấp dùng để đăng nhập người dùng (ví dụ: `"https://www.facebook.com"` hoặc `"https://accounts.google.com"`).
    - `protocol` {{optional_inline}}
      - : Chuỗi đại diện cho giao thức của nhà cung cấp danh tính liên kết của thông tin xác thực (ví dụ: `"openidconnect"`).

## Ví dụ

### Tạo thông tin xác thực danh tính liên kết

```js
const credData = {
  id: "1234",
  name: "Serpentina",
  origin: "https://example.org",
  protocol: "openidconnect",
  provider: "https://provider.example.org",
};

const fedCred = new FederatedCredential(credData);

// Store it
navigator.credentials.store(fedCred).then(() => {
  // Do something else
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
