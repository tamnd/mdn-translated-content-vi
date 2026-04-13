---
title: "SVGAnimatedAngle: thuộc tính baseVal"
short-title: baseVal
slug: Web/API/SVGAnimatedAngle/baseVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedAngle.baseVal
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`baseVal`** của giao diện {{domxref("SVGAnimatedAngle")}} đại diện cho giá trị cơ sở (không hoạt hình) của [`<angle>`](/en-US/docs/Web/SVG/Guides/Content_type#angle) liên quan trên phần tử SVG. Thuộc tính này được dùng để lấy giá trị tĩnh của `<angle>`, không bị ảnh hưởng bởi bất kỳ hoạt hình đang diễn ra nào.

Thuộc tính này phản ánh giá trị `<angle>` của thuộc tính {{SVGattr("orient")}} của phần tử SVG {{SVGElement("marker")}}, giống với thuộc tính {{domxref("SVGMarkerElement.orientAngle")}}.

## Giá trị

Một đối tượng {{domxref("SVGAngle")}} đại diện cho giá trị cơ sở của kiểu nội dung [`<angle>`](/en-US/docs/Web/SVG/Guides/Content_type#angle).

- Giá trị không bị ảnh hưởng bởi hoạt hình, đại diện cho trạng thái ban đầu của góc.
- Kiểu đơn vị của góc có thể được lấy từ {{domxref("SVGAngle.unitType")}}.

## Ví dụ

```js
const marker = document.querySelector("[orient]");

// Đặt thuộc tính orient với một góc
marker.setAttribute("orient", "90");
const baseAngle = marker.orientAngle.baseVal; // một đối tượng SVGAngle

console.log(baseAngle.value); // Đầu ra: 90
console.log(baseAngle.unitType); // Đầu ra: 1 (hằng số cho SVG_ANGLETYPE_UNSPECIFIED)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedAngle.animVal")}}
- {{domxref("SVGAngle")}} và [các hằng số `value` của góc](/en-US/docs/Web/API/SVGAngle#static_properties)
