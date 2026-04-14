---
title: "<marquee>: Phần tử Marquee"
slug: Web/HTML/Reference/Elements/marquee
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.marquee
sidebar: htmlsidebar
---

{{Deprecated_Header}}

Phần tử **`<marquee>`** trong [HTML](/vi/docs/Web/HTML) được sử dụng để chèn một vùng văn bản cuộn. Bạn có thể kiểm soát những gì xảy ra khi văn bản đến các cạnh của vùng nội dung bằng cách sử dụng các thuộc tính của nó.

Phần tử HTML `<marquee>` đã bị deprecated và việc sử dụng nó rất không được khuyến khích. Nếu bạn phải tạo hiệu ứng văn bản cuộn hoặc các phần tử liên tục, hãy cân nhắc sử dụng [CSS animations](/vi/docs/Web/CSS/Guides/Animations) với [CSS transforms](/vi/docs/Web/CSS/Guides/Transforms/Using) thay vì phần tử `<marquee>` để tạo hiệu ứng nội dung mượt mà. Ngoài ra, hãy bao gồm truy vấn CSS {{cssxref("@media/prefers-reduced-motion")}} {{cssxref("@media")}} để dừng hoạt ảnh dựa trên tùy chọn của người dùng, từ đó cải thiện trải nghiệm người dùng và khả năng tiếp cận.

## Thuộc tính

- `behavior` {{Deprecated_Inline}}
  - : Đặt cách cuộn văn bản trong marquee. Các giá trị có thể là `scroll`, `slide` và `alternate`. Nếu không chỉ định giá trị, giá trị mặc định là `scroll`.
- `bgcolor` {{Deprecated_Inline}}
  - : Đặt màu nền thông qua tên màu hoặc giá trị thập lục phân.
- `direction` {{Deprecated_Inline}}
  - : Đặt hướng cuộn trong marquee. Các giá trị có thể là `left`, `right`, `up` và `down`. Nếu không chỉ định giá trị, giá trị mặc định là `left`.
- `height` {{Deprecated_Inline}}
  - : Đặt chiều cao tính bằng pixel hoặc giá trị phần trăm.
- `hspace` {{Deprecated_Inline}}
  - : Đặt lề ngang.
- `loop` {{Deprecated_Inline}}
  - : Đặt số lần marquee sẽ cuộn. Nếu không chỉ định giá trị, giá trị mặc định là −1, có nghĩa là marquee sẽ cuộn liên tục.
- `scrollamount` {{Deprecated_Inline}}
  - : Đặt lượng cuộn tại mỗi khoảng thời gian tính bằng pixel. Giá trị mặc định là 6.
- `scrolldelay` {{Deprecated_Inline}}
  - : Đặt khoảng thời gian giữa mỗi lần di chuyển cuộn tính bằng mili giây. Giá trị mặc định là 85. Lưu ý rằng bất kỳ giá trị nào nhỏ hơn 60 đều bị bỏ qua và giá trị 60 được sử dụng thay thế trừ khi `truespeed` được chỉ định.
- `truespeed` {{Deprecated_Inline}}
  - : Theo mặc định, các giá trị `scrolldelay` nhỏ hơn 60 bị bỏ qua. Nếu `truespeed` hiện diện, các giá trị đó sẽ không bị bỏ qua.
- `vspace` {{Deprecated_Inline}}
  - : Đặt lề dọc tính bằng pixel hoặc giá trị phần trăm.
- `width` {{Deprecated_Inline}}
  - : Đặt chiều rộng tính bằng pixel hoặc giá trị phần trăm.

## Ví dụ

```html
<marquee>This text will scroll from right to left</marquee>

<marquee direction="up">This text will scroll from bottom to top</marquee>

<marquee
  direction="down"
  width="250"
  height="200"
  behavior="alternate"
  class="outlined">
  <marquee behavior="alternate">This text will bounce</marquee>
</marquee>
```

```css
.outlined {
  border: solid;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 600, 450)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{DOMxRef("HTMLMarqueeElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("transform")}}
- Thuộc tính CSS {{cssxref("translate")}}
- Module [CSS transforms](/vi/docs/Web/CSS/Guides/Transforms)
- Module [CSS animations](/vi/docs/Web/CSS/Guides/Animations)
- {{DOMxRef("HTMLMarqueeElement")}}
