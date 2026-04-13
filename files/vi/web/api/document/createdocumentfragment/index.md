---
title: "Document: phương thức createDocumentFragment()"
short-title: createDocumentFragment()
slug: Web/API/Document/createDocumentFragment
page-type: web-api-instance-method
browser-compat: api.Document.createDocumentFragment
---

{{APIRef("DOM WHATWG")}}

Tạo một {{domxref("DocumentFragment")}} mới trống để có thể thêm các nút DOM vào nhằm xây dựng một cây DOM offscreen.

## Cú pháp

```js-nolint
createDocumentFragment()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("DocumentFragment")}} mới được tạo, trống, sẵn sàng để chèn các nút vào.

## Ghi chú sử dụng

`DocumentFragment` là các đối tượng {{domxref("Node")}} DOM không bao giờ là một phần của cây DOM chính. Trường hợp sử dụng thông thường là tạo document fragment, thêm các phần tử vào document fragment và sau đó thêm document fragment vào cây DOM. Trong cây DOM, document fragment được thay thế bằng tất cả các phần tử con của nó.

Vì document fragment nằm _trong bộ nhớ_ và không phải là một phần của cây DOM chính, nên việc sử dụng document fragment có thể mang lại [hiệu suất tốt hơn](https://johnresig.com/blog/dom-documentfragments/) trong một số engine cũ hơn.

Bạn cũng có thể sử dụng phương thức khởi tạo `DocumentFragment` để tạo một fragment mới:

```js
const fragment = new DocumentFragment();
```

## Ví dụ

Ví dụ này tạo một danh sách các trình duyệt web chính trong một `DocumentFragment`, sau đó thêm cây DOM con mới vào tài liệu để hiển thị.

### HTML

```html
<ul id="ul"></ul>
```

### JavaScript

```js
const element = document.getElementById("ul"); // assuming ul exists
const fragment = document.createDocumentFragment();
const browsers = ["Firefox", "Chrome", "Opera", "Safari"];

browsers.forEach((browser) => {
  const li = document.createElement("li");
  li.textContent = browser;
  fragment.appendChild(li);
});

element.appendChild(fragment);
```

### Kết quả

{{EmbedLiveSample("Examples", 600, 140)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMImplementation.createDocument", "document.implementation.createDocument()")}}
- {{domxref("documentFragment")}}
