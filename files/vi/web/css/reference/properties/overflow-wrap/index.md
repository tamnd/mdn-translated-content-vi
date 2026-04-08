---
title: overflow-wrap
slug: Web/CSS/Reference/Properties/overflow-wrap
page-type: css-property
browser-compat: css.properties.overflow-wrap
sidebar: cssref
---

Thuộc tính **`overflow-wrap`** trong [CSS](/en-US/docs/Web/CSS) áp dụng cho văn bản, xác định xem trình duyệt có nên chèn dấu ngắt dòng vào giữa một chuỗi ký tự không thể ngắt hay không, để ngăn văn bản tràn ra ngoài hộp dòng.

> [!NOTE]
> Thuộc tính này ban đầu là phần mở rộng không chuẩn của Microsoft có tên `word-wrap`. Sau đó được đổi tên thành `overflow-wrap`, với `word-wrap` là alias.

{{InteractiveExample("CSS Demo: overflow-wrap")}}

```css interactive-example-choice
overflow-wrap: normal;
```

```css interactive-example-choice
overflow-wrap: anywhere;
```

```css interactive-example-choice
overflow-wrap: break-word;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    Most words are short &amp; don't need to break. But
    <strong class="transition-all" id="example-element"
      >Antidisestablishmentarianism</strong
    >
    is long. The width is set to min-content, with a max-width of 11em.
  </div>
</section>
```

```css interactive-example
.example-container {
  background-color: rgb(255 0 200 / 0.2);
  border: 3px solid rebeccapurple;
  padding: 0.75em;
  width: min-content;
  max-width: 11em;
  height: 200px;
}
```

> [!NOTE]
> Khác với {{cssxref("word-break")}}, `overflow-wrap` chỉ tạo dấu ngắt nếu toàn bộ một từ không thể đặt vào một dòng mà không bị tràn.

## Cú pháp

```css
/* Giá trị từ khóa */
overflow-wrap: normal;
overflow-wrap: break-word;
overflow-wrap: anywhere;

/* Giá trị toàn cục */
overflow-wrap: inherit;
overflow-wrap: initial;
overflow-wrap: revert;
overflow-wrap: revert-layer;
overflow-wrap: unset;
```

### Các giá trị

- `normal`
  - : Các dòng chỉ ngắt tại các điểm ngắt từ thông thường (ví dụ: khoảng trắng giữa hai từ).
- `anywhere`
  - : Để ngăn tràn, một chuỗi ký tự không thể ngắt có thể bị ngắt tại bất kỳ điểm nào. Không có ký tự gạch nối nào được chèn. Các cơ hội soft wrap được tính khi tính kích thước nội tại min-content.
- `break-word`
  - : Tương tự `anywhere`, nhưng các cơ hội soft wrap do ngắt từ tạo ra không được tính khi tính kích thước nội tại min-content.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### So sánh overflow-wrap, word-break, và hyphens

#### HTML

```html
<p>
  They say the fishing is excellent at Lake
  <em class="normal">Chargoggagoggmanchauggagoggchaubunagungamaugg</em>, though
  I've never been there myself. (<code>normal</code>)
</p>
<p>
  They say the fishing is excellent at Lake
  <em class="ow-anywhere">Chargoggagoggmanchauggagoggchaubunagungamaugg</em>,
  though I've never been there myself. (<code>overflow-wrap: anywhere</code>)
</p>
<p>
  They say the fishing is excellent at Lake
  <em class="ow-break-word">Chargoggagoggmanchauggagoggchaubunagungamaugg</em>,
  though I've never been there myself. (<code>overflow-wrap: break-word</code>)
</p>
```

#### CSS

```css
p {
  width: 13em;
  margin: 2px;
  background: gold;
}

.ow-anywhere {
  overflow-wrap: anywhere;
}

.ow-break-word {
  overflow-wrap: break-word;
}
```

#### Kết quả

{{ EmbedLiveSample('Comparing_overflow-wrap_word-break_and_hyphens', '100%', 260) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("word-break")}}
- {{cssxref("white-space")}}
- {{cssxref("hyphens")}}
- {{cssxref("text-overflow")}}
