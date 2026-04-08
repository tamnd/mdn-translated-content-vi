---
title: image-orientation
slug: Web/CSS/Reference/Properties/image-orientation
page-type: css-property
browser-compat: css.properties.image-orientation
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`image-orientation`** xác định một chỉnh sửa độc lập với bố cục đối với hướng của một hình ảnh.

{{InteractiveExample("CSS Demo: image-orientation")}}

```css interactive-example-choice
image-orientation: none;
```

```css interactive-example-choice
image-orientation: from-image;
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    id="example-element"
    src="/shared-assets/images/examples/hummingbird.jpg" />
</section>
```

```css interactive-example
#example-element {
  height: inherit;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
image-orientation: none;
image-orientation: from-image; /* Dùng dữ liệu EXIF từ hình ảnh */

/* Giá trị toàn cục */
image-orientation: inherit;
image-orientation: initial;
image-orientation: revert;
image-orientation: revert-layer;
image-orientation: unset;
```

### Giá trị

- `none`
  - : Không áp dụng xoay hình ảnh bổ sung nào; hình ảnh được định hướng theo cách đã mã hóa hoặc theo các giá trị thuộc tính CSS khác quy định.
- `from-image`
  - : Giá trị ban đầu mặc định. Thông tin [EXIF](https://en.wikipedia.org/wiki/EXIF) chứa trong hình ảnh được dùng để xoay hình ảnh cho phù hợp.

> [!WARNING]
> `image-orientation: none;` **không** ghi đè hướng của các hình ảnh từ nguồn gốc không an toàn được mã hóa bởi thông tin [EXIF](https://en.wikipedia.org/wiki/EXIF) của chúng, do lo ngại về bảo mật. Tìm hiểu thêm từ [bản nháp vấn đề của nhóm làm việc CSS](https://github.com/w3c/csswg-drafts/issues/5165).

## Mô tả

Thuộc tính này chỉ được dùng _duy nhất_ cho mục đích chỉnh sửa hướng của các hình ảnh được chụp khi camera bị xoay. Không nên dùng nó cho các phép xoay tùy ý. Đối với bất kỳ mục đích nào khác ngoài việc chỉnh sửa hướng của hình ảnh do cách chụp hoặc quét, hãy dùng thuộc tính {{cssxref("transform")}} với từ khóa `rotate` để chỉ định phép xoay. Điều này bao gồm bất kỳ thay đổi nào về hướng hình ảnh do người dùng chỉ đạo, hoặc các thay đổi cần thiết để in theo chiều dọc so với chiều ngang.

Nếu được dùng kết hợp với các thuộc tính CSS khác, chẳng hạn như {{cssxref("&lt;transform-function&gt;")}}, bất kỳ phép xoay `image-orientation` nào sẽ được áp dụng trước bất kỳ phép biến đổi nào khác.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Định hướng hình ảnh từ dữ liệu hình ảnh

Hình ảnh sau đây đã bị xoay 180 độ, và thuộc tính `image-orientation` được dùng để chỉnh sửa hướng của nó dựa trên dữ liệu EXIF trong hình ảnh. Bằng cách thay đổi `image-orientation` thành `none`, bạn có thể thấy hiệu ứng của thuộc tính.

#### CSS

```css
#image {
  image-orientation: from-image; /* Can be changed in the live sample */
}
```

```css hidden
img {
  margin: 0.5rem 0;
}

label {
  font-family: monospace;
}
```

```html hidden
<img id="image" src="oriole.jpg" alt="Orientation taken from the image" />

<div>
  <input
    type="radio"
    id="from-image"
    name="orientation"
    value="from-image"
    checked />
  <label for="from-image">from-image</label>
</div>

<div>
  <input type="radio" id="none" name="orientation" value="none" />
  <label for="none">none</label>
</div>
```

```js hidden
document.addEventListener("change", (evt) => {
  document.getElementById("image").style.imageOrientation = evt.target.value;
});
```

#### Kết quả

{{EmbedLiveSample("Orienting_image_from_image_data", "100%", 900)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan đến hình ảnh khác: {{cssxref("object-fit")}}, {{cssxref("object-position")}}, {{cssxref("image-rendering")}}, {{cssxref("image-resolution")}}.
- {{cssxref("transform")}} và {{cssxref("rotate")}}
