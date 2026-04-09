---
title: "NodeList: phương thức keys()"
short-title: keys()
slug: Web/API/NodeList/keys
page-type: web-api-instance-method
browser-compat: api.NodeList.keys
---

{{APIRef("DOM")}}

Phương thức **`NodeList.keys()`** trả về một {{jsxref("Iteration_protocols", "iterator")}} cho phép duyệt qua tất cả các khóa có trong đối tượng này. Các khóa là những số nguyên không dấu.

## Cú pháp

```js-nolint
keys()
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

let list = node.childNodes;

// Using for...of
for (const key of list.keys()) {
  console.log(key);
}
```

Kết quả là:

```plain
0
1
2
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `NodeList.prototype.keys` trong `core-js`](https://github.com/zloirock/core-js#iterable-dom-collections)
- {{domxref("Node")}}
- {{domxref("NodeList")}}
