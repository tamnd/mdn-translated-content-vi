---
title: <basic-shape>
slug: Web/CSS/Reference/Values/basic-shape
page-type: css-type
browser-compat: css.types.basic-shape
sidebar: cssref
---

Kiểu dữ liệu [CSS](/vi/docs/Web/CSS) **`<basic-shape>`** [data type](/vi/docs/Web/CSS/Reference/Values/Data_types) biểu diễn một hình dạng được sử dụng trong các thuộc tính {{cssxref("clip-path")}}, {{cssxref("shape-outside")}} và {{cssxref("offset-path")}}.

{{InteractiveExample("CSS Demo: &lt;basic-shape&gt;")}}

```css interactive-example-choice
clip-path: inset(22% 12% 15px 35px);
```

```css interactive-example-choice
clip-path: circle(6rem at 12rem 8rem);
```

```css interactive-example-choice
clip-path: ellipse(115px 55px at 50% 40%);
```

```css interactive-example-choice
clip-path: polygon(
  50% 2.4%,
  34.5% 33.8%,
  0% 38.8%,
  25% 63.1%,
  19.1% 97.6%,
  50% 81.3%,
  80.9% 97.6%,
  75% 63.1%,
  100% 38.8%,
  65.5% 33.8%
);
```

```css interactive-example-choice
clip-path: path("M 50,245 A 160,160 0,0,1 360,120 z");
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element"></div>
</section>
```

```css interactive-example
#default-example {
  background: #ffee99;
}

#example-element {
  background: linear-gradient(to bottom right, #ff5522, #0055ff);
  width: 100%;
  height: 100%;
}
```

## Cú pháp

Kiểu dữ liệu `<basic-shape>` được dùng để tạo các hình dạng cơ bản bao gồm hình chữ nhật theo [lề vùng chứa](#cú_pháp_cho_hình_chữ_nhật_theo_lề_vùng_chứa), theo [khoảng cách tọa độ](#cú_pháp_cho_hình_chữ_nhật_theo_khoảng_cách) hoặc theo [kích thước xác định](#cú_pháp_cho_hình_chữ_nhật_với_kích_thước), [hình tròn](#cú_pháp_cho_hình_tròn), [hình ellipse](#cú_pháp_cho_hình_ellipse), [đa giác](#cú_pháp_cho_đa_giác), [đường dẫn](#cú_pháp_cho_đường_dẫn) và [hình dạng tùy chỉnh](#cú_pháp_cho_hình_dạng). Các hình dạng cơ bản này được định nghĩa bằng một hàm CSS `<basic_shape>`, trong đó mỗi giá trị yêu cầu một tham số tuân theo cú pháp riêng của hàm đó.

### Tham số chung

Các tham số chung trong cú pháp của một số hàm hình dạng cơ bản bao gồm:

- `round <'border-radius'>`
  - : Định nghĩa các góc bo tròn cho [hình chữ nhật theo lề vùng chứa](#cú_pháp_cho_hình_chữ_nhật_theo_lề_vùng_chứa), [hình chữ nhật theo khoảng cách](#cú_pháp_cho_hình_chữ_nhật_theo_khoảng_cách) và [hình chữ nhật với kích thước](#cú_pháp_cho_hình_chữ_nhật_với_kích_thước) sử dụng cú pháp tương tự như thuộc tính viết tắt CSS {{cssxref("border-radius")}}.

- `<shape-radius>`
  - : Định nghĩa bán kính cho [hình tròn](#cú_pháp_cho_hình_tròn) hoặc [hình ellipse](#cú_pháp_cho_hình_ellipse). Các giá trị hợp lệ bao gồm {{cssxref("length")}}, {{cssxref("percentage")}}, `closest-side` (mặc định) và `farthest-side`. Giá trị âm không hợp lệ.

    Giá trị từ khóa `closest-side` sử dụng khoảng cách từ tâm hình đến cạnh gần nhất của hộp tham chiếu để tạo độ dài bán kính. Giá trị từ khóa `farthest-side` sử dụng khoảng cách từ tâm hình đến cạnh xa nhất của hộp tham chiếu.

- `<position>`
  - : Định nghĩa tâm {{cssxref("&lt;position&gt;")}} của [hình tròn](#cú_pháp_cho_hình_tròn) hoặc [hình ellipse](#cú_pháp_cho_hình_ellipse). Mặc định là `center` nếu bị bỏ qua.

- `<fill-rule>`
  - : Đặt {{SVGAttr("fill-rule")}} được dùng để xác định cách tô nội thất của hình dạng được định nghĩa bởi [đa giác](#cú_pháp_cho_đa_giác), [đường dẫn](#cú_pháp_cho_đường_dẫn) và [hình dạng](#cú_pháp_cho_hình_dạng) cơ bản. Các giá trị có thể là `nonzero` (mặc định) và `evenodd`.

    > [!NOTE]
    > `<fill-rule>` không được hỗ trợ trong {{cssxref("offset-path")}} và sử dụng nó sẽ làm mất hiệu lực của thuộc tính.

### Cú pháp cho hình chữ nhật: `<basic-shape-rect>`

Kiểu `<basic-shape-rect>`, là tập hợp con của kiểu `<basic-shape>`, biểu diễn các hàm hình dạng cơ bản giới hạn trong việc tạo hình chữ nhật, bao gồm {{cssxref("basic-shape/inset","inset()")}}, {{cssxref("basic-shape/rect","rect()")}} và {{cssxref("basic-shape/xywh","xywh()")}}.

Các hàm [`polygon()`](/vi/docs/Web/CSS/Reference/Values/basic-shape/polygon), [`path()`](/vi/docs/Web/CSS/Reference/Values/basic-shape/path) và [`shape()`](/vi/docs/Web/CSS/Reference/Values/basic-shape/shape) cũng có thể được dùng để tạo hình chữ nhật, nhưng không giới hạn chỉ trong các hình bốn cạnh, góc vuông.

#### Cú pháp cho hình chữ nhật theo lề vùng chứa

Hàm {{cssxref("basic-shape/inset","inset()")}} tạo một hình chữ nhật co vào bên trong, với kích thước được xác định bằng khoảng cách lề của mỗi trong bốn cạnh vùng chứa và, tùy chọn, các góc bo tròn.

```plain
inset( <length-percentage>{1,4} [ round <'border-radius'> ]? )
```

Khi cung cấp đủ bốn tham số đầu tiên, chúng biểu diễn khoảng lệch từ hộp tham chiếu vào bên trong theo thứ tự trên, phải, dưới và trái, xác định vị trí các cạnh của hình chữ nhật co vào. Các tham số này tuân theo cú pháp của thuộc tính viết tắt {{cssxref("margin")}}, cho phép đặt cả bốn lề với một, hai, ba hoặc bốn giá trị.

Nếu tổng hai lề của một chiều vượt quá 100% của chiều đó, cả hai giá trị sẽ được giảm tỷ lệ để tổng bằng 100%. Ví dụ, giá trị `inset(90% 10% 60% 10%)` có lề trên là `90%` và lề dưới là `60%`. Các giá trị này được giảm tỷ lệ thành `inset(60% 10% 40% 10%)`. Các hình như vậy, không bao quanh diện tích nào và không có {{cssxref("shape-margin")}}, không ảnh hưởng đến việc bao văn bản.

#### Cú pháp cho hình chữ nhật theo khoảng cách

Hàm {{cssxref("basic-shape/rect","rect()")}} định nghĩa một hình chữ nhật sử dụng khoảng cách được chỉ định từ các cạnh trên và trái của hộp tham chiếu, với các góc bo tròn tùy chọn.

```plain
rect( [ <length-percentage> | auto ]{4} [ round <'border-radius'> ]? )
```

Khi sử dụng hàm `rect()`, bạn không định nghĩa chiều rộng và chiều cao của hình chữ nhật. Thay vào đó, bạn chỉ định bốn giá trị để tạo hình chữ nhật, với kích thước được xác định bởi kích thước của hộp tham chiếu và bốn giá trị lệch. Mỗi giá trị có thể là {{cssxref("length")}}, {{cssxref("percentage")}}, hoặc từ khóa `auto`. Từ khóa `auto` được hiểu là `0%` cho giá trị trên và trái, và `100%` cho giá trị dưới và phải.

#### Cú pháp cho hình chữ nhật với kích thước

Hàm {{cssxref("basic-shape/xywh","xywh()")}} định nghĩa một hình chữ nhật đặt tại khoảng cách được chỉ định từ cạnh trái (`x`) và cạnh trên (`y`) của hộp tham chiếu, và có kích thước theo chiều rộng (`w`) và chiều cao (`h`) được chỉ định, theo thứ tự đó, với các góc bo tròn tùy chọn.

```plain
xywh( <length-percentage>{2} <length-percentage [0,∞]>{2} [ round <'border-radius'> ]? )
```

### Cú pháp cho hình tròn

Hàm {{cssxref("basic-shape/circle","circle()")}} định nghĩa một hình tròn sử dụng bán kính và vị trí.

```plain
circle( <shape-radius>? [ at <position> ]? )
```

Tham số `<shape-radius>` biểu diễn bán kính của hình tròn được định nghĩa là {{cssxref("length")}} hoặc {{cssxref("percentage")}}. Giá trị phần trăm ở đây được giải quyết từ chiều rộng và chiều cao đã dùng của hộp tham chiếu dưới dạng `sqrt(width^2+height^2)/sqrt(2)`. Nếu bị bỏ qua, bán kính được định nghĩa bởi `closest-side`.

### Cú pháp cho hình ellipse

Hàm {{cssxref("basic-shape/ellipse","ellipse()")}} định nghĩa một hình ellipse sử dụng hai bán kính và một vị trí.

```plain
ellipse( [ <shape-radius>{2} ]? [ at <position> ]? )
```

Các tham số `<shape-radius>` biểu diễn _rx_ và _ry_, bán kính theo trục x và trục y của hình ellipse, theo thứ tự đó. Các giá trị này được chỉ định là {{cssxref("length")}} hoặc {{cssxref("percentage")}}. Giá trị phần trăm ở đây được giải quyết theo chiều rộng đã dùng (cho giá trị rx) và chiều cao đã dùng (cho giá trị ry) của hộp tham chiếu. Nếu chỉ cung cấp một giá trị bán kính, hàm `ellipse()` không hợp lệ. Nếu không cung cấp giá trị nào, `50% 50%` được sử dụng.

### Cú pháp cho đa giác

Hàm {{cssxref("basic-shape/polygon","polygon()")}} định nghĩa một đa giác sử dụng {{SVGAttr("fill-rule")}} của SVG và một tập tọa độ.

```plain
polygon( <'fill-rule'>? , [ <length-percentage> <length-percentage> ]# )
```

Hàm nhận một danh sách các cặp tọa độ phân cách bằng dấu phẩy, mỗi cặp gồm hai giá trị `<length-percentage>` cách nhau bởi dấu cách, là cặp _xi_ và _yi_. Các giá trị này biểu diễn tọa độ trục x và y của đa giác tại vị trí _i_ (điểm đỉnh nơi hai đường gặp nhau).

### Cú pháp cho đường dẫn

Hàm {{cssxref("basic-shape/path","path()")}} định nghĩa một hình dạng sử dụng {{SVGAttr("fill-rule")}} của SVG và [định nghĩa đường dẫn](/vi/docs/Web/SVG/Reference/Attribute/d) SVG.

```plain
path( <'fill-rule'>? , <string> )
```

`<string>` bắt buộc là một [đường dẫn SVG](/vi/docs/Web/SVG/Reference/Attribute/d) dưới dạng chuỗi có dấu ngoặc kép. Hàm `path()` không phải là giá trị hợp lệ của thuộc tính {{cssxref("shape-outside")}}.

### Cú pháp cho hình dạng

Hàm {{cssxref("basic-shape/shape","shape()")}} định nghĩa một hình dạng sử dụng điểm bắt đầu ban đầu và một loạt các lệnh hình dạng.

```plain
shape( <'fill-rule'>? from <coordinate-pair> , <shape-command># )
```

Tham số `from <coordinate-pair>` biểu diễn điểm bắt đầu cho lệnh hình dạng đầu tiên, và `<shape-command>` định nghĩa một hoặc nhiều lệnh hình dạng, tương tự như các [lệnh đường dẫn SVG](/vi/docs/Web/SVG/Reference/Attribute/d#path_commands). Hàm `shape()` không phải là giá trị hợp lệ của thuộc tính {{cssxref("shape-outside")}}.

## Mô tả

Khi tạo một hình dạng, hộp tham chiếu được xác định bởi thuộc tính sử dụng giá trị `<basic-shape>`. Hệ tọa độ cho hình dạng có gốc tọa độ tại góc trên trái của margin box của phần tử theo mặc định, với trục x chạy sang phải và trục y chạy xuống dưới. Tất cả độ dài được biểu diễn dưới dạng phần trăm được giải quyết từ kích thước của hộp tham chiếu.

Hộp tham chiếu mặc định là [`margin-box`](/vi/docs/Web/CSS/Reference/Values/box-edge#margin-box), như minh họa trong hình bên dưới. Hình ảnh cho thấy một hình tròn được tạo bằng `shape-outside: circle(50%)`, làm nổi bật các phần khác nhau của mô hình hộp như nhìn thấy trong Developer Tools của trình duyệt. Hình dạng ở đây được định nghĩa với tham chiếu đến margin-box.

![An image showing a circle inspected with the Firefox DevTools Shape Inspector. The different parts of the box model are highlighted.](shapes-reference-box.png)

### Giá trị tính toán của hình dạng cơ bản

Các giá trị trong một hàm `<basic-shape>` được tính toán như đã chỉ định, với các lưu ý bổ sung sau:

- Đối với các giá trị bị bỏ qua, giá trị mặc định của chúng được sử dụng.
- Giá trị {{cssxref("position_value", "&lt;position&gt;")}} trong `circle()` hoặc `ellipse()` được tính toán thành một cặp lệch từ góc trên trái của hộp tham chiếu: lệch đầu tiên là ngang, lệch thứ hai là dọc. Mỗi lệch được chỉ định là giá trị {{cssxref("length-percentage")}}.
- Giá trị [`<border-radius>`](/vi/docs/Web/CSS/Reference/Properties/border-radius) trong `inset()` được mở rộng thành danh sách tám giá trị, mỗi giá trị là {{cssxref("length")}} hoặc {{cssxref("percentage")}}.
- Các hàm {{cssxref("basic-shape/inset","inset()")}}, {{cssxref("basic-shape/rect","rect()")}} và {{cssxref("basic-shape/xywh","xywh()")}} được tính toán thành hàm `inset()` tương đương.

### Nội suy hình dạng cơ bản

Khi hoạt hình giữa hai hàm `<basic-shape>`, các quy tắc {{Glossary("interpolation")}} được liệt kê bên dưới được áp dụng. Các giá trị tham số của mỗi hàm `<basic-shape>` tạo thành một danh sách. Để nội suy xảy ra giữa hai hình dạng, cả hai hình dạng phải sử dụng cùng hộp tham chiếu và số lượng, kiểu giá trị trong cả hai danh sách `<basic-shape>` phải khớp.

Mỗi giá trị trong danh sách của hai hàm `<basic-shape>` được nội suy dựa trên giá trị tính toán của nó dưới dạng {{cssxref("number")}}, {{cssxref("length")}}, {{cssxref("percentage")}}, {{cssxref("angle")}} hoặc {{cssxref("calc()")}} khi có thể. Nội suy vẫn có thể xảy ra nếu các giá trị không thuộc các kiểu dữ liệu đó nhưng giống nhau giữa hai hàm hình dạng cơ bản nội suy, chẳng hạn như `nonzero`.

- **Cả hai hình dạng đều thuộc kiểu `ellipse()` hoặc kiểu `circle()`**: Nội suy được áp dụng giữa mỗi giá trị tương ứng nếu bán kính của chúng được chỉ định là {{cssxref("length")}} hoặc {{cssxref("percentage")}} (thay vì các từ khóa như `closest-side` hoặc `farthest-side`).

- **Cả hai hình dạng đều thuộc kiểu `inset()`**: Nội suy được áp dụng giữa mỗi giá trị tương ứng.

- **Cả hai hình dạng đều thuộc kiểu `polygon()`**: Nội suy được áp dụng giữa mỗi giá trị tương ứng nếu chúng sử dụng cùng `<fill-rule>` và có cùng số cặp tọa độ phân cách bằng dấu phẩy.

- **Cả hai hình dạng đều thuộc kiểu `path()`**: Nội suy được áp dụng cho mỗi tham số dưới dạng {{cssxref("&lt;number&gt;")}} nếu các chuỗi đường dẫn trong cả hai hình dạng khớp về số lượng, kiểu và trình tự [lệnh dữ liệu đường dẫn](/vi/docs/Web/SVG/Reference/Attribute/d#path_commands).

- **Cả hai hình dạng đều thuộc kiểu `shape()`**: Nội suy được áp dụng giữa mỗi giá trị tương ứng nếu chúng có từ khóa lệnh giống hệt nhau và sử dụng cùng từ khóa `<by-to>`. Nếu `shape()` được sử dụng trong thuộc tính {{cssxref("clip-path")}}, hai hình dạng nội suy nếu chúng cũng có cùng `<fill-rule>`.
  - Nếu chúng sử dụng `<curve-command>` hoặc `<smooth-command>`, số điểm điều khiển phải khớp để nội suy.

  - Nếu chúng sử dụng `<arc-command>` với các hướng `<arc-sweep>` khác nhau, kết quả nội suy đi theo chiều kim đồng hồ (`cw`). Nếu chúng sử dụng các từ khóa `<arc-size>` khác nhau, kích thước được nội suy sử dụng giá trị `large`.

- **Một hình dạng thuộc kiểu `path()` và hình kia thuộc kiểu `shape()`**: Nội suy được áp dụng giữa mỗi giá trị tương ứng nếu danh sách các lệnh dữ liệu đường dẫn giống nhau về số lượng cũng như trình tự. Hình dạng nội suy là một hàm `shape()`, duy trì cùng danh sách các lệnh dữ liệu đường dẫn.

Trong tất cả các trường hợp khác, không có nội suy nào xảy ra và hoạt hình là rời rạc.

## Ví dụ

### Đa giác hoạt hình

Trong ví dụ này, chúng ta sử dụng at-rule [@keyframes](/vi/docs/Web/CSS/Reference/At-rules/@keyframes) để hoạt hình clip path giữa hai đa giác. Lưu ý rằng cả hai đa giác đều có cùng số đỉnh, điều này cần thiết để loại hoạt hình này hoạt động.

#### HTML

```html
<div></div>
```

#### CSS

```css
div {
  width: 300px;
  height: 300px;
  background: repeating-linear-gradient(red, orange 50px);
  clip-path: polygon(
    50% 0%,
    60% 40%,
    100% 50%,
    60% 60%,
    50% 100%,
    40% 60%,
    0% 50%,
    40% 40%
  );
  animation: 4s poly infinite alternate ease-in-out;
  margin: 10px auto;
}

@keyframes poly {
  from {
    clip-path: polygon(
      50% 0%,
      60% 40%,
      100% 50%,
      60% 60%,
      50% 100%,
      40% 60%,
      0% 50%,
      40% 40%
    );
  }

  to {
    clip-path: polygon(
      50% 30%,
      100% 0%,
      70% 50%,
      100% 100%,
      50% 70%,
      0% 100%,
      30% 50%,
      0% 0%
    );
  }
}
```

#### Kết quả

{{EmbedLiveSample('Animated_polygon','340', '340')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("clip-path")}}, {{cssxref("offset-path")}}, {{cssxref("shape-outside")}}
- Các phần tử hình dạng SVG: {{SVGElement("circle")}}, {{SVGElement("ellipse")}}, {{SVGElement("line")}}, {{SVGElement("polygon")}}, {{SVGElement("polyline")}}, {{SVGElement("rect")}}
- [Tổng quan về CSS shapes](/vi/docs/Web/CSS/Guides/Shapes/Overview)
- Module [CSS shapes](/vi/docs/Web/CSS/Guides/Shapes)
- [Giới thiệu về CSS masking](/vi/docs/Web/CSS/Guides/Masking/Introduction)
- Module [CSS masking](/vi/docs/Web/CSS/Guides/Masking)
- [Edit shape paths in Firefox developer tools](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/edit_css_shapes/index.html)
