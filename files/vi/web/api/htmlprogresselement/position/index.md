---
title: "HTMLProgressElement: position property"
short-title: position
slug: Web/API/HTMLProgressElement/position
page-type: web-api-instance-property
browser-compat: api.HTMLProgressElement.position
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`position`** của giao diện {{DOMxRef("HTMLProgressElement")}} trả về tiến trình hiện tại của phần tử {{HTMLElement("progress")}}.

## Giá trị

Đối với thanh tiến trình xác định, trả về kết quả của giá trị hiện tại chia cho giá trị tối đa, tức là một phân số giữa `0.0` và `1.0`.

Đối với thanh tiến trình không xác định, giá trị luôn là `-1`.

## Ví dụ

### HTML

```html
Determinate Progress bar: <progress id="pBar"></progress> Position:
<span>0</span>
```

### JavaScript

```js
const pBar = document.getElementById("pBar");
const span = document.getElementsByTagName("span")[0];

pBar.max = 100;
pBar.value = 0;

setInterval(() => {
  pBar.value = pBar.value < pBar.max ? pBar.value + 1 : 0;

  span.textContent = pBar.position;
}, 100);
```

{{EmbedLiveSample("Examples", "100%", 30)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
