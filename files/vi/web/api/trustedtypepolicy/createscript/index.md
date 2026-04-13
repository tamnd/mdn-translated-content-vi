---
title: "TrustedTypePolicy: createScript() method"
short-title: createScript()
slug: Web/API/TrustedTypePolicy/createScript
page-type: web-api-instance-method
browser-compat: api.TrustedTypePolicy.createScript
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`createScript()`** của giao diện {{domxref("TrustedTypePolicy")}} tạo đối tượng {{domxref("TrustedScript")}} sử dụng chính sách được tạo bởi {{domxref("TrustedTypePolicyFactory.createPolicy()")}}.

## Cú pháp

```js-nolint
createScript(input)
createScript(input, args)
```

### Tham số

- `input`
  - : Chuỗi chứa chuỗi cần được làm sạch bởi chính sách.
- `args` {{optional_inline}}
  - : Các đối số bổ sung để truyền vào hàm được biểu diễn bởi {{domxref("TrustedTypePolicy")}}.

### Giá trị trả về

Một đối tượng {{domxref("TrustedScript")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu {{domxref("TrustedTypePolicy")}} không chứa hàm để chạy trên đầu vào.

## Ví dụ

Trong ví dụ dưới đây, một chuỗi chứa script có nguy cơ tiềm ẩn được sử dụng làm đầu vào cho `createScript()`. Chính sách có thể làm sạch script này trước khi chèn vào điểm chèn có thể khiến nó được thực thi.

```js
const sanitized = scriptPolicy.createScript("eval('2 + 2')");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
