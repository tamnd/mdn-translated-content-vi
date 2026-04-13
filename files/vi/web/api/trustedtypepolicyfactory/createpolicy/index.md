---
title: "TrustedTypePolicyFactory: createPolicy() method"
short-title: createPolicy()
slug: Web/API/TrustedTypePolicyFactory/createPolicy
page-type: web-api-instance-method
browser-compat: api.TrustedTypePolicyFactory.createPolicy
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`createPolicy()`** của giao diện {{domxref("TrustedTypePolicyFactory")}} tạo một đối tượng {{domxref("TrustedTypePolicy")}} triển khai các quy tắc được truyền vào dưới dạng `policyOptions`.

## Cú pháp

```js-nolint
createPolicy(policyName, policyOptions)
```

### Tham số

- `policyName`
  - : Một chuỗi với tên của chính sách.
- `policyOptions` {{optional_inline}}
  - : Các hàm do người dùng định nghĩa để chuyển đổi chuỗi thành các giá trị đáng tin cậy.
    - `createHTML(input[,args])`
      - : Một hàm callback dưới dạng chuỗi chứa mã để chạy khi tạo đối tượng {{domxref("TrustedHTML")}}.
    - `createScript(input[,args])`
      - : Một hàm callback dưới dạng chuỗi chứa mã để chạy khi tạo đối tượng {{domxref("TrustedScript")}}.
    - `createScriptURL(input[,args])`
      - : Một hàm callback dưới dạng chuỗi chứa mã để chạy khi tạo đối tượng {{domxref("TrustedScriptURL")}}.

### Giá trị trả về

Một đối tượng {{domxref("TrustedTypePolicy")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu tên chính sách bị hạn chế bởi [chỉ thị `trusted-types` của Content Security Policy](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/trusted-types) và tên này không có trong danh sách cho phép.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu tên trùng lặp và [chỉ thị `trusted-types` của Content Security Policy](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/trusted-types) không sử dụng `allow-duplicates`.

## Ví dụ

### Tạo chính sách cho các sink HTML

Đoạn mã dưới đây tạo một chính sách với tên `"myEscapePolicy"` với hàm được định nghĩa cho `createHTML()` để làm sạch HTML.

```js
const escapeHTMLPolicy = trustedTypes.createPolicy("myEscapePolicy", {
  createHTML: (string) => string.replace(/</g, "&lt;"),
});
```

### Tạo chính sách mặc định

Trên một trang web nơi Trusted Types được thực thi qua Content Security Policy với chỉ thị [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) được đặt thành `script`, mọi script tiêm chấp nhận script đều mong đợi đối tượng Trusted Type. Trong trường hợp một chuỗi được chèn vào thay thế, một [chính sách mặc định](/en-US/docs/Web/API/Trusted_Types_API#the_default_policy) sẽ được sử dụng.

Chính sách mặc định ghi một thông báo vào console để nhắc nhở nhà phát triển cần cấu trúc lại phần này của ứng dụng để sử dụng đối tượng Trusted Type. Nó cũng thêm chi tiết về việc sử dụng chính sách mặc định, kiểu và sink tiêm vào giá trị được trả về.

```js
trustedTypes.createPolicy("default", {
  createScriptURL(s, type, sink) {
    console.log("Please refactor.");
    return `${s}?default-policy-used&type=${encodeURIComponent(
      type,
    )}&sink=${encodeURIComponent(sink)}`;
  },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
