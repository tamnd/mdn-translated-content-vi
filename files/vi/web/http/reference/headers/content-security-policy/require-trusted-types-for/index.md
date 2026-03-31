---
title: "Content-Security-Policy: require-trusted-types-for directive"
short-title: require-trusted-types-for
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.require-trusted-types-for
sidebar: http
---

Chỉ thị **`require-trusted-types-for`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) hướng dẫn các trình duyệt kiểm soát dữ liệu được truyền đến các hàm sink DOM XSS, như bộ thiết lập {{DOMxRef("Element.innerHTML")}}.

Khi được sử dụng, các hàm này chỉ chấp nhận các giá trị có kiểu không thể giả mạo được tạo bởi chính sách [Trusted Type](/en-US/docs/Web/API/Trusted_Types_API), và từ chối các chuỗi.
Cùng với chỉ thị **[`trusted-types`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/trusted-types)**, bảo vệ việc tạo các chính sách Trusted Type, điều này cho phép tác giả xác định các quy tắc bảo vệ việc ghi giá trị vào DOM và do đó giảm bề mặt tấn công DOM XSS thành các phần nhỏ, được cách ly của codebase ứng dụng web, tạo điều kiện giám sát và xem xét code.

## Cú pháp

```http
Content-Security-Policy: require-trusted-types-for 'script';
```

- `'script'`
  - : Không cho phép sử dụng chuỗi với các hàm sink tiêm DOM XSS, và yêu cầu các kiểu khớp được tạo bởi các chính sách Trusted Type.

## Ví dụ

```js
// Content-Security-Policy: require-trusted-types-for 'script'; trusted-types foo;

const attackerInput = '<svg onload="alert(/cross-site-scripting/)" />';
const el = document.createElement("div");

if (typeof trustedTypes !== "undefined") {
  // Tạo chính sách có thể tạo giá trị TrustedHTML
  // sau khi làm sạch chuỗi đầu vào bằng thư viện DOMPurify.
  const sanitizer = trustedTypes.createPolicy("foo", {
    createHTML: (input) => DOMPurify.sanitize(input),
  });

  el.innerHTML = sanitizer.createHTML(attackerInput); // Đặt giá trị đã được làm sạch vào DOM.
  el.innerHTML = attackerInput; // Từ chối giá trị chuỗi; ném TypeError.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
  - [Chỉ thị `trusted-types`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/trusted-types)
  - [Từ khóa `trusted-types-eval`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#trusted-types-eval)
- [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API)
  - [Giao diện injection sink](/en-US/docs/Web/API/Trusted_Types_API#injection_sink_interfaces)
- [Cross-Site Scripting (XSS)](/en-US/docs/Glossary/Cross-site_scripting)
