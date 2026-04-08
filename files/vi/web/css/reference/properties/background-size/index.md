---
title: background-size
slug: Web/CSS/Reference/Properties/background-size
page-type: css-property
browser-compat: css.properties.background-size
sidebar: cssref
---

Thuộc tính **`background-size`** [CSS](/en-US/docs/Web/CSS) xác định kích thước hình nền của phần tử.
Hình ảnh có thể giữ nguyên kích thước tự nhiên, được kéo giãn, hoặc bị thu nhỏ để vừa với không gian có sẵn.

Các khoảng trống không được hình nền che phủ sẽ được lấp đầy bởi thuộc tính {{cssxref("background-color")}}, và màu nền sẽ hiển thị phía sau hình nền có độ trong suốt.

{{InteractiveExample("CSS Demo: background-size")}}

```css interactive-example-choice
background-size: contain;
```

```css interactive-example-choice
background-size: contain;
background-repeat: no-repeat;
```

```css interactive-example-choice
background-size: cover;
```

```css interactive-example-choice
background-size: 30%;
```

```css interactive-example-choice
background-size: 200px 100px;
```

```html interactive-example
<section id="default-example">
  <div class="transition-all" id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  background-image: url("/shared-assets/images/examples/hand.jpg");
  min-width: 100%;
  min-height: 100%;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
background-size: cover;
background-size: contain;

/* Cú pháp một giá trị */
/* chiều rộng hình (chiều cao trở thành 'auto') */
background-size: 50%;
background-size: 3.2em;
background-size: 12px;
background-size: auto;

/* Cú pháp hai giá trị */
/* giá trị đầu tiên: chiều rộng, giá trị thứ hai: chiều cao */
background-size: 50% auto;
background-size: 3em 25%;
background-size: auto 6px;
background-size: auto auto;

/* Nhiều nền */
background-size: auto, auto; /* Không nhầm với `auto auto` */
background-size: 50%, 25%, 25%;
background-size: 6px, auto, contain;

/* Giá trị toàn cục */
background-size: inherit;
background-size: initial;
background-size: revert;
background-size: revert-layer;
background-size: unset;
```

Thuộc tính `background-size` được chỉ định theo một trong các cách sau:

- Sử dụng giá trị từ khóa `contain` hoặc `cover`.
- Chỉ sử dụng giá trị chiều rộng, khi đó chiều cao mặc định là `auto`.
- Sử dụng cả giá trị chiều rộng và chiều cao, giá trị đầu tiên đặt chiều rộng, giá trị thứ hai đặt chiều cao.
  Mỗi giá trị có thể là {{cssxref("&lt;length&gt;")}}, {{cssxref("&lt;percentage&gt;")}}, hoặc `auto`.

Để chỉ định kích thước của nhiều hình nền, hãy phân tách các giá trị bằng dấu phẩy.

### Giá trị

- `contain`
  - : Thu phóng hình ảnh lớn nhất có thể trong vùng chứa mà không cắt hoặc kéo giãn hình.
    Nếu vùng chứa lớn hơn hình, hình sẽ được lặp lại dạng lưới, trừ khi thuộc tính {{cssxref("background-repeat")}} được đặt thành `no-repeat`.
- `cover`
  - : Thu phóng hình ảnh (trong khi giữ nguyên tỷ lệ) đến kích thước nhỏ nhất có thể để lấp đầy vùng chứa (cả chiều cao và chiều rộng đều _phủ_ hoàn toàn vùng chứa), không để lại khoảng trống.
    Nếu tỷ lệ nền khác với phần tử, hình ảnh sẽ bị cắt theo chiều dọc hoặc chiều ngang.
- `auto`
  - : Thu phóng hình nền theo chiều tương ứng sao cho tỷ lệ tự nhiên được duy trì.
- {{cssxref("&lt;length&gt;")}}
  - : Kéo giãn hình ảnh theo chiều tương ứng đến độ dài được chỉ định. Không cho phép giá trị âm.
- {{cssxref("&lt;percentage&gt;")}}
  - : Kéo giãn hình ảnh theo chiều tương ứng đến phần trăm được chỉ định của _vùng định vị nền_.
    Vùng định vị nền được xác định bởi giá trị {{cssxref("background-origin")}} (mặc định là padding box).
    Tuy nhiên, nếu giá trị {{cssxref("background-attachment")}} của nền là `fixed`, vùng định vị thay vào đó là toàn bộ {{glossary("viewport", "khung nhìn")}}.
    Không cho phép giá trị âm.

### Kích thước và tỷ lệ tự nhiên

Việc tính toán giá trị phụ thuộc vào kích thước tự nhiên (chiều rộng và chiều cao) và tỷ lệ tự nhiên (tỷ lệ chiều rộng/chiều cao) của hình ảnh.
Các thuộc tính này như sau:

- Hình ảnh bitmap (như JPG) luôn có kích thước và tỷ lệ tự nhiên.
- Hình ảnh vector (như SVG) không nhất thiết có kích thước tự nhiên.
  Nếu có cả kích thước ngang và dọc tự nhiên, nó cũng có tỷ lệ tự nhiên.
  Nếu không có kích thước hoặc chỉ có một kích thước, nó có thể có hoặc không có tỷ lệ.
- CSS {{cssxref("gradient")}} không có kích thước hay tỷ lệ tự nhiên.
- Hình nền được tạo bằng hàm {{cssxref("element()")}} sử dụng kích thước và tỷ lệ tự nhiên của phần tử tạo ra.

> [!NOTE]
> Trong Gecko, hình nền được tạo bằng hàm [`element()`](/en-US/docs/Web/CSS/Reference/Values/element) hiện được xử lý như hình ảnh có kích thước bằng kích thước của phần tử, hoặc bằng vùng định vị nền nếu phần tử là SVG, với tỷ lệ tự nhiên tương ứng. Đây là hành vi phi chuẩn.

Dựa vào kích thước và tỷ lệ tự nhiên, kích thước hiển thị của hình nền được tính như sau:

- **Nếu cả hai thành phần của `background-size` được chỉ định và đều không phải `auto`:** Hình nền được hiển thị theo kích thước đã chỉ định.
- **Nếu `background-size` là `contain` hoặc `cover`:** Trong khi giữ nguyên tỷ lệ tự nhiên, hình ảnh được hiển thị theo kích thước lớn nhất nằm trong, hoặc bao phủ, vùng định vị nền.
  Nếu hình không có tỷ lệ tự nhiên, nó được hiển thị theo kích thước của vùng định vị nền.
- **Nếu `background-size` là `auto` hoặc `auto auto`:**
  - Nếu hình có cả kích thước ngang và dọc tự nhiên, nó được hiển thị theo kích thước đó.
  - Nếu hình không có kích thước tự nhiên và không có tỷ lệ tự nhiên, nó được hiển thị theo kích thước vùng định vị nền.
  - Nếu hình không có kích thước tự nhiên nhưng có tỷ lệ tự nhiên, nó được hiển thị như thể `contain` đã được chỉ định.
  - Nếu hình chỉ có một kích thước tự nhiên và có tỷ lệ tự nhiên, nó được hiển thị theo kích thước tương ứng với chiều đó.
    Chiều còn lại được tính từ chiều đã chỉ định và tỷ lệ tự nhiên.
  - Nếu hình chỉ có một kích thước tự nhiên nhưng không có tỷ lệ tự nhiên, nó được hiển thị bằng chiều đã chỉ định và chiều còn lại sử dụng kích thước của vùng định vị nền.

  > [!NOTE]
  > Hình ảnh SVG có thuộc tính [`preserveAspectRatio`](/en-US/docs/Web/SVG/Reference/Attribute/preserveAspectRatio) mặc định tương đương với `contain`; một `background-size` tường minh khiến `preserveAspectRatio` bị bỏ qua.

- **Nếu `background-size` có một thành phần `auto` và một thành phần không phải `auto`:**
  - Nếu hình có tỷ lệ tự nhiên, nó được kéo giãn theo chiều đã chỉ định.
    Chiều chưa chỉ định được tính từ chiều đã chỉ định và tỷ lệ tự nhiên.
  - Nếu hình không có tỷ lệ tự nhiên, nó được kéo giãn theo chiều đã chỉ định.
    Chiều chưa chỉ định được tính từ kích thước tự nhiên tương ứng của hình nếu có.
    Nếu không có kích thước tự nhiên như vậy, nó trở thành chiều tương ứng của vùng định vị nền.

> [!NOTE]
> Việc đặt kích thước nền cho hình vector không có kích thước hay tỷ lệ tự nhiên chưa được triển khai đầy đủ trong tất cả trình duyệt.
> Hãy cẩn thận khi dựa vào hành vi được mô tả ở trên và kiểm tra trên nhiều trình duyệt để đảm bảo kết quả chấp nhận được.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Lặp lại hình lớn

Hãy xem xét một hình lớn, logo Firefox dạng 2982x2808 pixel. Chúng ta muốn chia bốn bản sao của hình này vào một phần tử 300x300 pixel.
Để làm điều này, chúng ta có thể sử dụng giá trị `background-size` cố định là 150 pixel.

#### HTML

```html
<div class="tiledBackground"></div>
```

#### CSS

```css
.tiledBackground {
  background-image: url("https://www.mozilla.org/media/img/logos/firefox/logo-quantum.9c5e96634f92.png");
  background-size: 150px;
  width: 300px;
  height: 300px;
  border: 2px solid;
  color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Tiling_a_large_image", 340, 340)}}

Xem [Thay đổi kích thước hình nền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Resizing_background_images) để biết thêm ví dụ.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thay đổi kích thước hình nền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Resizing_background_images)
- [Thu phóng nền SVG](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Scaling_SVG_backgrounds)
- {{cssxref("object-fit")}}
