---
title: unicode-range
slug: Web/CSS/Reference/At-rules/@font-face/unicode-range
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-face.unicode-range
sidebar: cssref
---

Descriptor CSS **`unicode-range`** xác định phạm vi ký tự cụ thể sẽ được sử dụng từ một font được định nghĩa trong at-rule {{cssxref("@font-face")}} và sẵn sàng để dùng trên trang hiện tại. Nếu trang không sử dụng bất kỳ ký tự nào trong phạm vi này, font sẽ không được tải về; nếu dùng ít nhất một ký tự, toàn bộ font sẽ được tải về.

## Cú pháp

```css
/* Các giá trị <unicode-range> */
unicode-range: U+26; /* một điểm mã đơn */
unicode-range: U+0-7F;
unicode-range: U+0025-00FF; /* phạm vi điểm mã */
unicode-range: U+4??; /* phạm vi ký tự đại diện */
unicode-range: U+0025-00FF, U+4??; /* nhiều giá trị */
```

### Giá trị

- **_single code point_**
  - : Một điểm mã Unicode đơn lẻ, ví dụ `U+26`.
- **_code point range_**
  - : Một phạm vi các điểm mã Unicode. Ví dụ, `U+0025-00FF` nghĩa là _bao gồm tất cả ký tự trong phạm vi từ `U+0025` đến `U+00FF`_.
- **_wildcard range_**
  - : Một phạm vi điểm mã Unicode chứa ký tự đại diện, tức là dùng ký tự `'?'`, ví dụ `U+4??` nghĩa là _bao gồm tất cả ký tự trong phạm vi từ `U+400` đến `U+4FF`_.

## Mô tả

Mục đích của descriptor này là cho phép phân đoạn các tài nguyên font để trình duyệt chỉ cần tải về tài nguyên font cần thiết cho nội dung văn bản của một trang cụ thể. Ví dụ, một trang web có nhiều bản địa hóa có thể cung cấp các tài nguyên font riêng biệt cho tiếng Anh, tiếng Hy Lạp và tiếng Nhật. Đối với người dùng xem phiên bản tiếng Anh của trang, tài nguyên font cho tiếng Hy Lạp và tiếng Nhật không cần phải tải về, giúp tiết kiệm băng thông.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng font khác cho một ký tự đơn

Trong ví dụ này, chúng ta tạo một phần tử {{HTMLElement("div")}} duy nhất, với chuỗi văn bản bao gồm dấu ampersand mà chúng ta muốn tạo kiểu bằng một font khác. Để làm rõ điều này, chúng ta sẽ dùng font sans-serif, _Helvetica_, cho văn bản và font serif, _Times New Roman_, cho dấu ampersand.

Trong CSS, chúng ta thực tế đang định nghĩa một {{cssxref("@font-face")}} hoàn toàn riêng biệt chỉ bao gồm một ký tự duy nhất, nghĩa là chỉ ký tự này mới được tạo kiểu với font này. Chúng ta cũng có thể thực hiện điều này bằng cách bọc dấu ampersand trong một {{HTMLElement("span")}} và áp dụng font khác chỉ cho phần tử đó, nhưng cách đó thêm một phần tử và bộ quy tắc.

#### HTML

```html
<div>Me & You = Us</div>
```

#### CSS

```css
@font-face {
  font-family: "Ampersand";
  src: local("Times New Roman");
  unicode-range: U+26;
}

div {
  font-size: 4em;
  font-family: "Ampersand", "Helvetica", sans-serif;
}
```

#### Kết quả

{{EmbedLiveSample("Using_a_different_font_for_a_single_character", 500,104)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face/font-display", "font-display")}}
- {{cssxref("@font-face/font-family", "font-family")}}
- {{cssxref("@font-face/font-stretch", "font-stretch")}}
- {{cssxref("@font-face/font-style", "font-style")}}
- {{cssxref("@font-face/font-weight", "font-weight")}}
- {{cssxref("font-feature-settings", "font-feature-settings")}}
- {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
- {{cssxref("@font-face/src", "src")}}
