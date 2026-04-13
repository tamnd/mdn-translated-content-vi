---
title: "TrustedScript: toString() method"
short-title: toString()
slug: Web/API/TrustedScript/toString
page-type: web-api-instance-method
browser-compat: api.TrustedScript.toString
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`toString()`** của giao diện {{domxref("TrustedScript")}} trả về một chuỗi có thể chèn an toàn vào [injection sink](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage).

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi chứa script đã được xử lý an toàn.

## Ví dụ

Hằng số `sanitized` là đối tượng được tạo thông qua chính sách Trusted Types. Phương thức `toString()` trả về chuỗi để thực thi an toàn như script.

```js
const sanitized = scriptPolicy.createScript("eval('2 + 2')");
console.log(sanitized.toString());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
