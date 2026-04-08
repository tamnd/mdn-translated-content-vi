---
title: speak-as
slug: Web/CSS/Reference/At-rules/@counter-style/speak-as
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.counter-style.speak-as
sidebar: cssref
---

Descriptor **`speak-as`** chỉ định cách một ký hiệu bộ đếm được xây dựng với một {{cssxref('@counter-style')}} nhất định sẽ được biểu diễn dưới dạng giọng nói. Ví dụ: tác giả có thể chỉ định ký hiệu bộ đếm được đọc thành giá trị số hoặc chỉ được biểu diễn bằng tín hiệu âm thanh.

## Cú pháp

```css
/* Giá trị từ khóa */
speak-as: auto;
speak-as: bullets;
speak-as: numbers;
speak-as: words;
speak-as: spell-out;

/* Giá trị tên @counter-style */
speak-as: <counter-style-name>;
```

### Giá trị

- `auto`
  - : Nếu giá trị của `speak-as` được chỉ định là `auto`, thì giá trị hiệu quả của `speak-as` sẽ được xác định dựa trên giá trị của descriptor {{cssxref("@counter-style/system", "system")}}:
    - Nếu giá trị của `system` là `alphabetic`, giá trị hiệu quả của `speak-as` sẽ là `spell-out`.
    - Nếu `system` là `cyclic`, giá trị hiệu quả của `speak-as` sẽ là `bullets`.
    - Nếu `system` là `extends`, giá trị của `speak-as` sẽ giống như khi `speak-as: auto` được chỉ định trên kiểu được mở rộng.
    - Đối với tất cả các trường hợp khác, việc chỉ định `auto` có tác dụng tương tự như chỉ định `speak-as: numbers`.

- `bullets`
  - : Một cụm từ hoặc tín hiệu âm thanh do {{Glossary("user agent")}} định nghĩa để biểu diễn một mục danh sách không có thứ tự sẽ được đọc ra.
- `numbers`
  - : Giá trị số của bộ đếm sẽ được đọc ra bằng ngôn ngữ của tài liệu.
- `words`
  - : User agent sẽ tạo ra giá trị bộ đếm như bình thường và đọc nó ra như một từ trong ngôn ngữ của tài liệu.
- `spell-out`
  - : User agent sẽ tạo ra biểu diễn bộ đếm như bình thường và đọc nó từng chữ cái một. Nếu user agent không biết cách đọc một ký hiệu bộ đếm cụ thể, user agent có thể đọc nó như thể giá trị của `speak-as` là `numbers`.
- `<counter-style-name>`
  - : Tên của một kiểu bộ đếm khác, được chỉ định dưới dạng {{cssxref("&lt;custom-ident&gt;")}}. Nếu được bao gồm, bộ đếm sẽ được đọc theo dạng được chỉ định trong kiểu bộ đếm đó, tương tự như việc chỉ định descriptor {{cssxref("@counter-style/fallback", "fallback")}}. Nếu kiểu được chỉ định không tồn tại, `speak-as` mặc định là `auto`.

## Khả năng truy cập

Hỗ trợ công nghệ hỗ trợ cho thuộc tính `speak-as` rất hạn chế. Đừng dựa vào nó để truyền tải thông tin quan trọng để hiểu mục đích của trang.

[Let's Talk About Speech CSS | CSS Tricks](https://css-tricks.com/lets-talk-speech-css/) (2017)

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt dạng giọng nói cho bộ đếm

Trong ví dụ này, hệ thống bộ đếm là fixed với các ký hiệu không thể hiểu được dùng cho các marker trực quan. Tuy nhiên, descriptor `speak-as` được dùng để đặt các marker mục danh sách là số trong cây trợ năng. Khi được hỗ trợ, các số thay vì các marker trực quan sẽ được đọc bởi trình đọc màn hình.

Để trải nghiệm kết quả của descriptor `speak-as`, hãy dùng công nghệ hỗ trợ như VoiceOver hoặc trình đọc màn hình khác hoặc xem [bảng trợ năng](https://firefox-source-docs.mozilla.org/devtools-user/index.html#accessibility-inspector) trong công cụ nhà phát triển của trình duyệt hỗ trợ `speak-as`.

#### HTML

```html
<ul class="list">
  <li>I had one apple</li>
  <li>I ate two bananas</li>
  <li>I devoured three oranges</li>
  <li>I am not hungry for dinner</li>
  <li>But I'll have five scoops of ice cream for dessert</li>
</ul>
```

#### CSS

```css
@counter-style speak-as-example {
  system: fixed;
  symbols:;
  suffix: " ";
  speak-as: numbers;
}

.list {
  list-style: speak-as-example;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_the_spoken_form_for_a_counter') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các descriptor khác của {{cssxref("@counter-style")}}: {{cssxref("@counter-style/system","system")}}, {{cssxref("@counter-style/symbols", "symbols")}}, {{cssxref("@counter-style/additive-symbols", "additive-symbols")}}, {{cssxref("@counter-style/negative", "negative")}}, {{cssxref("@counter-style/prefix", "prefix")}}, {{cssxref("@counter-style/suffix", "suffix")}}, {{cssxref("@counter-style/range", "range")}}, {{cssxref("@counter-style/pad", "pad")}}, và {{cssxref("@counter-style/fallback", "fallback")}}
- {{Cssxref("list-style")}}, {{Cssxref("list-style-image")}}, {{Cssxref("list-style-position")}}
- {{cssxref("symbols()")}}: ký hiệu hàm để tạo kiểu bộ đếm ẩn danh.
- Module [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
- Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
