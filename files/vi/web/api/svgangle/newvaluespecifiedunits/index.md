---
title: "SVGAngle: newValueSpecifiedUnits() method"
short-title: newValueSpecifiedUnits()
slug: Web/API/SVGAngle/newValueSpecifiedUnits
page-type: web-api-instance-method
browser-compat: api.SVGAngle.newValueSpecifiedUnits
---

{{APIRef("SVG")}}

Phương thức `newValueSpecifiedUnits()` của giao diện {{domxref("SVGAngle")}} đặt giá trị dưới dạng số với {{domxref("SVGAngle.unitType", "unitType")}} liên kết, thay thế các giá trị của tất cả thuộc tính trên đối tượng.

## Cú pháp

```js-nolint
newValueSpecifiedUnits(unitType, valueInSpecifiedUnits)
```

### Tham số

- `unitType`
  - : Một hằng số đại diện cho loại đơn vị mà giá trị góc cần được chuyển đổi sang. Đây phải là một trong các giá trị hằng số được định nghĩa cho thuộc tính {{domxref("SVGAngle.unitType", "unitType")}}, ngoại trừ `SVG_ANGLETYPE_UNKNOWN`.
    - `SVGAngle.SVG_ANGLETYPE_DEG`: chuyển sang độ
    - `SVGAngle.SVG_ANGLETYPE_RAD`: chuyển sang radian
    - `SVGAngle.SVG_ANGLETYPE_GRAD`: chuyển sang gradian
    - `SVGAngle.SVG_ANGLETYPE_UNSPECIFIED`: chuyển sang số không đơn vị, được hiểu là độ

- `valueInSpecifiedUnits`
  - : Hệ số số của giá trị góc, được biểu thị theo loại đơn vị đã chỉ định.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

### Ngoại lệ

Phương thức này có thể ném ra {{domxref("DOMException")}} với một trong các kiểu sau:

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `unitType` là `SVG_ANGLETYPE_UNKNOWN` hoặc không phải hằng số loại đơn vị hợp lệ.

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGAngle")}} tương ứng với thuộc tính chỉ đọc hoặc khi chính đối tượng là chỉ đọc.

## Ví dụ

### Đặt góc theo độ

```js
// Lấy đối tượng SVGAngle
const svg = document.querySelector("svg");
const angle = svg.createSVGAngle();

// Đặt giá trị góc theo độ bằng newValueSpecifiedUnits()
angle.newValueSpecifiedUnits(SVGAngle.SVG_ANGLETYPE_DEG, 45);

// Truy xuất giá trị góc theo độ
console.log(angle.value); // Output: 45
console.log(angle.unitType); // Output: 2 (SVG_ANGLETYPE_DEG)
```

### Đặt góc theo radian

```js
// Lấy đối tượng SVGAngle
const svg = document.querySelector("svg");
const angle = svg.createSVGAngle();

// Đặt giá trị góc theo radian bằng newValueSpecifiedUnits()
angle.newValueSpecifiedUnits(SVGAngle.SVG_ANGLETYPE_RAD, Math.PI / 2);

// Truy xuất giá trị góc
console.log(angle.value); // Output: 90
console.log(angle.unitType); // Output: 3 (SVG_ANGLETYPE_RAD)
```

### Đặt góc theo gradian

```js
// Lấy đối tượng SVGAngle
const svg = document.querySelector("svg");
const angle = svg.createSVGAngle();

// Đặt giá trị góc theo gradian bằng newValueSpecifiedUnits()
angle.newValueSpecifiedUnits(SVGAngle.SVG_ANGLETYPE_GRAD, 100);

// Truy xuất giá trị góc theo gradian
console.log(angle.value); // Output: 90
console.log(angle.unitType); // Output: 4 (SVG_ANGLETYPE_GRAD)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedAngle")}}
