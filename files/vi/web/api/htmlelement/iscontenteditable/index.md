---
title: "HTMLElement: thuộc tính isContentEditable"
short-title: isContentEditable
slug: Web/API/HTMLElement/isContentEditable
page-type: web-api-instance-property
browser-compat: api.HTMLElement.isContentEditable
---

{{ APIRef("HTML DOM") }}

Thuộc tính chỉ đọc **`HTMLElement.isContentEditable`** trả về giá trị boolean là `true` nếu nội dung của phần tử có thể chỉnh sửa; ngược lại trả về `false`.

## Giá trị

Một giá trị boolean.

## Ví dụ

### HTML

```html
<p id="firstParagraph">Uneditable Paragraph</p>
<p id="secondParagraph" contenteditable="true">Editable Paragraph</p>

<p id="infoText1">Is the first paragraph editable?</p>
<p id="infoText2">Is the second paragraph editable?</p>
```

### JavaScript

```js
const firstParagraph = document.getElementById("firstParagraph");
const secondParagraph = document.getElementById("secondParagraph");

const infoText1 = document.getElementById("infoText1");
const infoText2 = document.getElementById("infoText2");

infoText1.textContent += ` ${firstParagraph.isContentEditable}`;
infoText2.textContent += ` ${secondParagraph.isContentEditable}`;
```

### Kết quả

{{ EmbedLiveSample('Examples', '100%', 160) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement/contentEditable")}}
- Thuộc tính toàn cục [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).
