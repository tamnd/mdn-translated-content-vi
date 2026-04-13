---
title: FederatedCredential
slug: Web/API/FederatedCredential
page-type: web-api-interface
status:
  - experimental
browser-compat: api.FederatedCredential
---

{{SeeCompatTable}}{{APIRef("Credential Management API")}}{{SecureContext_Header}}

Giao diện **`FederatedCredential`** của [Credential Management API](/en-US/docs/Web/API/Credential_Management_API) cung cấp thông tin về thông tin xác thực từ nhà cung cấp danh tính liên kết. Nhà cung cấp danh tính liên kết là thực thể mà một trang web tin tưởng để xác thực người dùng đúng đắn và cung cấp API cho mục đích đó. [OpenID Connect](https://openid.net/developers/specs/) là một ví dụ về khung nhà cung cấp danh tính liên kết.

> [!NOTE]
> [Federated Credential Management API (FedCM)](/en-US/docs/Web/API/FedCM_API) cung cấp giải pháp hoàn chỉnh hơn để xử lý liên kết danh tính trong trình duyệt và sử dụng loại {{domxref("IdentityCredential")}}.

Trong các trình duyệt hỗ trợ, một phiên bản của lớp này có thể được truyền trong thành viên `credential` của đối tượng `init` cho hàm toàn cục {{domxref("Window/fetch", "fetch()")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("FederatedCredential.FederatedCredential()","FederatedCredential()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `FederatedCredential` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ tổ tiên, {{domxref("Credential")}}._

- {{domxref("FederatedCredential.provider")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về chuỗi chứa nhà cung cấp danh tính liên kết của thông tin xác thực.
- {{domxref("FederatedCredential.protocol")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về chuỗi chứa giao thức danh tính liên kết của thông tin xác thực.

## Phương thức phiên bản

Không có.

## Ví dụ

```js
const cred = new FederatedCredential({
  id,
  name,
  provider: "https://account.google.com",
  iconURL,
});

// Store it
navigator.credentials.store(cred).then(() => {
  // Do something else.
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
