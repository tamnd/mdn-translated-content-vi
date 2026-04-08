---
title: hanging-punctuation
slug: Web/CSS/Reference/Properties/hanging-punctuation
page-type: css-property
browser-compat: css.properties.hanging-punctuation
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`hanging-punctuation`** chỉ định liệu một dấu câu có nên treo ở đầu hay cuối của một dòng văn bản hay không. Dấu câu treo có thể được đặt ngoài hộp đường.

## Cú pháp

```css
/* Giá trị từ khóa */
hanging-punctuation: none;
hanging-punctuation: first;
hanging-punctuation: last;
hanging-punctuation: allow-end;

/* Hai từ khóa */
hanging-punctuation: first allow-end;
hanging-punctuation: first last;
hanging-punctuation: last allow-end;

/* Ba từ khóa */
hanging-punctuation: first allow-end last;

/* Giá trị toàn cục */
hanging-punctuation: inherit;
hanging-punctuation: initial;
hanging-punctuation: revert;
hanging-punctuation: revert-layer;
hanging-punctuation: unset;
```

Thuộc tính `hanging-punctuation` có thể được chỉ định với một, hai hoặc ba giá trị cách nhau bằng dấu cách.

### Giá trị

- `none`
  - : Không có ký tự nào treo.
- `first`
  - : Dấu ngoặc mở hoặc dấu nháy ở đầu dòng đầu tiên được định dạng của một phần tử sẽ treo. Điều này áp dụng cho:
    - tất cả các ký tự trong các danh mục Unicode [Ps](https://unicodeplus.com/category/Ps), [Pf](https://unicodeplus.com/category/Pf), [Pi](https://unicodeplus.com/category/Pi)
    - các dấu nháy `U+0027` APOSTROPHE (`'`) và `U+0022` QUOTATION MARK (`"`).

- `last`
  - : Dấu ngoặc đóng hoặc dấu nháy ở cuối dòng cuối cùng được định dạng của một phần tử sẽ treo. Điều này áp dụng cho:
    - tất cả các ký tự trong các danh mục Unicode [Pe](https://unicodeplus.com/category/Pe), [Pf](https://unicodeplus.com/category/Pf), [Pi](https://unicodeplus.com/category/Pi)
    - các dấu nháy `U+0027` APOSTROPHE (`'`) và `U+0022` QUOTATION MARK (`"`).
- `allow-end`
  - : Dấu chấm hoặc dấu phẩy ở cuối dòng sẽ treo nếu chúng không vừa trước khi căn chỉnh đều.

Các dấu chấm và dấu phẩy được phép treo bao gồm:

- `U+002C`, COMMA
- `U+002E`, FULL STOP
- `U+060C`, ARABIC COMMA
- `U+06D4`, ARABIC FULL STOP
- `U+3001`, IDEOGRAPHIC COMMA
- `U+3002`, IDEOGRAPHIC FULL STOP
- `U+FF0C`, FULLWIDTH COMMA
- `U+FF0E`, FULLWIDTH FULL STOP
- `U+FE50`, SMALL COMMA
- `U+FE51`, SMALL IDEOGRAPHIC COMMA
- `U+FE52`, SMALL FULL STOP
- `U+FF61`, HALFWIDTH IDEOGRAPHIC FULL STOP
- `U+FF64`, HALFWIDTH IDEOGRAPHIC COMMA

Các tác nhân người dùng có thể bao gồm thêm các ký tự khác.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt dấu nháy mở và đóng để treo

#### HTML

```html
<p>
  «For a moment, nothing happened. Then, after a second or so, nothing continued
  to happen.»
</p>

<p class="hanging">
  «For a moment, nothing happened. Then, after a second or so, nothing continued
  to happen.»
</p>

<p class="hanging right">
  «For a moment, nothing happened. Then, after a second or so, nothing continued
  to happen.»
</p>
```

#### CSS

```css
p {
  width: 15em;
  border: 1px solid #cccccc;
  font-size: 2rem;
  font-style: italic;
  margin: 1em;
}

p.hanging {
  hanging-punctuation: first last;
}

p.right {
  text-align: right;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_opening_and_closing_quotes_to_hang", "", 500)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref('text-indent')}}
- [CSS Tricks: Hanging punctuation](https://css-tricks.com/almanac/properties/h/hanging-punctuation/)
