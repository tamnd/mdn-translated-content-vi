---
title: "SVGLength: valueAsString property"
short-title: valueAsString
slug: Web/API/SVGLength/valueAsString
page-type: web-api-instance-property
browser-compat: api.SVGLength.valueAsString
---

{{APIRef("SVG")}}

Thuộc tính `valueAsString` của giao diện {{domxref("SVGLength")}} đại diện cho giá trị của [\<length>](/en-US/docs/Web/SVG/Guides/Content_type#length) dưới dạng chuỗi, theo đơn vị được biểu thị bởi {{domxref("SVGLength.unitType", "unitType")}}.

Việc đặt thuộc tính này sẽ khiến {{domxref("SVGLength.value", "value")}}, {{domxref("SVGLength.valueInSpecifiedUnits", "valueInSpecifiedUnits")}}, và {{domxref("SVGLength.unitType", "unitType")}} được cập nhật tự động để phản ánh cài đặt này.

## Giá trị

Một chuỗi.

## Ví dụ

### Đặt và truy xuất `valueAsString`

```js
// Tạo đối tượng SVGLength
const svg = document.querySelector("svg");
const length = svg.createSVGLength();

// Đặt độ dài dưới dạng chuỗi
length.valueAsString = "45%";
console.log(length.valueAsString); // Output: "45%"
console.log(length.unitType); // Output: 2 (SVG_LENGTHTYPE_PERCENTAGE)
console.log(length.valueInSpecifiedUnits); // Output: 45

// Thay đổi giá trị độ dài
length.valueAsString = "100px";
console.log(length.valueAsString); // Output: "100px"
console.log(length.unitType); // Output: 5 (SVG_LENGTHTYPE_PX)
console.log(length.value); // Output: 100
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number)
- [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length)
- {{domxref("SVGAnimatedLength")}}
