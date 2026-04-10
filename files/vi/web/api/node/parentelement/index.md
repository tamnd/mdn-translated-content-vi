---
title: "Node: thuộc tính parentElement"
short-title: parentElement
slug: Web/API/Node/parentElement
page-type: web-api-instance-property
browser-compat: api.Node.parentElement
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`parentElement`** của giao diện {{domxref("Node")}} trả về phần tử cha {{DOMxRef("Element")}} của nút DOM, hoặc `null` nếu nút không có cha, hoặc cha của nó không phải là một nút DOM {{DOMxRef("Element")}}. Trong khi đó, {{domxref("Node.parentNode")}} trả về bất kỳ kiểu nút cha nào, bất kể kiểu của nó.

## Giá trị

Một {{domxref("Element")}} là phần tử cha của nút hiện tại, hoặc `null` nếu không có.

## Ví dụ

### Dùng parentElement

Ví dụ này đặt phần tử cha của `node` có màu chữ đỏ.

```js
if (node.parentElement) {
  node.parentElement.style.color = "red";
}
```

### parentElement là null

`parentElement` có thể là `null` nếu nút không có cha (ví dụ vì nó chưa được gắn vào một cây) hoặc cha của nó không phải là một `Element`. Ngược lại, {{domxref("Node.parentNode")}} luôn trả về nút cha, nút này có thể là một {{domxref("Document")}} hoặc các kiểu nút khác.

```html
<!doctype html>
<html lang="en-US">
  <body>
    <script>
      const html = document.querySelector("html");
      console.log(html.parentElement); // null
      console.log(html.parentNode); // document
    </script>
  </body>
</html>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node.parentNode")}}
