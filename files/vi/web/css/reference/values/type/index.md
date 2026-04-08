---
title: type()
slug: Web/CSS/Reference/Values/type
page-type: css-function
status:
  - experimental
browser-compat: css.types.type
sidebar: cssref
---

{{seecompattable}}

Hàm **`type()`** [CSS](/vi/docs/Web/CSS) cho phép bạn chỉ định một kiểu dữ liệu cụ thể, và được sử dụng bởi các tính năng CSS sau:

- Hàm {{cssxref("attr()")}}, để chỉ định kiểu dữ liệu mà giá trị thuộc tính nên được phân tích cú pháp thành.
- At-rule {{cssxref("@function")}}, để chỉ định các kiểu dữ liệu được phép cho các tham số và kết quả của [hàm tùy chỉnh CSS](/vi/docs/Web/CSS/Guides/Custom_functions_and_mixins/Using_custom_functions).

> [!NOTE]
> Giá trị mô tả {{cssxref("@property/syntax", "syntax")}} của at-rule {{cssxref("@property")}} sử dụng cùng `<syntax>` để định nghĩa các kiểu dữ liệu được phép cho các [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) đã đăng ký, tuy nhiên, điều này luôn có dạng một chuỗi.

## Cú pháp

```css
/* Giá trị đơn */
type(<color>)
type(auto)

/* Bộ kết hợp "|" cho nhiều kiểu */
type(<length> | <percentage>)

/* Danh sách giá trị phân tách bằng khoảng trắng */
type(<color>+)

/* Danh sách giá trị phân tách bằng dấu phẩy */
type(<length>#)

/* Nhiều từ khóa */
type(red | blue | green)

/* Kết hợp kiểu dữ liệu và từ khóa */
type(<percentage> | auto)

/* Cú pháp toàn cục */
type(*)
```

### Tham số

Cú pháp của hàm `type()` như sau:

```plain
type(<syntax>)
```

Tham số `<syntax>` là một biểu thức định nghĩa kiểu dữ liệu. Nó có thể có các dạng sau:

- `<ident>`
  - : Một giá trị từ khóa CSS, được viết không có dấu ngoặc nhọn.

- `<syntax-type>`
  - : Tên kiểu, được viết trong dấu ngoặc nhọn, đại diện cho một kiểu dữ liệu CSS. Các kiểu dữ liệu sau được hỗ trợ:
    - `<angle>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("angle")}} hợp lệ nào.
    - `<color>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;color&gt;")}} hợp lệ nào.
    - `<custom-ident>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;custom-ident&gt;")}} hợp lệ nào.
    - `<image>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("image")}} hợp lệ nào.
    - `<integer>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;integer&gt;")}} hợp lệ nào.
    - `<length>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;length&gt;")}} hợp lệ nào.
    - `<length-percentage>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} hợp lệ nào và bất kỳ biểu thức {{cssxref("calc()")}} hợp lệ nào kết hợp các giá trị `<length>` và `<percentage>`.
    - `<number>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;number&gt;")}} hợp lệ nào.
    - `<percentage>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;percentage&gt;")}} hợp lệ nào.
    - `<resolution>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("resolution")}} hợp lệ nào.
    - `<string>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;string&gt;")}} hợp lệ nào.
    - `<time>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;time&gt;")}} hợp lệ nào.
    - `<transform-function>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("&lt;transform-function&gt;")}} hợp lệ nào.
    - `<transform-list>`
      - : Chấp nhận danh sách các giá trị {{cssxref("&lt;transform-function&gt;")}} hợp lệ. Nó tương đương với `"<transform-function>+"`, và không thể theo sau bởi token `+` hoặc `#`.
    - `<url>`
      - : Chấp nhận bất kỳ giá trị {{cssxref("url_value", "&lt;url&gt;")}} hợp lệ nào.

- `*`
  - : Cú pháp toàn cục.

Bạn có thể kết hợp các giá trị `<syntax-type>` bằng cách sử dụng các token sau:

- `+`
  - : Danh sách giá trị phân tách bằng khoảng trắng được mong đợi.
- `#`
  - : Danh sách giá trị phân tách bằng dấu phẩy được mong đợi.

Ngoài ra, token `|` có thể được sử dụng làm dấu phân cách khi chỉ định nhiều giá trị hoặc kết hợp các giá trị `<ident>` và `<syntax-type>` cho cú pháp mong đợi.

### Giá trị trả về

Một định nghĩa kiểu dữ liệu.

## Mô tả

Hàm `type()` được sử dụng khi bạn cần định nghĩa một kiểu dữ liệu. Nó có thể được coi là một tập con của cú pháp định nghĩa giá trị tổng thể được sử dụng để định nghĩa tập hợp các giá trị hợp lệ cho mọi thuộc tính và hàm CSS.

Thông thường nhất, bạn sẽ thấy `type()` được sử dụng để chỉ định một kiểu dữ liệu duy nhất. Ví dụ tiếp theo sử dụng hàm {{cssxref("attr()")}} để đặt thuộc tính {{cssxref("background-color")}} bằng giá trị của hàm `data-background` do người dùng định nghĩa. Kiểu dữ liệu yêu cầu cho giá trị đã được chỉ định là {{cssxref("&lt;color>")}}.

```css
background-color: attr(data-background type(<color>), red);
```

Bạn cũng có thể chỉ định yêu cầu từ khóa chính xác (ví dụ: `type(blue)`), nhưng điều này sẽ quá hạn chế.

Chỉ định `type(*)` cho phép bất kỳ giá trị CSS hợp lệ nào. Đây là cú pháp toàn cục, không thể được nhân lên hoặc kết hợp với các thành phần cú pháp khác.

### Chỉ định nhiều kiểu được phép

Bạn có thể sử dụng token `|` làm dấu phân cách khi chỉ định một phạm vi các kiểu dữ liệu được phép, từ khóa, hoặc kết hợp cả hai. Ví dụ:

- `type(<length> | <percentage>)`
- `type(red | green)`
- `type(<length> | auto)`

Ví dụ sau đây cho thấy cách at-rule {{cssxref("@function")}} có thể được sử dụng để định nghĩa một [hàm tùy chỉnh](/vi/docs/Web/CSS/Guides/Custom_functions_and_mixins/Using_custom_functions) nhận hai tham số màu sắc và trả về tham số đầu tiên trừ khi chiều rộng viewport nhỏ hơn `700px`, trong trường hợp đó nó trả về tham số thứ hai. Tham số đầu tiên được phép là `red` hoặc `green`, trong khi tham số thứ hai phải là `blue`.

```css
@function --color-choice(--color1 type(red | green), --color2 blue) {
  result: var(--color1);
  @media (width < 700px) {
    result: var(--color2);
  }
}
```

> [!NOTE]
> Trong trường hợp kiểu dữ liệu `@function`, bạn có thể bỏ qua hàm `type()` và chỉ bao gồm giá trị trong các trường hợp chỉ có một kiểu dữ liệu hoặc từ khóa được chỉ định. Đây là trường hợp với định nghĩa kiểu `blue` trong hàm tùy chỉnh trước đó. Điều này không hoạt động với hàm `attr()`.

### Chỉ định danh sách các kiểu

Các token `+` và `#` có thể được thêm vào `<syntax-type>` để chỉ định rằng bạn đang mong đợi danh sách phân tách bằng khoảng trắng hoặc danh sách phân tách bằng dấu phẩy, tương ứng. Ví dụ:

- Tham số `<color>+` mong đợi danh sách các giá trị `<color>` phân tách bằng khoảng trắng, ví dụ `red blue #a60000 rgb(234 45 100)`.
- Tham số `<length>#` mong đợi danh sách các giá trị `<length>` phân tách bằng dấu phẩy, ví dụ `30px, 1em, 15vw`.

Bạn có thể kết hợp nhiều token bằng cách sử dụng `|` làm dấu phân cách. Ví dụ: `<color># | <integer>#` sẽ mong đợi danh sách phân tách bằng dấu phẩy của các giá trị `<color>` hoặc danh sách phân tách bằng dấu phẩy của các giá trị `<integer>`.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

Bạn có thể tìm thấy một số ví dụ khác trong tài liệu {{cssxref("attr()")}} và {{cssxref("@function")}}.

### Định nghĩa kiểu dữ liệu `@function` cơ bản

Ví dụ này định nghĩa một hàm tùy chỉnh CSS kết hợp nhiều chuỗi.

#### HTML

HTML chứa một phần tử {{htmlelement("section")}} duy nhất với một số nội dung văn bản.

```html live-sample___basic-data-type
<section>What you gonna say?</section>
```

#### CSS

Trong CSS, chúng ta bắt đầu bằng cách chỉ định `@function` được gọi là `--combine-strings`. Hàm này có một tham số gọi là `--strings`, kiểu dữ liệu của tham số này được chỉ định là một hoặc nhiều giá trị `<string>` phân tách bằng khoảng trắng. Nó trả về các giá trị chuỗi với một khoảng trắng và một biểu tượng trái tim được thêm vào cuối.

```css-nolint live-sample___basic-data-type
@function --combine-strings(--strings type(<string>+)) {
  result: var(--strings) " ❤️";
}
```

Sau đó, chúng ta chỉ định một số kiểu dáng cơ bản cho phần tử `<section>` và sử dụng hàm `--combine-strings()` để chỉ định giá trị của thuộc tính {{cssxref("content")}}, bao gồm hai chuỗi phân tách bằng khoảng trắng làm đối số.

```css live-sample___basic-data-type
section {
  font-family: system-ui;
  background-color: lime;
  padding: 20px;
}

section::after {
  content: --combine-strings("hello" "goodbye");
}
```

#### Kết quả

{{ EmbedLiveSample('basic-data-type', '100%', '70') }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- At-rule {{cssxref("@function")}}
- Hàm {{cssxref("attr()")}}
- [Sử dụng hàm tùy chỉnh CSS](/vi/docs/Web/CSS/Guides/Custom_functions_and_mixins/Using_custom_functions)
