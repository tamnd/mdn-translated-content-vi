---
title: box-shadow
slug: Web/CSS/Reference/Properties/box-shadow
page-type: css-property
browser-compat: css.properties.box-shadow
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`box-shadow`** thêm hiệu ứng đổ bóng xung quanh khung của phần tử. Bạn có thể đặt nhiều hiệu ứng được phân tách bằng dấu phẩy. Bóng hộp được mô tả bằng độ dời X và Y so với phần tử, bán kính làm mờ và bán kính lan rộng, và màu sắc.

{{InteractiveExample("CSS Demo: box-shadow")}}

```css interactive-example-choice
box-shadow: 10px 5px 5px red;
```

```css interactive-example-choice
box-shadow: 60px -16px teal;
```

```css interactive-example-choice
box-shadow: 12px 12px 2px 1px rgb(0 0 255 / 0.2);
```

```css interactive-example-choice
box-shadow: inset 5em 1em gold;
```

```css interactive-example-choice
box-shadow:
  3px 3px red,
  -1em 0 0.4em olive;
```

```html interactive-example
<section id="default-example">
  <div class="transition-all" id="example-element">
    <p>This is a box with a box-shadow around it.</p>
  </div>
</section>
```

```css interactive-example
#example-element {
  margin: 20px auto;
  padding: 0;
  border: 2px solid #333333;
  width: 80%;
  text-align: center;
}
```

## Cú pháp

```css
/* Keyword values */
box-shadow: none;

/* A color and two length values */
box-shadow: red 60px -16px;

/* Three length values and a color */
box-shadow: 10px 5px 5px black;

/* Four length values and a color */
box-shadow: 2px 2px 2px 1px rgb(0 0 0 / 20%);

/* inset, length values, and a color */
box-shadow: inset 5em 1em gold;

/* Multiple shadows, separated by commas */
box-shadow:
  3px 3px red inset,
  -1em 0 0.4em olive;

/* Global values */
box-shadow: inherit;
box-shadow: initial;
box-shadow: revert;
box-shadow: revert-layer;
box-shadow: unset;
```

Chỉ định một bóng hộp đơn bằng cách sử dụng:

- Hai, ba, hoặc bốn giá trị {{cssxref("length")}}.
  - Nếu chỉ có hai giá trị được đưa ra, chúng được hiểu là giá trị `<offset-x>` và `<offset-y>`.
  - Nếu có ba giá trị được đưa ra, giá trị thứ ba được hiểu là `<blur-radius>`.
  - Nếu có bốn giá trị được đưa ra, giá trị thứ tư được hiểu là `<spread-radius>`.

- Tùy chọn, từ khóa `inset`.
- Tùy chọn, một giá trị [`<color>`](#color).

Để chỉ định nhiều bóng, cung cấp một danh sách các bóng phân cách bằng dấu phẩy.

### Giá trị

- `<color>` {{optional_inline}}
  - : Chỉ định màu sắc cho bóng. Xem giá trị {{cssxref("&lt;color&gt;")}} để biết các từ khóa và ký hiệu có thể.
    Nếu không được chỉ định, giá trị của thuộc tính {{cssxref("color")}} được định nghĩa trong phần tử cha sẽ được sử dụng.

- `<length>`
  - : Chỉ định độ dài offset của bóng. Tham số này chấp nhận hai, ba, hoặc bốn giá trị. Giá trị thứ ba và thứ tư là tùy chọn. Chúng được hiểu như sau:
    - Nếu hai giá trị được chỉ định, chúng được hiểu là giá trị `<offset-x>` (độ dời ngang) và `<offset-y>` (độ dời dọc). Giá trị `<offset-x>` âm đặt bóng sang bên trái phần tử. Giá trị `<offset-y>` âm đặt bóng phía trên phần tử.\
      Nếu không được chỉ định, giá trị `0` sẽ được sử dụng cho độ dài còn thiếu. Nếu cả `<offset-x>` và `<offset-y>` đều được đặt thành `0`, bóng được đặt phía sau phần tử (và có thể tạo hiệu ứng làm mờ nếu `<blur-radius>` và/hoặc `<spread-radius>` được đặt).
    - Nếu ba giá trị được chỉ định, giá trị thứ ba được hiểu là `<blur-radius>`. Giá trị này càng lớn, độ mờ càng lớn, vì vậy bóng trở nên lớn hơn và sáng hơn. Giá trị âm không được phép. Nếu không được chỉ định, nó sẽ được đặt thành `0` (nghĩa là cạnh bóng sẽ sắc nét). Đặc tả không bao gồm một thuật toán chính xác về cách tính bán kính làm mờ; tuy nhiên, nó giải thích như sau:

      > ...đối với một cạnh bóng dài thẳng, điều này nên tạo ra một sự chuyển tiếp màu sắc theo chiều dài của khoảng cách làm mờ vuông góc và tập trung trên cạnh bóng, và dao động từ màu bóng đầy đủ tại điểm cuối bán kính bên trong bóng đến hoàn toàn trong suốt tại điểm cuối bên ngoài bóng.

    - Nếu bốn giá trị được chỉ định, giá trị thứ tư được hiểu là `<spread-radius>`. Các giá trị dương sẽ khiến bóng mở rộng và lớn hơn, các giá trị âm sẽ khiến bóng thu nhỏ lại. Nếu không được chỉ định, nó sẽ được đặt thành `0` (tức là bóng sẽ có cùng kích thước với phần tử).

- `inset` {{optional_inline}}
  - : Thay đổi bóng từ bóng hộp bên ngoài thành bóng hộp bên trong (như thể nội dung được nhấn vào hộp). Bóng nội tuyến được vẽ bên trong viền của hộp (ngay cả khi viền trong suốt), và chúng xuất hiện phía trên nền nhưng bên dưới nội dung. Theo mặc định, bóng hoạt động như một bóng đổ, tạo cảm giác hộp được nâng cao hơn nội dung của nó. Đây là hành vi mặc định khi `inset` không được chỉ định.

### Nội suy

Khi tạo hiệu ứng động cho các bóng, chẳng hạn khi nhiều giá trị bóng trên một hộp chuyển đổi sang các giá trị mới khi di chuột qua, các giá trị được nội suy. {{Glossary("Interpolation")}} xác định các giá trị trung gian của thuộc tính, chẳng hạn như bán kính làm mờ, bán kính lan rộng và màu sắc, khi các bóng chuyển đổi. Đối với mỗi bóng trong danh sách bóng, màu sắc, x, y, làm mờ và lan rộng được chuyển đổi; màu sắc như {{cssxref("&lt;color&gt;")}}, và các giá trị khác như {{cssxref("length")}}.

Khi nội suy nhiều bóng giữa hai danh sách phân cách bằng dấu phẩy của nhiều bóng hộp, các bóng được ghép đôi theo thứ tự, với nội suy xảy ra giữa các bóng được ghép đôi. Nếu danh sách các bóng có độ dài khác nhau, danh sách ngắn hơn được đệm ở cuối với các bóng có màu là `transparent` và X, Y và làm mờ là `0`, với `inset` hoặc không có `inset` được đặt để khớp. Nếu trong bất kỳ cặp bóng nào, một bóng có `inset` được đặt và bóng kia thì không, toàn bộ danh sách bóng sẽ không được nội suy; các bóng sẽ thay đổi sang các giá trị mới mà không có hiệu ứng hoạt hình.

## Mô tả

Thuộc tính `box-shadow` cho phép bạn đổ bóng từ khung của hầu hết bất kỳ phần tử nào. Nếu {{cssxref("border-radius")}} được chỉ định trên phần tử có bóng hộp, bóng hộp sẽ có các góc bo tròn tương tự. Thứ tự z của nhiều bóng hộp giống như nhiều [bóng văn bản](/en-US/docs/Web/CSS/Reference/Properties/text-shadow) (bóng được chỉ định đầu tiên ở trên cùng).

[Bộ tạo Box-shadow](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Box-shadow_generator) là một công cụ tương tác cho phép bạn tạo `box-shadow`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt ba bóng

Trong ví dụ này, chúng ta bao gồm ba bóng: một bóng nội tuyến, một bóng đổ thông thường, và một bóng 2px tạo hiệu ứng viền (chúng ta có thể đã sử dụng {{cssxref('outline')}} thay thế cho bóng thứ ba đó).

#### HTML

```html
<blockquote>
  <q>
    You may shoot me with your words,<br />
    You may cut me with your eyes,<br />
    You may kill me with your hatefulness,<br />
    But still, like air, I'll rise.
  </q>
  <p>&mdash; Maya Angelou</p>
</blockquote>
```

#### CSS

```css
blockquote {
  padding: 20px;
  box-shadow:
    inset 0 -3em 3em rgb(0 200 0 / 30%),
    0 0 0 2px white,
    0.3em 0.3em 1em rgb(200 0 0 / 60%);
}
```

#### Kết quả

{{EmbedLiveSample('Setting_three_shadows', '300', '300')}}

### Đặt offset và blur bằng không

Khi `x-offset`, `y-offset` và `blur` đều bằng không, bóng hộp sẽ là một đường viền màu đồng nhất có kích thước bằng nhau trên tất cả các cạnh. Các bóng được vẽ từ sau ra trước, vì vậy bóng đầu tiên nằm trên cùng so với các bóng tiếp theo. Khi `border-radius` được đặt thành 0 như mặc định, các góc của bóng sẽ là các góc vuông. Nếu chúng ta đặt `border-radius` với bất kỳ giá trị nào khác, các góc sẽ được bo tròn.

Chúng ta đã thêm một lề bằng kích thước của bóng hộp rộng nhất để đảm bảo bóng không chồng lên các phần tử liền kề hoặc vượt ra ngoài viền của hộp chứa. Bóng hộp không ảnh hưởng đến kích thước [mô hình hộp](/en-US/docs/Web/CSS/Guides/Box_model).

#### HTML

```html
<div><p>Hello World</p></div>
```

#### CSS

```css
p {
  box-shadow:
    0 0 0 2em #f4aab9,
    0 0 0 4em #66ccff;
  margin: 4em;
  padding: 1em;
}
```

<!-- these colors are intentionally pink and blue. WCAG requires color contrast between text and background, not between border colors. -->

#### Kết quả

{{EmbedLiveSample('Setting_zero_for_offset_and_blur', '300', '300')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("&lt;color&gt;")}}
- {{cssxref("text-shadow")}}
- {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
- [Introduction to text shadows](/en-US/docs/Web/CSS/Guides/Text_decoration/Text_shadows)
- [Applying color to HTML elements using CSS](/en-US/docs/Web/CSS/Guides/Colors/Applying_color)
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module
