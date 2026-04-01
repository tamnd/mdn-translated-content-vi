---
title: Map.prototype.size
short-title: size
slug: Web/JavaScript/Reference/Global_Objects/Map/size
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Map.size
sidebar: jsref
---

Thuộc tính accessor **`size`** của các instance {{jsxref("Map")}} trả về số lượng phần tử trong map này.

{{InteractiveExample("JavaScript Demo: Map.prototype.size")}}

```js interactive-example
const map = new Map();

map.set("a", "alpha");
map.set("b", "beta");
map.set("g", "gamma");

console.log(map.size);
// Expected output: 3
```

## Mô tả

Giá trị của `size` là một số nguyên biểu diễn số mục mà đối tượng `Map` có. Hàm setter accessor cho `size` là `undefined`; bạn không thể thay đổi thuộc tính này.

## Ví dụ

### Sử dụng size

```js
const myMap = new Map();
myMap.set("a", "alpha");
myMap.set("b", "beta");
myMap.set("g", "gamma");

console.log(myMap.size); // 3
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map")}}
