---
title: "TrustedTypePolicy: createScriptURL() method"
short-title: createScriptURL()
slug: Web/API/TrustedTypePolicy/createScriptURL
page-type: web-api-instance-method
browser-compat: api.TrustedTypePolicy.createScriptURL
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`createScriptURL()`** của giao diện {{domxref("TrustedTypePolicy")}} tạo đối tượng {{domxref("TrustedScriptURL")}} sử dụng chính sách được tạo bởi {{domxref("TrustedTypePolicyFactory.createPolicy()")}}.

## Cú pháp

```js-nolint
createScriptURL(input)
createScriptURL(input, args)
```

### Tham số

- `input`
  - : Chuỗi chứa chuỗi cần được làm sạch bởi chính sách.
- `args` {{optional_inline}}
  - : Các đối số bổ sung để truyền vào hàm được biểu diễn bởi {{domxref("TrustedTypePolicy")}}.

### Giá trị trả về

Một đối tượng {{domxref("TrustedScriptURL")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu {{domxref("TrustedTypePolicy")}} không chứa hàm để chạy trên đầu vào.

## Ví dụ

Trong ví dụ dưới đây, một chuỗi chứa URL đến tài nguyên bên ngoài được sử dụng làm đầu vào cho `createScriptURL()`. Chính sách có thể kiểm tra rằng đây là URL được phép trước khi chèn vào điểm chèn có thể khiến script bên ngoài này được thực thi.

```js
const escaped = escapeURLPolicy.createScriptURL(
  "https://example.com/my-script.js",
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
