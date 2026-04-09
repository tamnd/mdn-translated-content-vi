---
title: "HTMLCollection: thuộc tính length"
short-title: length
slug: Web/API/HTMLCollection/length
page-type: web-api-instance-property
browser-compat: api.HTMLCollection.length
---

{{APIRef("DOM")}}

Thuộc tính **`HTMLCollection.length`** trả về số lượng phần tử trong một {{domxref("HTMLCollection")}}.

## Giá trị

Một giá trị số nguyên đại diện cho số lượng phần tử trong `HTMLCollection`.

## Ví dụ

Thuộc tính `length` thường hữu ích trong lập trình DOM. Nó hay được dùng để kiểm tra độ dài của một danh sách, xem danh sách có tồn tại hay không. Nó cũng thường được dùng làm biến lặp trong vòng `for`, như trong ví dụ này.

```js
// All the elements with the class ".test" in the document
const items = document.getElementsByClassName("test");

// For each test item in the list,
// append the entire element as a string of HTML
let gross = "";
for (let i = 0; i < items.length; i++) {
  gross += items[i].innerHTML;
}

// gross is now all the HTML for the test elements
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
