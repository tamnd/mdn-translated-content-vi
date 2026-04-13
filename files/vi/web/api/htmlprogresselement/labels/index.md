---
title: "HTMLProgressElement: labels property"
short-title: labels
slug: Web/API/HTMLProgressElement/labels
page-type: web-api-instance-property
browser-compat: api.HTMLProgressElement.labels
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`HTMLProgressElement.labels`** trả về {{domxref("NodeList")}} của các phần tử {{HTMLElement("label")}} liên kết với phần tử {{HTMLElement("progress")}}.

## Giá trị

Một {{domxref("NodeList")}} chứa các phần tử `<label>` liên kết với phần tử `<progress>`.

## Ví dụ

### HTML

```html
<label id="label1" for="test">Label 1</label>
<progress id="test" value="70" max="100">70%</progress>
<label id="label2" for="test">Label 2</label>
```

### JavaScript

```js
const progress = document.getElementById("test");
for (const label of progress.labels) {
  console.log(label.textContent); // "Label 1" and "Label 2"
}
```

{{EmbedLiveSample("Examples", "100%", 30)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
