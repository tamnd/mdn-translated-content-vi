---
title: font-size
slug: Web/CSS/Reference/Properties/font-size
page-type: css-property
browser-compat: css.properties.font-size
sidebar: cssref
---

Thuộc tính **`font-size`** [CSS](/en-US/docs/Web/CSS) thiết lập kích thước của phông chữ. Thay đổi kích thước phông chữ cũng cập nhật kích thước của các đơn vị {{cssxref("&lt;length&gt;")}} tương đối theo kích thước phông chữ như `em`, `ex`, v.v.

{{InteractiveExample("CSS Demo: font-size")}}

```css interactive-example-choice
font-size: 1.2rem;
```

```css interactive-example-choice
font-size: x-small;
```

```css interactive-example-choice
font-size: smaller;
```

```css interactive-example-choice
font-size: 12px;
```

```css interactive-example-choice
font-size: 80%;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    London. Michaelmas term lately over, and the Lord Chancellor sitting in
    Lincoln's Inn Hall. Implacable November weather. As much mud in the streets
    as if the waters had but newly retired from the face of the earth, and it
    would not be wonderful to meet a Megalosaurus, forty feet long or so,
    waddling like an elephantine lizard up Holborn Hill.
  </p>
</section>
```

## Cú pháp

```css
/* Giá trị <absolute-size> */
font-size: xx-small;
font-size: x-small;
font-size: small;
font-size: medium;
font-size: large;
font-size: x-large;
font-size: xx-large;
font-size: xxx-large;

/* Giá trị <relative-size> */
font-size: smaller;
font-size: larger;

/* Giá trị <length> */
font-size: 12px;
font-size: 0.8em;

/* Giá trị <percentage> */
font-size: 80%;

/* Giá trị math */
font-size: math;

/* Giá trị toàn cục */
font-size: inherit;
font-size: initial;
font-size: revert;
font-size: revert-layer;
font-size: unset;
```

### Giá trị

- `xx-small`, `x-small`, `small`, `medium`, `large`, `x-large`, `xx-large`, `xxx-large`
  - : Từ khóa [kích thước tuyệt đối](/en-US/docs/Web/CSS/Reference/Values/absolute-size), dựa trên kích thước phông chữ mặc định của người dùng (thường là `medium`).

- `larger`, `smaller`
  - : Từ khóa [kích thước tương đối](/en-US/docs/Web/CSS/Reference/Values/relative-size). Phông chữ sẽ lớn hơn hoặc nhỏ hơn so với kích thước phông chữ của phần tử cha, xấp xỉ theo tỷ lệ được dùng để phân tách các từ khóa kích thước tuyệt đối ở trên.

- {{cssxref("&lt;length&gt;")}}
  - : Giá trị {{cssxref("&lt;length&gt;")}} dương. Đối với hầu hết các đơn vị tương đối theo phông chữ (như `em` và `ex`), kích thước phông chữ là tương đối so với kích thước phông chữ của phần tử cha.

    Đối với các đơn vị tương đối theo phông chữ gốc (như `rem`), kích thước phông chữ là tương đối so với kích thước phông chữ được sử dụng bởi phần tử {{HTMLElement("html")}} (gốc).

- {{cssxref("&lt;percentage&gt;")}}
  - : Giá trị {{cssxref("&lt;percentage&gt;")}} dương, tương đối so với kích thước phông chữ của phần tử cha.
    > [!NOTE]
    > Để tối đa hóa khả năng tiếp cận, nói chung tốt nhất nên sử dụng các giá trị tương đối với kích thước phông chữ mặc định của người dùng.

- `math`
  - : [Quy tắc tỷ lệ](https://w3c.github.io/mathml-core/#the-math-script-level-property) được áp dụng khi xác định giá trị tính toán của thuộc tính `font-size` cho các phần tử toán học so với `font-size` của phần tử cha chứa nó.
    Xem thuộc tính [math-depth](/en-US/docs/Web/CSS/Reference/Properties/math-depth) để biết thêm thông tin.

## Mô tả

Có nhiều cách để chỉ định kích thước phông chữ, bao gồm từ khóa hoặc giá trị số cho pixel hoặc em. Chọn phương pháp phù hợp dựa trên nhu cầu của trang web cụ thể.

### Từ khóa

Từ khóa là cách tốt để thiết lập kích thước phông chữ trên web. Bằng cách đặt kích thước phông chữ từ khóa trên phần tử {{HTMLElement("body")}}, bạn có thể thiết lập kích thước phông chữ tương đối ở mọi nơi khác trên trang, giúp bạn dễ dàng phóng to hoặc thu nhỏ phông chữ trên toàn bộ trang theo đó.

### Pixel

Đặt kích thước phông chữ theo giá trị pixel (`px`) là lựa chọn tốt khi bạn cần độ chính xác pixel. Giá trị px là tĩnh. Đây là cách độc lập với hệ điều hành và trình duyệt để nói với trình duyệt hiển thị các chữ cái chính xác ở số pixel chiều cao mà bạn đã chỉ định. Kết quả có thể hơi khác nhau giữa các trình duyệt vì chúng có thể sử dụng các thuật toán khác nhau để đạt được hiệu ứng tương tự.

Cài đặt kích thước phông chữ cũng có thể được sử dụng kết hợp. Ví dụ, nếu phần tử cha được đặt thành `16px` và phần tử con của nó được đặt thành `larger`, phần tử con sẽ hiển thị lớn hơn phần tử cha trên trang.

> [!NOTE]
> Định nghĩa kích thước phông chữ bằng `px` _[không có khả năng tiếp cận](https://en.wikipedia.org/wiki/Web_accessibility)_, vì người dùng không thể thay đổi kích thước phông chữ trong một số trình duyệt. Ví dụ, người dùng có thị lực kém có thể muốn đặt kích thước phông chữ lớn hơn nhiều so với kích thước được nhà thiết kế web chọn. Tránh sử dụng chúng cho kích thước phông chữ nếu bạn muốn tạo thiết kế bao trùm.

### Ems

Sử dụng giá trị `em` tạo ra kích thước phông chữ động hoặc được tính toán (về mặt lịch sử, đơn vị `em` được dẫn xuất từ chiều rộng của chữ hoa "M" trong một kiểu chữ nhất định). Giá trị số hoạt động như hệ số nhân của thuộc tính `font-size` của phần tử được sử dụng. Hãy xem ví dụ này:

```css
p {
  font-size: 2em;
}
```

Trong trường hợp này, kích thước phông chữ của các phần tử `<p>` sẽ gấp đôi kích thước `font-size` được kế thừa bởi các phần tử `<p>`. Theo đó, `font-size` là `1em` bằng kích thước `font-size` được tính toán của phần tử nó được sử dụng.

Nếu `font-size` chưa được đặt trên bất kỳ tổ tiên nào của `<p>`, thì `1em` sẽ bằng kích thước `font-size` mặc định của trình duyệt, thường là `16px`. Vì vậy, theo mặc định `1em` tương đương với `16px`, và `2em` tương đương với `32px`. Nếu bạn đặt `font-size` là `20px` trên phần tử `<body>`, thì `1em` trên các phần tử `<p>` sẽ tương đương với `20px`, và `2em` sẽ tương đương với `40px`.

Để tính giá trị `em` tương đương cho bất kỳ giá trị pixel nào cần thiết, bạn có thể sử dụng công thức này:

```plain
em = giá trị pixel của phần tử mong muốn / kích thước phông chữ phần tử cha tính bằng pixel
```

Ví dụ, giả sử `font-size` của `<body>` của trang được đặt thành `16px`. Nếu kích thước phông chữ bạn muốn là `12px`, thì bạn nên chỉ định `0.75em` (vì 12/16 = 0.75). Tương tự, nếu bạn muốn kích thước phông chữ là `10px`, thì chỉ định `0.625em` (10/16 = 0.625); cho `22px`, chỉ định `1.375em` (22/16).

Đơn vị `em` rất hữu ích trong CSS vì nó tự động điều chỉnh độ dài của nó tương đối với phông chữ mà người đọc chọn sử dụng.

Một thực tế quan trọng cần ghi nhớ: giá trị em tích lũy. Hãy xem HTML và CSS sau:

```css
html {
  font-size: 100%;
}
span {
  font-size: 1.6em;
}
```

```html
<div>
  <span>Outer <span>inner</span> outer</span>
</div>
```

Kết quả là:

{{EmbedLiveSample("Ems", 400, 100)}}

Giả sử kích thước `font-size` mặc định của trình duyệt là 16px, các từ "outer" sẽ được hiển thị ở 25.6px, nhưng từ "inner" sẽ được hiển thị ở 40.96px. Điều này xảy ra vì `font-size` của {{HTMLElement("span")}} bên trong là 1.6em, tương đối so với `font-size` của cha nó, lần lượt tương đối so với `font-size` của cha nó. Điều này thường được gọi là **tích lũy**.

### Rems

Giá trị `rem` được phát minh để tránh vấn đề tích lũy. Giá trị `rem` tương đối so với phần tử gốc `html`, không phải phần tử cha. Nói cách khác, nó cho phép bạn chỉ định kích thước phông chữ theo cách tương đối mà không bị ảnh hưởng bởi kích thước của phần tử cha, do đó loại bỏ tích lũy.

CSS bên dưới gần như giống với ví dụ trước. Ngoại lệ duy nhất là đơn vị đã được thay đổi thành `rem`.

```css
html {
  font-size: 100%;
}
span {
  font-size: 1.6rem;
}
```

Sau đó chúng ta áp dụng CSS này cho cùng HTML, trông như thế này:

```html
<span>Outer <span>inner</span> outer</span>
```

{{EmbedLiveSample("Rems", 400, 100)}}

Trong ví dụ này, các từ "outer inner outer" đều được hiển thị ở 25.6px (giả sử `font-size` của trình duyệt vẫn ở giá trị mặc định là 16px).

### Ex

Giống như đơn vị `em`, `font-size` của một phần tử được đặt bằng đơn vị `ex` được tính toán hoặc động. Nó hoạt động theo cách hoàn toàn giống nhau, ngoại trừ khi đặt thuộc tính `font-size` bằng đơn vị `ex`, `font-size` bằng chiều cao x của [phông chữ khả dụng đầu tiên](https://drafts.csswg.org/css-fonts/#first-available-font) được sử dụng trên trang. Giá trị số nhân với kích thước `font-size` được kế thừa của phần tử và `font-size` tích lũy tương đối.

Xem Dự thảo Editor W3C để biết mô tả chi tiết hơn về [các đơn vị độ dài tương đối theo phông chữ](https://drafts.csswg.org/css-values-4/#font-relative-length) như `ex`.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt kích thước phông chữ

#### CSS

```css
.small {
  font-size: xx-small;
}
.larger {
  font-size: larger;
}
.point {
  font-size: 24pt;
}
.percent {
  font-size: 200%;
}
```

#### HTML

```html
<h1 class="small">Small H1</h1>
<h1 class="larger">Larger H1</h1>
<h1 class="point">24 point H1</h1>
<h1 class="percent">200% H1</h1>
```

#### Kết quả

{{EmbedLiveSample('Setting_font_sizes', 600, 250)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-size-adjust")}}
- {{cssxref("font-style")}}
- {{cssxref("font-weight")}}
- {{cssxref("math-depth")}}
- {{cssxref("math-style")}}
- Thuộc tính SVG {{SVGAttr("font-size")}}
- [Học: Kiểu dáng văn bản và phông chữ cơ bản](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals)
