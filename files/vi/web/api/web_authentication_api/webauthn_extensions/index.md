---
title: Phần mở rộng WebAuthn
slug: Web/API/Web_Authentication_API/WebAuthn_extensions
page-type: guide
---

{{DefaultAPISidebar("Web Authentication API")}}{{securecontext_header}}

[Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API) hỗ trợ một số phần mở rộng (extensions) cho phép chỉ định thêm thông tin trong quá trình đăng ký và xác thực.

Phần mở rộng là tùy chọn và được xử lý khác nhau tùy theo từng thiết bị xác thực. Nếu thiết bị không hỗ trợ một phần mở rộng cụ thể, nó đơn giản là bỏ qua phần mở rộng đó.

## Chỉ định phần mở rộng

Phần mở rộng được chỉ định trong trường `extensions` của các tùy chọn đăng ký/xác thực:

```js
const credential = await navigator.credentials.create({
  publicKey: {
    // ...các tùy chọn khác...
    extensions: {
      credProps: true,
      appid: "https://example.com",
    },
  },
});
```

## Lấy kết quả phần mở rộng

Kết quả phần mở rộng có thể lấy được bằng phương thức `getClientExtensionResults()`:

```js
const extensionResults = credential.getClientExtensionResults();
```

## Các phần mở rộng được hỗ trợ

### `appid`

Phần mở rộng `appid` cung cấp khả năng tương thích ngược với U2F. Nó cho phép dịch vụ web chỉ định ID ứng dụng U2F cũ.

```js
// Trong yêu cầu xác thực
const requestOptions = {
  publicKey: {
    challenge: new Uint8Array([
      /* ... */
    ]),
    rpId: "example.com",
    allowCredentials: [
      /* ... */
    ],
    extensions: {
      appid: "https://old.example.com", // U2F App ID cũ
    },
  },
};
```

### `credProps`

Phần mở rộng `credProps` (Thuộc tính thông tin xác thực) yêu cầu thiết bị trả về thông tin về thuộc tính của thông tin xác thực được tạo.

```js
const credential = await navigator.credentials.create({
  publicKey: {
    // ...
    extensions: {
      credProps: true,
    },
  },
});

const extensionResults = credential.getClientExtensionResults();
if (extensionResults.credProps) {
  const { rk } = extensionResults.credProps;
  console.log(`Discoverable credential: ${rk}`);
}
```

### `largeBlob`

Phần mở rộng `largeBlob` cho phép Relying Party lưu trữ dữ liệu lớn liên quan đến thông tin xác thực.

#### Ghi blob trong khi đăng ký

```js
const credential = await navigator.credentials.create({
  publicKey: {
    // ...
    extensions: {
      largeBlob: {
        support: "required", // "required" hoặc "preferred"
      },
    },
  },
});
```

#### Đọc và ghi blob trong khi xác thực

```js
// Ghi blob
const assertion = await navigator.credentials.get({
  publicKey: {
    // ...
    extensions: {
      largeBlob: {
        write: new TextEncoder().encode("data to store"),
      },
    },
  },
});

// Đọc blob
const assertion2 = await navigator.credentials.get({
  publicKey: {
    // ...
    extensions: {
      largeBlob: {
        read: true,
      },
    },
  },
});
const blob = assertion2.getClientExtensionResults().largeBlob?.blob;
```

### `uvm`

Phần mở rộng `uvm` (User Verification Methods) trả về thông tin về các phương thức xác minh người dùng được thiết bị sử dụng.

```js
const assertion = await navigator.credentials.get({
  publicKey: {
    // ...
    extensions: {
      uvm: true,
    },
  },
});

const uvmEntries = assertion.getClientExtensionResults().uvm;
```

### `prf`

Phần mở rộng `prf` cho phép lấy dữ liệu từ một hàm giả ngẫu nhiên liên quan đến thông tin xác thực.

```js
// Trong khi đăng ký
const credential = await navigator.credentials.create({
  publicKey: {
    // ...
    extensions: {
      prf: {},
    },
  },
});

// Trong khi xác thực
const assertion = await navigator.credentials.get({
  publicKey: {
    // ...
    extensions: {
      prf: {
        eval: {
          first: new TextEncoder().encode("salt value"),
        },
      },
    },
  },
});

const prfResult = assertion.getClientExtensionResults().prf;
```

## Xem thêm

- [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API)
- [WebAuthn Level 3 specification - Defined Extensions](https://w3c.github.io/webauthn/#sctn-defined-extensions)
