---
title: ruby-overhang
slug: Web/CSS/Reference/Properties/ruby-overhang
page-type: css-property
browser-compat: css.properties.ruby-overhang
sidebar: cssref
---

Thuộc tính **`ruby-overhang`** của [CSS](/vi/docs/Web/CSS) chỉ định liệu chú thích {{htmlelement("ruby")}} có được phép tràn ra ngoài (overhang) lên văn bản xung quanh hay không.

{{InteractiveExample("CSS Demo: ruby-overhang")}}

```css interactive-example-choice
ruby-overhang: auto;
```

```css interactive-example-choice
ruby-overhang: none;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    あの<ruby>表<rp>(</rp><rt>ひょう</rt><rp>)</rp></ruby
    ><ruby>現<rp>(</rp><rt>げん</rt><rp>)</rp></ruby>は面白い。
  </p>
</section>
```

```css interactive-example
#default-example {
  font-size: 2em;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
ruby-overhang: auto;
ruby-overhang: none;

/* Giá trị toàn cục */
ruby-overhang: inherit;
ruby-overhang: initial;
ruby-overhang: revert;
ruby-overhang: revert-layer;
ruby-overhang: unset;
```

### Giá trị

- `auto`
  - : Khi container chú thích ruby dài hơn container cơ sở tương ứng, chú thích có thể tràn một phần lên văn bản liền kề.
    Việc có tràn hay không và tràn bao nhiêu do user agent quyết định.
- `none`
  - : Từ khóa cho biết ruby không bao giờ được phép mở rộng vượt ra ngoài các container liền kề.

## Mô tả

Thuộc tính `ruby-overhang` kiểm soát liệu hộp văn bản chú thích ruby ({{htmlelement("rt")}}) có thể tràn lên văn bản liền kề bên ngoài container `<ruby>` hay không.

Khi chú thích ruby không được phép tràn &mdash; khi `ruby-overhang: none` được đặt trên phần tử `<ruby>` &mdash; phần tử đó hoạt động như một hộp inline, như thể thuộc tính {{cssxref("display")}} của nó được đặt thành `inline`, chỉ hiển thị nội dung của chính nó trong ranh giới của nó và các phần tử liền kề không vượt qua hộp ranh giới.

Theo mặc định, nội dung của phần tử `<rt>` được phép tràn, do đó nội dung có thể chồng lên container `<ruby>`, hiển thị một phần trên hoặc dưới nội dung inline-level xung quanh. Với `auto` (mặc định), nội dung có thể tràn, nhưng sẽ không tràn nếu làm vậy sẽ chồng lên các phần tử `<rt>` liền kề hoặc các phần tử có giá trị `display` phân giải thành `ruby-base` hoặc `ruby-text`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ruby tràn lên văn bản cơ sở

Ví dụ này minh họa cả hai giá trị của thuộc tính `ruby-overhang`.

#### HTML

Chúng ta bao gồm hai đoạn văn với nội dung và cấu trúc `<ruby>` giống hệt nhau, chỉ khác tên class.

```html
<p class="auto">
  あの<ruby>表<rp>(</rp><rt>ひょう</rt><rp>)</rp></ruby
  ><ruby>現<rp>(</rp><rt>げん</rt><rp>)</rp></ruby>は面白い。
</p>

<p class="none">
  あの<ruby>表<rp>(</rp><rt>ひょう</rt><rp>)</rp></ruby
  ><ruby>現<rp>(</rp><rt>げん</rt><rp>)</rp></ruby>は面白い。
</p>
```

#### CSS

Một `outline` màu đỏ `1px` giúp làm nổi bật chú thích văn bản của các phần tử {{htmlelement("rt")}}.
Đoạn đầu tiên có `ruby-overhang: auto` và đoạn thứ hai có `ruby-overhang: none`.

```css
p {
  font-size: 40px;
  display: block;
  margin: 0.5rem;
}
rt {
  font-size: 28px;
  outline: 1px solid red;
}
.auto {
  ruby-overhang: auto;
}
.none {
  ruby-overhang: none;
}
```

#### Kết quả

{{EmbedLiveSample("ruby_overhanging_base_text", , "350")}}

Khi `ruby-overhang` được đặt thành `none`, văn bản chú thích không được phép chồng lên các hộp liền kề của văn bản ruby cơ sở. Nếu nhìn kỹ, bạn có thể nhận thấy trong đoạn đầu tiên, hộp màu đỏ bao quanh văn bản ruby hơi chồng lên một phần nội dung `<ruby>` không liên kết, trong khi trong ví dụ `none` trên các trình duyệt hỗ trợ, không có sự chồng chéo giữa nội dung ruby và văn bản ruby không liên kết.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("ruby-align")}}
- {{CSSxRef("text-transform")}}: full-size-kana
- {{HTMLElement("ruby")}}
- {{HTMLElement("rt")}}
- {{HTMLElement("rp")}}
