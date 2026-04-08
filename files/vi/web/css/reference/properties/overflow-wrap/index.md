---
title: overflow-wrap
slug: Web/CSS/Reference/Properties/overflow-wrap
page-type: css-property
browser-compat: css.properties.overflow-wrap
sidebar: cssref
---

Thuộc tính CSS **`overflow-wrap`** áp dụng cho văn bản, thiết lập xem trình duyệt có nên chèn ngắt dòng trong một chuỗi ký tự không thể ngắt để ngăn văn bản tràn qua hộp dòng của nó hay không.

> [!NOTE]
> Thuộc tính này ban đầu là một phần mở rộng không chuẩn và không có tiền tố của Microsoft có tên `word-wrap`, và được hầu hết các trình duyệt triển khai với cùng tên đó. Sau đó nó đã được đổi tên thành `overflow-wrap`, với `word-wrap` là một bí danh.

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
> Khác với {{cssxref("word-break")}}, `overflow-wrap` chỉ tạo ngắt dòng nếu toàn bộ từ không thể được đặt trên một dòng riêng mà không bị tràn.

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

Thuộc tính `overflow-wrap` được chỉ định bằng một từ khóa duy nhất được chọn từ danh sách các giá trị bên dưới.

### Giá trị

- `normal`
  - : Các dòng chỉ có thể ngắt tại các điểm ngắt từ thông thường (chẳng hạn như khoảng trắng giữa hai từ).
- `anywhere`
  - : Để ngăn tràn, một chuỗi ký tự không thể ngắt — như một từ dài hoặc URL — có thể bị ngắt tại bất kỳ điểm nào nếu không có điểm ngắt chấp nhận được khác trong dòng. Không có ký tự gạch nối nào được chèn vào điểm ngắt. Các cơ hội ngắt mềm được tạo ra bởi việc ngắt từ được xem xét khi tính toán kích thước nội tại min-content.
- `break-word`
  - : Tương tự như giá trị `anywhere`, các từ thông thường không thể ngắt được phép ngắt tại các điểm tùy ý nếu không có điểm ngắt chấp nhận được khác trong dòng, nhưng các cơ hội ngắt mềm được tạo ra bởi việc ngắt từ KHÔNG được xem xét khi tính toán kích thước nội tại min-content.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### So sánh overflow-wrap, word-break và hyphens

Ví dụ này so sánh kết quả của `overflow-wrap`, `word-break` và `hyphens` khi ngắt một từ dài.

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
<p>
  They say the fishing is excellent at Lake
  <em class="word-break">Chargoggagoggmanchauggagoggchaubunagungamaugg</em>,
  though I've never been there myself. (<code>word-break</code>)
</p>
<p>
  They say the fishing is excellent at Lake
  <em class="hyphens">Chargoggagoggmanchauggagoggchaubunagungamaugg</em>, though
  I've never been there myself. (<code>hyphens</code>, without
  <code>lang</code> attribute)
</p>
<p lang="en">
  They say the fishing is excellent at Lake
  <em class="hyphens">Chargoggagoggmanchauggagoggchaubunagungamaugg</em>, though
  I've never been there myself. (<code>hyphens</code>, English rules)
</p>
<p class="hyphens" lang="de">
  They say the fishing is excellent at Lake
  <em class="hyphens">Chargoggagoggmanchauggagoggchaubunagungamaugg</em>, though
  I've never been there myself. (<code>hyphens</code>, German rules)
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

.word-break {
  word-break: break-all;
}

.hyphens {
  hyphens: auto;
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
- [Guide to wrapping and breaking text](/en-US/docs/Web/CSS/Guides/Text/Wrapping_breaking_text)
