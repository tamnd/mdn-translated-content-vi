---
title: "SVGLength: newValueSpecifiedUnits() method"
short-title: newValueSpecifiedUnits()
slug: Web/API/SVGLength/newValueSpecifiedUnits
page-type: web-api-instance-method
browser-compat: api.SVGLength.newValueSpecifiedUnits
---

{{APIRef("SVG")}}

Phương thức `newValueSpecifiedUnits()` của giao diện {{domxref("SVGLength")}} đặt lại giá trị dưới dạng số với {{domxref("SVGLength.unitType", "unitType")}} liên kết, thay thế các giá trị của tất cả thuộc tính trên đối tượng.

## Cú pháp

```js-nolint
newValueSpecifiedUnits(unitType, valueInSpecifiedUnits)
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

- `valueInSpecifiedUnits`
  - : Hệ số số của giá trị độ dài, được biểu thị theo loại đơn vị đã chỉ định.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

### Ngoại lệ

Phương thức này có thể ném ra {{domxref("DOMException")}} với một trong các kiểu sau:

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `unitType` là `SVG_LENGTHTYPE_UNKNOWN` hoặc không phải hằng số loại đơn vị hợp lệ.
- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGLength")}} tương ứng với thuộc tính chỉ đọc hoặc khi chính đối tượng là chỉ đọc.

## Ví dụ

### Đặt giá trị độ dài với các đơn vị cụ thể

```js
// Lấy đối tượng SVGLength
const svg = document.querySelector("svg");
const length = svg.createSVGLength();

// Đặt giá trị mới với các đơn vị cụ thể
length.newValueSpecifiedUnits(SVGLength.SVG_LENGTHTYPE_NUMBER, 45);
console.log(length.valueInSpecifiedUnits); // Output: 45
console.log(length.unitType); // Output: 1 (SVG_LENGTHTYPE_NUMBER)
console.log(length.value); // Giá trị được chuyển đổi sang hệ tọa độ người dùng

// Thay đổi giá trị sang pixel
length.newValueSpecifiedUnits(SVGLength.SVG_LENGTHTYPE_PX, 100);
console.log(length.valueInSpecifiedUnits); // Output: 100
console.log(length.unitType); // Output: 5 (SVG_LENGTHTYPE_PX)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedLength")}}
