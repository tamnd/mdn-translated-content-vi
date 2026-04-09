---
title: "NodeList: thuộc tính length"
short-title: length
slug: Web/API/NodeList/length
page-type: web-api-instance-property
browser-compat: api.NodeList.length
---

{{APIRef("DOM")}}

Thuộc tính **`NodeList.length`** trả về số lượng mục trong một {{domxref("NodeList")}}.

## Giá trị

Một giá trị số nguyên biểu thị số lượng mục trong `NodeList`.

## Ví dụ

Thuộc tính `length` thường hữu ích trong lập trình DOM. Nó thường được dùng để kiểm tra độ dài của một danh sách, nhằm xem danh sách đó có tồn tại hay không. Nó cũng thường được dùng làm biến lặp trong một vòng `for`, như trong ví dụ sau.

```js
// All the paragraphs in the document
const items = document.getElementsByTagName("p");

// For each item in the list,
// append the entire element as a string of HTML
let gross = "";
for (let i = 0; i < items.length; i++) {
  gross += items[i].innerHTML;
}

// gross is now all the HTML for the paragraphs
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
