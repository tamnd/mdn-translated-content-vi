---
title: "TrustedScript: toJSON() method"
short-title: toJSON()
slug: Web/API/TrustedScript/toJSON
page-type: web-api-instance-method
browser-compat: api.TrustedScript.toJSON
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`toJSON()`** của giao diện {{domxref("TrustedScript")}} trả về biểu diễn JSON của dữ liệu được lưu trữ.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi chứa biểu diễn JSON của dữ liệu được lưu trữ.

## Ví dụ

Hằng số `sanitized` là đối tượng được tạo thông qua chính sách Trusted Types. Phương thức `toString()` trả về chuỗi để thực thi an toàn như script.

```js
const sanitized = scriptPolicy.createScript("eval('2 + 2')");
console.log(sanitized.toJSON());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
