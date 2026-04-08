---
title: syntax
slug: Web/CSS/Reference/At-rules/@property/syntax
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.property.syntax
sidebar: cssref
---

Mô tả **`syntax`** của at-rule {{cssxref("@property")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) xác định các kiểu giá trị được phép cho [thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Reference/Properties/--*) đã đăng ký.
Nó kiểm soát cách giá trị được chỉ định của thuộc tính được xử lý để tính ra [giá trị tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value).
Đây là mô tả bắt buộc; nếu thiếu hoặc không hợp lệ, toàn bộ quy tắc `@property` sẽ không hợp lệ và bị bỏ qua.

## Cú pháp

```css
/* Tên kiểu dữ liệu */
syntax: "<color>";

/* Tổ hợp '|' cho nhiều kiểu dữ liệu */
syntax: "<length> | <percentage>";

/* Danh sách giá trị phân tách bằng khoảng trắng */
syntax: "<color>+";

/* Danh sách giá trị phân tách bằng dấu phẩy */
syntax: "<length>#";

/* Từ khóa */
syntax: "small | medium | large";

/* Kết hợp kiểu dữ liệu và từ khóa */
syntax: "<length> | auto";

/* Giá trị cú pháp phổ quát */
syntax: "*";
```

### Giá trị

Một chuỗi (được gọi là chuỗi cú pháp) xác định các giá trị được phép.
Nó có thể là một trong những điều sau:

- Một hoặc nhiều tên thành phần cú pháp, có thể là:
  - Tên kiểu dữ liệu (được viết trong dấu ngoặc nhọn, chẳng hạn như `<color>` hoặc `<length>`)
  - Từ khóa (được viết không có dấu ngoặc nhọn, chẳng hạn như `auto` hoặc `none`)
- Cú pháp phổ quát `*`, chấp nhận bất kỳ giá trị CSS hợp lệ nào.
  Nó không thể được nhân hoặc kết hợp với các thành phần cú pháp khác.

Các tên thành phần cú pháp có thể được sử dụng một mình hoặc nhân và kết hợp theo nhiều cách:

- Các nhân tử `+` (phân tách bằng khoảng trắng) và `#` (phân tách bằng dấu phẩy) cho biết rằng một danh sách giá trị được mong đợi.
  Ví dụ, `<color>#` có nghĩa là một danh sách `<color>` phân tách bằng dấu phẩy là cú pháp mong đợi.

- Tổ hợp đường dọc (`|`) có thể tạo điều kiện "hoặc" cho cú pháp mong đợi.
  Ví dụ, `<length> | auto` chấp nhận `<length>` hoặc `auto`, và `<color># | <integer>#` mong đợi một danh sách giá trị `<color>` phân tách bằng dấu phẩy hoặc một danh sách giá trị `<integer>` phân tách bằng dấu phẩy.

Các tên thành phần cú pháp sau được hỗ trợ:

- `"<angle>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("angle")}} hợp lệ nào.
- `"<color>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;color&gt;")}} hợp lệ nào.
- `"<custom-ident>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;custom-ident&gt;")}} hợp lệ nào.
- `"<image>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("image")}} hợp lệ nào.
- `"<integer>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;integer&gt;")}} hợp lệ nào.
- `"<length>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;length&gt;")}} hợp lệ nào.
- `"<length-percentage>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} hợp lệ và bất kỳ biểu thức {{cssxref("calc()")}} hợp lệ nào kết hợp các giá trị `<length>` và `<percentage>`.
- `"<number>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;number&gt;")}} hợp lệ nào.
- `"<percentage>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;percentage&gt;")}} hợp lệ nào.
- `"<resolution>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("resolution")}} hợp lệ nào.
- `"<string>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;string&gt;")}} hợp lệ nào.
- `"<time>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;time&gt;")}} hợp lệ nào.
- `"<transform-function>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;transform-function&gt;")}} hợp lệ nào.
- `"<transform-list>"`
  - : Chấp nhận danh sách các giá trị {{cssxref("&lt;transform-function&gt;")}} hợp lệ. Nó tương đương với `"<transform-function>+"`.
- `"<url>"`
  - : Chấp nhận bất kỳ giá trị {{cssxref("url_value", "&lt;url&gt;")}} hợp lệ nào.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đăng ký thuộc tính tùy chỉnh với kiểm tra kiểu

Ví dụ này cho thấy cách định nghĩa thuộc tính tùy chỉnh `--my-color` chỉ cho phép các giá trị `<color>`:

```css
@property --my-color {
  syntax: "<color>";
  inherits: false;
  initial-value: #c0ffee;
}
```

Sử dụng [JavaScript](/en-US/docs/Web/JavaScript) {{domxref('CSS.registerProperty_static', 'CSS.registerProperty()')}}:

```js
window.CSS.registerProperty({
  name: "--my-color",
  syntax: "<color>",
  inherits: false,
  initialValue: "#c0ffee",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các mô tả {{cssxref("@property")}} khác: {{cssxref("@property/inherits","inherits")}} và {{cssxref("@property/initial-value", "initial-value")}}
- [Đăng ký thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Guides/Properties_and_values_API/Registering_properties)
- [CSS Properties and Values API](/en-US/docs/Web/API/CSS_Properties_and_Values_API)
- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- [CSS Typed Object Model](/en-US/docs/Web/API/CSS_Typed_OM_API)
- [Houdini APIs](/en-US/docs/Web/API/Houdini_APIs)
