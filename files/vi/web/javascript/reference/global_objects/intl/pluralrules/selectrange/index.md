---
title: Intl.PluralRules.prototype.selectRange()
short-title: selectRange()
slug: Web/JavaScript/Reference/Global_Objects/Intl/PluralRules/selectRange
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.PluralRules.selectRange
sidebar: jsref
---

Phương thức **`selectRange()`** của các instance {{jsxref("Intl.PluralRules")}} nhận hai giá trị và trả về chuỗi chỉ ra quy tắc số nhiều nào cần dùng cho định dạng khoảng số theo locale.

## Cú pháp

```js-nolint
selectRange(startRange, endRange)
```

### Tham số

- `startRange`
  - : Số đại diện cho đầu của khoảng.
- `endRange`
  - : Số đại diện cho cuối của khoảng.

### Giá trị trả về

Chuỗi đại diện cho danh mục số nhiều của khoảng được chỉ định. Có thể là một trong `zero`, `one`, `two`, `few`, `many` hoặc `other`, phù hợp với locale được chỉ định trong [LDML Language Plural Rules](https://www.unicode.org/cldr/charts/43/supplemental/language_plural_rules.html).

## Mô tả

Hàm này chọn danh mục số nhiều theo locale và tùy chọn định dạng của đối tượng {{jsxref("Intl.PluralRules")}}.

Về mặt khái niệm, hành vi giống như lấy quy tắc số nhiều cho một số đếm hoặc số thứ tự đơn lẻ. Các ngôn ngữ có một hoặc nhiều dạng để mô tả khoảng, và phương thức này trả về dạng phù hợp với locale và tùy chọn định dạng đã cho. Trong tiếng Anh chỉ có một dạng số nhiều, chẳng hạn như "1–10 apples", và phương thức sẽ trả về `other`. Các ngôn ngữ khác có thể có nhiều dạng.

## Ví dụ

### Sử dụng selectRange()

```js
new Intl.PluralRules("sl").selectRange(102, 201); // 'few'

new Intl.PluralRules("pt").selectRange(102, 102); // 'other'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.PluralRules")}}
