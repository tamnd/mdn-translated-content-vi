---
title: IdentityCredentialError
slug: Web/API/IdentityCredentialError
page-type: web-api-interface
status:
  - experimental
browser-compat: api.IdentityCredentialError
---

{{APIRef("FedCM API")}}{{SecureContext_Header}}{{SeeCompatTable}}

Giao diện **`IdentityCredentialError`** của {{domxref("FedCM API", "FedCM API", "", "nocode")}} mô tả một lỗi xác thực cho biết user agent không nhận được identity assertion sau khi người dùng đã yêu cầu sử dụng một tài khoản liên kết. Điều này có thể xảy ra nếu client không được ủy quyền hoặc nếu server tạm thời không khả dụng, ví dụ.

Các trình duyệt có thể sử dụng kiểu lỗi này để hiển thị thông báo lỗi trong giao diện người dùng.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("IdentityCredentialError.IdentityCredentialError", "IdentityCredentialError()")}} {{experimental_inline}}
  - : Tạo một phiên bản đối tượng `IdentityCredentialError` mới.

## Thuộc tính phiên bản

_Ngoài các thuộc tính bên dưới, `IdentityCredentialError` kế thừa các thuộc tính từ phần tử cha, {{DOMxRef("DOMException")}}_.

- {{domxref("IdentityCredentialError.error", "error")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Một chuỗi. Đây có thể là một trong các giá trị được liệt kê trong [danh sách lỗi được chỉ định bởi OAuth 2.0](https://datatracker.ietf.org/doc/html/rfc6749#section-4.1.2.1) hoặc một chuỗi tùy ý.
- {{domxref("IdentityCredentialError.url", "url")}} {{Experimental_Inline}} {{ReadOnlyInline}}
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
