---
title: "DOMTokenList: phương thức toString()"
short-title: toString()
slug: Web/API/DOMTokenList/toString
page-type: web-api-instance-method
browser-compat: api.DOMTokenList.toString
---

{{APIRef("DOM")}}

Phương thức **`toString()`** {{Glossary("stringifier")}} của giao diện {{domxref("DOMTokenList")}} trả về các giá trị của danh sách token được tuần tự hóa thành một chuỗi. Giá trị trả về là một danh sách token được phân tách bằng dấu cách, tương đương với thuộc tính {{domxref("DOMTokenList.value")}}.

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi.

## Ví dụ

```js
const element = document.createElement("div");
const classes = element.classList;

element.className = "shop empty-cart";
classes.add("logged-in", "dark-mode");

console.log(classes.toString());
// "shop empty-cart logged-in dark-mode"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.classList")}}
- {{domxref("DOMTokenList.add()")}}
