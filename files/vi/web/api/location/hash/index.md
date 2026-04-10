---
title: "Location: thuộc tính hash"
short-title: hash
slug: Web/API/Location/hash
page-type: web-api-instance-property
browser-compat: api.Location.hash
---

{{ APIRef("Location") }}

Thuộc tính **`hash`** của giao diện {{domxref("Location")}} là một chuỗi chứa `"#"` theo sau là fragment identifier của URL vị trí. Nếu URL không có fragment identifier, thuộc tính này chứa chuỗi rỗng `""`.

Xem {{domxref("URL.hash")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

Giả sử người dùng đã điều hướng tới `https://example.org#examples`, đoạn mã sau sẽ ghi ra `#examples`:

```js
const result = location.hash;
console.log(result);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
