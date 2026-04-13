---
title: "TrustedTypePolicy: createHTML() method"
short-title: createHTML()
slug: Web/API/TrustedTypePolicy/createHTML
page-type: web-api-instance-method
browser-compat: api.TrustedTypePolicy.createHTML
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`createHTML()`** của giao diện {{domxref("TrustedTypePolicy")}} tạo đối tượng {{domxref("TrustedHTML")}} sử dụng chính sách được tạo bởi {{domxref("TrustedTypePolicyFactory.createPolicy()")}}.

## Cú pháp

```js-nolint
createHTML(input)
createHTML(input, args)
```

### Tham số

- `input`
  - : Chuỗi chứa chuỗi cần được làm sạch bởi chính sách.
- `args` {{optional_inline}}
  - : Các đối số bổ sung để truyền vào hàm được biểu diễn bởi {{domxref("TrustedTypePolicy")}}.

### Giá trị trả về

Một đối tượng {{domxref("TrustedHTML")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu {{domxref("TrustedTypePolicy")}} không chứa hàm để chạy trên đầu vào.

## Ví dụ

Trong ví dụ dưới đây, một chuỗi chứa script có khả năng nguy hiểm được sử dụng làm đầu vào cho `createHTML()`. Mã nguy hiểm được chèn bởi người dùng sau đó có thể được làm sạch trước khi chèn vào bất kỳ điểm chèn nào.

```js
const escaped = escapeHTMLPolicy.createHTML("<img src=x onerror=alert(1)>");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
