---
title: PasswordCredential
slug: Web/API/PasswordCredential
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PasswordCredential
---

{{SeeCompatTable}}{{APIRef("Credential Management API")}}{{securecontext_header}}

Giao diện **`PasswordCredential`** của [Credential Management API](/en-US/docs/Web/API/Credential_Management_API) cung cấp thông tin về cặp tên đăng nhập/mật khẩu. Trong các trình duyệt hỗ trợ, một phiên bản của lớp này có thể được truyền trong thành viên `credential` của đối tượng `init` cho {{domxref("Window/fetch", "fetch()")}} toàn cục.

> [!NOTE]
> Giao diện này bị giới hạn ở các ngữ cảnh cấp cao nhất và không thể được sử dụng từ {{HTMLElement("iframe")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PasswordCredential.PasswordCredential()","PasswordCredential()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `PasswordCredential` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ đối tượng cha, {{domxref("Credential")}}._

- {{domxref("PasswordCredential.iconURL")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi chứa URL trỏ đến hình ảnh cho một biểu tượng. Hình ảnh này dùng để hiển thị trong bộ chọn thông tin xác thực. URL phải có thể truy cập mà không cần xác thực.
- {{domxref("PasswordCredential.name")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi có thể đọc được bởi con người cung cấp tên công khai để hiển thị trong bộ chọn thông tin xác thực.
- {{domxref("PasswordCredential.password")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi chứa mật khẩu của thông tin xác thực.

## Phương thức phiên bản

Không có.

## Ví dụ

```js
const cred = new PasswordCredential({
  id,
  password,
  name,
  iconURL,
});

navigator.credentials.store(cred).then(() => {
  // Do something else.
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
