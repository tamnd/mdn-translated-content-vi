---
title: text-combine-upright
slug: Web/CSS/Reference/Properties/text-combine-upright
page-type: css-property
browser-compat: css.properties.text-combine-upright
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-combine-upright`** đặt sự kết hợp các ký tự vào không gian của một ký tự đơn. Nếu văn bản kết hợp rộng hơn 1em, tác nhân người dùng phải co nội dung vào trong 1em. Bố cục kết quả được coi như một glyph đứng duy nhất để bố trí và trang trí. Thuộc tính này chỉ có tác dụng trong các chế độ viết dọc.

Điều này được sử dụng để tạo ra hiệu ứng được gọi là tate-chū-yoko <q lang="ja">縦中横</q> trong tiếng Nhật, hoặc <q lang="zh-Hant">橫向文字</q> trong tiếng Trung.

{{InteractiveExample("CSS Demo: text-combine-upright")}}

```css interactive-example-choice
text-combine-upright: none;
```

```css interactive-example-choice
text-combine-upright: all;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div>
    <p>
      <span class="transition-all" id="example-element"
        >2022<span>年</span>12<span>月</span>8</span
      >日から楽しい
    </p>
  </div>
</section>
```

```css interactive-example
p {
  writing-mode: vertical-rl;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
text-combine-upright: none;
text-combine-upright: all;

/* Giá trị toàn cục */
text-combine-upright: inherit;
text-combine-upright: initial;
text-combine-upright: revert;
text-combine-upright: revert-layer;
text-combine-upright: unset;
```

### Giá trị

- `none`
  - : Không có xử lý đặc biệt.
- `all`
  - : Cố gắng sắp chữ tất cả các ký tự liên tiếp trong hộp theo chiều ngang, sao cho chúng chiếm không gian của một ký tự đơn trong dòng dọc của hộp.

> [!NOTE]
> Mô-đun [chế độ viết CSS](/en-US/docs/Web/CSS/Guides/Writing_modes) định nghĩa giá trị `digits <integer>` cho thuộc tính `text-combine-upright` để hiển thị hai đến bốn chữ số {{Glossary("ASCII")}} liên tiếp (U+0030–U+0039) sao cho chúng chiếm không gian của một ký tự đơn trong hộp dòng dọc, tuy nhiên giá trị này không được hỗ trợ trong bất kỳ trình duyệt nào.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Dùng 'all' với văn bản ngang

Giá trị `all` yêu cầu đánh dấu xung quanh mỗi đoạn văn bản ngang, nhưng hiện tại được hỗ trợ bởi nhiều trình duyệt hơn giá trị `digits`.

#### HTML

```html
<p lang="zh-Hant">
  民國<span class="num">105</span>年<span class="num">4</span>月<span
    class="num"
    >29</span
  >日
</p>
```

#### CSS

```css
html {
  writing-mode: vertical-rl;
  font: 24px serif;
}
.num {
  text-combine-upright: all;
}
```

#### Kết quả

{{EmbedLiveSample('Example using "all"', 250, 200)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("writing-mode")}}, {{cssxref("text-orientation")}}
