---
title: "SVGLength: value property"
short-title: value
slug: Web/API/SVGLength/value
page-type: web-api-instance-property
browser-compat: api.SVGLength.value
---

{{APIRef("SVG")}}

Thuộc tính `value` của giao diện {{domxref("SVGLength")}} đại diện cho giá trị số thực dấu phẩy động của [\<length>](/en-US/docs/Web/SVG/Guides/Content_type#length) theo đơn vị người dùng.

Việc đặt thuộc tính này sẽ khiến {{domxref("SVGLength.valueInSpecifiedUnits")}} và {{domxref("SVGLength.valueAsString")}} được cập nhật tự động để phản ánh cài đặt này.

## Giá trị

Giá trị độ dài theo đơn vị người dùng dưới dạng số thực.

## Ví dụ

```js
// Lấy đối tượng SVGLength
const svg = document.querySelector("svg");
const length = svg.createSVGLength();

// Đặt giá trị
length.value = 10;
console.log(length.value); // Output: 10

// Phản ánh giá trị
length.value = 20;
console.log(length.value); // Output: 20
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedLength")}}
