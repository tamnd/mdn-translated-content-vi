---
title: mask-size
slug: Web/CSS/Reference/Properties/mask-size
page-type: css-property
browser-compat: css.properties.mask-size
sidebar: cssref
---

Thuộc tính **`mask-size`** trong [CSS](/en-US/docs/Web/CSS) xác định kích thước của các ảnh mặt nạ được chỉ định. Kích thước ảnh mặt nạ có thể được giới hạn hoàn toàn hoặc một phần để bảo toàn {{glossary("aspect ratio", "tỷ lệ khung hình nội tại")}} của chúng.

## Cú pháp

```css
/* Cú pháp từ khóa */
mask-size: cover;
mask-size: contain;
mask-size: auto;

/* Cú pháp một giá trị */
/* Chiều rộng mặt nạ. Đặt chiều cao là 'auto'. */
mask-size: 50%;
mask-size: 3em;
mask-size: 12px;

/* Cú pháp hai giá trị */
/* Giá trị đầu tiên: chiều rộng mặt nạ. Giá trị thứ hai: chiều cao mặt nạ */
mask-size: 3em 25%;
mask-size: auto 6px;
mask-size: auto 50%;

/* Nhiều giá trị */
mask-size: auto, contain;
mask-size:
  50%,
  50% 25%,
  auto 25%;
mask-size: 6px, auto, contain;

/* Giá trị toàn cục */
mask-size: inherit;
mask-size: initial;
mask-size: revert;
mask-size: revert-layer;
mask-size: unset;
```

### Giá trị

Thuộc tính `mask-size` nhận danh sách phân cách bằng dấu phẩy của các giá trị `<bg-size>`. Giá trị `<bg-size>` có thể là `cover`, `contain`, một cặp giá trị xác định chiều rộng và chiều cao (theo thứ tự đó), hoặc một giá trị đơn xác định chiều rộng (trong trường hợp đó, chiều cao được đặt là `auto`). Các giá trị bao gồm:

- `contain`
  - : Phóng to hoặc thu nhỏ ảnh mặt nạ trong khi duy trì tỷ lệ khung hình, làm cho mặt nạ càng lớn càng tốt trong hộp chứa mà không bị cắt hoặc kéo dài.
    Nếu ảnh mặt nạ nhỏ hơn hộp chứa, mặt nạ sẽ xếp gạch, hoặc lặp lại, trừ khi thuộc tính {{cssxref("mask-repeat")}} được đặt thành `no-repeat`.

- `cover`
  - : Thay đổi kích thước ảnh mặt nạ đến kích thước nhỏ nhất có thể để lấp đầy hộp chứa trong khi duy trì tỷ lệ khung hình. Nếu tỷ lệ khung hình của ảnh mặt nạ khác với phần tử, nó sẽ bị cắt theo chiều dọc hoặc ngang.

- `auto`
  - : Duy trì tỷ lệ khung hình gốc của nguồn mặt nạ. Khi được đặt cho cả chiều rộng và chiều cao, kích thước gốc của tài nguyên mặt nạ được sử dụng. Ngược lại, `auto` thay đổi kích thước ảnh mặt nạ theo chiều tương ứng sao cho tỷ lệ khung hình gốc của nó được duy trì.

- {{cssxref("&lt;length&gt;")}}
  - : Hiển thị ảnh mặt nạ ở độ dài được chỉ định trong chiều tương ứng (chiều rộng nếu được đặt là giá trị đầu tiên hoặc duy nhất, chiều cao nếu được đặt là giá trị thứ hai). Giá trị âm không được phép.

- {{cssxref("&lt;percentage&gt;")}}
  - : Hiển thị ảnh mặt nạ trong chiều tương ứng theo phần trăm được chỉ định của vùng gốc hộp theo định nghĩa của thuộc tính {{cssxref("mask-origin")}}, mặc định là `padding-box`. Giá trị âm không được phép.

## Mô tả

Thuộc tính `mask-size` được sử dụng để điều chỉnh kích thước các lớp mặt nạ.

Một phần tử có thể có nhiều lớp mặt nạ được áp dụng. Số lượng lớp mặt nạ được xác định bởi số lượng giá trị phân cách bằng dấu phẩy trong giá trị thuộc tính {{cssxref("mask-image")}} (một giá trị tạo ra một lớp mặt nạ, ngay cả khi nó là `none`).

Mỗi giá trị `mask-size` trong danh sách phân cách bằng dấu phẩy được ghép với lớp mặt nạ liên quan được xác định bởi danh sách giá trị `mask-image`, theo thứ tự. Nếu số lượng giá trị trong hai thuộc tính khác nhau:

- Nếu `mask-size` có nhiều giá trị hơn `mask-image`, các giá trị dư của `mask-size` không được sử dụng.
- Nếu `mask-size` có ít giá trị hơn `mask-image`, các giá trị `mask-size` được lặp lại.

Mỗi giá trị `mask-size` là giá trị `<bg-size>`. Có ba cách khai báo mỗi `<bg-size>`: một từ khóa, hai giá trị độ dài, phần trăm hoặc từ khóa `auto`, hoặc một giá trị độ dài, phần trăm hoặc `auto`:

- Các từ khóa có sẵn là `cover` và `contain`.
- Khi hai giá trị được chỉ định, giá trị đầu tiên xác định chiều rộng mặt nạ và giá trị thứ hai xác định chiều cao của nó.
- Khi một giá trị được chỉ định, nó chỉ xác định chiều rộng mặt nạ, với chiều cao được đặt là `auto`.

Các giá trị chiều rộng và chiều cao là {{cssxref("&lt;length&gt;")}}, {{cssxref("&lt;percentage&gt;")}}, hoặc từ khóa `auto`, là giá trị mặc định. Đặt một hoặc cả hai giá trị thành `auto` duy trì tỷ lệ khung hình gốc của ảnh mặt nạ.

Kích thước hiển thị của ảnh mặt nạ được tính như sau:

- Nếu cả hai thành phần của `mask-size` được chỉ định và không phải là `auto`, ảnh mặt nạ hiển thị ở kích thước được chỉ định.
- Nếu `mask-size` là `contain` hoặc `cover`, ảnh được hiển thị bằng cách duy trì tỷ lệ khung hình ở kích thước lớn nhất được chứa trong hoặc bao phủ vùng định vị mặt nạ. Nếu ảnh không có tỷ lệ nội tại, chẳng hạn như với các gradient, thì nó được hiển thị ở kích thước của vùng định vị mặt nạ.
- Nếu `mask-size` là `auto` (giải quyết thành `auto auto`), nó được hiển thị ở kích thước mà mặt nạ sẽ được hiển thị nếu không có CSS nào được áp dụng để thay đổi việc hiển thị; đây là {{glossary("intrinsic size", "kích thước nội tại")}} của nó. Nếu nó không có kích thước nội tại và không có tỷ lệ nội tại, như trong trường hợp [CSS gradient](/en-US/docs/Web/CSS/Reference/Values/gradient), nó được hiển thị ở kích thước của vùng định vị mặt nạ, được xác định bởi {{cssxref("mask-origin")}} (mặc định là `border-box`).
  Nếu nguồn mặt nạ không có kích thước nhưng có tỷ lệ (tỷ lệ khung hình), giá trị `auto` sẽ hiển thị nó như thể `contain` đã được chỉ định. Nếu ảnh có một kích thước nội tại và một tỷ lệ, nó được hiển thị ở kích thước được xác định bởi một kích thước đó và tỷ lệ. Nếu ảnh có một kích thước nội tại nhưng không có tỷ lệ, nó được hiển thị bằng kích thước nội tại và kích thước tương ứng của vùng định vị mặt nạ.
- Nếu `mask-size` có một thành phần `auto` và một thành phần không phải `auto`, áp dụng cho tất cả các giá trị đơn, tỷ lệ khung hình được duy trì nếu nguồn mặt nạ có tỷ lệ nội tại. Nếu không có tỷ lệ nội tại, giá trị `auto` được coi là kích thước của vùng định vị mặt nạ.

Như với tất cả các thành phần longhand của thuộc tính shorthand, nếu thuộc tính shorthand {{cssxref("mask")}} được đặt và giá trị của thuộc tính `mask-size` không được xác định trong bất kỳ lớp mặt nạ nào, giá trị `mask-size` được đặt lại thành giá trị ban đầu của nó là `auto` cho các lớp mặt nạ đó.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kích thước mặt nạ theo phần trăm

Ví dụ này minh họa cách sử dụng cơ bản, trong khi cũng minh họa các giá trị phần trăm cho `mask-size`.

#### HTML

Chúng ta bao gồm hai phần tử {{htmlelement("div")}}:

```html
<div class="width"></div>
<div class="height"></div>
```

#### CSS

Các phần tử `<div>` được xác định là cao gấp đôi chiều rộng, với nền gradient và mặt nạ:

```css
div {
  width: 200px;
  height: 400px;
  background: blue linear-gradient(red, blue);
  mask-image: url("/shared-assets/images/examples/mdn.svg");
}
```

Chiều rộng mặt nạ của một phần tử `<div>` được đặt là `50%`, với chiều cao mặc định là `auto`. Chiều cao mặt nạ của phần tử `<div>` thứ hai được đặt là `50%` với chiều rộng được đặt là `auto`:

```css
.width {
  mask-size: 50%;
}

.height {
  mask-size: auto 50%;
}
```

Trong trường hợp `width`, mặt nạ được hiển thị rộng `100px` (`50%` của phần tử rộng `200px`). Chiều cao mặc định là `auto`, duy trì tỷ lệ khung hình của mặt nạ.
Trong trường hợp `height`, mặt nạ được hiển thị cao `200px` (`50%` của hộp chứa cao `400px`). Chiều rộng được đặt rõ ràng là `auto`, duy trì tỷ lệ khung hình của mặt nạ.

```css hidden
body {
  display: flex;
  gap: 20px;
}
```

#### Kết quả

{{EmbedLiveSample("Setting mask size as a percentage", "", "430px")}}

### Cover và contain

Ví dụ này minh họa các giá trị từ khóa cho `mask-size`.

#### HTML

Ba phần tử {{htmlelement("section")}} được xác định, mỗi phần tử có tên lớp khác nhau, và mỗi phần tử chứa một `<div>`.

```html
<section class="auto">
  <div></div>
</section>
<section class="cover">
  <div></div>
</section>
<section class="contain">
  <div></div>
</section>
```

#### CSS

Các phần tử `<div>` được xác định là cao gấp đôi chiều rộng, với nền gradient và mặt nạ:

```css
div {
  width: 200px;
  height: 400px;
  background: blue linear-gradient(red, blue);
  mask-image: url("/shared-assets/images/examples/mask-star.svg");
}
```

`mask-size` của hai phần tử `<div>` được đặt thành một trong các giá trị từ khóa của thuộc tính. Phần tử `<div>` thứ ba có `mask-size` là `auto` được đặt để minh họa kích thước nội tại gốc của mặt nạ:

```css
.auto div {
  mask-size: auto;
}

.cover div {
  mask-size: cover;
}

.contain div {
  mask-size: contain;
}
```

Giá trị thuộc tính được hiển thị bằng [nội dung được tạo ra](/en-US/docs/Web/CSS/Guides/Generated_content).

```css
section::before {
  content: "mask-size: " attr(class) ";";
  display: block;
  text-align: center;
  border-bottom: 1px solid;
}
```

```css hidden
body {
  display: flex;
  flex-flow: row wrap;
  gap: 10px;
}
section {
  border: 1px solid;
}
```

#### Kết quả

{{EmbedLiveSample("Cover and contain", "", "430px")}}

Với `auto`, ngôi sao được hiển thị ở kích thước nội tại `100px` x `100px`. Với `cover`, ngôi sao tăng trưởng đến `400px` chiều cao, bao phủ toàn bộ hộp gốc. Với `contain`, ngôi sao tăng trưởng cho đến khi một chiều bằng chiều tương ứng của [hộp gốc](/en-US/docs/Web/CSS/Reference/Properties/mask-origin), nghĩa là ngôi sao càng lớn càng tốt (`200px` rộng) nhưng vẫn được chứa trong đó.

### Khi mặt nạ lớn hơn hộp chứa

Sử dụng cùng HTML và CSS ở trên, với chỉ kích thước hộp gốc khác nhau, ví dụ này khám phá điều gì xảy ra khi hộp gốc nhỏ hơn kích thước nội tại của mặt nạ.

```html hidden
<section class="auto">
  <div></div>
</section>
<section class="cover">
  <div></div>
</section>
<section class="contain">
  <div></div>
</section>
```

```css hidden
div {
  background: blue linear-gradient(red, blue);
  mask-image: url("/shared-assets/images/examples/mask-star.svg");
}

.auto div {
  mask-size: auto;
}

.cover div {
  mask-size: cover;
}

.contain div {
  mask-size: contain;
}

section::before {
  content: attr(class);
  display: block;
  text-align: center;
  border-bottom: 1px solid;
}

body {
  display: flex;
  flex-flow: row wrap;
  gap: 10px;
}
section {
  border: 1px solid;
}
```

Sự khác biệt duy nhất là kích thước của hộp chứa (và nội dung được tạo ra):

```css
div {
  width: 70px;
  height: 70px;
}
```

{{EmbedLiveSample("When the mask is larger than the container", "", "120px")}}

Giá trị `contain` chứa mặt nạ trong hộp gốc. Giá trị `cover` bao phủ nó. Trong cả hai trường hợp, mặt nạ thu nhỏ trong khi duy trì tỷ lệ khung hình gốc. Với `auto`, mặt nạ bị cắt vì kích thước nội tại lớn hơn kích thước hộp.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("background-size")}}
- {{cssxref("mask")}} shorthand
- {{cssxref("mask-image")}}
- {{cssxref("mask-origin")}}
- {{cssxref("mask-position")}}
- {{cssxref("mask-repeat")}}
- {{cssxref("mask-image")}}
- {{cssxref("mask-border")}}
- {{cssxref("background-size")}}
- {{cssxref("mask-border-width")}}
- [Introduction to CSS masking](/en-US/docs/Web/CSS/Guides/Masking/Introduction)
- [CSS `mask` properties](/en-US/docs/Web/CSS/Guides/Masking/Mask_properties)
- [Declaring multiple masks](/en-US/docs/Web/CSS/Guides/Masking/Multiple_masks)
- [CSS masking](/en-US/docs/Web/CSS/Guides/Masking) module
