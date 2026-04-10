---
title: "HTMLInputElement: thuộc tính colorSpace"
short-title: colorSpace
slug: Web/API/HTMLInputElement/colorSpace
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.colorSpace
---

{{APIRef("HTML DOM")}}

Thuộc tính **`colorSpace`** của giao diện {{domxref("HTMLInputElement")}} phản ánh thuộc tính [`colorspace`](/en-US/docs/Web/HTML/Reference/Elements/input/color#colorspace) của phần tử {{HTMLElement("input")}}, cho biết {{glossary("color space")}} của màu CSS được tuần tự hóa là `sRGB` (mặc định) hay `display-p3`. Nó chỉ liên quan đến các điều khiển [color](/en-US/docs/Web/HTML/Reference/Elements/input/color).

## Giá trị

Một chuỗi chứa giá trị của thuộc tính [`colorspace`](/en-US/docs/Web/HTML/Reference/Elements/input/color#colorspace).

## Ví dụ

### Lấy và đặt không gian màu

```html
<input id="color-picker" type="color" colorspace="display-p3" alpha />
```

```js
const colorInput = document.getElementById("color-picker");
console.log(colorInput.colorSpace); // "display-p3"
colorInput.colorSpace = "limited-srgb"; // chuyển đổi sang srgb
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`<input type="color">`](/en-US/docs/Web/HTML/Reference/Elements/input/color)
