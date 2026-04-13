---
title: "SVGAnimationElement: phương thức getStartTime()"
short-title: getStartTime()
slug: Web/API/SVGAnimationElement/getStartTime
page-type: web-api-instance-method
browser-compat: api.SVGAnimationElement.getStartTime
---

{{APIRef("SVG")}}

Phương thức `getStartTime()` của {{domxref("SVGAnimationElement")}} trả về một số thực biểu thị thời gian bắt đầu, tính bằng giây, cho khoảng hiện tại của phần tử hoạt hình này, nếu nó tồn tại, bất kể khoảng đó đã bắt đầu hay chưa.

Thời gian bắt đầu được trả về bởi `getStartTime()` được đo bằng giây so với thời điểm không của vùng chứa thời gian.

Thời điểm không là lúc vùng chứa thời gian bắt đầu dòng thời gian của nó. Nó hoạt động như điểm tham chiếu bắt đầu cho tất cả các hoạt hình trong vùng chứa đó.

Vùng chứa thời gian là một phần tử hoặc ngữ cảnh xác định dòng thời gian cục bộ cho một hoặc nhiều hoạt hình. Các hoạt hình bên trong vùng chứa thời gian được đo so với dòng thời gian của nó. Nếu một vùng chứa thời gian bị trì hoãn, tạm dừng hoặc bị thao tác, tất cả các hoạt hình trong đó sẽ điều chỉnh theo.

Thuộc tính này phản ánh thuộc tính {{SVGAttr("begin")}} của phần tử {{SVGElement("animate")}}, {{SVGElement("animateMotion")}} hoặc {{SVGElement("animateTransform")}}.

## Cú pháp

```js-nolint
getStartTime()
```

### Tham số

Không có ({{jsxref('undefined')}}).

### Giá trị trả về

Một số thực (float).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `SVGAnimationElement` không có khoảng hiện tại. Điều này xảy ra khi thời gian {{SVGAttr("begin")}} của phần tử hoạt hình chưa đến hoặc chưa được xác định, do đó phương thức `getStartTime()` không thể xác định thời gian bắt đầu hợp lệ. Ví dụ như khi hoạt hình được đặt để bắt đầu tại `begin="click"`, nhưng người dùng chưa nhấp để kích hoạt nó.

## Ví dụ

Ví dụ này minh họa cách thuộc tính `begin="3s"` làm cho hoạt hình bắt đầu 3 giây sau khi dòng thời gian của vùng chứa thời gian bắt đầu.

```html
<svg width="200" height="200" viewBox="0 0 200 200">
  <circle cx="50" cy="50" r="20" fill="rebeccapurple">
    <animate attributeName="cx" from="50" to="150" dur="5s" begin="3s" />
  </circle>
</svg>
```

```js
const animationElement = document.querySelector("animate");

const startTime = animationElement.getStartTime();
console.log(
  `The animation starts at: ${startTime} seconds relative to the time container's timeline`,
); // Output: 3
```

Phương thức `getStartTime()` trả về `3.0` vì đó là thời gian so với thời điểm không của vùng chứa thời gian.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
