---
title: "CSSTranslate: CSSTranslate() constructor"
short-title: CSSTranslate()
slug: Web/API/CSSTranslate/CSSTranslate
page-type: web-api-constructor
browser-compat: api.CSSTranslate.CSSTranslate
---

{{APIRef("CSS Typed OM")}}

Hàm khởi tạo **`CSSTranslate()`** tạo một đối tượng {{domxref("CSSTranslate")}} mới đại diện cho giá trị {{cssxref("transform-function/translate", "translate()")}} của thuộc tính {{CSSXref('transform')}} riêng lẻ trong CSS.

## Cú pháp

```js-nolint
new CSSTranslate(x, y)
new CSSTranslate(x, y, z)
```

### Tham số

- {{domxref('CSSTranslate.x','x')}}
  - : Giá trị cho trục x của đối tượng {{domxref('CSSTranslate')}} được tạo. Phải là một {{cssxref('length-percentage')}}.
- {{domxref('CSSTranslate.y','y')}}
  - : Giá trị cho trục y của đối tượng {{domxref('CSSTranslate')}} được tạo. Phải là một {{cssxref('length-percentage')}}.
- {{domxref('CSSTranslate.z','z')}} {{optional_inline}}
  - : Giá trị cho trục z của đối tượng {{domxref('CSSTranslate')}} được tạo. Phải là một {{cssxref('length')}}.

    Nếu truyền vào giá trị cho trục z thì đây là phép biến đổi 3D. Thuộc tính `is2D` sẽ được đặt thành false.

### Ngoại lệ

- [`TypeError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError)
  - : Được ném ra nếu giá trị của `CSSTranslate.x` hoặc `CSSTranslate.y` không phải là {{cssxref('length-percentage')}}.
- [`TypeError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError)
  - : Được ném ra nếu giá trị của `CSSTranslate.z` tồn tại nhưng không phải là {{cssxref('length')}}.

## Ví dụ

Sẽ cập nhật sau.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
