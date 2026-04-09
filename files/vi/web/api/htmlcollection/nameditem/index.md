---
title: "HTMLCollection: phương thức namedItem()"
short-title: namedItem()
slug: Web/API/HTMLCollection/namedItem
page-type: web-api-instance-method
browser-compat: api.HTMLCollection.namedItem
---

{{APIRef("DOM")}}

Phương thức **`namedItem()`** của giao diện {{domxref("HTMLCollection")}} trả về {{domxref("Element")}} đầu tiên trong tập hợp có thuộc tính `id` hoặc `name` khớp với tên đã chỉ định, hoặc `null` nếu không có phần tử nào khớp.

Trong JavaScript, thay vì gọi `collection.namedItem("value")`, bạn cũng có thể truy cập trực tiếp tên đó trên tập hợp, như `collection["value"]`, trừ khi tên đó trùng với một trong các thuộc tính sẵn có của `HTMLCollection`.

## Cú pháp

```js-nolint
namedItem(key)
```

### Tham số

- `key`
  - : Một chuỗi biểu thị giá trị của thuộc tính `id` hoặc `name` của phần tử mà ta đang tìm.

### Giá trị trả về

{{domxref("Element")}} đầu tiên trong {{domxref("HTMLCollection")}} khớp với `key`, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu không có phần tử nào. Luôn trả về `null` nếu `key` là chuỗi rỗng.

## Ví dụ

### HTML

```html
<div id="personal">
  <span name="title">Dr.</span>
  <span name="first-name">Carina</span>
  <span name="last-name">Anand</span>
  <span id="degree">(MD)</span>
</div>
```

### JavaScript

```js
const container = document.getElementById("personal");

// Returns the HTMLSpanElement with the name "title" if no such element exists null is returned
const titleSpan = container.children.namedItem("title");

// The following variants return undefined instead of null if there's no element with a matching name or id
const firstNameSpan = container.children["first-name"];
const lastNameSpan = container.children["last-name"];

// Returns the span element with the id "degree"
const degreeSpan = container.children.namedItem("degree");

const output = document.createElement("div");
output.textContent = `Result: ${titleSpan.textContent} ${firstNameSpan.textContent} ${lastNameSpan.textContent} ${degreeSpan.textContent}`;

container.insertAdjacentElement("afterend", output);
```

{{EmbedLiveSample("Example")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
