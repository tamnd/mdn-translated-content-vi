---
title: "CSSNumericValue: toSum() method"
short-title: toSum()
slug: Web/API/CSSNumericValue/toSum
page-type: web-api-instance-method
browser-compat: api.CSSNumericValue.toSum
---

{{APIRef("CSS Typed OM")}}

Phương thức **`toSum()`** của giao diện {{domxref("CSSNumericValue")}} chuyển đổi giá trị của đối tượng thành một đối tượng {{domxref("CSSMathSum")}} với các giá trị theo đơn vị được chỉ định.

## Cú pháp

```js-nolint
toSum(units)
```

### Tham số

- `units`
  - : Các đơn vị cần chuyển đổi sang.

### Giá trị trả về

Một {{domxref('CSSMathSum')}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu kiểu không hợp lệ được truyền vào phương thức.

## Ví dụ

```js
let v = CSS.px("23").add(CSS.percent("4")).add(CSS.cm("3")).add(CSS.in("9"));
v.toString(); // => "calc(23px + 4% + 3cm + 9in)"
v.toSum("px", "percent").toString(); // => "calc(1000.39px + 4%)"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
