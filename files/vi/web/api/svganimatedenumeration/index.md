---
title: SVGAnimatedEnumeration
slug: Web/API/SVGAnimatedEnumeration
page-type: web-api-interface
browser-compat: api.SVGAnimatedEnumeration
---

{{APIRef("SVG")}}

Giao diện **`SVGAnimatedEnumeration`** mô tả các giá trị thuộc tính là các hằng số từ một kiểu liệt kê cụ thể và có thể được hoạt hình.

## Thuộc tính phiên bản

- {{domxref("SVGAnimatedEnumeration.baseVal", "baseVal")}}
  - : Một số nguyên là giá trị cơ sở của thuộc tính đã cho trước khi áp dụng bất kỳ hoạt hình nào.
- {{domxref("SVGAnimatedEnumeration.animVal", "animVal")}}
  - : Nếu thuộc tính hoặc thuộc tính đã cho đang được hoạt hình, nó chứa giá trị hoạt hình hiện tại của thuộc tính hoặc thuộc tính đó. Nếu thuộc tính hoặc thuộc tính đã cho hiện không đang được hoạt hình, nó chứa giá trị tương tự như `baseVal`.

## Phương thức phiên bản

Giao diện `SVGAnimatedEnumeration` không cung cấp bất kỳ phương thức cụ thể nào.

## Ví dụ

Xem xét đoạn này với phần tử {{SVGElement("clipPath")}}: Thuộc tính {{SVGAttr("clipPathUnits")}} của nó liên quan đến đối tượng `SVGAnimatedEnumeration`.

```html
<svg viewBox="0 0 100 100" width="200" height="200">
  <clipPath id="clip1" clipPathUnits="userSpaceOnUse">
    <circle cx="50" cy="50" r="35" />
  </clipPath>

  <!-- Một số hình chữ nhật tham chiếu để cụ thể hóa đường cắt -->
  <rect id="r1" x="0" y="0" width="45" height="45" />
</svg>
```

Đoạn này lấy phần tử và ghi lại `baseVal` và `animVal` của thuộc tính {{domxref("SVGClipPathElement.clipPathUnits")}}. Vì không có hoạt hình nào đang xảy ra, chúng có cùng giá trị.

```js
const clipPathElt = document.getElementById("clip1");
console.log(clipPathElt.clipPathUnits.baseVal); // Ghi ra 1 tương ứng với userSpaceOnUse
console.log(clipPathElt.clipPathUnits.animVal); // Ghi ra 1 tương ứng với userSpaceOnUse
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
