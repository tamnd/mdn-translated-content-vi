---
title: "SVGPathElement: getTotalLength() method"
short-title: getTotalLength()
slug: Web/API/SVGPathElement/getTotalLength
page-type: web-api-instance-method
browser-compat: api.SVGPathElement.getTotalLength
---

{{APIRef("SVG")}}

Phương thức **`getTotalLength()`** của giao diện {{domxref("SVGPathElement")}} trả về giá trị tính toán của trình duyệt cho tổng độ dài của đường dẫn theo đơn vị người dùng.

## Cú pháp

```js-nolint
getTotalLength()
```

### Tham số

Không có.

### Giá trị trả về

Một số cho biết tổng độ dài của đường dẫn theo đơn vị người dùng.

### Ví dụ

### Lấy tổng độ dài của một `<path>`

Trong ví dụ này, chúng ta lấy tổng độ dài của hai đường dẫn: một đường thẳng cơ bản và một hình trái tim.

```html
<svg width="200" height="100">
  <path
    id="heart"
    fill="red"
    d="M 10,30
           A 20,20 0,0,1 50,30
           A 20,20 0,0,1 90,30
           Q 90,60 50,90
           Q 10,60 10,30 z" />
  <path id="line" d="M 0,30 h100" stroke="black" />
</svg>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 70px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const complexPath = document.getElementById("heart");
const basicPath = document.getElementById("line");

// Truy cập thuộc tính pathLength
const complexPathLength = complexPath.getTotalLength();
const basicPathLength = basicPath.getTotalLength();

// Giá trị cơ sở của thuộc tính pathLength
log(`complexPathLength: ${complexPathLength}`);
log(`basicPathLength: ${basicPathLength}`);
```

{{EmbedLiveSample('Getting the total length of a `<path>`',"100%","220px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
