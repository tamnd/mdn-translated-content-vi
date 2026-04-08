---
title: mask-origin
slug: Web/CSS/Reference/Properties/mask-origin
page-type: css-property
browser-compat: css.properties.mask-origin
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`mask-origin`** thiết lập gốc của mặt nạ. Thuộc tính này xác định vùng định vị mặt nạ: vùng mà trong đó một hình ảnh mặt nạ được định vị. Các phần tử HTML có thể có mặt nạ được chứa trong hộp viền nội dung, hộp đệm, hoặc hộp nội dung, trong khi các phần tử SVG (không có hộp bố cục CSS liên quan) có thể có mặt nạ được chứa trong vùng fill, stroke, hoặc view box.
Đối với các phần tử được hiển thị dưới dạng nhiều hộp, chẳng hạn như {{htmlelement("span")}} văn bản trải dài hơn một dòng, thuộc tính `mask-origin` chỉ định các hộp mà thuộc tính {{cssxref("box-decoration-break")}} hoạt động để xác định vùng định vị mặt nạ.

## Cú pháp

```css
/* Giá trị từ khóa */
mask-origin: content-box;
mask-origin: padding-box;
mask-origin: border-box;
mask-origin: fill-box;
mask-origin: stroke-box;
mask-origin: view-box;

/* Nhiều giá trị */
mask-origin: padding-box, content-box;
mask-origin: view-box, fill-box, border-box;

/* Giá trị toàn cục */
mask-origin: inherit;
mask-origin: initial;
mask-origin: revert;
mask-origin: revert-layer;
mask-origin: unset;
```

### Giá trị

Thuộc tính `mask-origin` là danh sách các giá trị từ khóa `<coord-box>` được phân tách bằng dấu phẩy, bao gồm:

- `content-box`
  - : Vị trí tương đối với [hộp nội dung](/vi/docs/Web/CSS/Guides/Shapes/From_box_values#content-box).
- `padding-box`
  - : Vị trí tương đối với [hộp đệm](/vi/docs/Web/CSS/Guides/Shapes/From_box_values#padding-box).
- `border-box`
  - : Vị trí tương đối với [hộp viền](/vi/docs/Web/CSS/Guides/Shapes/From_box_values#border-box).
- `fill-box`
  - : Vị trí tương đối với hộp giới hạn đối tượng.
- `stroke-box`
  - : Vị trí tương đối với hộp giới hạn nét vẽ.
- `view-box`
  - : Sử dụng khung nhìn SVG gần nhất làm hộp tham chiếu. Nếu một thuộc tính {{svgattr("viewBox")}} được chỉ định cho phần tử tạo ra khung nhìn SVG, hộp tham chiếu được định vị tại gốc của hệ tọa độ được thiết lập bởi thuộc tính `viewBox` và kích thước của hộp tham chiếu được đặt bằng các giá trị chiều rộng và chiều cao của thuộc tính `viewBox`.

Có ba giá trị không chuẩn là viết tắt cho các giá trị `<coord-box>` chuẩn: `content` là bí danh cho `content-box`, `padding` là bí danh cho `padding-box`, và `border` là bí danh cho `border-box`.

## Mô tả

Thuộc tính `mask-origin` rất giống với thuộc tính {{cssxref("background-origin")}}, nhưng nó có một tập hợp giá trị khác và giá trị ban đầu khác. Giá trị ban đầu phụ thuộc vào việc có hộp bố cục CSS liên quan hay không; nếu có, giá trị mặc định là `border-box`. Trong khi đó, mặc định cho `background-origin` là `padding-box`.

Đối với các phần tử SVG không có hộp bố cục CSS liên quan, các giá trị `content-box`, `padding-box`, và `border-box` (giá trị mặc định) tính toán thành `fill-box`, nghĩa là vị trí tương đối với hộp giới hạn đối tượng. Đối với các phần tử HTML, nếu một giá trị liên quan đến SVG là `fill-box`, `stroke-box`, hoặc `view-box` được đặt, giá trị được tính toán thành `border-box`.

Một phần tử có thể có nhiều lớp mặt nạ được áp dụng. Số lượng lớp được xác định bởi số lượng giá trị được phân tách bằng dấu phẩy trong giá trị thuộc tính {{cssxref("mask-image")}} (ngay cả khi một hoặc nhiều giá trị đó là `none`). Mỗi giá trị `mask-origin` trong danh sách giá trị được phân tách bằng dấu phẩy được khớp với giá trị `mask-image` được phân tách bằng dấu phẩy, theo cùng thứ tự.

Nếu số lượng giá trị trong hai thuộc tính khác nhau, bất kỳ giá trị dư thừa nào của `mask-origin` sẽ không được sử dụng trong trường hợp `mask-origin` có nhiều giá trị hơn `mask-image`. Nếu `mask-origin` có ít giá trị hơn `mask-image`, các giá trị `mask-origin` sẽ được lặp lại.

Đối với các phần tử được hiển thị dưới dạng một hộp đơn, thuộc tính này chỉ định vùng định vị mặt nạ — hay vị trí gốc — của hình ảnh được tham chiếu bởi thuộc tính `mask-image`.

Đối với các phần tử được hiển thị dưới dạng nhiều hộp, chẳng hạn như các hộp nội tuyến trải dài hơn một dòng, thuộc tính `mask-origin` chỉ định các hộp mà thuộc tính {{cssxref("box-decoration-break")}} hoạt động để xác định vùng định vị mặt nạ.

`mask-origin` có thể làm cho hình ảnh lớp mặt nạ bị cắt. Ví dụ, nếu thuộc tính {{cssxref("mask-clip")}} được đặt thành `padding-box`, `mask-origin` được đặt thành `border-box`, {{cssxref("mask-position")}} được đặt thành cạnh `top left`, và phần tử có viền, thì hình ảnh lớp mặt nạ sẽ bị cắt ở cạnh trên-trái.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### So sánh content, padding và border

Ví dụ này minh họa cách dùng cơ bản khi so sánh ba giá trị của thuộc tính `mask-origin`.

#### HTML

Chúng ta gồm bốn phần tử {{htmlelement("section")}}, mỗi phần tử chứa một phần tử {{htmlelement("div")}}.

```html
<section class="content">
  <div></div>
</section>
<section class="padding">
  <div></div>
</section>
<section class="border">
  <div></div>
</section>
<section class="comparison">
  <div></div>
</section>
```

#### CSS

Chúng ta áp dụng {{cssxref("border")}}, {{cssxref("padding")}}, và {{cssxref("margin")}} cho mỗi `<div>`. Chúng tạo ra các điểm tham chiếu cho gốc hình ảnh mặt nạ. Viết tắt `border` bao gồm một {{cssxref("border-color")}}. Chúng ta cũng gồm một {{cssxref("background-color")}}. Chúng cung cấp nền xanh lá cây và viền xanh dương để che phủ. Cuối cùng, tất cả các phần tử `<div>` của chúng ta được cung cấp một {{cssxref("mask-image")}}.

```css
div {
  width: 100px;
  height: 100px;
  margin: 10px;
  border: 10px solid blue;
  background-color: #8cffa0;
  padding: 10px;
  mask-image: url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg");
}
section {
  border: 1px solid black;
}
```

Chúng ta cung cấp cho mỗi `<div>` một giá trị `mask-origin` khác nhau.

```css
.content div {
  mask-origin: content-box;
}

.padding div {
  mask-origin: padding-box;
}

.border div {
  mask-origin: border-box;
}

.comparison div {
  mask-image: none;
}
```

Chúng ta cũng tạo ra một số văn bản bên trong mỗi `<section>` để chỉ ra gốc mặt nạ cho mỗi vùng chứa `<div>`.

```css
section::before {
  content: attr(class);
  display: block;
  text-align: center;
}
```

```css hidden
body {
  display: flex;
  flex-flow: row wrap;
  gap: 10px;
}
```

#### Kết quả

{{EmbedLiveSample("Comparing content padding and border", "", "200")}}

Lưu ý sự khác biệt giữa ba giá trị. Trong ba hộp đầu tiên, tương ứng, mặt nạ bắt nguồn từ:

- Cạnh ngoài của viền.
- Cạnh viền bên trong, là cạnh ngoài của hộp đệm.
- Cạnh đệm bên trong, là cạnh ngoài của hộp nội dung.

Hộp thứ tư không có `mask-image` được chỉ định: đây là hình ảnh tham chiếu, được bao gồm để cho phép bạn dễ dàng hình dung phạm vi của các vùng nội dung và đệm.

### Nhiều giá trị

Ví dụ này minh họa việc sử dụng các giá trị `mask-origin` khác nhau cho các `mask-image` khác nhau được áp dụng cho một phần tử đơn.

#### HTML

Chúng ta gồm một `<div>` đơn.

```html
<div></div>
```

#### CSS

Chúng ta áp dụng ba hình ảnh mặt nạ thay vì một, mỗi hình ảnh với {{cssxref("mask-position")}} khác nhau. Chúng ta cũng đặt các hình ảnh mặt nạ không lặp lại.

```css
div {
  width: 120px;
  height: 120px;
  margin: 10px;
  border: 10px solid blue;
  background-color: #8cffa0;
  padding: 10px;
  mask-image:
    url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg"),
    url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg"),
    url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg");
  mask-position:
    top left,
    top right,
    bottom center;
  mask-repeat: no-repeat;
  mask-origin: content-box, border-box;
}
```

#### Kết quả

{{EmbedLiveSample("Multiple values", "", "200")}}

Chúng ta có ba giá trị `mask-image`, nhưng chỉ có hai giá trị `mask-origin`. Điều này có nghĩa là các giá trị `mask-origin` được lặp lại, như thể chúng ta đã đặt `mask-origin: content-box, padding-box, content-box;`. Ngôi sao `border-box`, mặt nạ duy nhất chồng lên viền, là ngôi sao trên cùng bên phải.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("background-origin")}}
- {{cssxref("mask-image")}}
- {{cssxref("mask-position")}}
- {{cssxref("mask-repeat")}}
- {{cssxref("mask-size")}}
- {{cssxref("mask")}} viết tắt
- [Giới thiệu về mặt nạ CSS](/vi/docs/Web/CSS/Guides/Masking/Introduction)
- [Các thuộc tính `mask` CSS](/vi/docs/Web/CSS/Guides/Masking/Mask_properties)
- [Khai báo nhiều mặt nạ](/vi/docs/Web/CSS/Guides/Masking/Multiple_masks)
- Mô-đun [CSS masking](/vi/docs/Web/CSS/Guides/Masking)
