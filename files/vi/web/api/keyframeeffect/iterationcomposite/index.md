---
title: "KeyframeEffect: thuộc tính iterationComposite"
short-title: iterationComposite
slug: Web/API/KeyframeEffect/iterationComposite
page-type: web-api-instance-property
browser-compat: api.KeyframeEffect.iterationComposite
---

{{ APIRef("Web Animations") }}

Thuộc tính **`iterationComposite`** của {{domxref("KeyframeEffect")}} giải quyết cách các thay đổi giá trị thuộc tính của hoạt hình tích lũy hoặc ghi đè lẫn nhau qua mỗi lần lặp của hoạt hình.

## Giá trị

Một trong các giá trị sau:

- `replace`
  - : Giá trị `keyframeEffect` được tạo ra độc lập với lần lặp hiện tại.
- `accumulate`
  - : Các lần lặp tiếp theo của `keyframeEffect` xây dựng trên giá trị cuối cùng của lần lặp trước.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- Thuộc tính của đối tượng {{domxref("KeyframeEffect")}}.
