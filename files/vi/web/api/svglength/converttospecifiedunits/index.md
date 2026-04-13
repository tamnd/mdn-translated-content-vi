---
title: "SVGLength: convertToSpecifiedUnits() method"
short-title: convertToSpecifiedUnits()
slug: Web/API/SVGLength/convertToSpecifiedUnits
page-type: web-api-instance-method
browser-compat: api.SVGLength.convertToSpecifiedUnits
---

{{APIRef("SVG")}}

Phương thức `convertToSpecifiedUnits()` của giao diện {{domxref("SVGLength")}} cho phép bạn chuyển đổi giá trị độ dài sang loại đơn vị được chỉ định.

Hàm này sẽ:

- Đặt thuộc tính {{domxref("SVGLength.unitType", "unitType")}} về loại đơn vị đã cho.
- Cập nhật các thuộc tính {{domxref("SVGLength.valueInSpecifiedUnits", "valueInSpecifiedUnits")}} và {{domxref("SVGLength.valueAsString", "valueAsString")}} để giá trị độ dài được biểu thị theo loại đơn vị đã cho.

## Cú pháp

```js-nolint
convertToSpecifiedUnits(unitType)
```

### Tham số

- `unitType`
  - : Một hằng số đại diện cho loại đơn vị mà giá trị độ dài cần được chuyển đổi sang. Đây phải là một trong các giá trị hằng số được định nghĩa cho thuộc tính {{domxref("SVGLength.unitType", "unitType")}}, ngoại trừ `SVG_LENGTHTYPE_UNKNOWN`.
    - `SVGLength.SVG_LENGTHTYPE_NUMBER`: chuyển sang số không đơn vị
    - `SVGLength.SVG_LENGTHTYPE_PERCENTAGE`: chuyển sang phần trăm
    - `SVGLength.SVG_LENGTHTYPE_EMS`: chuyển sang đơn vị em
    - `SVGLength.SVG_LENGTHTYPE_EXS`: chuyển sang đơn vị ex
    - `SVGLength.SVG_LENGTHTYPE_PX`: chuyển sang pixel
    - `SVGLength.SVG_LENGTHTYPE_CM`: chuyển sang centimeter
    - `SVGLength.SVG_LENGTHTYPE_MM`: chuyển sang millimeter
    - `SVGLength.SVG_LENGTHTYPE_IN`: chuyển sang inch
    - `SVGLength.SVG_LENGTHTYPE_PT`: chuyển sang point
    - `SVGLength.SVG_LENGTHTYPE_PC`: chuyển sang pica

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

## Ví dụ

### Chuyển đổi độ dài sang mm

```js
// Lấy đối tượng SVGLength
const svg = document.querySelector("svg");
const length = svg.createSVGLength();

// Đặt giá trị độ dài theo centimeter
length.valueAsString = "0.5cm";

// Chuyển đổi độ dài sang millimeter
length.convertToSpecifiedUnits(SVGLength.SVG_LENGTHTYPE_MM);

console.log(length.unitType); // Output: 7 (SVG_LENGTHTYPE_MM)
console.log(length.valueInSpecifiedUnits); // Output: 5
console.log(length.valueAsString); // Output: "5mm"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedLength")}}
