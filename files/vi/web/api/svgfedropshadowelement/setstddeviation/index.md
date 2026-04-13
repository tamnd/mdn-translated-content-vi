---
title: "SVGFEDropShadowElement: setStdDeviation() method"
short-title: setStdDeviation()
slug: Web/API/SVGFEDropShadowElement/setStdDeviation
page-type: web-api-instance-method
browser-compat: api.SVGFEDropShadowElement.setStdDeviation
---

{{APIRef("SVG")}}

Phương thức `setStdDeviation()` của giao diện {{domxref("SVGFEDropShadowElement")}} đặt các giá trị cho thuộc tính {{SVGAttr("stdDeviation")}}.

## Cú pháp

```js-nolint
setStdDeviation(x, y)
```

### Tham số

- `x`
  - : Một số thực (float) đại diện cho thành phần X của thuộc tính {{SVGAttr("stdDeviation")}}.
- `y`
  - : Một số thực (float) đại diện cho thành phần Y của thuộc tính {{SVGAttr("stdDeviation")}}.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

## Ví dụ

### Sử dụng `setStdDeviation()`

Trong ví dụ này, chúng ta đặt độ lệch chuẩn ngang và dọc cho thao tác làm mờ của hiệu ứng bóng `<feDropShadow>` bằng phương thức `setStdDeviation()` của giao diện `SVGFEDropShadowElement`.

```html
<svg height="200" width="200" viewBox="0 0 200 200">
  <defs>
    <filter id="drop-shadow-filter">
      <feDropShadow
        in="SourceGraphic"
        dx="10"
        dy="10"
        stdDeviation="5 5"
        flood-color="gray" />
    </filter>
  </defs>

  <!-- Rectangle with an initial gray shadow -->
  <rect
    x="50"
    y="50"
    width="100"
    height="100"
    fill="red"
    filter="url(#drop-shadow-filter)" />
</svg>

<!-- Button to update the shadow -->
<button id="updateShadow" type="button">Update Shadow</button>
```

```js
// Get the feDropShadow element
const dropShadow = document.querySelector("feDropShadow");

// Button to trigger the update
document.getElementById("updateShadow").addEventListener("click", () => {
  // Change the standard deviation (blur radius) of the shadow
  dropShadow.setStdDeviation(15, 20);
});
```

{{EmbedLiveSample("Examples", "", "240")}}

Nhấp vào hình chữ nhật đỏ để cập nhật hiệu ứng làm mờ của bóng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedLength")}}
