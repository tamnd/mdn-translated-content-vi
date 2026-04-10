---
title: Các hàm factory số của CSS
slug: Web/API/CSS/factory_functions_static
page-type: web-api-static-method
browser-compat: api.CSS
spec-urls: https://drafts.css-houdini.org/css-typed-om/#numeric-factory
---

{{APIRef("CSSOM")}}

**Các hàm factory số của CSS**, như `CSS.em()` và `CSS.turn()`, là các phương thức trả về [CSSUnitValue](/en-US/docs/Web/API/CSSUnitValue) với giá trị là đối số số và đơn vị là tên của phương thức được dùng. Những hàm này tạo giá trị số mới ngắn gọn hơn so với việc dùng hàm khởi tạo {{domxref("CSSUnitValue.CSSUnitValue", "CSSUnitValue()")}}.

## Cú pháp

```js-nolint
CSS.number(number)
CSS.percent(number)

// <length>
CSS.em(number)
CSS.ex(number)
CSS.ch(number)
CSS.ic(number)
CSS.rem(number)
CSS.lh(number)
CSS.rlh(number)
CSS.vw(number)
CSS.vh(number)
CSS.vi(number)
CSS.vb(number)
CSS.vmin(number)
CSS.vmax(number)
CSS.cm(number)
CSS.mm(number)
CSS.Q(number)
CSS.in(number)
CSS.pt(number)
CSS.pc(number)
CSS.px(number)

// <angle>
CSS.deg(number)
CSS.grad(number)
CSS.rad(number)
CSS.turn(number)

// <time>
CSS.s(number)
CSS.ms(number)

// <frequency>
CSS.Hz(number)
CSS.kHz(number)

// <resolution>
CSS.dpi(number)
CSS.dpcm(number)
CSS.dppx(number)

// <flex>
CSS.fr(number)
```

### Tham số

- `number`
  - : Một số sẽ được dùng trong giá trị đơn vị CSS.

### Giá trị trả về

Một đối tượng {{domxref("CSSUnitValue")}} với giá trị số và đơn vị được chỉ định.

## Ví dụ

Chúng ta dùng hàm factory số `CSS.vmax()` để tạo một {{domxref('CSSUnitValue')}}:

```js
const height = CSS.vmax(50);

console.log(height); // CSSUnitValue {value: 50, unit: "vmax"}
console.log(height.value); // 50
console.log(height.unit); // vmax
```

Trong ví dụ này, chúng ta đặt `margin` cho phần tử bằng hàm factory `CSS.px()`:

```js
myElement.attributeStyleMap.set("margin", CSS.px(40));
const currentMargin = myElement.attributeStyleMap.get("margin");
console.log(currentMargin.value, currentMargin.unit); // 40, 'px'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSUnitValue.CSSUnitValue", "CSSUnitValue()")}}
