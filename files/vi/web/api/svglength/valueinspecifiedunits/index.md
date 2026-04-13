---
title: "SVGLength: valueInSpecifiedUnits property"
short-title: valueInSpecifiedUnits
slug: Web/API/SVGLength/valueInSpecifiedUnits
page-type: web-api-instance-property
browser-compat: api.SVGLength.valueInSpecifiedUnits
---

{{APIRef("SVG")}}

Thuộc tính `valueInSpecifiedUnits` của giao diện {{domxref("SVGLength")}} đại diện cho giá trị số thực dấu phẩy động, theo đơn vị được biểu thị bởi {{domxref("SVGLength.unitType", "unitType")}}.

Việc đặt thuộc tính này sẽ khiến {{domxref("SVGLength.value", "value")}} và {{domxref("SVGLength.valueAsString", "valueAsString")}} được cập nhật tự động để phản ánh cài đặt này.

## Giá trị

Hệ số số của độ dài dưới dạng số thực.

## Ví dụ

```js
// Lấy đối tượng SVGLength
const svg = document.querySelector("svg");
const length = svg.createSVGLength();

// Đặt giá trị của độ dài
length.value = 10;
console.log(length.valueInSpecifiedUnits); // Output: 10

// Cập nhật hệ số số của độ dài
length.valueInSpecifiedUnits = 20;
console.log(length.valueInSpecifiedUnits); // Output: 20
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedLength")}}
