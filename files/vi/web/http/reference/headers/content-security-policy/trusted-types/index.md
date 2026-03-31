---
title: "Content-Security-Policy: trusted-types directive"
short-title: trusted-types
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/trusted-types
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.trusted-types
sidebar: http
---

Chỉ thị **`trusted-types`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) được sử dụng để chỉ định danh sách cho phép các [tên chính sách Trusted Type](/en-US/docs/Web/API/Trusted_Types_API) mà một trang web có thể tạo bằng [`trustedTypes.createPolicy()`](/en-US/docs/Web/API/TrustedTypePolicyFactory/createPolicy).

Điều này ngăn code trang web tạo các chính sách không mong đợi, giúp dễ dàng kiểm tra code trusted type hơn (`createPolicy()` sẽ ném ra ngoại lệ nếu được truyền một tên không được liệt kê trong `trusted-types`).

> [!NOTE]
> Chỉ thị [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) phải được đặt để kích hoạt thực thi trusted types, và từ khóa [`trusted-types-eval`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#trusted-types-eval) được sử dụng để nới lỏng các hạn chế đối với [`eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval) và [`Function()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function) khi trusted types được kích hoạt.
>
> Xem [Trusted Type API](/en-US/docs/Web/API/Trusted_Types_API) để biết thêm thông tin.

## Cú pháp

```http
Content-Security-Policy: trusted-types;
Content-Security-Policy: trusted-types 'none';
Content-Security-Policy: trusted-types <policyName>;
Content-Security-Policy: trusted-types <policyName> <policyName> 'allow-duplicates';
```

- \<policyName>
  - : Tên chính sách hợp lệ chỉ bao gồm các ký tự chữ và số, hoặc một trong `-#=_/@.%`. Dấu sao (`*`) làm tên chính sách hướng dẫn trình duyệt cho phép bất kỳ tên chính sách duy nhất nào (`allow-duplicates` có thể nới lỏng thêm).
- `'none'`
  - : Không cho phép tạo bất kỳ chính sách Trusted Type nào (giống như không chỉ định bất kỳ _\<policyName>_ nào).
- `'allow-duplicates'`
  - : Cho phép tạo các chính sách với tên đã được sử dụng.

## Ví dụ

```js
// Content-Security-Policy: trusted-types foo bar 'allow-duplicates';

if (typeof trustedTypes !== "undefined") {
  const policyFoo = trustedTypes.createPolicy("foo", {});
  const policyFoo2 = trustedTypes.createPolicy("foo", {});
  const policyBaz = trustedTypes.createPolicy("baz", {}); // Ném ra và gửi SecurityPolicyViolationEvent.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
  - [Chỉ thị `require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for)
  - [Từ khóa `trusted-types-eval`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#trusted-types-eval)
- [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API)
  - [Giao diện injection sink](/en-US/docs/Web/API/Trusted_Types_API#injection_sink_interfaces)
- [Cross-Site Scripting (XSS)](/en-US/docs/Glossary/Cross-site_scripting)
