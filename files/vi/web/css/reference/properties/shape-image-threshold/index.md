---
title: shape-image-threshold
slug: Web/CSS/Reference/Properties/shape-image-threshold
page-type: css-property
browser-compat: css.properties.shape-image-threshold
sidebar: cssref
---

Thuộc tính **`shape-image-threshold`** [CSS](/en-US/docs/Web/CSS) đặt ngưỡng kênh alpha được sử dụng để trích xuất hình dạng sử dụng hình ảnh làm giá trị cho {{cssxref("shape-outside")}}.

{{InteractiveExample("CSS Demo: shape-image-threshold")}}

```css interactive-example-choice
shape-outside: linear-gradient(
  50deg,
  rgb(77 26 103),
  transparent 80%,
  transparent
);
shape-image-threshold: 0.2;
```

```css interactive-example-choice
shape-outside: linear-gradient(
  50deg,
  rgb(77 26 103),
  transparent 80%,
  transparent
);
shape-image-threshold: 0.4;
```

```css interactive-example-choice
shape-outside: linear-gradient(
  50deg,
  rgb(77 26 103),
  transparent 80%,
  transparent
);
shape-image-threshold: 0.6;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element"></div>
    We had agreed, my companion and I, that I should call for him at his house,
    after dinner, not later than eleven o'clock. This athletic young Frenchman
    belongs to a small set of Parisian sportsmen, who have taken up "ballooning"
    as a pastime. After having exhausted all the sensations that are to be found
    in ordinary sports, even those of "automobiling" at a breakneck speed, the
    members of the "Aéro Club" now seek in the air, where they indulge in all
    kinds of daring feats, the nerve-racking excitement that they have ceased to
    find on earth.
  </div>
</section>
```

```css interactive-example
.example-container {
  text-align: left;
  padding: 20px;
}

#example-element {
  float: left;
  width: 150px;
  height: 150px;
  margin: 20px;
  background-image: linear-gradient(
    50deg,
    rgb(77 26 103),
    transparent 80%,
    transparent
  );
}
```

Bất kỳ pixel nào có giá trị thành phần alpha lớn hơn ngưỡng đều được coi là một phần của hình dạng cho mục đích xác định ranh giới của nó. Ví dụ, giá trị `0.5` có nghĩa là hình dạng sẽ bao gồm tất cả các pixel có độ mờ đục hơn 50%.

## Cú pháp

```css
/* Giá trị <number> */
shape-image-threshold: 0.7;

/* Giá trị toàn cục */
shape-image-threshold: inherit;
shape-image-threshold: initial;
shape-image-threshold: revert;
shape-image-threshold: revert-layer;
shape-image-threshold: unset;
```

### Giá trị

- {{cssxref("&lt;alpha-value&gt;")}}
  - : Đặt ngưỡng được sử dụng để trích xuất hình dạng từ hình ảnh. Hình dạng được định nghĩa bởi các pixel có giá trị alpha lớn hơn ngưỡng. Các giá trị nằm ngoài phạm vi 0.0 (hoàn toàn trong suốt) đến 1.0 (hoàn toàn mờ đục) sẽ bị kẹp vào phạm vi này.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Căn chỉnh văn bản theo gradient

Ví dụ này tạo một khối {{HTMLElement("div")}} với hình ảnh nền gradient. Gradient được thiết lập như một hình dạng CSS bằng `shape-outside`, để các pixel trong gradient có độ mờ đục ít nhất 20% (tức là các pixel có thành phần alpha lớn hơn 0.2) được coi là một phần của hình dạng.

#### HTML

```html
<div id="gradient-shape"></div>

<p>
  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel at commodi
  voluptates enim, distinctio officia. Saepe optio accusamus doloribus sint
  facilis itaque ab nulla, dolor molestiae assumenda cum sit placeat adipisci,
  libero quae nihil porro debitis laboriosam inventore animi impedit nostrum
  nesciunt quisquam expedita! Dolores consectetur iure atque a mollitia dicta
  repudiandae illum exercitationem aliquam repellendus ipsum porro modi, id nemo
  eligendi, architecto ratione quibusdam iusto nisi soluta? Totam inventore ea
  eum sed velit et eligendi suscipit accusamus iusto dolore, at provident eius
  alias maxime pariatur non deleniti ipsum sequi rem eveniet laboriosam magni
  expedita?
</p>
```

#### CSS

```css
#gradient-shape {
  width: 150px;
  height: 150px;
  float: left;
  background-image: linear-gradient(30deg, black, transparent 80%, transparent);
  shape-outside: linear-gradient(30deg, black, transparent 80%, transparent);
  shape-image-threshold: 0.2;
}
```

Hình dạng được thiết lập ở đây bằng {{cssxref("background-image")}} với gradient tuyến tính thay vì tệp hình ảnh. Gradient tương tự cũng được sử dụng làm hình ảnh để hình dạng được suy ra cho việc thiết lập vùng float, bằng thuộc tính {{cssxref("shape-outside")}}.

Ngưỡng 20% độ mờ đục để xử lý các pixel gradient như một phần của hình dạng sau đó được thiết lập bằng `shape-image-threshold` với giá trị `0.2`.

#### Kết quả

{{EmbedLiveSample('Aligning_text_to_a_gradient', 600, 230)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Shapes](/en-US/docs/Web/CSS/Guides/Shapes)
- [Overview of CSS Shapes](/en-US/docs/Web/CSS/Guides/Shapes/Overview)
- {{cssxref("basic-shape")}}
- {{cssxref("shape-outside")}}
- {{cssxref("shape-margin")}}
