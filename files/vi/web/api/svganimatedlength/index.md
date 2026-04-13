---
title: SVGAnimatedLength
slug: Web/API/SVGAnimatedLength
page-type: web-api-interface
browser-compat: api.SVGAnimatedLength
---

{{APIRef("SVG")}}

Giao diện **`SVGAnimatedLength`** đại diện cho các thuộc tính thuộc kiểu [\<length>](/en-US/docs/Web/SVG/Guides/Content_type#length) có thể được hoạt hình.

## Thuộc tính phiên bản

- {{domxref("SVGAnimatedLength.baseVal", "baseVal")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGLength")}} đại diện cho giá trị cơ sở của thuộc tính đã cho trước khi áp dụng bất kỳ hoạt hình nào.
- {{domxref("SVGAnimatedLength.animVal", "animVal")}} {{ReadOnlyInline}}
  - : Nếu thuộc tính hoặc thuộc tính đã cho đang được hoạt hình,
    một {{domxref("SVGLength")}} chứa giá trị hoạt hình hiện tại của thuộc tính hoặc thuộc tính đó.
    Nếu thuộc tính hoặc thuộc tính đã cho hiện không đang được hoạt hình,
    một {{domxref("SVGLength")}} chứa giá trị tương tự như `baseVal`.

## Phương thức phiên bản

_Giao diện này không cài đặt bất kỳ phương thức cụ thể nào._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGLength")}}
