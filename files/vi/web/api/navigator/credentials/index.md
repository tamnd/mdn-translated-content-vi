---
title: "Navigator: thuộc tính credentials"
short-title: credentials
slug: Web/API/Navigator/credentials
page-type: web-api-instance-property
browser-compat: api.Navigator.credentials
---

{{securecontext_header}}{{APIRef("Credential Management API")}}

Thuộc tính chỉ đọc **`credentials`** của giao diện {{domxref("Navigator")}} trả về đối tượng {{domxref("CredentialsContainer")}} được liên kết với tài liệu hiện tại, hiển thị các phương thức yêu cầu thông tin xác thực. Giao diện {{domxref("CredentialsContainer")}} cũng thông báo cho tác nhân người dùng khi một sự kiện thú vị xảy ra, chẳng hạn như đăng nhập hoặc đăng xuất thành công. Giao diện này có thể được sử dụng để phát hiện tính năng.

## Giá trị

Đối tượng {{domxref("CredentialsContainer")}}.

## Ví dụ

```js
if ("credentials" in navigator) {
  navigator.credentials.get({ password: true }).then((creds) => {
    // Do something with the credentials.
  });
} else {
  // Handle sign-in the way you did before.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
