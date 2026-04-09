---
title: "NodeList: phương thức values()"
short-title: values()
slug: Web/API/NodeList/values
page-type: web-api-instance-method
browser-compat: api.NodeList.values
---

{{APIRef("DOM")}}

Phương thức **`NodeList.values()`** trả về một {{jsxref("Iteration_protocols", "iterator")}} cho phép duyệt qua tất cả các giá trị có trong đối tượng này. Các giá trị là những đối tượng {{domxref("Node")}}.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref("Iteration_protocols", "iterator")}}.

## Ví dụ

```js
const node = document.createElement("div");
const kid1 = document.createElement("p");
const kid2 = document.createTextNode("hey");
const kid3 = document.createElement("span");

node.appendChild(kid1);
node.appendChild(kid2);
node.appendChild(kid3);

const list = node.childNodes;

// Using for...of
for (const value of list.values()) {
  console.log(value);
}
```

Kết quả là:

```plain
<p>
#text "hey"
<span>
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `NodeList.prototype.values` trong `core-js`](https://github.com/zloirock/core-js#iterable-dom-collections)
- {{domxref("Node")}}
- {{domxref("NodeList")}}
