---
title: "HTMLMeterElement: thuộc tính labels"
short-title: labels
slug: Web/API/HTMLMeterElement/labels
page-type: web-api-instance-property
browser-compat: api.HTMLMeterElement.labels
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`HTMLMeterElement.labels`** trả về một
{{domxref("NodeList")}} chứa các phần tử {{HTMLElement("label")}} liên kết với
phần tử {{HTMLElement("meter")}}.

## Giá trị

Một {{domxref("NodeList")}} chứa các phần tử `<label>` liên kết
với phần tử `<meter>`.

## Ví dụ

### HTML

```html
<label id="label1" for="test">Nhãn 1</label>
<meter id="test" min="0" max="100" value="70">70</meter>
<label id="label2" for="test">Nhãn 2</label>
```

### JavaScript

```js
const meter = document.getElementById("test");
for (const label of meter.labels) {
  console.log(label.textContent); // "Nhãn 1" và "Nhãn 2"
}
```

{{EmbedLiveSample("Examples", "100%", 30)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}
