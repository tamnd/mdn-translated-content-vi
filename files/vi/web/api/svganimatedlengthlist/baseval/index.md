---
title: "SVGAnimatedLengthList: thuộc tính baseVal"
short-title: baseVal
slug: Web/API/SVGAnimatedLengthList/baseVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedLengthList.baseVal
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`baseVal`** của giao diện {{domxref("SVGAnimatedLengthList")}} đại diện cho giá trị cơ sở (không hoạt hình) của một thuộc tính có thể hoạt hình chấp nhận danh sách các giá trị [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number).

Một số thuộc tính SVG, như các thuộc tính `x`, `y`, `dx` và `dy` của phần tử [`<tspan>`](/en-US/docs/Web/SVG/Reference/Element/tspan) và [`<text>`](/en-US/docs/Web/SVG/Reference/Element/text), chấp nhận danh sách các độ dài, phần trăm, hoặc số làm giá trị. Thuộc tính này phản ánh giá trị thuộc tính, ở trạng thái không hoạt hình, dưới dạng đối tượng {{domxref("SVGLengthList")}} trực tiếp.

## Giá trị

Một đối tượng {{domxref("SVGLengthList")}} đại diện cho giá trị cơ sở của thuộc tính.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length)
- [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage)
- [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number)
- {{domxref("SVGLengthList")}}
