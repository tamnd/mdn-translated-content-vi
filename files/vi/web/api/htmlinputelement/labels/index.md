---
title: "HTMLInputElement: thuộc tính labels"
short-title: labels
slug: Web/API/HTMLInputElement/labels
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.labels
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`HTMLInputElement.labels`** trả về một {{domxref("NodeList")}} các phần tử {{HTMLElement("label")}} được liên kết với phần tử {{HTMLElement("input")}}, nếu phần tử không bị ẩn. Nếu phần tử có loại `hidden`, thuộc tính trả về `null`.

## Giá trị

Một {{domxref("NodeList")}} chứa các phần tử `<label>` được liên kết với phần tử `<input>`.

## Ví dụ

### HTML

```html
<label id="label1" for="test">Nhãn 1</label>
<input id="test" />
<label id="label2" for="test">Nhãn 2</label>
```

### JavaScript

```js
const input = document.getElementById("test");
for (const label of input.labels) {
  console.log(label.textContent); // "Nhãn 1" và "Nhãn 2"
}
```

{{EmbedLiveSample("Examples", "100%", 30)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
