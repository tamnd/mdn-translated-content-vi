---
title: "CSSRuleList: phương thức item()"
short-title: item()
slug: Web/API/CSSRuleList/item
page-type: web-api-instance-method
browser-compat: api.CSSRuleList.item
---

{{ APIRef("CSSOM") }}

Phương thức **`item()`** của giao diện {{domxref("CSSRuleList")}} trả về đối tượng {{domxref("CSSRule")}} tại `index` được chỉ định hoặc `null` nếu `index` được chỉ định không tồn tại.

## Cú pháp

```js-nolint
item(index)
```

### Tham số

- `index`
  - : Một số nguyên.

### Giá trị trả về

Một {{domxref("CSSRule")}}.

## Ví dụ

Trong ví dụ sau, chúng ta giả định rằng danh sách `myRules` chỉ có ba mục.

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules.item(0)); // Logs the first CSSRule item from this list

// Accessing non-existing items using this method will return null instead of undefined
console.log(myRules.item(5)); // null
console.log(myRules[5]); // undefined
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
