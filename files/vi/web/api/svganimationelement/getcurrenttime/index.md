---
title: "SVGAnimationElement: phương thức getCurrentTime()"
short-title: getCurrentTime()
slug: Web/API/SVGAnimationElement/getCurrentTime
page-type: web-api-instance-method
browser-compat: api.SVGAnimationElement.getCurrentTime
---

{{APIRef("SVG")}}

Phương thức `getCurrentTime()` của {{domxref("SVGAnimationElement")}} trả về một số thực biểu thị thời gian hiện tại tính bằng giây so với thời điểm không của vùng chứa thời gian đã cho.

Thời điểm không là lúc vùng chứa thời gian bắt đầu dòng thời gian của nó. Nó hoạt động như điểm tham chiếu bắt đầu cho tất cả các hoạt hình trong vùng chứa đó.

Vùng chứa thời gian là một phần tử hoặc ngữ cảnh xác định dòng thời gian cục bộ cho một hoặc nhiều hoạt hình. Các hoạt hình bên trong vùng chứa thời gian được đo so với dòng thời gian của nó. Nếu một vùng chứa thời gian bị trì hoãn, tạm dừng hoặc bị thao tác, tất cả các hoạt hình trong đó sẽ điều chỉnh theo.

## Cú pháp

```js-nolint
getCurrentTime()
```

### Tham số

Không có ({{jsxref('undefined')}}).

### Giá trị trả về

Một số thực (float).

## Ví dụ

Ví dụ này minh họa cách phương thức `getCurrentTime()` lấy thời gian đã trôi qua kể từ thời điểm không của vùng chứa thời gian.

```html
<svg width="200" height="200" viewBox="0 0 200 200">
  <circle cx="50" cy="50" r="20" fill="rebeccapurple">
    <animate
      attributeName="cx"
      from="50"
      to="150"
      dur="4s"
      repeatCount="indefinite" />
  </circle>
</svg>
```

```js
const animationElement = document.querySelector("animate");

setInterval(() => {
  const currentTime = animationElement.getCurrentTime();
  console.log(
    `Current time relative to the time container: ${currentTime} seconds`,
  );
}, 1000);
```

Hoạt hình bắt đầu tại `time zero = 0` và chạy vô thời hạn, và giá trị `getCurrentTime()` tăng liên tục trong ngữ cảnh của vùng chứa thời gian.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
