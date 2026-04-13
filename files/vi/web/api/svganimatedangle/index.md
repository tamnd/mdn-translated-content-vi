---
title: SVGAnimatedAngle
slug: Web/API/SVGAnimatedAngle
page-type: web-api-interface
browser-compat: api.SVGAnimatedAngle
---

{{APIRef("SVG")}}

Giao diện **`SVGAnimatedAngle`** được dùng cho các thuộc tính thuộc kiểu cơ bản [\<angle>](/en-US/docs/Web/SVG/Guides/Content_type#angle) có thể được hoạt hình.

## Thuộc tính phiên bản

- {{domxref("SVGAnimatedAngle.baseVal")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAngle")}} đại diện cho giá trị cơ sở của thuộc tính đã cho trước khi áp dụng bất kỳ hoạt hình nào.
- {{domxref("SVGAnimatedAngle.animVal")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAngle")}} chỉ đọc đại diện cho giá trị hoạt hình hiện tại của thuộc tính đã cho. Nếu thuộc tính đã cho hiện không đang được hoạt hình, thì {{domxref("SVGAngle")}} sẽ có cùng nội dung như `baseVal`. Đối tượng được tham chiếu bởi `animVal` luôn khác biệt so với đối tượng được tham chiếu bởi `baseVal`, ngay cả khi thuộc tính không được hoạt hình.

## Phương thức phiên bản

_Giao diện `SVGAnimatedAngle` không cung cấp bất kỳ phương thức cụ thể nào._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
