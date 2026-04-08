---
title: font-stretch
slug: Web/CSS/Reference/At-rules/@font-face/font-stretch
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-face.font-stretch
sidebar: cssref
---

> [!NOTE]
> Descriptor `font-stretch` đã được đổi tên thành {{cssxref("@font-face/font-width")}} trong [đặc tả CSS Fonts](https://drafts.csswg.org/css-fonts/#font-stretch-desc). Để duy trì khả năng tương thích, đặc tả vẫn giữ `font-stretch` như một alias kế thừa cho descriptor `font-width`.

Descriptor **`font-stretch`** trong [CSS](/en-US/docs/Web/CSS) cho phép tác giả chỉ định kiểu dáng bình thường, thu hẹp hoặc mở rộng cho các phông chữ được khai báo trong quy tắc at-rule {{cssxref("@font-face")}}.

Với một họ phông chữ cụ thể, tác giả có thể tải về các font face tương ứng với các kiểu dáng khác nhau của cùng họ phông chữ, rồi sử dụng descriptor `font-stretch` để chỉ định rõ ràng độ co giãn của font face đó.

## Cú pháp

```css
/* Giá trị đơn */
font-stretch: ultra-condensed;
font-stretch: extra-condensed;
font-stretch: condensed;
font-stretch: semi-condensed;
font-stretch: normal;
font-stretch: semi-expanded;
font-stretch: expanded;
font-stretch: extra-expanded;
font-stretch: ultra-expanded;
font-stretch: 50%;
font-stretch: 100%;
font-stretch: 200%;

/* Nhiều giá trị */
font-stretch: 75% 125%;
font-stretch: condensed ultra-condensed;
```

Descriptor `font-stretch` có thể nhận một giá trị từ danh sách bên dưới.

### Giá trị

- `normal`
  - : Chỉ định font face có độ rộng bình thường.
- `semi-condensed`, `condensed`, `extra-condensed`, `ultra-condensed`
  - : Chỉ định font face thu hẹp hơn bình thường, trong đó ultra-condensed là thu hẹp nhất.
- `semi-expanded`, `expanded`, `extra-expanded`, `ultra-expanded`
  - : Chỉ định font face mở rộng hơn bình thường, trong đó ultra-expanded là mở rộng nhất.
- `<percentage>`
  - : Giá trị {{cssxref("&lt;percentage&gt;")}} từ 50% đến 200% (bao gồm cả hai đầu). Giá trị âm không được phép dùng cho descriptor này.

Trong các phiên bản trước của đặc tả `font-stretch`, descriptor chỉ chấp nhận chín giá trị từ khóa. CSS Fonts Level 4 mở rộng cú pháp để chấp nhận thêm giá trị `<percentage>`. Điều này cho phép variable font cung cấp sự biến đổi liên tục về độ rộng ký tự. Với TrueType hoặc OpenType variable font, biến thể `wdth` được dùng để thực hiện độ rộng thay đổi.

Nếu phông chữ không cung cấp font face khớp chính xác với giá trị đã cho, các giá trị nhỏ hơn `100%` sẽ ánh xạ sang font face thu hẹp, còn các giá trị lớn hơn hoặc bằng `100%` sẽ ánh xạ sang font face mở rộng.

### Ánh xạ từ khóa sang số

Bảng dưới đây cho thấy sự ánh xạ giữa các giá trị từ khóa và phần trăm số:

<table class="fullwidth-table standard-table">
  <thead>
    <tr>
      <th scope="col">Từ khóa</th>
      <th scope="col">Phần trăm</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>ultra-condensed</code></td>
      <td>50%</td>
    </tr>
    <tr>
      <td><code>extra-condensed</code></td>
      <td>62.5%</td>
    </tr>
    <tr>
      <td><code>condensed</code></td>
      <td>75%</td>
    </tr>
    <tr>
      <td><code>semi-condensed</code></td>
      <td>87.5%</td>
    </tr>
    <tr>
      <td><code>normal</code></td>
      <td>100%</td>
    </tr>
    <tr>
      <td><code>semi-expanded</code></td>
      <td>112.5%</td>
    </tr>
    <tr>
      <td><code>expanded</code></td>
      <td>125%</td>
    </tr>
    <tr>
      <td><code>extra-expanded</code></td>
      <td>150%</td>
    </tr>
    <tr>
      <td><code>ultra-expanded</code></td>
      <td>200%</td>
    </tr>
  </tbody>
</table>

### Variable font

Hầu hết các phông chữ có một độ rộng cụ thể tương ứng với một trong các giá trị từ khóa. Tuy nhiên, variable font có thể hỗ trợ một dải độ rộng với độ chi tiết cao, cho phép nhà thiết kế kiểm soát tốt hơn độ rộng được chọn. Vì vậy, dải phần trăm rất hữu ích.

Với TrueType hoặc OpenType variable font, biến thể `wdth` được dùng để thực hiện độ rộng glyph thay đổi.

## Khả năng tiếp cận

Người mắc chứng khó đọc và các vấn đề nhận thức khác có thể gặp khó khăn khi đọc phông chữ quá thu hẹp, đặc biệt nếu phông chữ có [tỷ lệ tương phản màu thấp](/en-US/docs/Web/CSS/Reference/Properties/color#accessibility).

- [MDN Giải thích WCAG, Hướng dẫn 1.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Hiểu Tiêu chí Thành công 1.4.8 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-visual-presentation.html)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{CSSSyntax("font-width")}}

## Ví dụ

### Đặt dải phần trăm cho font-stretch

Ví dụ dưới đây sử dụng phông chữ [League Mono](https://www.theleagueofmoveabletype.com/league-mono). Nó tổng hợp các họ phông chữ khác nhau từ cùng một tệp phông chữ bằng cách sử dụng descriptor `font-stretch` với các từ khóa và phần trăm khác nhau.

```html
<p>League Mono</p>
<p>League Mono</p>
<p>League Mono</p>
```

```css
@font-face {
  font-family: "League Mono Ultra Condensed";
  src: url("/shared-assets/fonts/LeagueMono-VF.ttf") format("truetype");
  font-stretch: ultra-condensed; /* same as 50% */
}

@font-face {
  font-family: "League Mono Normal";
  src: url("/shared-assets/fonts/LeagueMono-VF.ttf") format("truetype");
  font-stretch: 100%; /* same as normal */
}

@font-face {
  font-family: "League Mono Ultra Expanded";
  src: url("/shared-assets/fonts/LeagueMono-VF.ttf") format("truetype");
  font-stretch: ultra-expanded; /* same as 200% */
}

p:nth-child(1) {
  font-family: "League Mono Ultra Condensed", sans-serif;
}

p:nth-child(2) {
  font-family: "League Mono Normal", sans-serif;
}

p:nth-child(3) {
  font-family: "League Mono Ultra Expanded", sans-serif;
}
```

{{EmbedLiveSample("Setting font stretch percentages", "100%", 200)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Descriptor hiện đại {{cssxref("@font-face/font-width")}}, thay thế `font-stretch`
- Descriptor {{cssxref("@font-face/font-display")}}
- Descriptor {{cssxref("@font-face/font-family")}}
- Descriptor {{cssxref("@font-face/font-weight")}}
- Descriptor {{cssxref("@font-face/font-style")}}
- Descriptor {{cssxref("font-feature-settings")}}
- Descriptor {{cssxref("@font-face/font-variation-settings")}}
- Descriptor {{cssxref("@font-face/src")}}
- Descriptor {{cssxref("@font-face/unicode-range", "unicode-range")}}
