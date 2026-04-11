---
title: "SVGSVGElement: phương thức getCurrentTime()"
short-title: getCurrentTime()
slug: Web/API/SVGSVGElement/getCurrentTime
page-type: web-api-instance-method
browser-compat: api.SVGSVGElement.getCurrentTime
---

{{APIRef("SVG")}}

Phương thức `getCurrentTime()` của giao diện {{domxref("SVGSVGElement")}} trả về thời gian hiện tại tính bằng giây so với thời gian bắt đầu của mảnh tài liệu SVG hiện tại.

Nếu `getCurrentTime()` được gọi trước khi dòng thời gian tài liệu bắt đầu (ví dụ: bởi script chạy trong phần tử {{SVGElement("script")}} trước khi sự kiện `SVGLoad` của tài liệu được gửi đi), thì `0` được trả về.

## Cú pháp

```js-nolint
getCurrentTime()
```

### Tham số

Không có.

### Giá trị trả về

Một số thực (float).

## Ví dụ

### Lấy thời gian hiện tại

```html
<svg
  id="exampleSVG"
  width="200"
  height="200"
  xmlns="http://www.w3.org/2000/svg">
  <circle id="circle1" cx="100" cy="100" r="50" fill="blue" />
</svg>
<button id="getTimeButton">Lấy thời gian hiện tại</button>
<p id="currentTimeDisplay"></p>
```

```js
const svgElement = document.getElementById("exampleSVG");
const getTimeButton = document.getElementById("getTimeButton");
const currentTimeDisplay = document.getElementById("currentTimeDisplay");

getTimeButton.addEventListener("click", () => {
  const currentTime = svgElement.getCurrentTime();
  currentTimeDisplay.textContent = `Current time in the SVG: ${currentTime} seconds`;
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
