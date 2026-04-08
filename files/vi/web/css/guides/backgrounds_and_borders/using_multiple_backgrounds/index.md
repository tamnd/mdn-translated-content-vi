---
title: Using multiple backgrounds
slug: Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds
page-type: guide
sidebar: cssref
---

Bạn có thể áp dụng **nhiều background** cho các phần tử. Chúng được xếp chồng lên nhau với background đầu tiên bạn cung cấp ở trên cùng và background cuối cùng được liệt kê ở phía sau. Chỉ background cuối cùng mới có thể bao gồm màu nền.

Nhiều background được chỉ định dưới dạng danh sách phân tách bằng dấu phẩy, chẳng hạn như `background: background1, background2, ...;`. Cú pháp này được chấp nhận bởi cả thuộc tính viết tắt {{cssxref("background")}} và các thuộc tính riêng lẻ của nó ngoại trừ {{cssxref("background-color")}}: {{cssxref("background-attachment")}}, {{cssxref("background-clip")}}, {{cssxref("background-image")}}, {{cssxref("background-origin")}}, {{cssxref("background-position")}}, {{cssxref("background-repeat")}}, {{cssxref("background-size")}}.

## Ví dụ

Trong ví dụ này, ba background được xếp chồng lên nhau: logo Firefox, một hình ảnh bong bóng, và một [linear gradient](/en-US/docs/Web/CSS/Reference/Values/gradient/linear-gradient):

### HTML

```html
<div class="multi-bg-example"></div>
```

### CSS

```css
.multi-bg-example {
  width: 100%;
  height: 400px;
  background-image:
    url("firefox.png"), url("bubbles.png"),
    linear-gradient(to right, rgb(30 75 115 / 100%), transparent);
  background-repeat: no-repeat, no-repeat, no-repeat;
  background-position:
    bottom right,
    left,
    right;
}
```

### Kết quả

{{EmbedLiveSample('Example','600','400')}}

Như bạn có thể thấy ở đây, logo Firefox (được liệt kê đầu tiên trong {{ cssxref("background-image") }}) nằm ở trên cùng, ngay phía trên hình ảnh bong bóng, tiếp theo là gradient (được liệt kê cuối cùng) nằm bên dưới tất cả các 'hình ảnh' trước đó. Mỗi thuộc tính con tiếp theo ({{ cssxref("background-repeat") }} và {{ cssxref("background-position") }}) áp dụng cho các background tương ứng. Vì vậy giá trị đầu tiên được liệt kê cho {{ cssxref("background-repeat") }} áp dụng cho background đầu tiên (ở phía trước nhất), và cứ như vậy.

## Lặp lại giá trị cho nhiều background

Khi sử dụng nhiều background, nếu một thuộc tính liên quan đến background được cung cấp ít giá trị phân tách bằng dấu phẩy hơn số lớp background, tác nhân người dùng sẽ lặp lại danh sách giá trị cho đến khi có đủ giá trị cho tất cả các lớp.

Ví dụ:

```css
.element {
  background-image: url(a.png), url(b.png), url(c.png);
  background-position: left top;
}
```

Điều này tương đương với:

```css
.element {
  background-position:
    left top,
    left top,
    left top;
}
```

## Xem thêm

- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module
- [Using CSS gradients](/en-US/docs/Web/CSS/Guides/Images/Using_gradients)
