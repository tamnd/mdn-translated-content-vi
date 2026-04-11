---
title: "SVGAnimationElement: phương thức getSimpleDuration()"
short-title: getSimpleDuration()
slug: Web/API/SVGAnimationElement/getSimpleDuration
page-type: web-api-instance-method
browser-compat: api.SVGAnimationElement.getSimpleDuration
---

{{APIRef("SVG")}}

Phương thức `getSimpleDuration()` của {{domxref("SVGAnimationElement")}} trả về một số thực biểu thị số giây cho thời lượng đơn giản của hoạt hình này.

Thời lượng đơn giản là khoảng thời gian một hoạt hình được thiết kế để chạy cho một lần lặp, không tính đến việc lặp lại, khởi động lại hoặc mở rộng.

Thuộc tính này phản ánh thuộc tính {{SVGAttr("dur")}} của phần tử {{SVGElement("animate")}}, {{SVGElement("animateMotion")}} hoặc {{SVGElement("animateTransform")}}.

## Cú pháp

```js-nolint
getSimpleDuration()
```

### Tham số

Không có ({{jsxref('undefined')}}).

### Giá trị trả về

Một số thực (float).

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu thời lượng đơn giản của `SVGAnimationElement` không xác định (ví dụ: thời gian kết thúc là vô hạn). Điều này xảy ra khi thuộc tính {{SVGAttr("dur")}} được đặt thành `indefinite` hoặc không xác định, vì khi đó thời lượng đơn giản được coi là không xác định.

## Ví dụ

Ví dụ này minh họa cách thuộc tính `dur="3s"` xác định thời lượng đơn giản là 3 giây.

```html
<svg width="200" height="200" viewBox="0 0 200 200">
  <circle cx="50" cy="50" r="20" fill="rebeccapurple">
    <animate
      attributeName="cx"
      from="50"
      to="150"
      dur="3s"
      repeatCount="indefinite" />
  </circle>
</svg>
```

```js
const animationElement = document.querySelector("animate");

const simpleDuration = animationElement.getSimpleDuration();
console.log(`The simple duration is: ${simpleDuration} seconds`); // Output: 3
```

Vì `repeatCount="indefinite"` chỉ định vòng lặp liên tục, thời lượng hiệu quả là vô hạn, nhưng thời lượng đơn giản vẫn là 3 giây mỗi lần lặp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
