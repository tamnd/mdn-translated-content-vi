---
title: Lựa chọn và duyệt trên cây DOM
slug: Web/API/Document_Object_Model/Selection_and_traversal_on_the_DOM_tree
page-type: guide
---

{{DefaultAPISidebar("DOM")}}

Hướng dẫn này mô tả cách lựa chọn và duyệt cây DOM.

## Lựa chọn phần tử

DOM cung cấp nhiều phương thức để chọn phần tử từ tài liệu.

### `querySelector()` và `querySelectorAll()`

{{domxref("Document.querySelector()")}} trả về phần tử đầu tiên khớp với CSS selector cho trước. {{domxref("Document.querySelectorAll()")}} trả về tất cả các phần tử khớp.

```js
// Chọn phần tử đầu tiên khớp
const firstParagraph = document.querySelector("p");

// Chọn tất cả phần tử khớp
const allParagraphs = document.querySelectorAll("p");
allParagraphs.forEach((p) => console.log(p.textContent));
```

Bạn cũng có thể gọi các phương thức này trên bất kỳ phần tử nào (không chỉ trên `document`) để tìm kiếm trong cây con của phần tử đó.

### `getElementById()`

{{domxref("Document.getElementById()")}} chọn phần tử theo giá trị thuộc tính `id` của nó.

```js
const header = document.getElementById("main-header");
```

### `getElementsByTagName()` và `getElementsByClassName()`

{{domxref("Document.getElementsByTagName()")}} và {{domxref("Document.getElementsByClassName()")}} trả về các HTMLCollection trực tiếp.

```js
const paragraphs = document.getElementsByTagName("p");
const highlights = document.getElementsByClassName("highlight");
```

## Duyệt cây DOM

Sau khi bạn có tham chiếu đến phần tử, bạn có thể duyệt cây DOM để tìm các phần tử liên quan.

### Duyệt cha

```js
const element = document.querySelector("p");
const parent = element.parentNode; // Nút cha (bất kỳ loại nút)
const parentElement = element.parentElement; // Phần tử cha
```

### Duyệt con

```js
const container = document.querySelector(".container");
const children = container.childNodes; // NodeList của các nút con
const elementChildren = container.children; // HTMLCollection của các phần tử con

const first = container.firstChild; // Nút con đầu tiên
const firstElement = container.firstElementChild; // Phần tử con đầu tiên
const last = container.lastChild; // Nút con cuối cùng
const lastElement = container.lastElementChild; // Phần tử con cuối cùng
```

### Duyệt anh em

```js
const element = document.querySelector("p");
const prev = element.previousSibling; // Nút anh em trước
const prevElement = element.previousElementSibling; // Phần tử anh em trước
const next = element.nextSibling; // Nút anh em tiếp theo
const nextElement = element.nextElementSibling; // Phần tử anh em tiếp theo
```

## Kiểm tra quan hệ nút

### `contains()`

Phương thức {{domxref("Node.contains()")}} kiểm tra xem một nút có phải là hậu duệ của nút hiện tại không.

```js
const container = document.querySelector(".container");
const button = document.querySelector("button");
if (container.contains(button)) {
  console.log("Button is inside container");
}
```

### `compareDocumentPosition()`

Phương thức {{domxref("Node.compareDocumentPosition()")}} so sánh vị trí của hai nút trong tài liệu.

```js
const position = nodeA.compareDocumentPosition(nodeB);
```

## Tìm kiếm nâng cao

### `closest()`

Phương thức {{domxref("Element.closest()")}} duyệt lên cây DOM (bao gồm chính phần tử đó) và trả về phần tử cha gần nhất khớp với CSS selector cho trước.

```js
const listItem = document.querySelector("li");
const list = listItem.closest("ul");
```

### `matches()`

Phương thức {{domxref("Element.matches()")}} kiểm tra xem phần tử có khớp với CSS selector cho trước không.

```js
const element = document.querySelector("p");
if (element.matches(".active")) {
  console.log("Element has active class");
}
```

## Xem thêm

- {{domxref("Document.querySelector()")}}
- {{domxref("Document.querySelectorAll()")}}
- {{domxref("Node.contains()")}}
- {{domxref("Element.closest()")}}
