---
title: Xây dựng và cập nhật cây DOM
slug: Web/API/Document_Object_Model/Building_and_updating_the_DOM_tree
page-type: guide
---

{{DefaultAPISidebar("DOM")}}

Hướng dẫn này mô tả cách xây dựng cây DOM bằng JavaScript và cách cập nhật cây DOM hiện có để phản ánh sự thay đổi trong nội dung trang.

## Tạo nút mới

Để tạo nút mới, bạn sử dụng các phương thức của giao diện {{domxref("Document")}}.

### Tạo phần tử

Sử dụng {{domxref("Document.createElement()")}} để tạo phần tử HTML mới. Bạn truyền tên thẻ và phương thức trả về đối tượng {{domxref("HTMLElement")}} mới.

```js
const paragraph = document.createElement("p");
```

### Tạo nút văn bản

Sử dụng {{domxref("Document.createTextNode()")}} để tạo nút văn bản mới.

```js
const textNode = document.createTextNode("Hello, world!");
```

### Tạo fragment tài liệu

Sử dụng {{domxref("Document.createDocumentFragment()")}} để tạo {{domxref("DocumentFragment")}} mới.

```js
const fragment = document.createDocumentFragment();
```

## Thêm nút vào cây DOM

Sau khi tạo nút mới, bạn cần thêm nút đó vào cây DOM. Có nhiều phương thức để thực hiện điều này.

### Sử dụng `appendChild()`

Phương thức {{domxref("Node.appendChild()")}} thêm nút làm con cuối cùng của nút mục tiêu.

```js
const paragraph = document.createElement("p");
const textNode = document.createTextNode("Hello, world!");
paragraph.appendChild(textNode);
document.body.appendChild(paragraph);
```

### Sử dụng `insertBefore()`

Phương thức {{domxref("Node.insertBefore()")}} chèn nút trước một nút con tham chiếu cụ thể của nút mục tiêu.

```js
const newParagraph = document.createElement("p");
const existingParagraph = document.querySelector("p");
document.body.insertBefore(newParagraph, existingParagraph);
```

### Sử dụng `replaceChild()`

Phương thức {{domxref("Node.replaceChild()")}} thay thế nút con bằng nút mới.

```js
const newParagraph = document.createElement("p");
const oldParagraph = document.querySelector("p");
document.body.replaceChild(newParagraph, oldParagraph);
```

### Sử dụng `insertAdjacentElement()`

Phương thức {{domxref("Element.insertAdjacentElement()")}} chèn phần tử vào vị trí chỉ định tương đối với phần tử mục tiêu.

```js
const newParagraph = document.createElement("p");
const existingParagraph = document.querySelector("p");
existingParagraph.insertAdjacentElement("afterend", newParagraph);
```

## Xóa nút khỏi cây DOM

### Sử dụng `removeChild()`

Phương thức {{domxref("Node.removeChild()")}} xóa nút con khỏi nút mục tiêu.

```js
const paragraph = document.querySelector("p");
document.body.removeChild(paragraph);
```

### Sử dụng `remove()`

Phương thức {{domxref("Element.remove()")}} xóa phần tử khỏi DOM.

```js
const paragraph = document.querySelector("p");
paragraph.remove();
```

## Sao chép nút

Phương thức {{domxref("Node.cloneNode()")}} tạo bản sao của nút. Bạn có thể chỉ định xem có sao chép sâu (bao gồm tất cả nút con) hay không.

```js
const original = document.querySelector("p");
const shallowCopy = original.cloneNode(false);
const deepCopy = original.cloneNode(true);
```

## Thao tác thuộc tính phần tử

### Đặt thuộc tính

```js
const link = document.createElement("a");
link.setAttribute("href", "https://example.com");
link.textContent = "Visit Example";
document.body.appendChild(link);
```

### Thêm class CSS

```js
const element = document.querySelector("p");
element.classList.add("highlight");
element.classList.remove("old-class");
element.classList.toggle("active");
```

## Xem thêm

- {{domxref("Document.createElement()")}}
- {{domxref("Node.appendChild()")}}
- {{domxref("Node.removeChild()")}}
- [Cấu trúc của DOM](/en-US/docs/Web/API/Document_Object_Model/Anatomy_of_the_DOM)
