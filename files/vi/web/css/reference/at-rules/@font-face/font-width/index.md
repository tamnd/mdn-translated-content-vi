---
title: font-width
slug: Web/CSS/Reference/At-rules/@font-face/font-width
page-type: css-at-rule-descriptor
status:
  - experimental
browser-compat: css.at-rules.font-face.font-width
sidebar: cssref
---

{{SeeCompatTable}}

> [!NOTE]
> Descriptor `font-width` là phiên bản hiện đại thay thế cho descriptor {{cssxref("@font-face/font-stretch")}}, là một alias kế thừa. Mặc dù `font-width` là tên được ưu tiên trong đặc tả, nhưng `font-stretch` hiện có hỗ trợ trình duyệt rộng hơn. Xem [ví dụ fallback](#providing_a_font-stretch_fallback) và bảng [tương thích trình duyệt](#browser_compatibility) để biết chi tiết.

Descriptor **`font-width`** trong [CSS](/en-US/docs/Web/CSS) cho phép tác giả chỉ định kiểu dáng bình thường, thu hẹp hoặc mở rộng cho các phông chữ được khai báo trong quy tắc at-rule {{cssxref("@font-face")}}.

Với một họ phông chữ cụ thể, tác giả có thể tải về các font face tương ứng với các kiểu dáng khác nhau của cùng họ phông chữ, rồi sử dụng descriptor `font-width` để chỉ định rõ ràng độ rộng của font face đó. Các giá trị descriptor `font-width` có sẵn giống với các giá trị của thuộc tính {{cssxref("font-width")}} tương ứng.

## Cú pháp

```css
/* Giá trị đơn */
font-width: ultra-condensed;
font-width: extra-condensed;
font-width: condensed;
font-width: semi-condensed;
font-width: normal;
font-width: semi-expanded;
font-width: expanded;
font-width: extra-expanded;
font-width: ultra-expanded;
font-width: 50%;
font-width: 100%;
font-width: 200%;

/* Nhiều giá trị */
font-width: 75% 125%;
font-width: condensed ultra-condensed;
```

Descriptor `font-width` có thể nhận một giá trị từ danh sách bên dưới.

### Giá trị

- `normal`
  - : Chỉ định font face có độ rộng bình thường.
- `semi-condensed`, `condensed`, `extra-condensed`, `ultra-condensed`
  - : Chỉ định font face thu hẹp hơn bình thường, trong đó ultra-condensed là thu hẹp nhất.
- `semi-expanded`, `expanded`, `extra-expanded`, `ultra-expanded`
  - : Chỉ định font face mở rộng hơn bình thường, trong đó ultra-expanded là mở rộng nhất.
- `<percentage>`
  - : Giá trị {{cssxref("&lt;percentage&gt;")}} từ 50% đến 200% (bao gồm cả hai đầu). Giá trị âm không được phép dùng cho descriptor này.

Trong các phiên bản trước của đặc tả `font-width`, descriptor chỉ chấp nhận chín giá trị từ khóa. CSS Fonts Level 4 mở rộng cú pháp để chấp nhận thêm giá trị `<percentage>`. Điều này cho phép variable font cung cấp sự biến đổi liên tục về độ rộng ký tự. Với TrueType hoặc OpenType variable font, biến thể `wdth` được dùng để thực hiện độ rộng thay đổi.

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

### Đặt dải phần trăm cho font-width

Ví dụ dưới đây sử dụng phông chữ [League Mono](https://www.theleagueofmoveabletype.com/league-mono). Nó tổng hợp các họ phông chữ khác nhau từ cùng một tệp phông chữ bằng cách sử dụng descriptor `font-width` với các từ khóa và phần trăm khác nhau.

```html
<p>League Mono</p>
<p>League Mono</p>
<p>League Mono</p>
```

```css
@font-face {
  font-family: "League Mono Ultra Condensed";
  src: url("/shared-assets/fonts/LeagueMono-VF.ttf") format("truetype");
  font-width: ultra-condensed; /* same as 50% */
}

@font-face {
  font-family: "League Mono Normal";
  src: url("/shared-assets/fonts/LeagueMono-VF.ttf") format("truetype");
  font-width: 100%; /* same as normal */
}

@font-face {
  font-family: "League Mono Ultra Expanded";
  src: url("/shared-assets/fonts/LeagueMono-VF.ttf") format("truetype");
  font-width: ultra-expanded; /* same as 200% */
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

{{EmbedLiveSample("Setting font width percentages", "100%", 200)}}

### Cung cấp fallback font-stretch

Vì `font-width` chưa được hỗ trợ rộng rãi trên trình duyệt, bạn có thể muốn bao gồm descriptor {{cssxref("@font-face/font-stretch")}} kế thừa làm fallback. Đặt `font-stretch` trước `font-width` để các trình duyệt hỗ trợ sử dụng descriptor hiện đại:

```css
@font-face {
  font-family: "MyFont";
  src: url("my-font.woff2") format("woff2");
  font-stretch: condensed; /* for browsers that don't support font-width */
  font-width: condensed;
}
```

> [!NOTE]
> Bạn có thể tự động hóa mẫu fallback này bằng plugin [postcss-preset-env](https://preset-env.cssdb.org/) cho PostCSS, bao gồm biến đổi [postcss-font-width-property](https://github.com/csstools/postcss-plugins/tree/main/plugins/postcss-font-width-property) để chuyển đổi khai báo `font-width` thành `font-stretch` tự động.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Descriptor alias kế thừa {{cssxref("@font-face/font-stretch")}} với hỗ trợ trình duyệt tốt hơn
- Descriptor {{cssxref("@font-face/font-display", "font-display")}}
- Descriptor {{cssxref("@font-face/font-family", "font-family")}}
- Descriptor {{cssxref("@font-face/font-weight", "font-weight")}}
- Descriptor {{cssxref("@font-face/font-style", "font-style")}}
- Thuộc tính {{cssxref("font-feature-settings", "font-feature-settings")}}
- Descriptor {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
- Descriptor {{cssxref("@font-face/src", "src")}}
- Descriptor {{cssxref("@font-face/unicode-range", "unicode-range")}}
