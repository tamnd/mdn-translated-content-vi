---
title: "StylePropertyMapReadOnly: phương thức entries()"
short-title: entries()
slug: Web/API/StylePropertyMapReadOnly/entries
page-type: web-api-instance-method
browser-compat: api.StylePropertyMapReadOnly.entries
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức **`StylePropertyMapReadOnly.entries()`** trả về một mảng các cặp `[key, value]` thuộc tính liệt kê riêng của đối tượng, theo cùng thứ tự như vòng lặp {{jsxref("Statements/for...in", "for...in")}} (điểm khác biệt là vòng lặp for-in cũng duyệt qua các thuộc tính trong chuỗi prototype).

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng các cặp `[key, value]` thuộc tính liệt kê riêng của đối tượng `StylePropertyMapReadOnly`.

## Ví dụ

Đây là ví dụ sử dụng phương thức `StylePropertyMapReadOnly.entries()` trên các kiểu tính toán của một phần tử.

```js
// grab a DOM element
const buttonEl = document.querySelector("button");

// we can retrieve all computed styles with `computedStyleMap`
const allComputedStyles = buttonEl.computedStyleMap();

// entries returns an iterable of the items
const iterableStyles = allComputedStyles.entries();

// returns a two item array with align-content as the first item and CSSStyleValue as the second
console.log(iterableStyles.next().value);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
