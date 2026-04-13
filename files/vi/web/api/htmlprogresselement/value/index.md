---
title: "HTMLProgressElement: value property"
short-title: value
slug: Web/API/HTMLProgressElement/value
page-type: web-api-instance-property
browser-compat: api.HTMLProgressElement.value
---

{{APIRef("HTML DOM")}}

Thuộc tính **`value`** của giao diện {{DOMxRef("HTMLProgressElement")}} đại diện cho tiến trình hiện tại của phần tử {{HTMLElement("progress")}}.

## Giá trị

Một số dấu phẩy động. Nếu giá trị {{DOMxRef("HTMLProgressElement.max", "max")}} không được đặt trên thanh tiến trình thì giá trị dao động trong khoảng 0.0 đến 1.0. Nếu giá trị `max` được đặt thì `value` dao động trong khoảng `0` đến giá trị `max`.

Nếu thuộc tính `value` không được đặt trên đối tượng {{DOMxRef("HTMLProgressElement")}}, thanh tiến trình vẫn ở trạng thái không xác định.

## Ví dụ

### HTML

```html
Determinate Progress bar: <progress id="pBar"></progress> <span>0</span>%
<br />
Indeterminate Progress bar: <progress></progress>
```

### JavaScript

```js
const pBar = document.getElementById("pBar");
const span = document.getElementsByTagName("span")[0];

pBar.max = 100;
pBar.value = 0;

setInterval(() => {
  pBar.value = pBar.value < pBar.max ? pBar.value + 1 : 0;

  span.textContent = Math.trunc(pBar.position * 100);
}, 100);
```

{{EmbedLiveSample("Examples", "100%", 30)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
