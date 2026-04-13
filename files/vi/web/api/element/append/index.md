---
title: "Element: phương thức append()"
short-title: append()
slug: Web/API/Element/append
page-type: web-api-instance-method
browser-compat: api.Element.append
---

{{APIRef("DOM")}}

Phương thức **`Element.append()`** chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi vào sau con cuối cùng của `Element`. Các chuỗi được chèn dưới dạng các nút {{domxref("Text")}} tương đương.

Sự khác biệt so với {{domxref("Node.appendChild()")}}:

- `Element.append()` cho phép bạn chèn cả chuỗi, trong khi `Node.appendChild()` chỉ chấp nhận các đối tượng {{domxref("Node")}}.
- `Element.append()` không có giá trị trả về, trong khi `Node.appendChild()` trả về đối tượng {{domxref("Node")}} đã được chèn.
- `Element.append()` có thể chèn nhiều nút và chuỗi, trong khi `Node.appendChild()` chỉ có thể chèn một nút.

## Cú pháp

```js-nolint
append(param1)
append(param1, param2)
append(param1, param2, /* …, */ paramN)
```

### Tham số

- `param1`, …, `paramN`
  - : Một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi cần chèn.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném khi nút không thể được chèn tại điểm đã chỉ định trong hệ thống phân cấp.

## Ví dụ

### Chèn một phần tử

```js
let div = document.createElement("div");
let p = document.createElement("p");
div.append(p);

console.log(div.childNodes); // NodeList [ <p> ]
```

### Chèn văn bản

```js
let div = document.createElement("div");
div.append("Some text");

console.log(div.textContent); // "Some text"
```

### Chèn một phần tử và văn bản

```js
let div = document.createElement("div");
let p = document.createElement("p");
div.append("Some text", p);

console.log(div.childNodes); // NodeList [ #text "Some text", <p> ]
```

### Phương thức append không nằm trong scope

Phương thức `append()` không được đưa vào scope của câu lệnh `with`. Xem {{jsxref("Symbol.unscopables")}} để biết thêm thông tin.

```js
let div = document.createElement("div");

with (div) {
  append("foo");
}
// ReferenceError: append is not defined
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.prepend()")}}
- {{domxref("Node.appendChild()")}}
- {{domxref("Element.after()")}}
- {{domxref("Element.insertAdjacentElement()")}}
- {{domxref("NodeList")}}
