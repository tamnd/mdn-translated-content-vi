---
title: "SVGAngle: value property"
short-title: value
slug: Web/API/SVGAngle/value
page-type: web-api-instance-property
browser-compat: api.SVGAngle.value
---

{{APIRef("SVG")}}

Thuộc tính `value` của giao diện {{domxref("SVGAngle")}} đại diện cho giá trị số thực dấu phẩy động của [`<angle>`](/en-US/docs/Web/SVG/Guides/Content_type#angle) theo đơn vị độ.

Việc đặt thuộc tính này sẽ khiến {{domxref("SVGAngle.valueInSpecifiedUnits", "valueInSpecifiedUnits")}} và {{domxref("SVGAngle.valueAsString", "valueAsString")}} được cập nhật tự động để phản ánh cài đặt này.

## Giá trị

Một số; giá trị góc theo độ.

## Ví dụ

```js
// Lấy đối tượng SVGAngle
const svg = document.querySelector("svg");
const angle = svg.createSVGAngle();

// Đặt giá trị
angle.value = 45;
console.log(angle.value); // Output: 45

// Phản ánh giá trị
angle.value = 90;
console.log(angle.value); // Output: 90
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedAngle")}}
