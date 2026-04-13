---
title: "DOMMatrixReadOnly: toJSON() method"
short-title: toJSON()
slug: Web/API/DOMMatrixReadOnly/toJSON
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.toJSON
---

{{APIRef("DOM")}}

Phương thức **`toJSON()`** của giao diện {{domxref("DOMMatrixReadOnly")}} tạo và trả về một đối tượng {{jsxref("JSON")}}. Đối tượng JSON bao gồm các phần tử ma trận 2D `a` đến `f`, 16 phần tử của ma trận 4x4 3D là `m[1-4][1-4]`, thuộc tính boolean {{domxref("DOMMatrixReadOnly.is2D", "is2D")}}, và thuộc tính boolean {{domxref("DOMMatrixReadOnly.isIdentity", "isIdentity")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}}; biểu diễn JSON của đối tượng `DOMMatrixReadOnly`.

## Ví dụ

```js
const matrix = new DOMMatrixReadOnly();
console.log(matrix.translate(20, 30).toJSON());
/*
{
    "a": 1,
    "b": 0,
    "c": 0,
    "d": 1,
    "e": 20,
    "f": 30,
    "m11": 1,
    "m12": 0,
    "m13": 0,
    "m14": 0,
    "m21": 0,
    "m22": 1,
    "m23": 0,
    "m24": 0,
    "m31": 0,
    "m32": 0,
    "m33": 1,
    "m34": 0,
    "m41": 20,
    "m42": 30,
    "m43": 0,
    "m44": 1,
    "is2D": true,
    "isIdentity": false
}
*/
console.log(matrix.translate(22, 55, 66).toJSON());
/*
{
    "a": 1,
    "b": 0,
    "c": 0,
    "d": 1,
    "e": 22,
    "f": 55,
    "m11": 1,
    "m12": 0,
    "m13": 0,
    "m14": 0,
    "m21": 0,
    "m22": 1,
    "m23": 0,
    "m24": 0,
    "m31": 0,
    "m32": 0,
    "m33": 1,
    "m34": 0,
    "m41": 22,
    "m42": 55,
    "m43": 66,
    "m44": 1,
    "is2D": false,
    "isIdentity": false
}
*/
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.toString()")}}
- {{domxref("DOMMatrix.setMatrixValue()")}}
