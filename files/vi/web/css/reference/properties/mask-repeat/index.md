---
title: mask-repeat
slug: Web/CSS/Reference/Properties/mask-repeat
page-type: css-property
browser-compat: css.properties.mask-repeat
sidebar: cssref
---

Thuộc tính **`mask-repeat`** trong [CSS](/en-US/docs/Web/CSS) đặt cách các ảnh mặt nạ được lặp lại. Ảnh mặt nạ có thể được lặp lại theo trục ngang, trục dọc, cả hai trục, hoặc không lặp lại.

## Cú pháp

```css
/* Cú pháp một giá trị */
mask-repeat: repeat-x;
mask-repeat: repeat-y;
mask-repeat: repeat;
mask-repeat: space;
mask-repeat: round;
mask-repeat: no-repeat;

/* Cú pháp hai giá trị: ngang | dọc */
mask-repeat: repeat space;
mask-repeat: repeat repeat;
mask-repeat: round space;
mask-repeat: no-repeat round;

/* Nhiều giá trị */
mask-repeat:
  space round,
  no-repeat;
mask-repeat:
  round repeat,
  space,
  repeat-x;

/* Giá trị toàn cục */
mask-repeat: inherit;
mask-repeat: initial;
mask-repeat: revert;
mask-repeat: revert-layer;
mask-repeat: unset;
```

### Giá trị

Thuộc tính `mask-repeat` là danh sách phân cách bằng dấu phẩy gồm hai giá trị `<repeat-style>`, với giá trị `<repeat-style>` đầu tiên là giá trị lặp lại theo chiều ngang và giá trị thứ hai là giá trị lặp lại theo chiều dọc, hoặc một giá trị từ khóa là viết tắt của hai giá trị `<repeat-style>`.

#### Các giá trị `<repeat-style>`

Các giá trị `<repeat-style>` bao gồm:

- `repeat`
  - : Ảnh được lặp lại nhiều lần cần thiết để bao phủ toàn bộ vùng vẽ mặt nạ. Các ảnh mặt nạ ở các cạnh sẽ bị cắt khi kích thước của [hộp gốc mặt nạ](/en-US/docs/Web/CSS/Reference/Properties/mask-origin) không phải là bội số chính xác của kích thước ảnh mặt nạ.

- `space`
  - : Ảnh mặt nạ được lặp lại nhiều lần nhất có thể mà không bị cắt. Nếu kích thước gốc của phần tử ít nhất gấp đôi kích thước ảnh mặt nạ trong chiều liên quan, thuộc tính {{cssxref("mask-position")}} bị bỏ qua và ảnh đầu tiên và cuối cùng được đặt ở các cạnh của hộp chứa gốc mặt nạ. Nếu hộp gốc mặt nạ không phải là bội số chính xác của kích thước ảnh mặt nạ, khoảng trắng được phân bổ đều giữa các ảnh mặt nạ được lặp lại.

    Nếu kích thước hộp gốc nhỏ hơn gấp đôi kích thước ảnh mặt nạ trong chiều đã cho, chỉ có thể hiển thị một ảnh mặt nạ. Trong trường hợp này, ảnh được định vị theo thuộc tính `mask-position`, mặc định là `0% 0%`. Ảnh mặt nạ chỉ bị cắt nếu ảnh mặt nạ lớn hơn hộp gốc mặt nạ.

- `round`
  - : Ảnh mặt nạ được lặp lại nhiều lần nhất có thể với kích thước gốc của nó. Nếu kích thước hộp gốc mặt nạ không phải là bội số chính xác của kích thước ảnh mặt nạ, tất cả các ảnh mặt nạ sẽ được thay đổi kích thước, [thu nhỏ hoặc kéo dài](#rounded_repetitions) để đảm bảo không có lần lặp nào bị cắt.

- `no-repeat`
  - : Ảnh mặt nạ không được lặp lại (và do đó vùng vẽ mặt nạ không nhất thiết phải được bao phủ hoàn toàn). Vị trí của ảnh mặt nạ không lặp lại được xác định bởi thuộc tính {{cssxref("mask-position")}} CSS.

#### Giá trị viết tắt

Cú pháp một giá trị là viết tắt cho cú pháp đầy đủ hai giá trị:

<table class="standard-table">
  <thead>
    <tr>
      <th>Giá trị đơn</th>
      <th>Tương đương hai giá trị</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>repeat-x</code></td>
      <td><code>repeat no-repeat</code></td>
    </tr>
    <tr>
      <td><code>repeat-y</code></td>
      <td><code>no-repeat repeat</code></td>
    </tr>
    <tr>
      <td><code>repeat</code></td>
      <td><code>repeat repeat</code></td>
    </tr>
    <tr>
      <td><code>space</code></td>
      <td><code>space space</code></td>
    </tr>
    <tr>
      <td><code>round</code></td>
      <td><code>round round</code></td>
    </tr>
    <tr>
      <td><code>no-repeat</code></td>
      <td><code>no-repeat no-repeat</code></td>
    </tr>
  </tbody>
</table>

- `repeat-x`
  - : Tương đương với `repeat no-repeat`. Ảnh được lặp lại theo chiều ngang nhiều lần cần thiết để bao phủ chiều rộng của vùng vẽ mặt nạ. Các ảnh mặt nạ ở cạnh phải hoặc trái, hoặc cả hai tùy thuộc vào giá trị {{cssxref("mask-position")}}, sẽ bị cắt nếu chiều rộng hộp gốc mặt nạ không phải là bội số chính xác của chiều rộng ảnh mặt nạ.

- `repeat-y`
  - : Tương đương với `no-repeat repeat`. Ảnh được lặp lại theo chiều dọc nhiều lần cần thiết để bao phủ chiều cao của vùng vẽ mặt nạ. Các ảnh mặt nạ ở cạnh trên hoặc dưới, hoặc cả hai tùy thuộc vào giá trị {{cssxref("mask-position")}}, sẽ bị cắt nếu chiều cao hộp gốc mặt nạ không phải là bội số chính xác của chiều cao ảnh mặt nạ.

## Mô tả

Thuộc tính `mask-repeat` nhận một cặp giá trị phân cách bằng dấu phẩy hoặc một [giá trị viết tắt](#shorthand_values). Trong cú pháp hai giá trị, giá trị đầu tiên biểu thị hành vi lặp lại theo chiều ngang và giá trị thứ hai biểu thị hành vi theo chiều dọc.

### Nhiều giá trị

Mỗi giá trị `mask-repeat` trong danh sách phân cách bằng dấu phẩy này được áp dụng cho một lớp mặt nạ riêng biệt. Một phần tử có thể có nhiều lớp mặt nạ được áp dụng. Số lượng lớp được xác định bởi số lượng giá trị phân cách bằng dấu phẩy trong giá trị thuộc tính {{cssxref("mask-image")}} (ngay cả khi giá trị là `none`). Mỗi giá trị `mask-repeat` được ghép với các giá trị `mask-image`, theo thứ tự. Nếu số lượng giá trị trong hai thuộc tính khác nhau, bất kỳ giá trị dư của `mask-repeat` nào đều bị bỏ qua, hoặc nếu `mask-repeat` có ít giá trị hơn `mask-image`, các giá trị `mask-repeat` được lặp lại.

### Kích thước và định vị

Giá trị thuộc tính `mask-repeat` xác định cách các ảnh mặt nạ được xếp gạch sau khi chúng đã được [điều chỉnh kích thước](/en-US/docs/Web/CSS/Reference/Properties/mask-size) và [định vị](/en-US/docs/Web/CSS/Reference/Properties/mask-position). Lần lặp lại ảnh mặt nạ đầu tiên (và có thể là duy nhất) được định vị bởi thuộc tính {{cssxref("mask-position")}}, mặc định là `0% 0%`, góc trên bên trái của hộp gốc. Kích thước được xác định bởi thuộc tính {{cssxref("mask-size")}}, mặc định là `auto`. Vị trí của các mặt nạ lặp lại dựa trên phiên bản mặt nạ ban đầu này.

### Cắt xén

Các ảnh mặt nạ sẽ không lặp lại nhưng sẽ bị cắt nếu kích thước ảnh mặt nạ lớn hơn hộp gốc, ngoại trừ trường hợp `round`, trong đó một mặt nạ duy nhất sẽ được thu nhỏ để vừa với hộp gốc.

Với các giá trị `repeat`, ảnh mặt nạ có thể bị cắt ở cạnh hộp gốc nếu kích thước (chiều rộng hoặc chiều cao) của hộp không phải là bội số chính xác của kích thước mặt nạ.

### Tỷ lệ khung hình

Theo mặc định, các ảnh mặt nạ duy trì tỷ lệ khung hình được đặt bởi thuộc tính {{cssxref("mask-size")}} hoặc tỷ lệ khung hình mặc định của chúng nếu `mask-size` mặc định hoặc được đặt rõ ràng là `auto`. Chỉ trong trường hợp giá trị `round` ở cả hai chiều, tỷ lệ khung hình mặt nạ mới có thể bị biến dạng.

Nếu `round` được đặt ở cả hai chiều, các ảnh mặt nạ lặp lại kết quả sẽ khớp với tỷ lệ khung hình của hộp gốc. Khi các ảnh mặt nạ được thay đổi kích thước để vừa, chúng có thể bị biến dạng, đảm bảo các ảnh mặt nạ không bị cắt. Nếu `round` chỉ được đặt ở một chiều, tỷ lệ khung hình của kích thước mặt nạ được tôn trọng.

### Lặp lại làm tròn

Trong trường hợp `round`, các ảnh mặt nạ được phóng to hoặc thu nhỏ để vừa với ảnh mặt nạ trong vùng định vị một số lần nguyên. Kích thước mặt nạ tăng hoặc giảm để vừa với số tự nhiên gần nhất hoặc số mặt nạ, với tối thiểu là một mặt nạ.

Kích thước hiển thị của mặt nạ là kích thước hộp gốc chia cho số lần lặp của mặt nạ trong chiều đó, trong đó số lần lặp là một số nguyên lớn hơn không. Số lần lặp là: `X' = D / round(D / X)` trong đó `D` là chiều rộng hoặc chiều cao, và `round()` là hàm trả về số nguyên gần nhất lớn hơn không.

Ví dụ, nếu `mask-repeat` được đặt thành `round` và `mask-size` đặt mặt nạ rộng `40px`, khi hộp gốc có mặt (rộng hơn `0px`) nhưng nhỏ hơn `60px`, sẽ có một lần lặp chiếm 100% chiều rộng của hộp đó. Nếu hộp rộng ít nhất `60px` nhưng nhỏ hơn `100px`, sẽ có hai lần lặp mỗi lần chiếm `50%` của hộp. Từ 100px đến 140px, ba mặt nạ sẽ vừa theo trục ngang. Các mặt nạ "`40px`-rộng" này chỉ rộng `40px` nếu hộp gốc là bội số chính xác của `40px`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa việc đặt thuộc tính `mask-repeat` cho một mặt nạ đơn.

#### HTML

HTML của chúng ta bao gồm một phần tử {{htmlelement("div")}} cơ bản:

```html
<div></div>
```

#### CSS

Chúng ta xác định một hình vuông `250px` với gradient từ đỏ sang xanh với ngôi sao `100px` x `100px` làm ảnh mặt nạ. Chúng ta sử dụng thuộc tính `mask-repeat`, đặt `round` cho chiều ngang và `space` cho giá trị dọc.

```css
div {
  width: 250px;
  height: 250px;
  background-image: linear-gradient(red, blue);

  mask-image: url("/shared-assets/images/examples/mask-star.svg");
  mask-size: 100px 100px;

  mask-repeat: round space;
}
```

#### Kết quả

{{EmbedLiveSample("basic usage", "", "300px")}}

Với `space` và `round` trên ảnh mặt nạ nhỏ hơn hộp gốc, mặt nạ không bị cắt. Thay vào đó, giá trị `round` làm méo ngôi sao để ngăn việc cắt và ngăn khoảng trắng, trong khi `space` duy trì tỷ lệ khung hình của ngôi sao, nhưng thêm khoảng cách cần thiết giữa các mặt nạ.

### Lặp lại làm tròn

Sử dụng cùng HTML và CSS, minh họa này bao gồm thanh trượt thay đổi chiều rộng của hộp chứa để hiển thị cách, với `round`, các mặt nạ sẽ tăng trưởng khi không gian cho phép cho đến khi có thể vừa một lần lặp khác của mặt nạ, hoặc thu nhỏ cho đến khi số lần lặp không còn vừa nữa.

```html hidden
<div></div>
<label
  >width: <span></span><br />
  <input type="range" min="0" max="400" value="250" id="width" />
</label>
```

```css hidden
div {
  width: 250px;
  height: 250px;
  background-image: linear-gradient(red, blue);

  mask-image: url("/shared-assets/images/examples/mask-star.svg");
  mask-size: 100px 100px;

  mask-repeat: round space;
}
input {
  clear: both;
  width: 90%;
}
```

```js hidden
const div = document.querySelector("div");
const range = document.getElementById("width");
const output = document.querySelector("span");

range.addEventListener("change", () => {
  const value = `${range.value}px`;
  output.innerText = value;
  div.style.width = value;
});
```

{{EmbedLiveSample("round iterations", "", "300px")}}

Mặt nạ được xác định là rộng `100px`. Có một ngôi sao duy nhất khi hộp gốc từ `1px` đến `149px` rộng, hai ngôi sao từ `150px` đến `249px`, ba ngôi sao từ `250px` đến `349px`, và tiếp tục.

### Các giá trị viết tắt

Ví dụ này minh họa tất cả các giá trị viết tắt (từ khóa đơn) của `mask-repeat`.

#### HTML

Chúng ta bao gồm một số phần tử {{htmlelement("section")}} mỗi phần tử chứa một `<div>`, mỗi phần tử có tên lớp khác nhau.

```html
<section class="repeat">
  <div></div>
</section>
<section class="space">
  <div></div>
</section>
<section class="round">
  <div></div>
</section>
<section class="no-repeat">
  <div></div>
</section>
<section class="repeat-x">
  <div></div>
</section>
<section class="repeat-y">
  <div></div>
</section>
```

#### CSS

Chúng ta cung cấp cho mỗi `<div>` cùng CSS, ngoại trừ giá trị `mask-repeat`, mà chúng ta khớp với tên lớp của phần tử cha. Chúng ta xác định kích thước mặt nạ, đặt `mask-image` ban đầu ở dưới cùng bên phải, có nghĩa là bất kỳ việc cắt nào sẽ xảy ra trên các mặt nạ ở trên cùng và bên trái nhất, ở cạnh trên và trái của chúng.

```css
div {
  width: 180px;
  height: 180px;
  background-image: linear-gradient(red, blue);

  mask-image: url("/shared-assets/images/examples/mask-star.svg");

  mask-size: 50px 50px;
  mask-position: bottom right;
}

.repeat div {
  mask-repeat: repeat;
}
.space div {
  mask-repeat: space;
}
.round div {
  mask-repeat: round;
}
.no-repeat div {
  mask-repeat: no-repeat;
}
.repeat-x div {
  mask-repeat: repeat-x;
}
.repeat-y div {
  mask-repeat: repeat-y;
}
```

Chúng ta hiển thị tên lớp bằng nội dung được tạo ra.

```css
section::before {
  content: attr(class);
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

{{EmbedLiveSample("The shorthand values", "", "450px")}}

Ngôi sao mặt nạ đầu tiên (và trong trường hợp `no-repeat`, duy nhất) được [điều chỉnh kích thước](/en-US/docs/Web/CSS/Reference/Properties/mask-size) là 50px x 50px, và [định vị](/en-US/docs/Web/CSS/Reference/Properties/mask-position) ở góc dưới bên phải của vùng vẽ, với các ngôi sao lặp lại được đặt phía trên và/hoặc bên trái của nó với bất kỳ việc cắt nào xảy ra ở trên và bên trái của các ngôi sao ở trên cùng và bên trái nhất. Lưu ý rằng tất cả các ngôi sao đều có cùng kích thước và hình dạng, ngoại trừ `round`, trong đó tất cả các mặt nạ thu nhỏ xuống 45px x 45px để vừa bốn mặt nạ hoàn chỉnh theo mỗi chiều.

### Nhiều ảnh mặt nạ và lặp lại

Bạn có thể chỉ định một `<repeat-style>` khác nhau cho mỗi ảnh mặt nạ, được phân cách bằng dấu phẩy:

```css
.extra-repeats {
  mask-image: url("mask1.png"), url("mask2.png");
  mask-repeat: repeat-x, repeat-y, space;
}
```

Mỗi ảnh được ghép với kiểu lặp lại tương ứng. Vì có nhiều giá trị `mask-repeat` hơn giá trị `mask-image`, các giá trị `mask-repeat` dư bị bỏ qua.

```css
.missing-repeats {
  mask-image:
    url("mask1.png"), url("mask2.png"), url("mask3.png"), url("mask4.png");
  mask-repeat: repeat-x, repeat-y;
}
```

Mỗi ảnh được ghép với kiểu lặp lại tương ứng. Vì có nhiều giá trị `mask-image` hơn giá trị `mask-repeat`, `mask-repeat` được lặp lại cho đến khi mỗi `mask-image` có một giá trị `mask-repeat` liên quan. Ở đây, các mặt nạ số lẻ lặp lại theo trục x, trong khi các mặt nạ số chẵn lặp lại theo trục y.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("background-repeat")}}
- {{cssxref("mask-border-repeat")}}
- [Introduction to CSS masking](/en-US/docs/Web/CSS/Guides/Masking/Introduction)
- [CSS `mask` properties](/en-US/docs/Web/CSS/Guides/Masking/Mask_properties)
- [Declaring multiple masks](/en-US/docs/Web/CSS/Guides/Masking/Multiple_masks)
- [CSS masking](/en-US/docs/Web/CSS/Guides/Masking) module
