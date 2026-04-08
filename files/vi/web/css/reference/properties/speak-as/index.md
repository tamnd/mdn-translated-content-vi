---
title: speak-as
slug: Web/CSS/Reference/Properties/speak-as
page-type: css-property
status:
  - experimental
browser-compat: css.properties.speak-as
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`speak-as`** của [CSS](/vi/docs/Web/CSS) được dùng để xác định cách nội dung [HTML](/vi/docs/Web/HTML) được đọc ra. Một đến ba từ khóa liệt kê xác định cách thức mà các phần tử và văn bản được kết xuất bởi các công nghệ âm thanh, chẳng hạn như {{glossary("screen reader", "trình đọc màn hình")}} và trợ lý kỹ thuật số.

Thuộc tính này áp dụng cho tất cả nội dung, bao gồm cả các phần tử giả, ngoại trừ các phần tử giả {{cssxref("::marker")}} được xây dựng thông qua {{cssxref("@counter-style")}} với một bộ mô tả [`speak-as`](/vi/docs/Web/CSS/Reference/At-rules/@counter-style/speak-as) đã xác định, bộ mô tả này sẽ được ưu tiên hơn bất kỳ giá trị thuộc tính `speak-as` kế thừa nào.

## Cú pháp

```css
/* cú pháp giá trị đơn */
speak-as: normal;
speak-as: spell-out;
speak-as: literal-punctuation;
speak-as: digits;
speak-as: no-punctuation;

/* cú pháp nhiều giá trị */
speak-as: spell-out literal-punctuation;
speak-as: spell-out no-punctuation;
speak-as: digits literal-punctuation;
speak-as: digits no-punctuation;
speak-as: spell-out digits literal-punctuation;
speak-as: spell-out digits no-punctuation;
```

### Giá trị

- `normal`
  - : Quy tắc phát âm thông thường với dấu câu được thay thế bằng các khoảng dừng. Ví dụ, "Hello, world!" sẽ được đọc là "Hello (dừng) world (dừng)". Đây là giá trị mặc định.
- `spell-out`
  - : Nội dung được đánh vần từng chữ cái. Ví dụ, "role" sẽ được đọc là "r" "o" "l" "e".
- `literal-punctuation`
  - : Các dấu câu được đọc theo nghĩa đen. Ví dụ, "Hello, world!" sẽ được đọc là "Hello phẩy world chấm than".
- `digits`
  - : Các số được đọc từng chữ số riêng lẻ. Ví dụ, "31" sẽ được đọc là "ba một".
- `no-punctuation`
  - : Nội dung được đọc bình thường mà không có bất kỳ dấu câu nào. Ví dụ, "Hello, world!" sẽ được đọc là "Hello" "world".

> [!NOTE]
> Hỗ trợ thuộc tính `speak-as` còn hạn chế và được triển khai không nhất quán trên các công nghệ hỗ trợ khác nhau, chẳng hạn như trình đọc màn hình hay bộ tổng hợp giọng nói. Để đảm bảo bất kỳ thông tin quan trọng phụ thuộc vào cách phát âm vẫn thân thiện với người dùng và có thể truy cập được với nhiều đối tượng, không nên chỉ dựa vào thuộc tính CSS này để xác định cách trình bày thông tin đó theo hình thức âm thanh.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### HTML

```html
<p class="normal">Hello, world! I'm 25.</p>
<p class="spell-out">Hello, world! I'm 25.</p>
<p class="literal-punctuation">Hello, world! I'm 25.</p>
<p class="no-punctuation">Hello, world! I'm 25.</p>
<p class="digits">Hello, world! I'm 25.</p>
<p class="multi">Hello, world! I'm 25.</p>
```

### CSS

```css
.normal {
  speak-as: normal;
}

.spell-out {
  speak-as: spell-out;
}

.literal-punctuation {
  speak-as: literal-punctuation;
}

.no-punctuation {
  speak-as: no-punctuation;
}

.digits {
  speak-as: digits;
}
.multi {
  speak-as: literal-punctuation digits;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Bộ mô tả {{cssxref("@counter-style/speak-as", "speak-as")}} của quy tắc at {{cssxref("@counter-style")}}
- Module [CSS counter styles](/vi/docs/Web/CSS/Guides/Counter_styles)
- Module [CSS lists and counters](/vi/docs/Web/CSS/Guides/Lists)
- [Web Speech API](/vi/docs/Web/API/Web_Speech_API)
