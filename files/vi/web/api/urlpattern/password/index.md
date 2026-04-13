---
title: "URLPattern: password property"
short-title: password
slug: Web/API/URLPattern/password
page-type: web-api-instance-property
browser-compat: api.URLPattern.password
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`password`** của giao diện {{domxref("URLPattern")}} là một chuỗi chứa [mẫu](/en-US/docs/Web/API/URL_Pattern_API#pattern_syntax) được dùng để khớp phần password của một URL.

Đây là [giá trị đã chuẩn hóa](/en-US/docs/Web/API/URL_Pattern_API#pattern_normalization) của mẫu password được truyền cho [hàm tạo](/en-US/docs/Web/API/URLPattern/URLPattern), hoặc giá trị mặc định (`"*"`), khớp với mọi password.

## Giá trị

Một chuỗi.

## Ví dụ

### Cách dùng cơ bản

Ví dụ sau tạo một đối tượng {{domxref("URLPattern")}} với `correct-horse-battery{-staple}?` cho phần `password` và ghi lại thuộc tính.
Mẫu này khớp với các password `correct-horse-battery` và `correct-horse-battery-staple`.

```js
const pattern = new URLPattern({ password: "correct-horse-battery{-staple}?" });
console.log(pattern.password); // 'correct-horse-battery{-staple}?'
console.log(pattern.test("https://user:correct-horse-battery@example.com")); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
