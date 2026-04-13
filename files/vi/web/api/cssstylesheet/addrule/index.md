---
title: "CSSStyleSheet: addRule() method"
short-title: addRule()
slug: Web/API/CSSStyleSheet/addRule
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.CSSStyleSheet.addRule
---

{{APIRef("CSSOM")}}{{deprecated_header}}

Phương thức _legacy_ **`addRule()`** của giao diện {{domxref("CSSStyleSheet")}} đã lỗi thời thêm một quy tắc mới vào bảng kiểu. Bạn nên tránh sử dụng phương thức này, và thay vào đó nên sử dụng phương thức tiêu chuẩn hơn {{domxref("CSSStyleSheet.insertRule", "insertRule()")}}.

## Cú pháp

```js-nolint
addRule(selector, styleBlock, index)
```

### Tham số

- `selector`
  - : Một chuỗi chỉ định phần bộ chọn của quy tắc CSS. Giá trị mặc định là chuỗi `undefined`.
- `styleBlock`
  - : Một chuỗi chỉ định khối kiểu dáng áp dụng cho các phần tử khớp với `selector`. Giá trị mặc định là chuỗi `undefined`.
- `index` {{optional_inline}}
  - : Một chỉ số tùy chọn trong {{domxref("CSSRuleList")}} của bảng kiểu để chèn quy tắc mới vào. Nếu không chỉ định `index`, chỉ số tiếp theo sau mục cuối cùng hiện có trong danh sách sẽ được sử dụng (cụ thể là giá trị của `cssStyleSheet.cssRules.length`).

### Giá trị trả về

Luôn trả về -1.

Lưu ý rằng do các quy tắc khá phức tạp về vị trí bạn có thể chèn quy tắc hợp lệ, nên có thể một ngoại lệ sẽ được ném ra. Xem {{domxref("CSSStyleSheet.insertRule", "insertRule()")}} để biết thêm thông tin.

## Ghi chú sử dụng

Phương thức này được các trình duyệt triển khai bằng cách xây dựng một chuỗi sử dụng template literal `` `${selector}{${styleBlock}}` ``, sau đó truyền nó vào phương thức tiêu chuẩn {{domxref("CSSStyleSheet.insertRule", "insertRule()")}}.

Do đó, với mã hiện có như sau:

```js
cssStyleSheet.addRule(selector, styles, 0);
```

Bạn có thể viết lại để sử dụng `insertRule()` tiêu chuẩn hơn như sau:

```js
cssStyleSheet.insertRule(`${selector} {${styles}}`, 0);
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model)
- [Using dynamic styling information](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
