---
title: "SecurityPolicyViolationEvent: SecurityPolicyViolationEvent() constructor"
short-title: SecurityPolicyViolationEvent()
slug: Web/API/SecurityPolicyViolationEvent/SecurityPolicyViolationEvent
page-type: web-api-constructor
browser-compat: api.SecurityPolicyViolationEvent.SecurityPolicyViolationEvent
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`SecurityPolicyViolationEvent()`** tạo một đối tượng {{domxref("SecurityPolicyViolationEvent")}} mới.

## Cú pháp

```js-nolint
new SecurityPolicyViolationEvent(type)
new SecurityPolicyViolationEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt nó là `securitypolicyviolation`.
- `options` {{optional_inline}}
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `blockedURI` {{optional_inline}}
      - : {{domxref("SecurityPolicyViolationEvent.blockedURI","blockedURI")}} của `SecurityPolicyViolationEvent`.
        Nếu không được cung cấp, giá trị mặc định là `""`.
    - `columnNumber` {{optional_inline}}
      - : {{domxref("SecurityPolicyViolationEvent.columnNumber","columnNumber")}} của `SecurityPolicyViolationEvent`.
        Nếu không được cung cấp, giá trị mặc định là `0`.
    - `disposition`
      - : {{domxref("SecurityPolicyViolationEvent.disposition","disposition")}} của `SecurityPolicyViolationEvent`.
    - `documentURI`
      - : {{domxref("SecurityPolicyViolationEvent.documentURI","documentURI")}} của `SecurityPolicyViolationEvent`.
    - `effectiveDirective`
      - : {{domxref("SecurityPolicyViolationEvent.effectiveDirective","effectiveDirective")}} của `SecurityPolicyViolationEvent`.
    - `lineNumber` {{optional_inline}}
      - : {{domxref("SecurityPolicyViolationEvent.lineNumber","lineNumber")}} của `SecurityPolicyViolationEvent`.
        Nếu không được cung cấp, giá trị mặc định là `0`.
    - `originalPolicy`
      - : {{domxref("SecurityPolicyViolationEvent.originalPolicy","originalPolicy")}} của `SecurityPolicyViolationEvent`.
    - `referrer` {{optional_inline}}
      - : {{domxref("SecurityPolicyViolationEvent.referrer","referrer")}} của `SecurityPolicyViolationEvent`.
        Nếu không được cung cấp, giá trị mặc định là `""`.
    - `sample` {{optional_inline}}
      - : {{domxref("SecurityPolicyViolationEvent.sample","sample")}} của `SecurityPolicyViolationEvent`.
        Nếu không được cung cấp, giá trị mặc định là `""`.
    - `sourceFile` {{optional_inline}}
      - : {{domxref("SecurityPolicyViolationEvent.sourceFile","sourceFile")}} của `SecurityPolicyViolationEvent`.
        Nếu không được cung cấp, giá trị mặc định là `""`.
    - `statusCode`
      - : {{domxref("SecurityPolicyViolationEvent.statusCode","statusCode")}} của `SecurityPolicyViolationEvent`.
    - `violatedDirective`
      - : {{domxref("SecurityPolicyViolationEvent.violatedDirective","violatedDirective")}} của `SecurityPolicyViolationEvent`.

### Giá trị trả về

Một đối tượng `SecurityPolicyViolationEvent` mới.

## Ví dụ

```js
let SPVEvt = new SecurityPolicyViolationEvent("foo", {
  /* ... */
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP)
