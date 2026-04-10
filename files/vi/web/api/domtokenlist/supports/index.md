---
title: "DOMTokenList: phương thức supports()"
short-title: supports()
slug: Web/API/DOMTokenList/supports
page-type: web-api-instance-method
browser-compat: api.DOMTokenList.supports
---

{{APIRef("DOM")}}

Phương thức **`supports()`** của giao diện {{domxref("DOMTokenList")}}
trả về `true` nếu token đã cho nằm trong các token được hỗ trợ của thuộc tính liên kết.
Phương thức này được thiết kế để hỗ trợ phát hiện tính năng.

## Cú pháp

```js-nolint
supports(token)
```

### Tham số

- `token`
  - : Một chuỗi chứa token cần truy vấn.

### Giá trị trả về

Một giá trị boolean cho biết token có được tìm thấy hay không.

## Ví dụ

```js
const iframe = document.getElementById("display");

if (iframe.sandbox.supports("an-upcoming-feature")) {
  // support code for mystery future feature
} else {
  // fallback code
}

if (iframe.sandbox.supports("allow-scripts")) {
  // instruct frame to run JavaScript
  //
  // (NOTE: This feature is well-supported; this is just an example!)
  //
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
