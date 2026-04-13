---
title: "SVGPathElement: getPointAtLength() method"
short-title: getPointAtLength()
slug: Web/API/SVGPathElement/getPointAtLength
page-type: web-api-instance-method
browser-compat: api.SVGPathElement.getPointAtLength
---

{{APIRef("SVG")}}

Phương thức **`getPointAtLength()`** của giao diện {{domxref("SVGPathElement")}} trả về điểm tại một khoảng cách nhất định dọc theo đường dẫn.

## Cú pháp

```js-nolint
getPointAtLength(distance)
```

### Tham số

- `distance`
  - : Một số cho biết khoảng cách dọc theo đường dẫn.

### Giá trị trả về

Một {{domxref("DOMPoint")}} cho biết điểm tại khoảng cách nhất định dọc theo đường dẫn.

### Ví dụ

#### Lấy điểm giữa của một `<path>`

Trong ví dụ này, chúng ta xác định điểm giữa của đường dẫn bằng cách lấy điểm nằm ở nửa độ dài của đường dẫn.

Chúng ta định nghĩa một SVG bao gồm hai đường dẫn: một đường thẳng cơ bản và một hình trái tim phức tạp.

Đường dẫn tạo ra hình trái tim dài khoảng 275 đơn vị.

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

Đường thẳng nằm ngang, bắt đầu từ `0, 30` và dài 100 đơn vị.
Đường dẫn hình trái tim bắt đầu từ `10, 30` và dài khoảng 275 đơn vị.

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

Chúng ta biết độ dài của đường thẳng là 100 đơn vị, vì vậy `50` là điểm giữa.
Chúng ta sử dụng phương thức {{domxref("SVGPathElement.getTotalLength()")}} để lấy độ dài của đường dẫn hình trái tim, chia cho `2` để lấy khoảng cách điểm giữa.
Sau đó dùng phương thức `getPointAtLength()` để trả về điểm giữa dưới dạng `DOMPoint`.
Chúng ta hiển thị tọa độ `x` và `y` của mỗi điểm giữa.

```js
const basicPath = document.getElementById("line");
const complexPath = document.getElementById("heart");

// Lấy độ dài của hình trái tim và chia cho 2
const halfLength = complexPath.getTotalLength() / 2;

// Truy cập thuộc tính getPointAtLength
const basicMidPoint = basicPath.getPointAtLength(50);
const complexMidPoint = complexPath.getPointAtLength(halfLength);

// Giá trị cơ sở của thuộc tính pathLength
log(`Line mid point: ${basicMidPoint.x}, ${basicMidPoint.y}`);
log(`Heart mid point: ${complexMidPoint.x}, ${complexMidPoint.y}`);
```

{{EmbedLiveSample('Getting the total length of a `<path>`',"100%","220px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGPathElement.getTotalLength()")}}
- {{domxref("DOMPoint.x")}}
- {{domxref("DOMPoint.y")}}
