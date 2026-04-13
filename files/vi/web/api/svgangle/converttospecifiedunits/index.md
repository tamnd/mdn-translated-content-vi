---
title: "SVGAngle: convertToSpecifiedUnits() method"
short-title: convertToSpecifiedUnits()
slug: Web/API/SVGAngle/convertToSpecifiedUnits
page-type: web-api-instance-method
browser-compat: api.SVGAngle.convertToSpecifiedUnits
---

{{APIRef("SVG")}}

Phương thức `convertToSpecifiedUnits()` của giao diện {{domxref("SVGAngle")}} cho phép bạn chuyển đổi giá trị góc sang loại đơn vị được chỉ định.

Hàm này sẽ:

- Đặt thuộc tính {{domxref("SVGAngle.unitType", "unitType")}} về loại đơn vị đã cho.
- Cập nhật các thuộc tính {{domxref("SVGAngle.valueInSpecifiedUnits", "valueInSpecifiedUnits")}} và {{domxref("SVGAngle.valueAsString", "valueAsString")}} để giá trị góc được biểu thị theo loại đơn vị đã cho.

## Cú pháp

```js-nolint
convertToSpecifiedUnits(unitType)
```

### Tham số

- `unitType`
  - : Một hằng số đại diện cho loại đơn vị mà giá trị góc cần được chuyển đổi sang. Đây phải là một trong các giá trị hằng số được định nghĩa cho thuộc tính {{domxref("SVGAngle.unitType", "unitType")}}, ngoại trừ `SVG_ANGLETYPE_UNKNOWN`.
    - `SVGAngle.SVG_ANGLETYPE_DEG`: chuyển sang độ
    - `SVGAngle.SVG_ANGLETYPE_RAD`: chuyển sang radian
    - `SVGAngle.SVG_ANGLETYPE_GRAD`: chuyển sang gradian
    - `SVGAngle.SVG_ANGLETYPE_UNSPECIFIED`: chuyển sang số không đơn vị, được hiểu là độ

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

## Ví dụ

### Chuyển đổi góc sang độ

```js
// Lấy đối tượng SVGAngle
const svg = document.querySelector("svg");
const angle = svg.createSVGAngle();

// Đặt giá trị góc theo radian (Math.PI / 2)
angle.newValueSpecifiedUnits(SVGAngle.SVG_ANGLETYPE_RAD, Math.PI / 2);

// Truy xuất giá trị góc dưới dạng chuỗi
console.log(angle.valueAsString); // Output: 1.5708rad
console.log(angle.unitType); // Output: 3 (SVG_ANGLETYPE_RAD)

// Chuyển đổi giá trị góc sang độ
angle.convertToSpecifiedUnits(SVGAngle.SVG_ANGLETYPE_DEG);

// Truy xuất giá trị góc dưới dạng chuỗi
console.log(angle.valueAsString); // Output: 90deg
console.log(angle.unitType); // Output: 2 (SVG_ANGLETYPE_DEG)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedAngle")}}
