---
title: "KeyframeEffect: thuộc tính composite"
short-title: composite
slug: Web/API/KeyframeEffect/composite
page-type: web-api-instance-property
browser-compat: api.KeyframeEffect.composite
---

{{ APIRef("Web Animations") }}

Thuộc tính **`composite`** của {{domxref("KeyframeEffect")}} giải quyết cách hoạt hình của phần tử tác động đến các giá trị thuộc tính bên dưới của nó.

## Giá trị

Để hiểu các giá trị này, hãy lấy ví dụ giá trị `keyframeEffect` là `blur(2)` hoạt động trên giá trị thuộc tính bên dưới là `blur(3)`.

- `replace`
  - : `keyframeEffect` **ghi đè** giá trị bên dưới mà nó được kết hợp: `blur(2)` thay thế `blur(3)`.
- `add`
  - : `keyframeEffect` được **thêm vào** giá trị bên dưới mà nó được kết hợp (còn gọi là _cộng_): `blur(2) blur(3)`.
- `accumulate`
  - : keyframeEffect được **tích lũy** vào giá trị bên dưới: `blur(5)`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- Thuộc tính của đối tượng {{domxref("KeyframeEffect")}}
- {{Glossary("Composite operation")}}
