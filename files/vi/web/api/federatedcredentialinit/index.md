---
title: FederatedCredentialInit
slug: Web/API/FederatedCredentialInit
page-type: web-api-interface
spec-urls: https://w3c.github.io/webappsec-credential-management/#dom-federatedcredential-federatedcredential
---

{{APIRef("Credential Management API")}}

Dictionary **`FederatedCredentialInit`** đại diện cho đối tượng được truyền vào {{domxref("CredentialsContainer.create()")}} như là giá trị của tùy chọn `federated`: tức là khi tạo đối tượng {{domxref("FederatedCredential")}} đại diện cho thông tin xác thực liên kết với nhà cung cấp danh tính liên kết.

> [!NOTE]
> [Federated Credential Management API (FedCM)](/en-US/docs/Web/API/FedCM_API) thay thế giao diện {{domxref("FederatedCredential")}} bằng giao diện {{domxref("IdentityCredential")}}.
>
> Dictionary `FederatedCredentialInit` không được sử dụng khi làm việc với giao diện `IdentityCredential`.

## Thuộc tính phiên bản

- `iconURL` {{optional_inline}}
  - : Chuỗi đại diện cho URL của biểu tượng hoặc avatar liên kết với thông tin xác thực.
- `id`
  - : Chuỗi đại diện cho ID duy nhất cho thông tin xác thực.
- `name` {{optional_inline}}
  - : Chuỗi đại diện cho tên người dùng của thông tin xác thực.
- `origin`
  - : Chuỗi đại diện cho origin của thông tin xác thực. Các đối tượng {{domxref("FederatedCredential")}} bị giới hạn theo origin, nghĩa là chúng chỉ có thể sử dụng trên origin được chỉ định mà chúng được tạo ra để sử dụng.
- `protocol` {{optional_inline}}
  - : Chuỗi đại diện cho giao thức của nhà cung cấp danh tính liên kết của thông tin xác thực (ví dụ: `"openidconnect"`).
- `provider`
  - : Chuỗi đại diện cho nhà cung cấp danh tính liên kết của thông tin xác thực (ví dụ: `"https://www.facebook.com"` hoặc `"https://accounts.google.com"`).

## Ví dụ

### Tạo thông tin xác thực danh tính liên kết

```js
const credInit = {
  id: "1234",
  name: "Serpentina",
  origin: "https://example.org",
  protocol: "openidconnect",
  provider: "https://provider.example.org",
};

const makeCredential = document.querySelector("#make-credential");

makeCredential.addEventListener("click", async () => {
  const cred = await navigator.credentials.create({
    federated: credInit,
  });
  console.log(cred.name);
  console.log(cred.provider);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{domxref("FederatedCredential")}}
