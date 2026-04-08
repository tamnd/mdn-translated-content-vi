---
title: box-sizing
slug: Web/CSS/Reference/Properties/box-sizing
page-type: css-property
browser-compat: css.properties.box-sizing
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`box-sizing`** đặt cách tính tổng chiều rộng và chiều cao của một phần tử.

{{InteractiveExample("CSS Demo: box-sizing")}}

```css interactive-example-choice
box-sizing: content-box;
width: 100%;
```

```css interactive-example-choice
box-sizing: content-box;
width: 100%;
border: solid #5b6dcd 10px;
padding: 5px;
```

```css interactive-example-choice
box-sizing: border-box;
width: 100%;
border: solid #5b6dcd 10px;
padding: 5px;
```

```html interactive-example
<section id="default-example">
  <div id="example-element-parent">
    <p>Parent container</p>
    <div class="transition-all" id="example-element">
      <p>Child container</p>
    </div>
  </div>
</section>
```

```css interactive-example
#example-element-parent {
  width: 220px;
  height: 200px;
  border: solid 10px #ffc129;
  margin: 0.8em;
}

#example-element {
  height: 60px;
  margin: 2em auto;
  background-color: rgb(81 81 81 / 0.6);
}

#example-element > p {
  margin: 0;
}
```

## Cú pháp

```css
box-sizing: border-box;
box-sizing: content-box;

/* Global values */
box-sizing: inherit;
box-sizing: initial;
box-sizing: revert;
box-sizing: revert-layer;
box-sizing: unset;
```

Thuộc tính `box-sizing` được chỉ định là một từ khóa duy nhất được chọn từ danh sách các giá trị bên dưới.

### Giá trị

- `content-box`
  - : Đây là giá trị ban đầu và mặc định theo tiêu chuẩn CSS. Các thuộc tính {{Cssxref("width")}} và {{Cssxref("height")}} bao gồm nội dung, nhưng không bao gồm padding, border hay margin. Ví dụ, `.box {width: 350px; border: 10px solid black;}` hiển thị một hộp rộng 370px.

    Ở đây, kích thước của phần tử được tính như: _width = chiều rộng của nội dung_, và _height = chiều cao của nội dung_. (Border và padding không được tính vào phép tính.)

- `border-box`
  - : Các thuộc tính {{Cssxref("width")}} và {{Cssxref("height")}} bao gồm nội dung, padding và border, nhưng không bao gồm margin. Lưu ý rằng padding và border sẽ nằm bên trong hộp. Ví dụ, `.box {width: 350px; border: 10px solid black;}` hiển thị một hộp rộng 350px, với diện tích dành cho nội dung là 330px. Hộp nội dung không thể âm và được làm tròn về 0, khiến không thể sử dụng `border-box` để làm phần tử biến mất.

    Ở đây, kích thước của phần tử được tính như: _width = border + padding + chiều rộng của nội dung_, và _height = border + padding + chiều cao của nội dung_.

## Mô tả

Theo mặc định trong [mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model/Introduction), `width` và `height` bạn gán cho một phần tử chỉ được áp dụng cho hộp nội dung của phần tử. Nếu phần tử có bất kỳ border hay padding nào, chúng sẽ được cộng thêm vào `width` và `height` để tính kích thước hộp được hiển thị trên màn hình. Điều này có nghĩa là khi bạn đặt `width` và `height`, bạn phải điều chỉnh giá trị để tính đến bất kỳ border hay padding nào có thể được thêm vào. Ví dụ, nếu bạn có bốn hộp với `width: 25%;`, nếu bất kỳ hộp nào có padding trái hoặc phải hoặc border trái hoặc phải, chúng mặc định sẽ không vừa trên một dòng trong giới hạn của container cha.

Thuộc tính `box-sizing` có thể được sử dụng để điều chỉnh hành vi này:

- `content-box` cho bạn hành vi sizing hộp CSS mặc định. Nếu bạn đặt chiều rộng của phần tử thành 100 pixel, thì hộp nội dung của phần tử sẽ rộng 100 pixel, và chiều rộng của bất kỳ border hay padding nào sẽ được cộng vào chiều rộng hiển thị cuối cùng, khiến phần tử rộng hơn 100px.
- `border-box` yêu cầu trình duyệt tính toán bất kỳ border và padding nào trong các giá trị bạn chỉ định cho chiều rộng và chiều cao của phần tử. Nếu bạn đặt chiều rộng của phần tử thành 100 pixel, 100 pixel đó sẽ bao gồm bất kỳ border hay padding nào bạn đã thêm, và hộp nội dung sẽ thu nhỏ lại để hấp thụ chiều rộng thêm đó. Điều này thường giúp dễ dàng định kích thước các phần tử hơn nhiều.

  `box-sizing: border-box` là kiểu dáng mặc định mà trình duyệt sử dụng cho các phần tử {{htmlelement("table")}}, {{htmlelement("select")}} và {{htmlelement("button")}}, cũng như cho các phần tử {{htmlelement("input")}} có type là `{{htmlelement("input/radio", "radio")}}`, `{{htmlelement("input/checkbox", "checkbox")}}`, `{{htmlelement("input/reset", "reset")}}`, `{{htmlelement("input/button", "button")}}`, `{{htmlelement("input/submit", "submit")}}`, `{{htmlelement("input/color", "color")}}` hay `{{htmlelement("input/search", "search")}}`.

> [!NOTE]
> Thường hữu ích khi đặt `box-sizing` thành `border-box` để bố trí các phần tử. Điều này giúp việc xử lý kích thước của các phần tử dễ dàng hơn nhiều, và thường loại bỏ một số vấn đề bạn có thể gặp phải khi bố trí nội dung. Mặt khác, khi sử dụng `position: relative` hoặc `position: absolute`, việc sử dụng `box-sizing: content-box` cho phép các giá trị vị trí là tương đối so với nội dung và độc lập với các thay đổi về kích thước border và padding, đôi khi điều này là mong muốn.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Kích thước hộp với content-box và border-box

Ví dụ này cho thấy cách các giá trị `box-sizing` khác nhau thay đổi kích thước hiển thị của hai phần tử giống hệt nhau.

#### HTML

```html
<div class="content-box">Content box</div>
<br />
<div class="border-box">Border box</div>
```

#### CSS

```css
div {
  width: 160px;
  height: 80px;
  padding: 20px;
  border: 8px solid red;
  background: yellow;
}

.content-box {
  box-sizing: content-box;
  /* Total width: 160px + (2 * 20px) + (2 * 8px) = 216px
     Total height: 80px + (2 * 20px) + (2 * 8px) = 136px
     Content box width: 160px
     Content box height: 80px */
}

.border-box {
  box-sizing: border-box;
  /* Total width: 160px
     Total height: 80px
     Content box width: 160px - (2 * 20px) - (2 * 8px) = 104px
     Content box height: 80px - (2 * 20px) - (2 * 8px) = 24px */
}
```

#### Kết quả

{{EmbedLiveSample('Box_sizes_with_content-box_and_border-box', 'auto', 300)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
