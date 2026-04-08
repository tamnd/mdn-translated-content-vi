---
title: text-transform
slug: Web/CSS/Reference/Properties/text-transform
page-type: css-property
browser-compat: css.properties.text-transform
sidebar: cssref
---

Thuộc tính **`text-transform`** [CSS](/en-US/docs/Web/CSS) xác định cách viết hoa văn bản của một phần tử. Nó có thể được dùng để hiển thị văn bản toàn chữ hoa, toàn chữ thường, hoặc viết hoa chữ đầu mỗi từ. Nó cũng có thể giúp cải thiện khả năng đọc cho ruby.

{{InteractiveExample("CSS Demo: text-transform")}}

```css interactive-example-choice
text-transform: capitalize;
```

```css interactive-example-choice
text-transform: uppercase;
```

```css interactive-example-choice
text-transform: lowercase;
```

```css interactive-example-choice
text-transform: none;
```

```css interactive-example-choice
text-transform: full-width;
```

```css interactive-example-choice
text-transform: full-size-kana;
```

```css interactive-example-choice
text-transform: math-auto;
```

```html interactive-example
<section id="default-example">
  <div class="transition-all" id="example-element">
    <p>
      LONDON. Michaelmas term lately over, and the Lord Chancellor sitting in
      Lincoln's Inn Hall.
    </p>
    <p lang="el">
      Σ is a Greek letter and appears in ΟΔΥΣΣΕΥΣ. Θα πάμε στο "Θεϊκό φαΐ" ή στη
      "Νεράιδα"
    </p>
    <p lang="ja">ァィゥェ ォヵㇰヶ</p>
  </div>
</section>
```

```css interactive-example
#example-element {
  font-size: 1.2em;
}
```

Thuộc tính `text-transform` tính đến các quy tắc ánh xạ chữ hoa/chữ thường theo ngôn ngữ cụ thể như sau:

- Trong các ngôn ngữ Thổ Nhĩ Kỳ, như tiếng Thổ Nhĩ Kỳ (`tr`), tiếng Azerbaijan (`az`), tiếng Tatar Crimea (`crh`), tiếng Tatar Volga (`tt`), và tiếng Bashkir (`ba`), có hai loại `i`, có và không có dấu chấm, và hai cặp chữ hoa/thường: `i`/`İ` và `ı`/`I`.
- Trong tiếng Đức (`de`), `ß` trở thành `SS` ở dạng chữ hoa.
- Trong tiếng Hà Lan (`nl`), chữ ghép `ij` trở thành `IJ`, ngay cả với `text-transform: capitalize`, vốn chỉ viết hoa chữ cái đầu tiên của một từ.
- Trong tiếng Hy Lạp (`el`), các nguyên âm mất dấu trọng âm khi cả từ ở dạng chữ hoa (`ά`/`Α`), ngoại trừ eta phân biệt (`ή`/`Ή`). Ngoài ra, các nguyên âm đôi có dấu trọng âm ở nguyên âm đầu sẽ mất dấu trọng âm và thêm dấu phân âm ở nguyên âm thứ hai (`άι`/`ΑΪ`).
- Trong tiếng Hy Lạp (`el`), ký tự sigma chữ thường có hai dạng: `σ` và `ς`. `ς` chỉ được dùng khi sigma kết thúc một từ. Khi áp dụng `text-transform: lowercase` cho sigma chữ hoa (`Σ`), trình duyệt cần chọn dạng chữ thường đúng dựa trên ngữ cảnh.
- Trong tiếng Ireland (`ga`), một số chữ cái có tiền tố vẫn ở dạng chữ thường khi chữ cái gốc đầu tiên được viết hoa, ví dụ `text-transform: uppercase` sẽ thay đổi `ar aon tslí` thành `AR AON tSLÍ` chứ không phải `AR AON TSLÍ` như có thể dự đoán (chỉ Firefox). Trong một số trường hợp, dấu gạch nối cũng bị loại bỏ khi viết hoa: `an t-uisce` biến thành `AN tUISCE` (và dấu gạch nối được chèn lại đúng chỗ bởi `text-transform: lowercase`).

Ngôn ngữ được xác định bởi thuộc tính HTML [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) hoặc thuộc tính XML [`xml:lang`](/en-US/docs/Web/SVG/Reference/Attribute/xml:lang).

> [!NOTE]
> Hỗ trợ cho các trường hợp theo ngôn ngữ cụ thể khác nhau giữa các trình duyệt, vì vậy hãy kiểm tra [bảng tương thích trình duyệt](#khả_năng_tương_thích_trình_duyệt).

## Cú pháp

```css
/* Giá trị từ khóa */
text-transform: none;
text-transform: capitalize;
text-transform: uppercase;
text-transform: lowercase;
text-transform: full-width;
text-transform: full-size-kana;
text-transform: math-auto;

/* Giá trị toàn cục */
text-transform: inherit;
text-transform: initial;
text-transform: revert;
text-transform: revert-layer;
text-transform: unset;
```

- `capitalize`
  - : Là từ khóa chuyển đổi chữ cái đầu tiên của mỗi từ thành chữ hoa. Các ký tự còn lại không thay đổi (chúng giữ nguyên chữ hoa/thường ban đầu như được viết trong văn bản của phần tử). Một chữ cái được định nghĩa là ký tự thuộc danh mục tổng quát Chữ cái hoặc Số của Unicode; do đó, bất kỳ dấu câu hoặc ký hiệu nào ở đầu một từ đều bị bỏ qua.

    > [!WARNING]
    > Trong nhiều ngôn ngữ, việc viết hoa mọi từ trong câu được coi là không đúng, ngay cả trong tiêu đề và tên riêng. Nếu bạn không biết ngôn ngữ của văn bản mà style sẽ được áp dụng, bạn nên tránh sử dụng `capitalize`. Hơn nữa, `capitalize` không tạo ra tiêu đề chuẩn, vì nó không áp dụng các quy tắc theo ngôn ngữ cụ thể như bỏ qua mạo từ trong tiếng Anh.

    > [!NOTE]
    > Từ khóa `capitalize` không được chỉ định rõ trong CSS 1 và CSS 2.1. Điều này dẫn đến sự khác biệt giữa các trình duyệt trong cách tính chữ cái đầu tiên (Firefox coi `-` và `_` là chữ cái, nhưng các trình duyệt khác thì không. Cả WebKit và Gecko đều coi nhầm các ký hiệu dựa trên chữ cái như `ⓐ` là chữ cái thực.) Bằng cách định nghĩa chính xác hành vi đúng, CSS Text Level 3 đã giải quyết vấn đề này. Dòng `capitalize` trong bảng tương thích trình duyệt chứa phiên bản mà các engine khác nhau bắt đầu hỗ trợ hành vi được định nghĩa chính xác này.

- `uppercase`
  - : Là từ khóa chuyển đổi tất cả ký tự thành chữ hoa.
- `lowercase`
  - : Là từ khóa chuyển đổi tất cả ký tự thành chữ thường.
- `none`
  - : Là từ khóa ngăn chặn sự thay đổi chữ hoa/thường của tất cả ký tự.
- `full-width`
  - : Là từ khóa buộc các ký tự — chủ yếu là biểu tượng chữ và chữ Latin — được viết trong một ô vuông, cho phép chúng được căn chỉnh trong các chữ viết Đông Á thông thường (như tiếng Trung hoặc tiếng Nhật).
- `full-size-kana`
  - : Thường được dùng cho văn bản chú thích {{htmlelement("ruby")}}, từ khóa này chuyển đổi tất cả các ký tự Kana nhỏ thành Kana kích thước đầy đủ tương đương, để bù đắp cho các vấn đề về khả năng đọc ở các cỡ chữ nhỏ thường dùng trong ruby.
- `math-auto`
  - : Được dùng để tự động hiển thị văn bản theo kiểu in nghiêng toán học khi thích hợp. Nó biến đổi các chữ cái Latin và Hy Lạp, và một số ký hiệu liên quan đến toán học khác, thành [ký hiệu toán học in nghiêng](https://www.unicode.org/charts/PDF/U1D400.pdf) nhưng chỉ khi được áp dụng cho một nút văn bản chứa một ký tự đơn. Ví dụ, "x" sẽ trở thành "𝑥" (U+1D465), nhưng "exp" sẽ vẫn là "exp".
    Nó chủ yếu được dùng để chỉ định hành vi của các phần tử {{mathmlelement("mi")}} trong MathML. Bạn thường nên sử dụng đánh dấu MathML để tự động áp dụng kiểu đúng.

## Khả năng tiếp cận

Các đoạn văn bản lớn được đặt với giá trị `text-transform` là `uppercase` có thể khó đọc đối với những người có vấn đề nhận thức như chứng khó đọc.

- [MDN Hiểu WCAG, giải thích Hướng dẫn 1.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [W3C Hiểu WCAG 2.2](https://w3c.github.io/wcag/guidelines/22/#visual-presentation)

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ dùng "none"

```html
<p>
  Initial String
  <strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit…</strong>
</p>
<p>
  text-transform: none
  <strong
    ><span
      >Lorem ipsum dolor sit amet, consectetur adipisicing elit…</span
    ></strong
  >
</p>
```

```css
span {
  text-transform: none;
}
strong {
  float: right;
}
```

Ví dụ này minh họa việc không biến đổi văn bản.

{{ EmbedLiveSample('Example using "none"', '100%', '100px') }}

### Ví dụ dùng "capitalize" (tổng quát)

```html
<p>
  Initial String
  <strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit…</strong>
</p>
<p>
  text-transform: capitalize
  <strong
    ><span
      >Lorem ipsum dolor sit amet, consectetur adipisicing elit…</span
    ></strong
  >
</p>
```

```css
span {
  text-transform: capitalize;
}
strong {
  float: right;
}
```

Ví dụ này minh họa viết hoa chữ cái đầu mỗi từ.

{{ EmbedLiveSample('Example using "capitalize" (general)', '100%', '100px') }}

### Ví dụ dùng "capitalize" (dấu câu)

```html
<p>
  Initial String
  <strong
    >(this) "is" [a] –short– -test- «for» *the* _css_ ¿capitalize?
    ?¡transform!</strong
  >
</p>
<p>
  text-transform: capitalize
  <strong
    ><span
      >(this) "is" [a] –short– -test- «for» *the* _css_ ¿capitalize?
      ?¡transform!</span
    ></strong
  >
</p>
```

```css
span {
  text-transform: capitalize;
}
strong {
  float: right;
}
```

Ví dụ này minh họa cách các dấu câu đầu từ bị bỏ qua. Từ khóa nhắm vào chữ cái đầu tiên, tức là ký tự Unicode đầu tiên thuộc danh mục tổng quát Chữ cái hoặc Số.

{{ EmbedLiveSample('Example using "capitalize" (punctuation)', '100%', '100px') }}

### Ví dụ dùng "capitalize" (ký hiệu)

```html
<p>
  Initial String
  <strong>ⓐⓑⓒ (ⓓⓔⓕ) —ⓖⓗⓘ— ⓙkl</strong>
</p>
<p>
  text-transform: capitalize
  <strong><span>ⓐⓑⓒ (ⓓⓔⓕ) —ⓖⓗⓘ— ⓙkl</span></strong>
</p>
```

```css
span {
  text-transform: capitalize;
}
strong {
  float: right;
}
```

Ví dụ này minh họa cách các ký hiệu đầu từ bị bỏ qua. Từ khóa nhắm vào chữ cái đầu tiên, tức là ký tự Unicode đầu tiên thuộc danh mục tổng quát Chữ cái hoặc Số.

{{ EmbedLiveSample('Example using "capitalize" (symbols)', '100%', '100px') }}

### Ví dụ dùng "capitalize" (chữ ghép ij tiếng Hà Lan)

```html
<p>
  Initial String
  <strong lang="nl">The Dutch word: "ijsland" starts with a digraph.</strong>
</p>
<p>
  text-transform: capitalize
  <strong
    ><span lang="nl"
      >The Dutch word: "ijsland" starts with a digraph.</span
    ></strong
  >
</p>
```

```css
span {
  text-transform: capitalize;
}
strong {
  float: right;
}
```

Ví dụ này minh họa cách chữ ghép _ij_ tiếng Hà Lan phải được xử lý như một chữ cái đơn.

{{ EmbedLiveSample('Example using "capitalize" (Dutch ij digraph)', '100%', '100px') }}

### Ví dụ dùng "uppercase" (tổng quát)

```html
<p>
  Initial String
  <strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit…</strong>
</p>
<p>
  text-transform: uppercase
  <strong
    ><span
      >Lorem ipsum dolor sit amet, consectetur adipisicing elit…</span
    ></strong
  >
</p>
```

```css
span {
  text-transform: uppercase;
}
strong {
  float: right;
}
```

Ví dụ này minh họa biến đổi văn bản thành chữ hoa.

{{ EmbedLiveSample('Example using "uppercase" (general)', '100%', '100px') }}

### Ví dụ dùng "uppercase" (nguyên âm Hy Lạp)

```html
<p>
  Initial String
  <strong>Θα πάμε στο "Θεϊκό φαΐ" ή στη "Νεράιδα"</strong>
</p>
<p>
  text-transform: uppercase
  <strong
    ><span lang="el">Θα πάμε στο "Θεϊκό φαΐ" ή στη "Νεράιδα"</span></strong
  >
</p>
```

```css
span {
  text-transform: uppercase;
}
strong {
  float: right;
}
```

Ví dụ này minh họa cách các nguyên âm Hy Lạp ngoại trừ eta phân biệt không có dấu trọng âm, và dấu trọng âm trên nguyên âm đầu của một cặp nguyên âm trở thành dấu phân âm trên nguyên âm thứ hai.

{{ EmbedLiveSample('Example using "uppercase" (Greek vowels)', '100%', '100px') }}

### Ví dụ dùng "lowercase" (tổng quát)

```html
<p>
  Initial String
  <strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit…</strong>
</p>
<p>
  text-transform: lowercase
  <strong
    ><span
      >Lorem ipsum dolor sit amet, consectetur adipisicing elit…</span
    ></strong
  >
</p>
```

```css
span {
  text-transform: lowercase;
}
strong {
  float: right;
}
```

Ví dụ này minh họa biến đổi văn bản thành chữ thường.

{{ EmbedLiveSample('Example using "lowercase" (general)', '100%', '100px') }}

### Ví dụ dùng "lowercase" (Σ Hy Lạp)

```html
<p>
  Initial String
  <strong>Σ IS A greek LETTER that appears SEVERAL TIMES IN ΟΔΥΣΣΕΥΣ.</strong>
</p>
<p>
  text-transform: lowercase
  <strong
    ><span
      >Σ IS A greek LETTER that appears SEVERAL TIMES IN ΟΔΥΣΣΕΥΣ.</span
    ></strong
  >
</p>
```

```css
span {
  text-transform: lowercase;
}
strong {
  float: right;
}
```

Ví dụ này minh họa cách ký tự sigma Hy Lạp (`Σ`) được biến đổi thành sigma chữ thường thông thường (`σ`) hoặc biến thể cuối từ (`ς`), tùy theo ngữ cảnh.

{{ EmbedLiveSample('Example using "lowercase" (Greek Σ)', '100%', '100px') }}

### Ví dụ dùng "lowercase" (tiếng Litva)

```html
<p>
  Initial String
  <strong>Ĩ is a Lithuanian LETTER as is J́</strong>
</p>
<p>
  text-transform: lowercase
  <strong><span lang="lt">Ĩ is a Lithuanian LETTER as is J́</span></strong>
</p>
```

```css
span {
  text-transform: lowercase;
}
strong {
  float: right;
}
```

Ví dụ này minh họa cách các chữ cái tiếng Litva `Ĩ` và `J́` giữ nguyên dấu chấm khi được biến đổi thành chữ thường.

{{ EmbedLiveSample('Example using "lowercase" (Lithuanian)', '100%', '100px') }}

### Ví dụ dùng "full-width" (tổng quát)

```html
<p>
  Initial String
  <strong
    >0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!"#$%&()*+,-./:;&lt;=&gt;?@{|}~</strong
  >
</p>
<p>
  text-transform: full-width
  <strong
    ><span
      >0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!"#$%&()*+,-./:;&lt;=&gt;?@{|}~</span
    ></strong
  >
</p>
```

```css
span {
  text-transform: full-width;
}
strong {
  width: 100%;
  float: right;
}
```

Một số ký tự tồn tại ở hai định dạng: chiều rộng bình thường và chiều rộng đầy đủ, với các code point Unicode khác nhau. Phiên bản chiều rộng đầy đủ được dùng để kết hợp chúng mượt mà với các ký tự biểu tượng chữ Á Đông.

{{ EmbedLiveSample('Example using "full-width" (general)', '100%', '175px') }}

### Ví dụ dùng "full-width" (katakana nửa chiều rộng tiếng Nhật)

```html
<p>
  Initial String
  <strong>ｳｪﾌﾞﾌﾟﾛｸﾞﾗﾐﾝｸﾞの勉強</strong>
</p>
<p>
  text-transform: full-width
  <strong><span>ｳｪﾌﾞﾌﾟﾛｸﾞﾗﾐﾝｸﾞの勉強</span></strong>
</p>
```

```css
span {
  text-transform: full-width;
}
strong {
  width: 100%;
  float: right;
}
```

Katakana nửa chiều rộng tiếng Nhật được dùng để biểu diễn katakana trong mã ký tự 8-bit. Không giống như các ký tự katakana thông thường (toàn chiều rộng), một chữ cái có dakuten (dấu âm thanh có giọng) được biểu diễn bằng hai code point, thân chữ và dakuten. `full-width` kết hợp các này thành một code point duy nhất khi chuyển đổi các ký tự này thành toàn chiều rộng.

{{ EmbedLiveSample('Example using "full-width" (Japanese half-width katakana)', '100%', '175px') }}

### Ví dụ dùng "full-size-kana"

```html
<p>ァィゥェ ォヵㇰヶ ㇱㇲッㇳ ㇴㇵㇶㇷ ㇸㇹㇺャ ュョㇻㇼ ㇽㇾㇿヮ</p>
<p>ァィゥェ ォヵㇰヶ ㇱㇲッㇳ ㇴㇵㇶㇷ ㇸㇹㇺャ ュョㇻㇼ ㇽㇾㇿヮ</p>
```

```css
p:nth-of-type(2) {
  text-transform: full-size-kana;
}
```

{{ EmbedLiveSample('Example using "full-size-kana"', '100%', '175px') }}

### Ví dụ dùng "math-auto"

Trong ví dụ này, chúng ta dùng đánh dấu HTML thuần để tạo công thức toán:

```html
<div>
  (<span class="math-id">sin</span>&#8198;<span class="math-id">x</span>)<sup
    >2</sup
  >
  + (<span class="math-id">cos</span>&#8198;<span class="math-id">x</span>)<sup
    >2</sup
  >
  = 1
</div>
```

Chúng ta đặt `text-transform: math-auto` cho mọi phần tử `.math-id`. Tuy nhiên, lưu ý rằng chỉ các ký tự `x` trở thành chữ nghiêng, trong khi `sin` và `cos` vẫn không thay đổi.

```css
.math-id {
  text-transform: math-auto;
}
```

{{ EmbedLiveSample('Example using "math-auto"', '', '100px') }}

Tuy nhiên, bạn được khuyến khích sử dụng [MathML](/en-US/docs/Web/MathML) cho các công thức toán, vì nó cung cấp cách biểu diễn nội dung toán học mạnh mẽ và dễ tiếp cận hơn. Đây là công thức tương tự dùng MathML:

```xml
<math xmlns="http://www.w3.org/1998/Math/MathML" display="block">
  <semantics>
    <mrow>
      <mo stretchy="false">(</mo>
      <mo lspace="0em" rspace="0em">sin</mo>
      <mspace width="0.16666666666666666em"></mspace>
      <mi>x</mi>
      <msup>
        <mo stretchy="false">)</mo>
        <mn>2</mn>
      </msup>
      <mo>+</mo>
      <mo stretchy="false">(</mo>
      <mo lspace="0em" rspace="0em">cos</mo>
      <mspace width="0.16666666666666666em"></mspace>
      <mi>x</mi>
      <msup>
        <mo stretchy="false">)</mo>
        <mn>2</mn>
      </msup>
      <mo>=</mo>
      <mn>1</mn>
    </mrow>
    <annotation encoding="TeX">(\sin\,x)^2+(\cos\,x)^2=1</annotation>
  </semantics>
</math>
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-variant")}}
