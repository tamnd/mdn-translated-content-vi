---
title: "HTMLTextAreaElement: labels property"
short-title: labels
slug: Web/API/HTMLTextAreaElement/labels
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.labels
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`HTMLTextAreaElement.labels`** trả về một {{domxref("NodeList")}} gồm các phần tử {{HTMLElement("label")}} được liên kết với phần tử {{HTMLElement("textArea")}}.

## Giá trị

Một {{domxref("NodeList")}} chứa các phần tử `<label>` được liên kết với phần tử `<textArea>`.

## Ví dụ

### HTML

```html
<label id="label1" for="test">Label 1</label>
<textarea id="test">Some text</textarea>
<label id="label2" for="test">Label 2</label>
```

### JavaScript

```js
const textArea = document.getElementById("test");
for (const label of textArea.labels) {
  console.log(label.textContent); // "Label 1" and "Label 2"
}
```

{{EmbedLiveSample("Examples", "100%", 100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
