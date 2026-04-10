---
title: "URLPattern: username property"
short-title: username
slug: Web/API/URLPattern/username
page-type: web-api-instance-property
browser-compat: api.URLPattern.username
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`username`** của giao diện {{domxref("URLPattern")}} là một chuỗi chứa [mẫu](/en-US/docs/Web/API/URL_Pattern_API#pattern_syntax) được dùng để khớp phần username của một URL.

Đây là [giá trị đã chuẩn hóa](/en-US/docs/Web/API/URL_Pattern_API#pattern_normalization) của mẫu username được truyền cho [hàm tạo](/en-US/docs/Web/API/URLPattern/URLPattern), hoặc giá trị mặc định (`"*"`), khớp với mọi username.

## Giá trị

Một chuỗi.

## Ví dụ

### Cách dùng cơ bản

Ví dụ sau tạo một đối tượng {{domxref("URLPattern")}} với `admin` cho phần `username` và ghi lại thuộc tính.
Mẫu này chỉ khớp nếu phần username của URL là `admin`.

```js
const pattern = new URLPattern({ username: "admin" });
console.log(pattern.username); // "admin"
console.log(pattern.test("http://admin:password@example.com/")); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
