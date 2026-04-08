---
title: word-break
slug: Web/CSS/Reference/Properties/word-break
page-type: css-property
browser-compat: css.properties.word-break
sidebar: cssref
---

Thuộc tính **`word-break`** của [CSS](/vi/docs/Web/CSS) đặt vị trí ngắt dòng xuất hiện ở nơi văn bản sẽ tràn ra ngoài hộp nội dung của nó.

{{InteractiveExample("CSS Demo: word-break")}}

```css interactive-example-choice
word-break: normal;
```

```css interactive-example-choice
word-break: break-all;
```

```css interactive-example-choice
word-break: keep-all;
```

```css interactive-example-choice
word-break: break-word;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    Honorificabilitudinitatibus califragilisticexpialidocious
    Taumatawhakatangihangakoauauotamateaturipukakapikimaungahoronukupokaiwhenuakitanatahu
    グレートブリテンおよび北アイルランド連合王国という言葉は本当に長い言葉
  </div>
</section>
```

```css interactive-example
#example-element {
  width: 80%;
  padding: 20px;
  text-align: start;
  border: solid 1px darkgray;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
word-break: normal;
word-break: break-all;
word-break: keep-all;
word-break: auto-phrase; /* thử nghiệm */
word-break: break-word; /* đã lỗi thời */

/* Giá trị toàn cục */
word-break: inherit;
word-break: initial;
word-break: revert;
word-break: revert-layer;
word-break: unset;
```

Thuộc tính `word-break` được chỉ định là một từ khóa đơn được chọn từ danh sách các giá trị dưới đây.

### Giá trị

- `normal`
  - : Sử dụng quy tắc ngắt dòng mặc định.
- `break-all`
  - : Để ngăn tràn, nên chèn ngắt từ giữa bất kỳ hai ký tự nào (ngoại trừ văn bản Trung/Nhật/Hàn).
- `keep-all`
  - : Không nên dùng ngắt từ cho văn bản Trung/Nhật/Hàn (CJK). Hành vi văn bản không phải CJK giống như `normal`.
- `auto-phrase`
  - : Có hiệu ứng giống như `word-break: normal` ngoại trừ việc phân tích theo ngôn ngữ cụ thể được thực hiện để cải thiện ngắt từ bằng cách không đặt chúng ở giữa các cụm từ tự nhiên.
- `break-word`
  - : Có hiệu ứng giống như `overflow-wrap: anywhere` kết hợp với `word-break: normal`, bất kể giá trị thực tế của thuộc tính {{cssxref("overflow-wrap")}}.

> [!NOTE]
> Trái với `word-break: break-word` và `overflow-wrap: break-word` (xem {{cssxref("overflow-wrap")}}), `word-break: break-all` sẽ tạo ngắt tại đúng nơi văn bản sẽ tràn ra ngoài bộ chứa (ngay cả khi đặt toàn bộ từ trên một dòng riêng có thể giải quyết vấn đề tràn).

Đặc tả cũng liệt kê thêm giá trị `manual`, hiện không được hỗ trợ trong bất kỳ trình duyệt nào. Khi được triển khai, `manual` sẽ có hiệu ứng giống như `word-break: normal` ngoại trừ các ngắt sẽ không tự động được chèn vào ngôn ngữ Đông Nam Á. Điều này cần thiết vì trong các ngôn ngữ đó, tác nhân người dùng thường đặt ngắt ở các vị trí không tối ưu. `manual` sẽ cho phép bạn tự chèn ngắt dòng ở các vị trí tối ưu.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<p>1. <code>word-break: normal</code></p>
<p class="normal narrow">
  This is a long and Honorificabilitudinitatibus califragilisticexpialidocious
  Taumatawhakatangihangakoauauotamateaturipukakapikimaungahoronukupokaiwhenuakitanatahu
  グレートブリテンおよび北アイルランド連合王国という言葉は本当に長い言葉
</p>

<p>2. <code>word-break: break-all</code></p>
<p class="breakAll narrow">
  This is a long and Honorificabilitudinitatibus califragilisticexpialidocious
  Taumatawhakatangihangakoauauotamateaturipukakapikimaungahoronukupokaiwhenuakitanatahu
  グレートブリテンおよび北アイルランド連合王国という言葉は本当に長い言葉
</p>

<p>3. <code>word-break: keep-all</code></p>
<p class="keepAll narrow">
  This is a long and Honorificabilitudinitatibus califragilisticexpialidocious
  Taumatawhakatangihangakoauauotamateaturipukakapikimaungahoronukupokaiwhenuakitanatahu
  グレートブリテンおよび北アイルランド連合王国という言葉は本当に長い言葉
</p>

<p>4. <code>word-break: manual</code></p>
<p class="manual narrow">
  This is a long and Honorificabilitudinitatibus califragilisticexpialidocious
  Taumatawhakatangihangakoauauotamateaturipukakapikimaungahoronukupokaiwhenuakitanatahu
  グレートブリテンおよび北アイルランド連合王国という言葉は本当に長い言葉
</p>

<p>5. <code>word-break: auto-phrase</code></p>
<p class="autoPhrase narrow">
  This is a long and Honorificabilitudinitatibus califragilisticexpialidocious
  Taumatawhakatangihangakoauauotamateaturipukakapikimaungahoronukupokaiwhenuakitanatahu
  グレートブリテンおよび北アイルランド連合王国という言葉は本当に長い言葉
</p>

<p>6. <code>word-break: break-word</code></p>
<p class="breakWord narrow">
  This is a long and Honorificabilitudinitatibus califragilisticexpialidocious
  Taumatawhakatangihangakoauauotamateaturipukakapikimaungahoronukupokaiwhenuakitanatahu
  グレートブリテンおよび北アイルランド連合王国という言葉は本当に長い言葉
</p>
```

### CSS

```css
.narrow {
  padding: 10px;
  border: 1px solid;
  width: 500px;
  margin: 0 auto;
  font-size: 20px;
  line-height: 1.5;
  letter-spacing: 1px;
}

.normal {
  word-break: normal;
}

.breakAll {
  word-break: break-all;
}

.keepAll {
  word-break: keep-all;
}

.manual {
  word-break: manual;
}

.autoPhrase {
  word-break: auto-phrase;
}

.breakWord {
  word-break: break-word;
}
```

{{EmbedLiveSample('Examples', '100%', 600)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("overflow-wrap")}}
- {{cssxref("white-space")}}
- {{cssxref("hyphens")}}
- {{cssxref("line-break")}}
- [Hướng dẫn bọc và ngắt văn bản](/vi/docs/Web/CSS/Guides/Text/Wrapping_breaking_text)
