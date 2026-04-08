---
title: Implementing image sprites in CSS
short-title: Implementing image sprites
slug: Web/CSS/Guides/Images/Implementing_image_sprites
page-type: guide
sidebar: cssref
---

**Image sprite** được sử dụng trong nhiều ứng dụng web nơi có nhiều image được sử dụng. Thay vì bao gồm mỗi image là một file image riêng biệt, việc gửi chúng như một image duy nhất tiết kiệm bộ nhớ và băng thông hơn; sử dụng background position như một cách để phân biệt giữa các image riêng lẻ trong cùng một file image, nhờ đó số lượng yêu cầu HTTP được giảm xuống.

> [!NOTE]
> Khi sử dụng HTTP/2, việc sử dụng nhiều yêu cầu nhỏ thực tế có thể thân thiện với băng thông hơn.

## Triển khai

Giả sử một image được cung cấp cho mọi phần tử có class `tool-btn`:

```css
.tool-btn {
  background: url("myfile.png");
  display: inline-block;
  height: 20px;
  width: 20px;
}
```

Một background position có thể được thêm dưới dạng hai giá trị x, y sau {{cssxref("url_value", "&lt;url&gt;")}} trong background, hoặc dưới dạng {{cssxref("background-position")}}. Ví dụ:

```css
#btn1 {
  background-position: -20px 0px;
}

#btn2 {
  background-position: -40px 0px;
}
```

Điều này sẽ trượt điểm bắt đầu của background image cho phần tử có ID `btn1` sang trái 20 pixel và phần tử có ID `btn2` sang trái 40 pixel (giả sử chúng có class `tool-btn` được gán và chịu ảnh hưởng của quy tắc image ở trên).

Tương tự, bạn cũng có thể tạo trạng thái hover bằng cách nhắm mục tiêu `#btn:hover`.

## Xem thêm

- [Full working demo at CSS Tricks](https://css-tricks.com/snippets/css/perfect-css-sprite-sliding-doors-button/)
