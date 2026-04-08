---
title: border-radius
slug: Web/CSS/Reference/Properties/border-radius
page-type: css-shorthand-property
browser-compat: css.properties.border-radius
sidebar: cssref
---

Thuộc tính **`border-radius`** trong [CSS](/en-US/docs/Web/CSS) bo tròn các góc của đường viền ngoài của một phần tử. Bạn có thể đặt một bán kính duy nhất để tạo góc tròn hình tròn, hoặc hai bán kính để tạo góc tròn hình elip.

{{InteractiveExample("CSS Demo: border-radius")}}

```css interactive-example-choice
border-radius: 30px;
```

```css interactive-example-choice
border-radius: 25% 10%;
```

```css interactive-example-choice
border-radius: 10% 30% 50% 70%;
```

```css interactive-example-choice
border-radius: 10% / 50%;
```

```css interactive-example-choice
border-radius: 10px 100px / 120px;
```

```css interactive-example-choice
border-radius: 50% 20% / 10% 40%;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with rounded corners.
  </div>
</section>
```

```css interactive-example
#example-element {
  width: 80%;
  height: 80%;
  display: flex;
  justify-content: center;
  flex-direction: column;
  background-color: #5b6dcd;
  color: white;
  padding: 10px;
}
```

## Thuộc tính thành phần

Thuộc tính này là dạng viết tắt cho các thuộc tính CSS sau:

- {{cssxref("border-top-left-radius")}}
- {{cssxref("border-top-right-radius")}}
- {{cssxref("border-bottom-right-radius")}}
- {{cssxref("border-bottom-left-radius")}}

## Cú pháp

```css
/* Cú pháp của bán kính thứ nhất cho phép một đến bốn giá trị */
/* Bán kính được đặt cho cả 4 cạnh */
border-radius: 10px;

/* top-left-and-bottom-right | top-right-and-bottom-left */
border-radius: 10px 5%;

/* top-left | top-right-and-bottom-left | bottom-right */
border-radius: 2px 4px 2px;

/* top-left | top-right | bottom-right | bottom-left */
border-radius: 1px 0 3px 4px;

/* Cú pháp của bán kính thứ hai cho phép một đến bốn giá trị */
/* (các giá trị bán kính thứ nhất) / radius */
border-radius: 10px / 20px;

/* (các giá trị bán kính thứ nhất) / top-left-and-bottom-right | top-right-and-bottom-left */
border-radius: 10px 5% / 20px 30px;

/* (các giá trị bán kính thứ nhất) / top-left | top-right-and-bottom-left | bottom-right */
border-radius: 10px 5px 2em / 20px 25px 30%;

/* (các giá trị bán kính thứ nhất) / top-left | top-right | bottom-right | bottom-left */
border-radius: 10px 5% / 20px 25em 30px 35em;

/* Giá trị toàn cục */
border-radius: inherit;
border-radius: initial;
border-radius: revert;
border-radius: revert-layer;
border-radius: unset;
```

Thuộc tính `border-radius` được chỉ định bằng:

- một, hai, ba, hoặc bốn giá trị {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Được dùng để đặt một bán kính duy nhất cho các góc.
- tùy chọn theo sau bởi "/" và một, hai, ba, hoặc bốn giá trị `<length>` hoặc `<percentage>`. Được dùng để đặt thêm một bán kính, tạo góc tròn hình elip.

### Giá trị

<table>
  <tbody>
    <tr>
      <td><em>radius</em></td>
      <td><img alt="A light blue rectangle with a light gray border. All 4 corners are rounded." src="all-corner.png" /></td>
      <td>
        Là giá trị {{cssxref("&lt;length&gt;")}} hoặc
        {{cssxref("&lt;percentage&gt;")}} biểu thị bán kính dùng
        cho đường viền ở mỗi góc. Chỉ dùng trong cú pháp một giá trị.
      </td>
    </tr>
    <tr>
      <td><em>top-left-and-bottom-right</em></td>
      <td>
        <img alt="A light blue rectangle with a light gray border. The 2 corners on the top left and the bottom right have are rounded." src="top-left-bottom-right.png" />
      </td>
      <td>
        Là giá trị {{cssxref("&lt;length&gt;")}} hoặc
        {{cssxref("&lt;percentage&gt;")}} biểu thị bán kính dùng
        cho đường viền ở góc trên-trái và góc dưới-phải của hộp phần tử.
        Chỉ dùng trong cú pháp hai giá trị.
      </td>
    </tr>
    <tr>
      <td><em>top-right-and-bottom-left</em></td>
      <td>
        <img alt="A light blue rectangle with a light gray border. The 2 corners on the top right and the bottom left are rounded." src="top-right-bottom-left.png" />
      </td>
      <td>
        Là giá trị {{cssxref("&lt;length&gt;")}} hoặc
        {{cssxref("&lt;percentage&gt;")}} biểu thị bán kính dùng
        cho đường viền ở góc trên-phải và góc dưới-trái của hộp phần tử.
        Chỉ dùng trong cú pháp hai và ba giá trị.
      </td>
    </tr>
    <tr>
      <td><em>top-left</em></td>
      <td><img alt="A light blue rectangle with a light gray border. The corner on the top left is rounded." src="top-left.png" /></td>
      <td>
        Là giá trị {{cssxref("&lt;length&gt;")}} hoặc
        {{cssxref("&lt;percentage&gt;")}} biểu thị bán kính dùng
        cho đường viền ở góc trên-trái của hộp phần tử. Chỉ dùng trong
        cú pháp ba và bốn giá trị.
      </td>
    </tr>
    <tr>
      <td><em>top-right</em></td>
      <td><img alt="A light blue rectangle with a light gray border. The corner on the top right is rounded." src="top-right.png" /></td>
      <td>
        Là giá trị {{cssxref("&lt;length&gt;")}} hoặc
        {{cssxref("&lt;percentage&gt;")}} biểu thị bán kính dùng
        cho đường viền ở góc trên-phải của hộp phần tử. Chỉ dùng trong
        cú pháp bốn giá trị.
      </td>
    </tr>
    <tr>
      <td><em>bottom-right</em></td>
      <td><img alt="A light blue rectangle with a light gray border. The bottom right corner is rounded." src="bottom-right.png" /></td>
      <td>
        Là giá trị {{cssxref("&lt;length&gt;")}} hoặc
        {{cssxref("&lt;percentage&gt;")}} biểu thị bán kính dùng
        cho đường viền ở góc dưới-phải của hộp phần tử. Chỉ dùng trong
        cú pháp ba và bốn giá trị.
      </td>
    </tr>
    <tr>
      <td><em>bottom-left</em></td>
      <td><img alt="A light blue rectangle with a light gray border. The bottom left corner is rounded." src="bottom-left.png" /></td>
      <td>
        Là giá trị {{cssxref("&lt;length&gt;")}} hoặc
        {{cssxref("&lt;percentage&gt;")}} biểu thị bán kính dùng
        cho đường viền ở góc dưới-trái của hộp phần tử. Chỉ dùng trong
        cú pháp bốn giá trị.
      </td>
    </tr>
  </tbody>
</table>

- {{cssxref("&lt;length&gt;")}}
  - : Biểu thị kích thước của bán kính đường tròn, hoặc trục bán trục lớn và bán trục nhỏ của elip, bằng giá trị độ dài. Giá trị âm không hợp lệ.
- {{cssxref("&lt;percentage&gt;")}}
  - : Biểu thị kích thước của bán kính đường tròn, hoặc trục bán trục lớn và bán trục nhỏ của elip, bằng giá trị phần trăm. Phần trăm cho trục ngang tham chiếu đến chiều rộng của hộp; phần trăm cho trục dọc tham chiếu đến chiều cao của hộp. Giá trị âm không hợp lệ.

Ví dụ:

```css
border-radius: 1em / 5em;

/* Tương đương: */
border-top-left-radius: 1em 5em;
border-top-right-radius: 1em 5em;
border-bottom-right-radius: 1em 5em;
border-bottom-left-radius: 1em 5em;
```

```css
border-radius: 4px 3px 6px / 2px 4px;

/* Tương đương: */
border-top-left-radius: 4px 2px;
border-top-right-radius: 3px 4px;
border-bottom-right-radius: 6px 2px;
border-bottom-left-radius: 3px 4px;
```

## Mô tả

Bán kính áp dụng cho toàn bộ {{cssxref("background")}}, ngay cả khi phần tử không có đường viền; vị trí cắt chính xác được xác định bởi thuộc tính {{cssxref("background-clip")}}.

Thuộc tính `border-radius` không áp dụng cho các phần tử bảng khi {{cssxref("border-collapse")}} là `collapse`.

> [!NOTE]
> Như với bất kỳ thuộc tính viết tắt nào, các thuộc tính con riêng lẻ không thể kế thừa, chẳng hạn trong `border-radius:0 0 inherit inherit`, điều này sẽ ghi đè một phần các định nghĩa hiện có. Thay vào đó, phải sử dụng các thuộc tính dài riêng lẻ.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### So sánh các kiểu đường viền

Ví dụ dưới đây có bảy phần tử {{htmlelement("pre")}}, mỗi phần tử minh họa các kết hợp kiểu `border` và `border-radius`.
Các kiểu áp dụng cho mỗi phần tử `<pre>` được đưa vào nội dung của phần tử, để bạn có thể thấy các khai báo CSS cần thiết để tạo kiểu đường viền tương ứng:

```html hidden
<pre id="example-1">
  border: solid 10px;
  border-radius: 10px 40px 40px 10px;
</pre>

<pre id="example-2">
  border: groove 1em red;
  border-radius: 2em;
</pre>

<pre id="example-3">
  background: gold;
  border: ridge gold;
  border-radius: 13em / 3em;
</pre>

<pre id="example-4">
  border: none;
  border-radius: 40px 10px;
  background: gold;
</pre>

<pre id="example-5">
  border: none;
  border-radius: 50%;
  background: burlywood;
</pre>

<pre id="example-6">
  border: dotted;
  border-width: 10px 4px;
  border-radius: 10px 40px;
</pre>

<pre id="example-7">
  border: dashed;
  border-width: 2px 4px;
  border-radius: 40px;
</pre>
```

```css hidden
pre {
  margin: 20px;
  padding: 20px;
  width: 80%;
  height: 50px;
}

pre#example-1 {
  border: solid 10px;
  border-radius: 10px 40px 40px 10px;
}

pre#example-2 {
  border: groove 1em red;
  border-radius: 2em;
}

pre#example-3 {
  background: gold;
  border: ridge gold;
  border-radius: 13em / 3em;
}

pre#example-4 {
  border: none;
  border-radius: 40px 10px;
  background: gold;
}

pre#example-5 {
  border: none;
  border-radius: 50%;
  background: burlywood;
}

pre#example-6 {
  border: dotted;
  border-width: 10px 4px;
  border-radius: 10px 40px;
}

pre#example-7 {
  border: dashed;
  border-width: 2px 4px;
  border-radius: 40px;
}
```

{{EmbedLiveSample("Comparing border styles", "", "900")}}

### Sử dụng `corner-shape` cùng với `border-radius`

Khi giá trị `border-radius` khác `0` được áp dụng cho một góc của hộp, bạn có thể sử dụng thuộc tính {{cssxref("corner-shape")}} (hoặc một trong các [dạng dài và viết tắt của nó](/en-US/docs/Web/CSS/Reference/Properties/corner-shape#corner--shape_shorthands_and_longhands)) để áp dụng các hình dạng tùy chỉnh cho góc đó, chẳng hạn như vát cạnh, khía, hoặc squircle. Ví dụ này minh họa cách dùng `corner-shape`.

#### HTML

Đánh dấu cho ví dụ này chứa một phần tử {{htmlelement("div")}} duy nhất.

```html live-sample___basic-usage
<div></div>
```

#### CSS

Chúng tôi đặt một số kiểu cơ bản cho hộp, đã ẩn để ngắn gọn. Chúng tôi cũng áp dụng {{cssxref("box-shadow")}}, `border-radius` là `0 20% 50px 30%`, và `corner-shape` là `superellipse(0.5) bevel notch squircle`.

```css hidden live-sample___basic-usage
body {
  font-family: "Helvetica", "Arial", sans-serif;
  width: 240px;
  margin: 20px auto;
}

div {
  width: 100%;
  height: 180px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: green;
  background-image: linear-gradient(
    to bottom,
    rgb(255 255 255 / 0),
    rgb(255 255 255 / 0.5)
  );
}
```

```css live-sample___basic-usage
div {
  box-shadow: 1px 1px 3px gray;
  border-radius: 0 20% 50px 30%;
  corner-shape: superellipse(0.5) bevel notch squircle;
}
```

#### Kết quả

Kết quả hiển thị trông như thế này:

{{EmbedLiveSample("basic-usage", "100%", "240")}}

Lưu ý rằng không có hình dạng góc nào được áp dụng cho góc trên-trái, vì nó có giá trị `border-radius` là `0`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan đến border-radius: {{cssxref("border-top-left-radius")}}, {{cssxref("border-top-right-radius")}}, {{cssxref("border-bottom-right-radius")}}, {{cssxref("border-bottom-left-radius")}}, {{cssxref("border-start-start-radius")}}, {{cssxref("border-start-end-radius")}}, {{cssxref("border-end-start-radius")}}, {{cssxref("border-end-end-radius")}}
