---
title: "SVGAngle: valueInSpecifiedUnits property"
short-title: valueInSpecifiedUnits
slug: Web/API/SVGAngle/valueInSpecifiedUnits
page-type: web-api-instance-property
browser-compat: api.SVGAngle.valueInSpecifiedUnits
---

{{APIRef("SVG")}}

Thuộc tính `valueInSpecifiedUnits` của giao diện {{domxref("SVGAngle")}} đại diện cho giá trị của góc này dưới dạng số, theo đơn vị được biểu thị bởi {{domxref("SVGAngle.unitType", "unitType")}} của góc.

Việc đặt thuộc tính này sẽ khiến {{domxref("SVGAngle.value", "value")}} và {{domxref("SVGAngle.valueAsString", "valueAsString")}} được cập nhật tự động để phản ánh cài đặt này.

## Giá trị

Một số; hệ số số của góc.

## Ví dụ

```js
// Lấy đối tượng SVGAngle
const svg = document.querySelector("svg");
const angle = svg.createSVGAngle();

// Đặt giá trị góc theo độ
angle.value = 45;
console.log(angle.valueInSpecifiedUnits); // Output: 45

// Cập nhật hệ số số của góc
angle.valueInSpecifiedUnits = 90;
console.log(angle.valueInSpecifiedUnits); // Output: 90
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedAngle")}}
