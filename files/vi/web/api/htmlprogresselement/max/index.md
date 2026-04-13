---
title: "HTMLProgressElement: max property"
short-title: max
slug: Web/API/HTMLProgressElement/max
page-type: web-api-instance-property
browser-compat: api.HTMLProgressElement.max
---

{{APIRef("HTML DOM")}}

Thuộc tính **`max`** của giao diện {{DOMxRef("HTMLProgressElement")}} đại diện cho giới hạn trên của phạm vi phần tử {{HTMLElement("progress")}}.

## Giá trị

Một số dấu phẩy động lớn hơn 0. Giá trị mặc định là 1.0.

## Ví dụ

### HTML

```html
Progress: <progress id="pBar"></progress> <span>0</span>%
```

### JavaScript

```js
const pBar = document.getElementById("pBar");
const span = document.getElementsByTagName("span")[0];

console.log(`Default value of max: ${pBar.max}`);

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
