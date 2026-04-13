---
title: "SVGAngle: valueAsString property"
short-title: valueAsString
slug: Web/API/SVGAngle/valueAsString
page-type: web-api-instance-property
browser-compat: api.SVGAngle.valueAsString
---

{{APIRef("SVG")}}

Thuộc tính `valueAsString` của giao diện {{domxref("SVGAngle")}} đại diện cho giá trị góc dưới dạng chuỗi, theo đơn vị được biểu thị bởi {{domxref("SVGAngle.unitType", "unitType")}}.

Việc đặt thuộc tính này sẽ khiến {{domxref("SVGAngle.value", "value")}}, {{domxref("SVGAngle.valueInSpecifiedUnits", "valueInSpecifiedUnits")}}, và {{domxref("SVGAngle.unitType", "unitType")}} được cập nhật tự động để phản ánh cài đặt này.

## Giá trị

Một chuỗi; giá trị góc.

## Ví dụ

### Đặt và truy xuất `valueAsString`

```js
// Lấy đối tượng SVGAngle
const svg = document.querySelector("svg");
const angle = svg.createSVGAngle();

// Đặt giá trị bằng valueAsString theo độ
angle.valueAsString = "45deg";
console.log(angle.valueAsString); // Output: "45deg"
console.log(angle.value); // Output: 45 (theo độ)

// Đặt giá trị bằng valueAsString theo radian
angle.valueAsString = "1.57rad";
console.log(angle.valueAsString); // Output: "1.57rad"
console.log(Math.round(angle.value)); // Output: 90 (vì 1.57 radian xấp xỉ 90 độ)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`<angle>`](/en-US/docs/Web/SVG/Guides/Content_type#angle)
- {{domxref("SVGAnimatedAngle")}}
