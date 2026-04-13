---
title: SVGAnimatedLengthList
slug: Web/API/SVGAnimatedLengthList
page-type: web-api-interface
browser-compat: api.SVGAnimatedLengthList
---

{{APIRef("SVG")}}

Giao diện **`SVGAnimatedLengthList`** được dùng cho các thuộc tính thuộc kiểu {{domxref("SVGLengthList")}} có thể được hoạt hình.

## Thuộc tính phiên bản

- {{domxref("SVGAnimatedLengthList.baseVal")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGLengthList")}} đại diện cho giá trị cơ sở của thuộc tính đã cho trước khi áp dụng bất kỳ hoạt hình nào.
- {{domxref("SVGAnimatedLengthList.animVal")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGLengthList")}} chỉ đọc đại diện cho giá trị hoạt hình hiện tại của thuộc tính đã cho. Nếu thuộc tính đã cho hiện không đang được hoạt hình, thì {{domxref("SVGLengthList")}} sẽ có cùng nội dung như `baseVal`. Đối tượng được tham chiếu bởi `animVal` luôn khác biệt so với đối tượng được tham chiếu bởi `baseVal`, ngay cả khi thuộc tính không được hoạt hình.

## Phương thức phiên bản

_Giao diện `SVGAnimatedLengthList` không cung cấp bất kỳ phương thức cụ thể nào._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
