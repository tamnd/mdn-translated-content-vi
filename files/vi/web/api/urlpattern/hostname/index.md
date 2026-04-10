---
title: "URLPattern: hostname property"
short-title: hostname
slug: Web/API/URLPattern/hostname
page-type: web-api-instance-property
browser-compat: api.URLPattern.hostname
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`hostname`** của giao diện {{domxref("URLPattern")}} là một chuỗi chứa [mẫu](/en-US/docs/Web/API/URL_Pattern_API#pattern_syntax) được dùng để khớp phần hostname của một URL.

Đây là [giá trị đã chuẩn hóa](/en-US/docs/Web/API/URL_Pattern_API#pattern_normalization) của mẫu hostname được truyền cho [hàm tạo](/en-US/docs/Web/API/URLPattern/URLPattern), một [giá trị được kế thừa từ `baseURL`](/en-US/docs/Web/API/URLPattern/URLPattern#inheritance_from_a_baseurl) được truyền cho hàm tạo, hoặc giá trị mặc định (`"*"`), khớp với mọi hostname.

## Giá trị

Một chuỗi.

## Ví dụ

### Cách dùng cơ bản

Ví dụ sau tạo một đối tượng {{domxref("URLPattern")}} với `*.example.org` cho phần `hostname` và ghi lại thuộc tính.
Mẫu này khớp với bất kỳ hostname nào là một miền con trực tiếp của `example.org`.

```js
const pattern = new URLPattern("https://*.example.org");
console.log(pattern.hostname); // '*.example.org'
console.log(pattern.test("https://horses.example.org")); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
