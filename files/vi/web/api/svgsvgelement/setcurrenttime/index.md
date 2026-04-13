---
title: "SVGSVGElement: phương thức setCurrentTime()"
short-title: setCurrentTime()
slug: Web/API/SVGSVGElement/setCurrentTime
page-type: web-api-instance-method
browser-compat: api.SVGSVGElement.setCurrentTime
---

{{APIRef("SVG")}}

Phương thức `setCurrentTime()` của giao diện {{domxref("SVGSVGElement")}} điều chỉnh đồng hồ cho mảnh tài liệu SVG này, thiết lập một thời gian hiện tại mới.

Nếu `setCurrentTime()` được gọi trước khi dòng thời gian tài liệu bắt đầu (ví dụ: bởi script chạy trong phần tử {{SVGElement("script")}} trước khi sự kiện `SVGLoad` của tài liệu được gửi đi), thì giá trị giây trong lần gọi cuối cùng của phương thức sẽ là thời gian mà tài liệu sẽ tua tới khi dòng thời gian tài liệu bắt đầu.

## Cú pháp

```js-nolint
setCurrentTime(time)
```

### Tham số

- `time`
  - : Một số thực biểu thị thời gian tính bằng giây để đặt làm thời gian hiện tại.

### Giá trị trả về

Không có.

## Ví dụ

### Đặt thời gian hiện tại

```html
<svg
  id="exampleSVG"
  width="200"
  height="200"
  xmlns="http://www.w3.org/2000/svg">
  <circle id="circle1" cx="100" cy="100" r="50" fill="blue" />
</svg>
<button id="setTimeButton">Đặt thời gian hiện tại</button>
<p id="currentTimeDisplay"></p>
```

```js
const svgElement = document.getElementById("exampleSVG");
const setTimeButton = document.getElementById("setTimeButton");
const currentTimeDisplay = document.getElementById("currentTimeDisplay");

setTimeButton.addEventListener("click", () => {
  // Đặt thời gian thành 5 giây
  svgElement.setCurrentTime(5);
  const currentTime = svgElement.getCurrentTime();
  currentTimeDisplay.textContent = `Current time in the SVG: ${currentTime} seconds`;
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
