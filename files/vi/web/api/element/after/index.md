---
title: "Element: phương thức after()"
short-title: after()
slug: Web/API/Element/after
page-type: web-api-instance-method
browser-compat: api.Element.after
---

{{APIRef("DOM")}}

Phương thức **`Element.after()`** chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi vào danh sách con của phần tử cha của `Element`, ngay sau `Element`.
Các chuỗi được chèn dưới dạng các nút {{domxref("Text")}} tương đương.

## Cú pháp

```js-nolint
after(node1)
after(node1, node2)
after(node1, node2, /* …, */ nodeN)
```

### Tham số

- `node1`, …, `nodeN`
  - : Một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi cần chèn.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném khi nút không thể được chèn tại điểm đã chỉ định trong hệ thống phân cấp.

## Ví dụ

### Chèn một phần tử

```js
let container = document.createElement("div");
let p = document.createElement("p");
container.appendChild(p);
let span = document.createElement("span");

p.after(span);

console.log(container.outerHTML);
// "<div><p></p><span></span></div>"
```

### Chèn văn bản

```js
let container = document.createElement("div");
let p = document.createElement("p");
container.appendChild(p);

p.after("Text");

console.log(container.outerHTML);
// "<div><p></p>Text</div>"
```

### Chèn một phần tử và văn bản

```js
let container = document.createElement("div");
let p = document.createElement("p");
container.appendChild(p);
let span = document.createElement("span");

p.after(span, "Text");

console.log(container.outerHTML);
// "<div><p></p><span></span>Text</div>"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.before()")}}
- {{domxref("Element.append()")}}
- {{domxref("Element.insertAdjacentElement()")}}
- {{domxref("CharacterData.after()")}}
- {{domxref("DocumentType.after()")}}
- {{domxref("Node.appendChild()")}}
- {{domxref("NodeList")}}
