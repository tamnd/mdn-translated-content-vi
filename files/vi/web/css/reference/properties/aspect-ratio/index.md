---
title: aspect-ratio
slug: Web/CSS/Reference/Properties/aspect-ratio
page-type: css-property
browser-compat: css.properties.aspect-ratio
sidebar: cssref
---

Thuộc tính **`aspect-ratio`** [CSS](/en-US/docs/Web/CSS) cho phép bạn xác định tỷ lệ chiều rộng trên chiều cao mong muốn của hộp phần tử. Điều này có nghĩa là ngay cả khi kích thước container cha hoặc viewport thay đổi, trình duyệt sẽ điều chỉnh kích thước phần tử để duy trì tỷ lệ chiều rộng trên chiều cao được chỉ định. {{glossary("aspect ratio")}} được chỉ định được sử dụng trong tính toán kích thước tự động và một số hàm bố cục khác.

Ít nhất một trong các kích thước của hộp cần là tự động để `aspect-ratio` có bất kỳ hiệu ứng nào. Nếu cả chiều rộng lẫn chiều cao đều không phải kích thước tự động, thì tỷ lệ được cung cấp không có hiệu ứng trên kích thước ưa thích của hộp.

{{InteractiveExample("CSS Demo: aspect-ratio")}}

```css interactive-example-choice
aspect-ratio: auto;
```

```css interactive-example-choice
aspect-ratio: 1 / 1;
```

```css interactive-example-choice
aspect-ratio: 16 / 9;
```

```css interactive-example-choice
aspect-ratio: 0.5;
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    height="640"
    id="example-element"
    src="/shared-assets/images/examples/plumeria.jpg"
    width="466" />
</section>
```

```css interactive-example
#example-element {
  height: 100%;
  width: auto;
}
```

## Cú pháp

```css
aspect-ratio: 1 / 1;
aspect-ratio: 1;

/* dự phòng về 'auto' cho các phần tử thay thế */
aspect-ratio: auto 3/4;
aspect-ratio: 9/6 auto;

/* Giá trị toàn cục */
aspect-ratio: inherit;
aspect-ratio: initial;
aspect-ratio: revert;
aspect-ratio: revert-layer;
aspect-ratio: unset;
```

Thuộc tính này được chỉ định là một hoặc cả hai từ khóa auto hoặc `<ratio>`. Nếu cả hai được cung cấp và phần tử là {{ glossary("replaced elements", "replaced element")}}, chẳng hạn như [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img), thì tỷ lệ đã cho được sử dụng cho đến khi nội dung được tải. Sau khi nội dung được tải, giá trị `auto` được áp dụng, vì vậy tỷ lệ intrinsic của nội dung được tải được sử dụng.

Nếu phần tử không phải là replaced element, thì `ratio` đã cho được sử dụng.

### Giá trị

- `auto`
  - : {{glossary("Replaced elements")}} với tỷ lệ intrinsic sử dụng _tỷ lệ đó_, nếu không hộp không có tỷ lệ ưa thích. Các tính toán kích thước liên quan đến tỷ lệ intrinsic luôn làm việc với kích thước hộp nội dung.

- {{cssxref("&lt;ratio&gt;")}}
  - : Tỷ lệ ưa thích của hộp là tỷ lệ được chỉ định của `width` / `height`. Nếu `height` và ký tự dấu gạch chéo trước nó bị bỏ qua, `height` mặc định là `1`. Các tính toán kích thước liên quan đến tỷ lệ ưa thích làm việc với kích thước của hộp được chỉ định bởi `box-sizing`.

- `auto && <ratio>`
  - : Khi cả `auto` và `<ratio>` được chỉ định cùng nhau, `auto` được sử dụng nếu phần tử là replaced element có tỷ lệ tự nhiên, như phần tử `<img>`. Nếu không, tỷ lệ được chỉ định của `width` / `height` được sử dụng làm tỷ lệ ưa thích.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Khám phá hiệu ứng aspect-ratio với chiều rộng cố định

Trong ví dụ này, chiều rộng của các phần tử `<div>` được đặt thành `100px` và chiều cao là `auto`. Vì giá trị chiều rộng cố định ở đây, thuộc tính `aspect-ratio` chỉ ảnh hưởng đến chiều cao của các phần tử `<div>` để duy trì tỷ lệ chiều rộng trên chiều cao được chỉ định.

```html hidden
<div>1/1</div>
<div>0.5</div>
<div>1</div>
<div>1/0.5</div>
<div>16/9</div>
```

```css hidden
div {
  display: inline-flex;
  background-color: lime;
  justify-content: center;
}
```

```css
div {
  width: 100px;
  height: auto;
}
div:nth-child(1) {
  aspect-ratio: 1/1;
}
div:nth-child(2) {
  aspect-ratio: 0.5;
}
div:nth-child(3) {
  aspect-ratio: 1;
}
div:nth-child(4) {
  aspect-ratio: 1/0.5;
}
div:nth-child(5) {
  aspect-ratio: 16/9;
}
```

{{EmbedLiveSample('Exploring aspect-ratio effects with fixed width', '100%', '300px')}}

### Dự phòng về tỷ lệ tự nhiên

Trong ví dụ này, chúng ta dùng hai phần tử `<img>`. Phần tử đầu tiên không có thuộc tính `src` được đặt thành file hình ảnh.

```html
<img src="" /> <img src="plumeria.jpg" />
```

Code sau đây đặt `3/2` là tỷ lệ ưa thích và `auto` là dự phòng.

```css
img {
  display: inline;
  width: 200px;
  border: 2px dashed red;
  background-color: lime;
  vertical-align: top;

  aspect-ratio: 3/2 auto;
}
```

Lưu ý hình ảnh đầu tiên không có nội dung thay thế vẫn giữ tỷ lệ `3/2`, trong khi hình ảnh thứ hai sau khi nội dung được tải sử dụng tỷ lệ tự nhiên của hình ảnh.

{{EmbedLiveSample('Fallback to natural aspect ratio', '100%', '300px')}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Understanding aspect ratios](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
- [Image aspect-ratio: preventing jank](/en-US/docs/Learn_web_development/Extensions/Performance/Multimedia#rendering_strategy_preventing_jank_when_loading_images)
- [Designing an aspect ratio unit for CSS](https://www.smashingmagazine.com/2019/03/aspect-ratio-unit-css/)
- [Setting Height And Width On Images Is Important Again](https://www.smashingmagazine.com/2020/03/setting-height-width-images-important-again/)
