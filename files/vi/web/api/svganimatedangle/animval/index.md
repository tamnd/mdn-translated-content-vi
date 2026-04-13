---
title: "SVGAnimatedAngle: thuộc tính animVal"
short-title: animVal
slug: Web/API/SVGAnimatedAngle/animVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedAngle.animVal
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`animVal`** của giao diện {{domxref("SVGAnimatedAngle")}} đại diện cho giá trị hoạt hình hiện tại của [`<angle>`](/en-US/docs/Web/SVG/Guides/Content_type#angle) liên quan trên phần tử SVG. Nếu thuộc tính hiện không được hoạt hình, `animVal` sẽ giống với `baseVal`.

Thuộc tính này phản ánh trạng thái hoạt hình của góc của thuộc tính {{SVGattr("orient")}} đang hoạt hình của phần tử SVG {{SVGElement("marker")}}, cung cấp quyền truy cập vào giá trị của góc trong quá trình hoạt hình.

## Giá trị

Một đối tượng {{domxref("SVGAngle")}} đại diện cho giá trị hoạt hình của kiểu nội dung [`<angle>`](/en-US/docs/Web/SVG/Guides/Content_type#angle).

- Nếu góc đang được hoạt hình, `animVal` sẽ phản ánh trạng thái hoạt hình hiện tại.
- Nếu góc không được hoạt hình, `animVal` sẽ giống với {{domxref("SVGAnimatedAngle.baseVal")}}.

## Ví dụ

```js
const marker = document.querySelector("[orient]");

// Đặt góc ban đầu cho thuộc tính orient
marker.setAttribute("orient", "45");

// Truy cập giá trị hoạt hình của góc
const animAngle = marker.orientAngle.animVal; // một đối tượng SVGAngle

console.log(animAngle.value); // Đầu ra: 45 (giá trị hoạt hình hiện tại của góc)
console.log(animAngle.unitType); // Đầu ra: 2 (hằng số cho SVG_ANGLETYPE_DEG)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedAngle.baseVal")}}
- {{domxref("SVGAngle")}} và [các hằng số `value` của góc](/en-US/docs/Web/API/SVGAngle#static_properties)
