---
title: "@property"
slug: Web/CSS/Reference/At-rules/@property
page-type: css-at-rule
browser-compat: css.at-rules.property
sidebar: cssref
---

At-rule **`@property`** của [CSS](/en-US/docs/Web/CSS) [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) được dùng để định nghĩa rõ ràng [các thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Reference/Properties/--*), cho phép kiểm tra và ràng buộc kiểu thuộc tính, đặt giá trị mặc định và định nghĩa liệu thuộc tính tùy chỉnh có thể kế thừa giá trị hay không.

> [!NOTE]
> Phương thức JavaScript {{domxref('CSS.registerProperty_static', 'registerProperty()')}} tương đương với at-rule `@property`.

## Cú pháp

```css
@property --canBeAnything {
  syntax: "*";
  inherits: true;
}

@property --rotation {
  syntax: "<angle>";
  inherits: false;
  initial-value: 45deg;
}

@property --defaultSize {
  syntax: "<length> | <percentage>";
  inherits: true;
  initial-value: 200px;
}
```

Tên thuộc tính tùy chỉnh là {{cssxref("dashed-ident")}} bắt đầu bằng `--` và theo sau là một định danh hợp lệ do người dùng định nghĩa. Nó phân biệt chữ hoa và chữ thường.

### Mô tả

- {{cssxref("@property/syntax","syntax")}}
  - : Một chuỗi mô tả các kiểu giá trị được phép cho thuộc tính tùy chỉnh đã đăng ký.
- {{cssxref("@property/inherits","inherits")}}
  - : Giá trị boolean kiểm soát liệu đăng ký thuộc tính tùy chỉnh được chỉ định bởi `@property` có kế thừa theo mặc định hay không.
- {{cssxref("@property/initial-value","initial-value")}}
  - : Giá trị đặt giá trị khởi đầu cho thuộc tính.

## Mô tả

At-rule `@property` là một phần của bộ API [CSS Houdini](/en-US/docs/Web/API/Houdini_APIs). Nó cho phép các nhà phát triển định nghĩa rõ ràng [các thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Reference/Properties/--*), cho phép kiểm tra và ràng buộc kiểu thuộc tính, đặt giá trị mặc định và định nghĩa liệu thuộc tính tùy chỉnh có thể kế thừa giá trị hay không.

Quy tắc `@property` cho phép đăng ký thuộc tính tùy chỉnh trực tiếp bên trong stylesheet mà không cần bất kỳ JavaScript nào. Các quy tắc `@property` hợp lệ tạo ra các thuộc tính tùy chỉnh đã đăng ký, tạo ra hiệu ứng giống như khi gọi {{domxref('CSS.registerProperty_static', 'registerProperty()')}} với các tham số tương đương.

Các điều kiện sau phải được đáp ứng để quy tắc `@property` hợp lệ:

- Quy tắc `@property` phải bao gồm cả mô tả {{cssxref("@property/syntax","syntax")}} và {{cssxref("@property/inherits","inherits")}}.
  Nếu thiếu một trong hai, toàn bộ quy tắc `@property` sẽ không hợp lệ và bị bỏ qua.
- `syntax` có thể là tên kiểu dữ liệu (như `<color>`, `<length>` hoặc `<number>`, v.v.), với các nhân tử (`+`, `#`) và tổ hợp (`|`), một ident tùy chỉnh, hoặc định nghĩa cú pháp phổ quát (`*`), nghĩa là cú pháp có thể là bất kỳ luồng token hợp lệ nào. Giá trị là {{cssxref("string")}}. Như vậy, nó phải được đặt trong dấu ngoặc kép.
- Mô tả {{cssxref("@property/initial-value","initial-value")}} là tùy chọn nếu giá trị của mô tả `syntax` là định nghĩa cú pháp phổ quát (`syntax: "*"`).
  Nếu cần nhưng bị thiếu hoặc không hợp lệ, toàn bộ quy tắc `@property` sẽ không hợp lệ và bị bỏ qua.
- Nếu giá trị của mô tả `syntax` không phải là định nghĩa cú pháp phổ quát, mô tả {{cssxref("@property/initial-value","initial-value")}} phải là giá trị [độc lập về mặt tính toán](https://drafts.css-houdini.org/css-properties-values-api-1/#computationally-independent).
  Điều này có nghĩa là giá trị có thể được chuyển đổi thành giá trị tính toán mà không phụ thuộc vào các giá trị khác, ngoại trừ các định nghĩa "toàn cục" độc lập với CSS.
  Ví dụ, `10px` là độc lập về mặt tính toán - nó không thay đổi khi được chuyển đổi thành giá trị tính toán. `2in` cũng hợp lệ, vì `1in` luôn tương đương với `96px`. Tuy nhiên, `3em` không hợp lệ, vì giá trị của `em` phụ thuộc vào {{cssxref("font-size")}} của phần tử cha.
- Các mô tả không xác định là không hợp lệ và bị bỏ qua, nhưng không làm cho quy tắc `@property` không hợp lệ.

Nếu nhiều quy tắc `@property` hợp lệ được định nghĩa bằng cùng một tên, quy tắc cuối cùng theo thứ tự stylesheet sẽ "thắng". Nếu các thuộc tính tùy chỉnh được đăng ký với cùng tên bằng `@property` trong CSS và `CSS.registerProperty()` trong JavaScript, thì đăng ký JavaScript sẽ thắng.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

Trong ví dụ này, chúng tôi sử dụng at-rule `@property` để khai báo hai thuộc tính tùy chỉnh, sau đó sử dụng các thuộc tính đó trong các khai báo kiểu.

#### HTML

```html
<p>Hello world!</p>
```

#### CSS

```css
@property --myColor {
  syntax: "<color>";
  inherits: true;
  initial-value: rebeccapurple;
}

@property --myWidth {
  syntax: "<length> | <percentage>";
  inherits: true;
  initial-value: 200px;
}

p {
  background-color: var(--myColor);
  width: var(--myWidth);
  color: white;
}
```

#### Kết quả

{{ EmbedLiveSample('Basic example', '100%', '60px') }}

Đoạn văn nên có chiều rộng `200px`, với nền màu tím và văn bản màu trắng.

### Tạo hiệu ứng động cho giá trị thuộc tính tùy chỉnh

Trong ví dụ này, chúng tôi định nghĩa một thuộc tính tùy chỉnh gọi là `--progress` bằng cách sử dụng `@property`: thuộc tính này chấp nhận các giá trị {{cssxref("percentage")}} và có giá trị ban đầu là `25%`. Chúng tôi sử dụng `--progress` để định nghĩa giá trị vị trí của các điểm dừng màu trong {{cssxref("gradient/linear-gradient")}}, chỉ định nơi màu xanh lá cây dừng lại và màu đen bắt đầu. Sau đó chúng tôi tạo hiệu ứng động cho giá trị của `--progress` đến `100%` trong 2,5 giây, tạo ra hiệu ứng tạo hiệu ứng động cho thanh tiến trình.

#### HTML

```html
<div class="bar"></div>
```

#### CSS

```css
@property --progress {
  syntax: "<percentage>";
  inherits: false;
  initial-value: 25%;
}

.bar {
  display: inline-block;
  --progress: 25%;
  width: 100%;
  height: 5px;
  background: linear-gradient(
    to right,
    #00d230 var(--progress),
    black var(--progress)
  );
  animation: progressAnimation 2.5s ease infinite;
}

@keyframes progressAnimation {
  to {
    --progress: 100%;
  }
}
```

#### Kết quả

{{ EmbedLiveSample('Animating a custom property value', '100%', '60px') }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("var")}}
- [Thuộc tính tùy chỉnh (`--*`)](/en-US/docs/Web/CSS/Reference/Properties/--*)
- [Đăng ký thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Guides/Properties_and_values_API/Registering_properties)
- Module [CSS Properties and Values API](/en-US/docs/Web/CSS/Guides/Properties_and_values_API)
- Tài liệu API [CSS Properties and Values](/en-US/docs/Web/API/CSS_Properties_and_Values_API)
- Hướng dẫn [Sử dụng thuộc tính tùy chỉnh CSS (biến)](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties)
- Module [biến phân tầng tùy chỉnh CSS](/en-US/docs/Web/CSS/Guides/Cascading_variables)
