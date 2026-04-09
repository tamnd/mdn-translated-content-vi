---
title: "NodeList: phương thức forEach()"
short-title: forEach()
slug: Web/API/NodeList/forEach
page-type: web-api-instance-method
browser-compat: api.NodeList.forEach
---

{{APIRef("DOM")}}

Phương thức **`forEach()`** của giao diện {{domxref("NodeList")}} gọi hàm callback được truyền vào một lần cho mỗi cặp giá trị trong danh sách, theo thứ tự chèn.

## Cú pháp

```js-nolint
forEach(callback)
forEach(callback, thisArg)
```

### Tham số

- `callback`
  - : Hàm sẽ được thực thi trên mỗi phần tử của `someNodeList`. Hàm này nhận 3 tham số:
    - `currentValue`
      - : Phần tử hiện tại đang được xử lý trong `someNodeList`.
    - `currentIndex` {{Optional_inline}}
      - : Chỉ số của `currentValue` hiện đang được xử lý trong `someNodeList`.
    - `listObj` {{Optional_inline}}
      - : `someNodeList` mà `forEach()` đang được áp dụng.

- `thisArg` {{Optional_inline}}
  - : Giá trị dùng làm [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) khi thực thi `callback`.

### Giá trị trả về

{{jsxref("undefined")}}.

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

list.forEach(function (currentValue, currentIndex, listObj) {
  console.log(`${currentValue}, ${currentIndex}, ${this}`);
}, "myThisArg");
```

Mã trên tạo ra kết quả sau:

```plain
[object HTMLParagraphElement], 0, myThisArg
[object Text], 1, myThisArg
[object HTMLSpanElement], 2, myThisArg
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `NodeList.prototype.forEach` trong `core-js`](https://github.com/zloirock/core-js#iterable-dom-collections)
- {{domxref("Node")}}
- {{domxref("NodeList")}}
