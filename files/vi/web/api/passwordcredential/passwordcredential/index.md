---
title: "PasswordCredential: hàm khởi tạo PasswordCredential()"
short-title: PasswordCredential()
slug: Web/API/PasswordCredential/PasswordCredential
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.PasswordCredential.PasswordCredential
---

{{APIRef("Credential Management API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Hàm khởi tạo **`PasswordCredential()`** tạo một đối tượng {{domxref("PasswordCredential")}} mới.

## Cú pháp

```js-nolint
new PasswordCredential(data)
new PasswordCredential(form)
```

### Tham số

Một trong hai loại sau:

- `data`
  - : Một đối tượng với các thuộc tính sau:
    - `iconURL` {{optional_inline}}
      - : Một chuỗi đại diện cho URL của biểu tượng hoặc avatar để liên kết với thông tin xác thực.
    - `id`
      - : Một chuỗi đại diện cho phần tên đăng nhập của cặp tên đăng nhập/mật khẩu.
    - `name` {{optional_inline}}
      - : Một chuỗi đại diện cho tên có thể hiểu được bởi con người liên kết với thông tin xác thực, nhằm giúp người dùng chọn thông tin xác thực này trong giao diện người dùng.
    - `origin`
      - : Một chuỗi đại diện cho origin của thông tin xác thực. Các đối tượng {{domxref("PasswordCredential")}} được gắn với origin, có nghĩa là chúng chỉ có thể sử dụng được trên origin được chỉ định mà chúng được thiết kế để sử dụng.
    - `password`
      - : Một chuỗi đại diện cho mật khẩu thông tin xác thực.

- `form`
  - : Tham chiếu đến {{domxref("HTMLFormElement")}} với các trường đầu vào phù hợp. Biểu mẫu ít nhất phải chứa id và mật khẩu. Nó cũng có thể yêu cầu CSRF token.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu một trong các tùy chọn `id`, `origin` hoặc `password` trống.

## Ví dụ

Ví dụ này cho thấy cách thiết lập {{domxref("HTMLFormElement")}} để thu thập dữ liệu mà chúng ta sẽ dùng để tạo đối tượng {{domxref("PasswordCredential")}}.

Bắt đầu với phần tử biểu mẫu.

```html
<form id="form" method="post">
  <label for="id">Username:</label>
  <input type="text" name="id" autocomplete="username" />
  <label for="password">Password:</label>
  <input type="password" name="password" autocomplete="current-password" />
  <input type="hidden" name="csrf_token" value="*****" />
</form>
```

Sau đó, tham chiếu đến phần tử biểu mẫu này, sử dụng nó để tạo đối tượng {{domxref("PasswordCredential")}}, và lưu vào hệ thống mật khẩu của trình duyệt.

```js
const form = document.querySelector("#form");
const creds = new PasswordCredential(form);
// Store the credentials.
navigator.credentials.store(creds).then((creds) => {
  // Do something with the credentials if you need to.
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
