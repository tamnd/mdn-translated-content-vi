---
title: "Phương thức CredentialsContainer: store()"
short-title: store()
slug: Web/API/CredentialsContainer/store
page-type: web-api-instance-method
browser-compat: api.CredentialsContainer.store
---

{{APIRef("Credential Management API")}}{{SecureContext_Header}}

Phương thức **`store()`** của {{domxref("CredentialsContainer")}} lưu một bộ thông tin xác thực cho người dùng bên trong một thể hiện {{domxref("Credential")}}, và trả về thể hiện đó trong một {{jsxref("Promise")}}.

> [!NOTE]
> Phương thức này bị giới hạn trong ngữ cảnh cấp cao nhất. Các lệnh gọi bên trong phần tử `<iframe>` sẽ được giải quyết nhưng không có tác dụng.

## Cú pháp

```js-nolint
store(credentials)
```

### Tham số

- `credentials`
  - : Một thể hiện {{domxref("Credential")}} hợp lệ.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành `undefined`.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu cũng tồn tại một thông tin xác thực khác cùng kiểu với thông tin xác thực hiện đang được xử lý.

## Ví dụ

### Lưu thông tin xác thực mật khẩu khi xác thực thành công

Đoạn mã này sẽ được thực thi sau khi người dùng đăng ký hoặc đăng nhập và máy chủ xác nhận thông tin xác thực là chính xác.

```js
// Kiểm tra xem trình duyệt có hỗ trợ thông tin xác thực mật khẩu
// (và Credential Management API) hay không
if ("PasswordCredential" in window) {
  let credential = new PasswordCredential({
    id: "example-username",
    name: "Carina Anand", // Trong trường hợp đăng nhập, tên đến từ máy chủ.
    password: "correct horse battery staple",
  });

  navigator.credentials.store(credential).then(
    () => {
      console.info("Credential stored in the user agent's credential manager.");
    },
    (err) => {
      console.error("Error while storing the credential: ", err);
    },
  );
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tính tương thích của trình duyệt

{{Compat}}
