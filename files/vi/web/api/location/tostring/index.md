---
title: "Location: phương thức toString()"
short-title: toString()
slug: Web/API/Location/toString
page-type: web-api-instance-method
browser-compat: api.Location.toString
---

{{ApiRef("Location")}}

Phương thức **`toString()`** {{Glossary("stringifier")}} của giao diện {{domxref("Location")}} trả về một chuỗi chứa toàn bộ URL. Nó là phiên bản chỉ đọc của {{domxref("Location.href")}}.

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho URL của đối tượng.

## Ví dụ

```js
// Giả sử đoạn mã này được thực thi trên https://example.com/path?search#hash
const result = window.location.toString(); // Trả về: 'https://example.com/path?search#hash'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
