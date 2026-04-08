---
title: font-weight
slug: Web/CSS/Reference/At-rules/@font-face/font-weight
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-face.font-weight
sidebar: cssref
---

Descriptor **`font-weight`** trong [CSS](/en-US/docs/Web/CSS) thuộc {{cssxref("@font-face")}} cho phép tác giả chỉ định một độ đậm phông chữ đơn lẻ, hoặc một dải độ đậm phông chữ, cho phông chữ được khai báo trong quy tắc at-rule {{cssxref("@font-face")}}. Sau đó, trình duyệt sẽ sử dụng thông tin này để chọn phông chữ phù hợp khi một quy tắc CSS đặt [độ đậm phông chữ](/en-US/docs/Web/CSS/Reference/Properties/font-weight) mong muốn.

Thông thường, một nhà phát triển muốn sử dụng các phông chữ từ một họ phông chữ duy nhất với nhiều độ đậm khác nhau. Với phông chữ truyền thống, hay còn gọi là phông chữ _tĩnh_, một tệp phông chữ chứa các ký tự từ một họ phông chữ với độ đậm và kiểu dáng cụ thể: ví dụ, "Helvetica bold italic". Để hiển thị phông chữ nhẹ, thường, đậm, hoặc đậm hơn khi thuộc tính `font-weight` yêu cầu một độ đậm cụ thể, bạn có thể định nghĩa nhiều quy tắc at-rule {{cssxref("@font-face")}} cho cùng một họ (tất cả có cùng giá trị descriptor {{cssxref("@font-face/font-family", "font-family")}}), mỗi quy tắc cho một độ đậm hoặc dải độ đậm.

Để khai báo phông chữ được sử dụng cho một dải độ đậm, hãy khai báo một cặp giá trị font-weight phân cách bằng dấu cách làm giá trị cho descriptor `font-weight`. Khi các quy tắc CSS đặt độ đậm phông chữ thông qua thuộc tính {{cssxref("font-weight")}} hoặc thuộc tính viết tắt {{cssxref("font")}}, phông chữ phù hợp sẽ được sử dụng.

Ví dụ, nếu descriptor là `font-weight: 400 600;`, khi thuộc tính là `font-weight: 450` hoặc `font-weight: 550`, phông chữ đó sẽ được dùng cho họ phông chữ này. Dù phông chữ là tĩnh hay [variable font](/en-US/docs/Web/CSS/Guides/Fonts/Variable_fonts), phông chữ khớp với dải sẽ được sử dụng. Trong trường hợp này, nếu phông chữ là tĩnh, `450` và `550` sẽ trông giống nhau. Nếu phông chữ là variable font, phông chữ sau sẽ đậm hơn.

Descriptor này giống nhau cho mọi phông chữ, nhưng dải bạn đặt cho variable font thường sẽ lớn hơn, thậm chí có thể là `1 1000` để sử dụng cùng một phông chữ cho mọi giá trị thuộc tính font-weight.

## Cú pháp

```css
/* Giá trị đơn */
font-weight: normal;
font-weight: bold;
font-weight: 400;

/* Định nghĩa dải */
font-weight: normal bold;
font-weight: 300 500;
```

### Giá trị

Descriptor `font-weight` nhận một trong các dạng sau:

- Từ khóa `auto`.
- Một giá trị `<font-weight-absolute>` đơn lẻ.
- Một cặp giá trị `<font-weight-absolute>`, phân cách bằng dấu cách.

Mỗi `<font-weight-absolute>` có thể là một trong các giá trị sau:

- `normal`
  - : Độ đậm phông chữ bình thường. Tương đương với `400`.
- `bold`
  - : Độ đậm phông chữ đậm. Tương đương với `700`.
- `<number>`
  - : Giá trị {{cssxref("&lt;number&gt;")}} từ 1 đến 1000 (bao gồm cả hai đầu). Số lớn hơn đại diện cho độ đậm lớn hơn (hoặc bằng) số nhỏ hơn. Một số giá trị thường dùng tương ứng với các tên độ đậm thông thường, như được mô tả trong phần [Ánh xạ tên độ đậm thông thường](#common_weight_name_mapping) bên dưới.

### Ánh xạ tên độ đậm thông thường

Các giá trị số từ `100` đến `900` tương ứng gần đúng với các tên độ đậm thông thường sau:

| Giá trị | Tên độ đậm thông thường   |
| ------- | ------------------------- |
| 100     | Thin (Hairline)           |
| 200     | Extra Light (Ultra Light) |
| 300     | Light                     |
| 400     | Normal                    |
| 500     | Medium                    |
| 600     | Semi Bold (Demi Bold)     |
| 700     | Bold                      |
| 800     | Extra Bold (Ultra Bold)   |
| 900     | Black (Heavy)             |

### Variable font

Hầu hết phông chữ có một độ đậm cụ thể tương ứng với một trong các số trong [Ánh xạ tên độ đậm thông thường](#common_weight_name_mapping). Tuy nhiên, một số phông chữ gọi là variable font có thể hỗ trợ một dải độ đậm với độ chi tiết cao hơn hoặc ít hơn, và điều này có thể cho nhà thiết kế mức độ kiểm soát tốt hơn về độ đậm được chọn.

Với TrueType hoặc OpenType variable font, biến thể "wght" được dùng để thực hiện độ đậm thay đổi.

## Khả năng tiếp cận

Những người gặp vấn đề về thị lực thấp có thể gặp khó khăn khi đọc văn bản được đặt với giá trị `font-weight` là `100` (Thin/Hairline) hoặc `200` (Extra Light), đặc biệt nếu phông chữ có [tỷ lệ màu tương phản thấp](/en-US/docs/Web/CSS/Reference/Properties/color#accessibility).

- [MDN Giải thích WCAG, Hướng dẫn 1.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Hiểu Tiêu chí Thành công 1.4.8 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-visual-presentation.html)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chọn phông chữ bình thường và đậm

Trong ví dụ này, chúng ta bao gồm hai phông chữ, một phông chữ có độ đậm bình thường và một có độ đậm đậm, từ họ phông chữ ["Fira Sans"](https://fonts.google.com/specimen/Fira+Sans) bằng cách sử dụng hai quy tắc at-rule `@font-face`. Chúng ta đặt các descriptor `font-weight` để khớp với độ đậm của phông chữ.

Sau đó, các quy tắc CSS có thể chọn phông chữ bình thường hoặc đậm cho họ "Fira Sans" chỉ bằng cách đặt thuộc tính {{cssxref("font-weight")}}. Lưu ý rằng phần tử HTML {{htmlelement("strong")}} cũng chọn phông chữ đậm, vì mặc định các phần tử `<strong>` có giá trị thuộc tính CSS `font-weight` là `bold`.

#### HTML

```html
<p class="one">Fira Sans, `normal` weight paragraph</p>
<p class="two">Fira Sans, `bold` weight paragraph</p>
<p><strong>Fira Sans, &lt;strong&gt; element (`bold`)</strong></p>
```

#### CSS

```css
@font-face {
  font-family: "Fira Sans";
  font-weight: normal;
  src: url("https://mdn.github.io/shared-assets/fonts/FiraSans-Regular.woff2");
}

@font-face {
  font-family: "Fira Sans";
  font-weight: bold;
  src: url("https://mdn.github.io/shared-assets/fonts/FiraSans-Bold.woff2");
}

body {
  font-family: "Fira Sans", serif;
  font-size: 2rem;
}

p.one {
  font-weight: normal;
}

p.two {
  font-weight: bold;
}
```

#### Kết quả

{{embedlivesample("Selecting normal and bold fonts", "", 300)}}

### Đặt dải font-weight

Ví dụ này minh họa cách tác giả có thể bao gồm nhiều phông chữ cho nhiều độ đậm (và kiểu dáng), bằng cách bao gồm nhiều khai báo `@font-face` với cùng giá trị `font-family`. Bằng cách đặt các descriptor `font-weight` sử dụng dải từ 1 đến 1000, trong phần còn lại của stylesheet, bạn có thể khai báo `font-weight` (hoặc `font-style`), và biết rằng phông chữ phù hợp sẽ được sử dụng.

#### HTML

```html
<p class="one">This has a font weight of 100</p>
<p class="three">This has a font weight of 300</p>
<p class="four">This has a font weight of 400</p>
<p class="five">This has a font weight of 500</p>
<p class="seven">This has a font weight of 700</p>
<p class="nine">This has a font weight of 900</p>
```

#### CSS

Chúng ta bao gồm bốn khai báo `@font-face` cho bốn phông chữ khác nhau từ họ phông chữ `FireSans`, như ví dụ trước. Mỗi khai báo được đặt thành một dải giá trị font-weight khác nhau, nhưng tất cả sử dụng cùng tên phông chữ.

Khai báo đầu tiên sử dụng `FiraSans-Regular` và dải `font-weight` liên quan của nó bao gồm toàn bộ dải giá trị font weight có thể.

Ba khai báo còn lại sử dụng phiên bản nhẹ, đậm và đậm hơn của phông chữ, và các dải `font-weight` liên quan của chúng định nghĩa các tập con của dải như sau:

- phông chữ nhẹ gắn với dải 1-300
- phông chữ đậm gắn với dải 500-700
- phông chữ đậm hơn gắn với dải 700-1000

Cascade CSS đảm bảo rằng ba khai báo sau ghi đè các phần của dải đã đặt trong khai báo `FiraSans-Regular`.

```css
@font-face {
  font-family: "Fira Sans";
  font-weight: 1 1000;
  src: url("https://mdn.github.io/shared-assets/fonts/FiraSans-Regular.woff2");
}

@font-face {
  font-family: "Fira Sans";
  font-weight: 1 300;
  src: url("https://mdn.github.io/shared-assets/fonts/FiraSans-Light.woff2");
}

@font-face {
  font-family: "Fira Sans";
  font-weight: 500 700;
  src: url("https://mdn.github.io/shared-assets/fonts/FiraSans-Bold.woff2");
}

@font-face {
  font-family: "Fira Sans";
  font-weight: 700 1000;
  src: url("https://mdn.github.io/shared-assets/fonts/FiraSans-ExtraBold.woff2");
}

body {
  font-family: "Fira Sans", serif;
  font-size: 2rem;
}

p.one {
  font-weight: 100;
}

p.three {
  font-weight: 300;
}

p.four {
  font-weight: 400;
}

p.five {
  font-weight: 500;
}

p.seven {
  font-weight: 700;
}

p.nine {
  font-weight: 900;
}
```

#### Kết quả

{{embedlivesample("Setting font-weight ranges", "", 500)}}

Đoạn văn `seven` sử dụng phông chữ đậm hơn. Trong khi `font-weight: 700` khớp cả hai khai báo `FiraSans-Bold` và `FiraSans-ExtraBold`, vì `FiraSans-ExtraBold` được khai báo sau, nó ghi đè `FiraSans-Bold` cho giá trị đó.

Tương tự, `100` và `300` đều sử dụng phông chữ nhẹ; mặc dù `FiraSans-Regular` và `FiraSans-Light` đều bao gồm `300` trong dải của chúng, nhưng `FiraSans-Light` được khai báo sau. Ngoài ra, chúng ta có thể khai báo `FiraSans-Regular` sau `FiraSans-Light`, nhưng khi đó cần thay đổi dải descriptor `font-weight`.

### Đặt dải cho variable font

Trong ví dụ này, chúng ta dùng descriptor `font-weight` để giới hạn dải độ đậm có thể đặt khi sử dụng variable font.

Chúng ta bao gồm một variable font, ["League Mono"](https://www.theleagueofmoveabletype.com/league-mono), sử dụng một quy tắc at-rule `@font-face` duy nhất. Chúng ta sử dụng giá trị `font-weight: 300 700` để giới hạn dải độ đậm có sẵn. Nếu một quy tắc CSS sử dụng phông chữ "League Mono" của chúng ta, thì nếu nó chỉ định độ đậm ngoài dải này, độ đậm sẽ bị kẹp vào dải đó.

#### HTML

Chúng ta bao gồm một đoạn văn với `<output>` được đặt ban đầu là `400`, vì đó là font-weight mặc định cho văn bản đoạn không có định kiểu. Đoạn văn này nằm giữa hai đoạn văn khác để bạn có thể so sánh các giá trị font weight được hiển thị với các giá trị được khai báo.

Chúng ta bao gồm một {{htmlelement("input/range")}} loại `range`, được lồng trong một {{htmlelement("label")}}, đặt `step` là `50`.

```html
<p>LeagueMono, font-weight: 300 (comparison)</p>
<p id="example">LeagueMono, font-weight: <output>400</output> (example)</p>
<p>LeagueMono, font-weight: 700 (comparison)</p>
<label
  >Change the font weight:
  <input type="range" min="50" max="1000" step="50" value="400" />
</label>
```

#### CSS

Chúng ta đặt dải descriptor `font-weight` là `300 700`, kẹp variable font vào dải đó.

```css
@font-face {
  font-family: "LeagueMono";
  src: url("https://mdn.github.io/shared-assets/fonts/LeagueMono-VF.ttf");
  font-weight: 300 700;
}

p {
  font-family: "LeagueMono", serif;
  font-size: 1.5rem;
}

p:first-of-type {
  font-weight: 300;
}

p:last-of-type {
  font-weight: 700;
}
```

#### JavaScript

Chúng ta bao gồm một event handler cập nhật giá trị thuộc tính `font-weight` của đoạn văn, và cập nhật văn bản để phản ánh sự thay đổi:

```js
const text = document.querySelector("#example");
const log = document.querySelector("output");
const range = document.querySelector("input");

range.addEventListener("change", () => {
  text.style.fontWeight = range.value;
  log.innerText = range.value;
});
```

#### Kết quả

{{embedlivesample("Setting a range for a variable font", "", "400")}}

Thay đổi độ đậm phông chữ của đoạn văn thông qua thanh kéo. Lưu ý rằng đoạn văn ví dụ không nhẹ hơn đoạn văn `300` phía trên hoặc đậm hơn đoạn văn `700` phía dưới; độ đậm phông chữ bị kẹp vào dải được định nghĩa bởi descriptor `font-weight`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face/font-display", "font-display")}}
- {{cssxref("@font-face/font-family", "font-family")}}
- {{cssxref("@font-face/font-stretch", "font-stretch")}}
- {{cssxref("@font-face/font-style", "font-style")}}
- {{cssxref("font-feature-settings", "font-feature-settings")}}
- {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
- {{cssxref("@font-face/src", "src")}}
- {{cssxref("@font-face/unicode-range", "unicode-range")}} descriptor
