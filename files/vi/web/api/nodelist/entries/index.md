---
title: "NodeList: phương thức entries()"
short-title: entries()
slug: Web/API/NodeList/entries
page-type: web-api-instance-method
browser-compat: api.NodeList.entries
---

{{APIRef("DOM")}}

Phương thức **`NodeList.entries()`** trả về một {{jsxref("Iteration_protocols", "iterator")}} cho phép duyệt qua tất cả các cặp khóa/giá trị có trong đối tượng này. Các giá trị là những đối tượng {{domxref("Node")}}.

## Cú pháp

```js-nolint
entries()
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
for (const entry of list.entries()) {
  console.log(entry);
}
```

Kết quả là:

```plain
Array [ 0, <p> ]
Array [ 1, #text "hey" ]
Array [ 2, <span> ]
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `NodeList.prototype.entries` trong `core-js`](https://github.com/zloirock/core-js#iterable-dom-collections)
- {{domxref("Node")}}
- {{domxref("NodeList")}}
