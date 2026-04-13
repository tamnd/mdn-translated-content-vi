---
title: "IdentityCredentialError: hàm khởi tạo IdentityCredentialError()"
short-title: IdentityCredentialError()
slug: Web/API/IdentityCredentialError/IdentityCredentialError
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.IdentityCredentialError.IdentityCredentialError
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}{{SeeCompatTable}}

Hàm khởi tạo **`IdentityCredentialError()`** tạo một đối tượng {{domxref("IdentityCredentialError")}} mới.

## Cú pháp

```js-nolint
new IdentityCredentialError()
new IdentityCredentialError(message)
new IdentityCredentialError(message, options)
```

### Tham số

- `message`
  - : Mô tả lỗi. Nếu không có, chuỗi rỗng `''` được sử dụng.
- `options` {{optional_inline}}
  - : Một đối tượng có thể có các thuộc tính sau:
    - `error` {{optional_inline}}
      - : Một chuỗi. Đây có thể là một trong các giá trị được liệt kê trong [danh sách lỗi được chỉ định bởi OAuth 2.0](https://datatracker.ietf.org/doc/html/rfc6749#section-4.1.2.1) hoặc một chuỗi tùy ý.
    - `url` {{optional_inline}}
      - : URL trỏ đến thông tin mà người dùng có thể đọc được về lỗi để hiển thị cho người dùng, chẳng hạn như cách khắc phục lỗi hoặc liên hệ với dịch vụ khách hàng.

## Ví dụ

```js
try {
  const cred = await navigator.credentials.get({
    identity: {
      providers: [
        {
          configURL: "https://idp.example/manifest.json",
          clientId: "1234",
        },
      ],
    },
  });
} catch (e) {
  const error = e.error;
  const url = e.url;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CredentialsContainer.get()")}}
- [Phản hồi lỗi ID assertion](/en-US/docs/Web/API/FedCM_API/IDP_integration#id_assertion_error_responses)
