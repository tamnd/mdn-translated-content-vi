---
title: "Node: thuộc tính isConnected"
short-title: isConnected
slug: Web/API/Node/isConnected
page-type: web-api-instance-property
browser-compat: api.Node.isConnected
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`isConnected`** của giao diện {{domxref("Node")}} trả về một giá trị boolean cho biết nút có được kết nối (trực tiếp hoặc gián tiếp) với một đối tượng {{domxref("Document")}} hay không.

## Giá trị

Một giá trị boolean là `true` nếu nút được kết nối với đối tượng ngữ cảnh liên quan của nó, và `false` nếu không.

## Ví dụ

### DOM thông thường

Một ví dụ DOM thông thường:

```js
let test = document.createElement("p");
console.log(test.isConnected); // Trả về false
document.body.appendChild(test);
console.log(test.isConnected); // Trả về true
```

### Shadow DOM

Một ví dụ shadow DOM:

```js
// Tạo một shadow root
const shadow = this.attachShadow({ mode: "open" });

// Tạo một số CSS để áp dụng cho shadow DOM
const style = document.createElement("style");
console.log(style.isConnected); // trả về false

style.textContent = `
.wrapper {
  position: relative;
}

.info {
  font-size: 0.8rem;
  width: 200px;
  display: inline-block;
  border: 1px solid black;
  padding: 10px;
  background: white;
  border-radius: 10px;
  opacity: 0;
  transition: 0.6s all;
  positions: absolute;
  bottom: 20px;
  left: 10px;
  z-index: 3
}
`;

// Gắn phần tử style đã tạo vào shadow DOM

shadow.appendChild(style);
console.log(style.isConnected); // Trả về true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
