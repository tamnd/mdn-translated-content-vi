---
title: "CSS: phương thức tĩnh supports()"
short-title: supports()
slug: Web/API/CSS/supports_static
page-type: web-api-static-method
browser-compat: api.CSS.supports_static
---

{{APIRef("CSSOM")}}

Phương thức tĩnh **`CSS.supports()`** trả về một giá trị boolean cho biết trình duyệt có hỗ trợ một tính năng CSS nhất định hay không.

## Cú pháp

```js-nolint
CSS.supports(propertyName, value)
CSS.supports(supportCondition)
```

### Tham số

Có hai nhóm tham số riêng biệt. Nhóm thứ nhất cho phép kiểm tra khả năng hỗ trợ của một cặp _thuộc tính-giá trị_:

- `propertyName`
  - : Một chuỗi chứa tên của thuộc tính CSS cần kiểm tra.
- `value`
  - : Một chuỗi chứa giá trị của thuộc tính CSS cần kiểm tra.

Cú pháp thứ hai nhận một tham số khớp với điều kiện của {{cssxref("@supports")}}:

- `supportCondition`
  - : Một chuỗi chứa điều kiện cần kiểm tra.

### Giá trị trả về

`true` nếu trình duyệt hỗ trợ quy tắc, ngược lại là `false`.

## Ví dụ

Trong các ví dụ sau, `result` là một giá trị boolean cho biết trình duyệt có hỗ trợ tính năng CSS đã cho hay không.

```js
result = CSS.supports("text-decoration-style", "blink");
result = CSS.supports("display: flex");
result = CSS.supports("(--foo: red)");
result = CSS.supports("selector(:has(a))");
result = CSS.supports(
  "(transform-style: preserve) or (-moz-transform-style: preserve) or (-webkit-transform-style: preserve)",
);
```

Để xem thêm ví dụ và các đặc tính cú pháp, hãy xem at-rule {{cssxref("@supports")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- At-rule {{cssxref("@supports")}} cho phép cùng chức năng này nhưng theo cách khai báo.
- Lớp CSSOM {{domxref("CSSSupportsRule")}} cho phép thao tác với các at-rule {{cssxref("@supports")}}.
