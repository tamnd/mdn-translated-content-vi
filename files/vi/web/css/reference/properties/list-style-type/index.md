---
title: list-style-type
slug: Web/CSS/Reference/Properties/list-style-type
page-type: css-property
browser-compat: css.properties.list-style-type
sidebar: cssref
---

Thuộc tính CSS **`list-style-type`** đặt dấu đầu dòng (như hình tròn đặc, ký tự, hoặc kiểu đếm tùy chỉnh) của một phần tử mục danh sách.

{{InteractiveExample("CSS Demo: list-style-type")}}

```css interactive-example-choice
list-style-type: space-counter;
```

```css interactive-example-choice
list-style-type: disc;
```

```css interactive-example-choice
list-style-type: circle;
```

```css interactive-example-choice
list-style-type: "\1F44D";
```

```html interactive-example
<section class="default-example" id="default-example">
  <div>
    <p>NASA Notable Missions</p>
    <ul class="transition-all unhighlighted" id="example-element">
      <li>Apollo</li>
      <li>Hubble</li>
      <li>Chandra</li>
      <li>Cassini-Huygens</li>
    </ul>
  </div>
  <hr />
  <div class="note">
    <p>
      <code>space-counter</code> is defined with
      <a
        href="//developer.mozilla.org/docs/Web/CSS/Reference/At-rules/@counter-style"
        target="_parent"
        ><code>@counter-style</code></a
      >
    </p>
  </div>
</section>
```

```css interactive-example
.default-example {
  font-size: 1.2rem;
}

#example-element {
  width: 100%;
  background: #be094b;
  color: white;
}

section {
  text-align: left;
  flex-direction: column;
}

hr {
  width: 50%;
  color: lightgray;
  margin: 0.5em;
}

.note {
  font-size: 0.8rem;
}

.note a {
  color: #009e5f;
}

@counter-style space-counter {
  symbols: "\1F680" "\1F6F8" "\1F6F0" "\1F52D";
  suffix: " ";
}
```

Dấu đầu dòng sẽ có màu [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword), giống với giá trị [color](/en-US/docs/Web/CSS/Reference/Values/color_value) được tính toán của phần tử áp dụng.

Chỉ một vài phần tử ({{HTMLElement("li")}} và {{HTMLElement("summary")}}) có giá trị mặc định là `display: list-item`. Tuy nhiên, thuộc tính `list-style-type` có thể được áp dụng cho bất kỳ phần tử nào có giá trị {{cssxref("display")}} được đặt thành `list-item`. Hơn nữa, vì thuộc tính này được kế thừa, nó có thể được đặt trên phần tử cha (thường là {{HTMLElement("ol")}} hoặc {{HTMLElement("ul")}}) để áp dụng cho tất cả các mục danh sách.

## Cú pháp

```css
/* Một số loại */
list-style-type: disc;
list-style-type: circle;
list-style-type: square;
list-style-type: decimal;
list-style-type: georgian;
list-style-type: trad-chinese-informal;
list-style-type: kannada;

/* Giá trị <string> */
list-style-type: "-";

/* Định danh khớp với quy tắc @counter-style */
list-style-type: custom-counter-style;

/* Giá trị từ khóa */
list-style-type: none;

/* Giá trị toàn cục */
list-style-type: inherit;
list-style-type: initial;
list-style-type: revert;
list-style-type: revert-layer;
list-style-type: unset;
```

Thuộc tính `list-style-type` có thể được định nghĩa là một trong các giá trị:

- giá trị `<custom-ident>`,
- giá trị `symbols()`,
- giá trị `<string>`, hoặc
- từ khóa `none`.

Lưu ý:

- Một số loại yêu cầu phông chữ phù hợp được cài đặt để hiển thị đúng cách.
- `cjk-ideographic` giống hệt `trad-chinese-informal`; nó tồn tại vì lý do tương thích ngược.

### Giá trị

- {{cssxref("custom-ident", "&lt;custom-ident&gt;")}}
  - : Một định danh khớp với giá trị của {{cssxref("@counter-style")}} hoặc một trong các kiểu được định sẵn:
- {{cssxref("symbols()")}}
  - : Định nghĩa một kiểu danh sách ẩn danh.
- {{cssxref("&lt;string&gt;")}}
  - : Chuỗi được chỉ định sẽ được dùng làm dấu đầu dòng của mục.
- `none`
  - : Không hiển thị dấu đầu dòng.
- `disc`
  - : Hình tròn đặc (giá trị mặc định).
- `circle`
  - : Hình tròn rỗng.
- `square`
  - : Hình vuông đặc.
- `decimal`
  - : Số thập phân, bắt đầu từ 1.
- `cjk-decimal`
  - : Số thập phân chữ Hán.
- `decimal-leading-zero`
  - : Số thập phân, có thêm số 0 ở đầu.
- `lower-roman`
  - : Chữ số La Mã viết thường.
- `upper-roman`
  - : Chữ số La Mã viết hoa.
- `lower-greek`
  - : Chữ Hy Lạp cổ điển viết thường.
- `lower-alpha`, `lower-latin`
  - : Chữ cái {{Glossary("ASCII")}} viết thường.
- `upper-alpha`, `upper-latin`
  - : Chữ cái ASCII viết hoa.
- `arabic-indic`, `-moz-arabic-indic`
  - : Số Ả Rập-Ấn Độ.
- `armenian`
  - : Đánh số Armenia truyền thống.
- `bengali`, `-moz-bengali`
  - : Đánh số Bengali.
- `cambodian`/`khmer`
  - : Đánh số Campuchia/Khmer.
- `cjk-earthly-branch`, `-moz-cjk-earthly-branch`
  - : Số thứ tự "Chi Địa" chữ Hán.
- `cjk-heavenly-stem`, `-moz-cjk-heavenly-stem`
  - : Số thứ tự "Can Thiên" chữ Hán.
- `cjk-ideographic`
  - : Giống hệt `trad-chinese-informal`.
- `devanagari`, `-moz-devanagari`
  - : Đánh số Devanagari.
- `ethiopic-numeric`
  - : Đánh số Ethiopia.
- `georgian`
  - : Đánh số Georgia truyền thống.
- `gujarati`, `-moz-gujarati`
  - : Đánh số Gujarati.
- `gurmukhi`, `-moz-gurmukhi`
  - : Đánh số Gurmukhi.
- `hebrew`
  - : Đánh số Hebrew truyền thống.
- `hiragana`
  - : Chữ hiragana theo thứ tự từ điển.
- `hiragana-iroha`
  - : Chữ hiragana theo [thứ tự Iroha](https://en.wikipedia.org/wiki/Iroha).
- `japanese-formal`
  - : Đánh số chính thức Nhật Bản dùng trong tài liệu pháp lý hoặc tài chính. Các chữ Kanji được thiết kế để không thể sửa đổi trông giống chữ khác hợp lệ.
- `japanese-informal`
  - : Đánh số không chính thức Nhật Bản.
- `kannada`, `-moz-kannada`
  - : Đánh số Kannada.
- `katakana`
  - : Chữ katakana theo thứ tự từ điển.
- `katakana-iroha`
  - : Chữ katakana theo [thứ tự Iroha](https://en.wikipedia.org/wiki/Iroha).
- `korean-hangul-formal`
  - : Đánh số hangul Hàn Quốc.
- `korean-hanja-formal`
  - : Đánh số chính thức bằng chữ Hán Hàn Quốc.
- `korean-hanja-informal`
  - : Đánh số hanja Hàn Quốc.
- `lao`, `-moz-lao`
  - : Đánh số Lào.
- `lower-armenian`
  - : Đánh số Armenia viết thường.
- `malayalam`, `-moz-malayalam`
  - : Đánh số Malayalam.
- `mongolian`
  - : Đánh số Mông Cổ.
- `myanmar`, `-moz-myanmar`
  - : Đánh số Myanmar (Miến Điện).
- `oriya`, `-moz-oriya`
  - : Đánh số Oriya.
- `persian`, `-moz-persian`
  - : Đánh số Ba Tư.
- `simp-chinese-formal`
  - : Đánh số chính thức chữ Hán giản thể.
- `simp-chinese-informal`
  - : Đánh số không chính thức chữ Hán giản thể.
- `tamil`, `-moz-tamil`
  - : Đánh số Tamil.
- `telugu`, `-moz-telugu`
  - : Đánh số Telugu.
- `thai`, `-moz-thai`
  - : Đánh số Thái.
- `tibetan`
  - : Đánh số Tây Tạng.
- `trad-chinese-formal`
  - : Đánh số chính thức chữ Hán phồn thể.
- `trad-chinese-informal`
  - : Đánh số không chính thức chữ Hán phồn thể.
- `upper-armenian`
  - : Đánh số Armenia viết hoa truyền thống.
- `disclosure-open`
  - : Ký hiệu cho biết widget tiết lộ như {{HTMLElement("details")}} đang mở.
- `disclosure-closed`
  - : Ký hiệu cho biết widget tiết lộ như {{HTMLElement("details")}} đang đóng.

Xem ví dụ [Tất cả kiểu danh sách](#all_list_style_types) để thấy các giá trị trên hoạt động. Chi tiết về tất cả các kiểu đếm có sẵn được sử dụng bởi nhiều nền văn hóa trên thế giới có thể được tìm thấy trong [Ready-made Counter Styles](https://w3c.github.io/predefined-counter-styles/).

### Phần mở rộng phi tiêu chuẩn

Một vài kiểu được định sẵn được Mozilla (Firefox) hỗ trợ với tiền tố `-moz-`.

- `ethiopic-halehame`: `-moz-ethiopic-halehame`
- `ethiopic-halehame-am`: `-moz-ethiopic-halehame-am`
- `ethiopic-halehame-ti-er`: `-moz-ethiopic-halehame-ti-er`
- `ethiopic-halehame-ti-et`: `-moz-ethiopic-halehame-ti-et`
- `ethiopic-numeric`: `-moz-ethiopic-numeric`
- `hangul`: `-moz-hangul`
- `hangul-consonant`: `-moz-hangul-consonant`
- `urdu`: `-moz-urdu`

Xem [bảng tương thích](#browser_compatibility) để kiểm tra trình duyệt nào hỗ trợ phần mở rộng nào.

## Khả năng tiếp cận

Safari sẽ không nhận dạng danh sách có thứ tự hoặc không có thứ tự như một danh sách trong cây trợ năng nếu nó có giá trị `list-style-type` là `none`. Điều này có thể được giải quyết bằng cách thêm `role="list"` vào thẻ mở của danh sách. Để tìm hiểu thêm về vấn đề này và các giải pháp thay thế tiềm năng, hãy xem [`list-style`](/en-US/docs/Web/CSS/Reference/Properties/list-style#accessibility).

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt dấu đầu dòng mục danh sách

#### HTML

```html
List 1
<ol class="normal">
  <li>Hello</li>
  <li>World</li>
  <li>What's up?</li>
</ol>

List 2
<ol class="shortcut">
  <li>Looks</li>
  <li>Like</li>
  <li>The</li>
  <li>Same</li>
</ol>
```

#### CSS

```css
ol.normal {
  list-style-type: upper-alpha;
}

/* hoặc dùng thuộc tính rút gọn "list-style": */
ol.shortcut {
  list-style: upper-alpha;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_list_item_markers","200","300")}}

### Tất cả kiểu danh sách

#### HTML

```html
<ol>
  <li>Apollo</li>
  <li>Hubble</li>
  <li>Chandra</li>
  <li>Cassini-Huygens</li>
  <li>Spitzer</li>
</ol>

<h2>Choose a list style type:</h2>

<div class="container">
  <label for="disc">
    <input type="radio" id="disc" name="type" value="disc" />disc
  </label>

  <label for="circle">
    <input type="radio" id="circle" name="type" value="circle" />circle
  </label>

  <label for="square">
    <input type="radio" id="square" name="type" value="square" />square
  </label>

  <label for="decimal">
    <input type="radio" id="decimal" name="type" value="decimal" />decimal
  </label>

  <label for="cjk-decimal">
    <input
      type="radio"
      id="cjk-decimal"
      name="type"
      value="cjk-decimal" />cjk-decimal
  </label>

  <label for="decimal-leading-zero">
    <input
      type="radio"
      id="decimal-leading-zero"
      name="type"
      value="decimal-leading-zero" />decimal-leading-zero
  </label>

  <label for="lower-roman">
    <input
      type="radio"
      id="lower-roman"
      name="type"
      value="lower-roman" />lower-roman
  </label>

  <label for="upper-roman">
    <input
      type="radio"
      id="upper-roman"
      name="type"
      value="upper-roman" />upper-roman
  </label>

  <label for="lower-greek">
    <input
      type="radio"
      id="lower-greek"
      name="type"
      value="lower-greek" />lower-greek
  </label>

  <label for="lower-alpha">
    <input
      type="radio"
      id="lower-alpha"
      name="type"
      value="lower-alpha" />lower-alpha, lower-latin
  </label>

  <label for="upper-alpha">
    <input
      type="radio"
      id="upper-alpha"
      name="type"
      value="upper-alpha" />upper-alpha, upper-latin
  </label>

  <label for="arabic-indic">
    <input
      type="radio"
      id="arabic-indic"
      name="type"
      value="arabic-indic" />arabic-indic
  </label>

  <label for="armenian">
    <input type="radio" id="armenian" name="type" value="armenian" />armenian
  </label>

  <label for="bengali">
    <input type="radio" id="bengali" name="type" value="bengali" />bengali
  </label>

  <label for="cambodian">
    <input type="radio" id="cambodian" name="type" value="cambodian" />cambodian
  </label>

  <label for="cjk-earthly-branch">
    <input
      type="radio"
      id="cjk-earthly-branch"
      name="type"
      value="cjk-earthly-branch" />cjk-earthly-branch
  </label>

  <label for="cjk-heavenly-stem">
    <input
      type="radio"
      id="cjk-heavenly-stem"
      name="type"
      value="cjk-heavenly-stem" />cjk-heavenly-stem
  </label>

  <label for="cjk-ideographic">
    <input
      type="radio"
      id="cjk-ideographic"
      name="type"
      value="cjk-ideographic" />cjk-ideographic
  </label>

  <label for="devanagari">
    <input
      type="radio"
      id="devanagari"
      name="type"
      value="devanagari" />devanagari
  </label>

  <label for="ethiopic-numeric">
    <input
      type="radio"
      id="ethiopic-numeric"
      name="type"
      value="ethiopic-numeric" />ethiopic-numeric
  </label>

  <label for="georgian">
    <input type="radio" id="georgian" name="type" value="georgian" />georgian
  </label>

  <label for="gujarati">
    <input type="radio" id="gujarati" name="type" value="gujarati" />gujarati
  </label>

  <label for="gurmukhi">
    <input type="radio" id="gurmukhi" name="type" value="gurmukhi" />gurmukhi
  </label>

  <label for="hebrew">
    <input type="radio" id="hebrew" name="type" value="hebrew" />hebrew
  </label>

  <label for="hiragana">
    <input type="radio" id="hiragana" name="type" value="hiragana" />hiragana
  </label>

  <label for="hiragana-iroha">
    <input
      type="radio"
      id="hiragana-iroha"
      name="type"
      value="hiragana-iroha" />hiragana-iroha
  </label>

  <label for="japanese-formal">
    <input
      type="radio"
      id="japanese-formal"
      name="type"
      value="japanese-formal" />japanese-formal
  </label>

  <label for="japanese-informal">
    <input
      type="radio"
      id="japanese-informal"
      name="type"
      value="japanese-informal" />japanese-informal
  </label>

  <label for="kannada">
    <input type="radio" id="kannada" name="type" value="kannada" />kannada
  </label>

  <label for="katakana">
    <input type="radio" id="katakana" name="type" value="katakana" />katakana
  </label>

  <label for="katakana-iroha">
    <input
      type="radio"
      id="katakana-iroha"
      name="type"
      value="katakana-iroha" />katakana-iroha
  </label>

  <label for="khmer">
    <input type="radio" id="khmer" name="type" value="khmer" />khmer
  </label>

  <label for="korean-hangul-formal">
    <input
      type="radio"
      id="korean-hangul-formal"
      name="type"
      value="korean-hangul-formal" />korean-hangul-formal
  </label>

  <label for="korean-hanja-formal">
    <input
      type="radio"
      id="korean-hanja-formal"
      name="type"
      value="korean-hanja-formal" />korean-hanja-formal
  </label>

  <label for="korean-hanja-informal">
    <input
      type="radio"
      id="korean-hanja-informal"
      name="type"
      value="korean-hanja-informal" />korean-hanja-informal
  </label>

  <label for="lao">
    <input type="radio" id="lao" name="type" value="lao" />lao
  </label>

  <label for="lower-armenian">
    <input
      type="radio"
      id="lower-armenian"
      name="type"
      value="lower-armenian" />lower-armenian
  </label>

  <label for="malayalam">
    <input type="radio" id="malayalam" name="type" value="malayalam" />malayalam
  </label>

  <label for="mongolian">
    <input type="radio" id="mongolian" name="type" value="mongolian" />mongolian
  </label>

  <label for="myanmar">
    <input type="radio" id="myanmar" name="type" value="myanmar" />myanmar
  </label>

  <label for="oriya">
    <input type="radio" id="oriya" name="type" value="oriya" />oriya
  </label>

  <label for="persian">
    <input type="radio" id="persian" name="type" value="persian" />persian
  </label>

  <label for="simp-chinese-formal">
    <input
      type="radio"
      id="simp-chinese-formal"
      name="type"
      value="simp-chinese-formal" />simp-chinese-formal
  </label>

  <label for="simp-chinese-informal">
    <input
      type="radio"
      id="simp-chinese-informal"
      name="type"
      value="simp-chinese-informal" />simp-chinese-informal
  </label>

  <label for="tamil">
    <input type="radio" id="tamil" name="type" value="tamil" />tamil
  </label>

  <label for="telugu">
    <input type="radio" id="telugu" name="type" value="telugu" />telugu
  </label>

  <label for="thai">
    <input type="radio" id="thai" name="type" value="thai" />thai
  </label>

  <label for="tibetan">
    <input type="radio" id="tibetan" name="type" value="tibetan" />tibetan
  </label>

  <label for="trad-chinese-formal">
    <input
      type="radio"
      id="trad-chinese-formal"
      name="type"
      value="trad-chinese-formal" />trad-chinese-formal
  </label>

  <label for="trad-chinese-informal">
    <input
      type="radio"
      id="trad-chinese-informal"
      name="type"
      value="trad-chinese-informal" />trad-chinese-informal
  </label>

  <label for="upper-armenian">
    <input
      type="radio"
      id="upper-armenian"
      name="type"
      value="upper-armenian" />upper-armenian
  </label>

  <label for="disclosure-open">
    <input
      type="radio"
      id="disclosure-open"
      name="type"
      value="disclosure-open" />disclosure-open
  </label>

  <label for="disclosure-closed">
    <input
      type="radio"
      id="disclosure-closed"
      name="type"
      value="disclosure-closed" />disclosure-closed
  </label>

  <label for="moz-ethiopic-halehame">
    <input
      type="radio"
      id="moz-ethiopic-halehame"
      name="type"
      value="-moz-ethiopic-halehame" />-moz-ethiopic-halehame
  </label>

  <label for="moz-ethiopic-halehame-am">
    <input
      type="radio"
      id="moz-ethiopic-halehame-am"
      name="type"
      value="-moz-ethiopic-halehame-am" />-moz-ethiopic-halehame-am
  </label>

  <label for="ethiopic-halehame-ti-er">
    <input
      type="radio"
      id="ethiopic-halehame-ti-er"
      name="type"
      value="ethiopic-halehame-ti-er" />ethiopic-halehame-ti-er
  </label>

  <label for="ethiopic-halehame-ti-et">
    <input
      type="radio"
      id="ethiopic-halehame-ti-et"
      name="type"
      value="ethiopic-halehame-ti-et" />ethiopic-halehame-ti-et
  </label>

  <label for="hangul">
    <input type="radio" id="hangul" name="type" value="hangul" />hangul
  </label>

  <label for="hangul-consonant">
    <input
      type="radio"
      id="hangul-consonant"
      name="type"
      value="hangul-consonant" />hangul-consonant
  </label>

  <label for="urdu">
    <input type="radio" id="urdu" name="type" value="urdu" />urdu
  </label>

  <label for="moz-ethiopic-halehame-ti-er">
    <input
      type="radio"
      id="moz-ethiopic-halehame-ti-er"
      name="type"
      value="-moz-ethiopic-halehame-ti-er" />-moz-ethiopic-halehame-ti-er
  </label>

  <label for="moz-ethiopic-halehame-ti-et">
    <input
      type="radio"
      id="moz-ethiopic-halehame-ti-et"
      name="type"
      value="-moz-ethiopic-halehame-ti-et" />-moz-ethiopic-halehame-ti-et
  </label>

  <label for="moz-hangul">
    <input
      type="radio"
      id="moz-hangul"
      name="type"
      value="-moz-hangul" />-moz-hangul
  </label>

  <label for="moz-hangul-consonant">
    <input
      type="radio"
      id="moz-hangul-consonant"
      name="type"
      value="-moz-hangul-consonant" />-moz-hangul-consonant
  </label>

  <label for="moz-urdu">
    <input type="radio" id="moz-urdu" name="type" value="-moz-urdu" />-moz-urdu
  </label>
</div>
```

#### CSS

```css
ol {
  font-size: 1.2rem;
}

.container {
  column-count: 3;
}

label {
  display: block;
}

input {
  margin: 0.4rem;
}
```

#### JavaScript

```js
const container = document.querySelector(".container");
const list = document.querySelector("ol");

container.addEventListener("change", (event) => {
  list.setAttribute("style", `list-style-type: ${event.target.value}`);
});
```

#### Kết quả

{{EmbedLiveSample("All_list_style_types", "600", "800")}}

Chúng ta không bị giới hạn ở các kiểu danh sách được định nghĩa trên trang này hoặc trong đặc tả. Quy tắc at-rule {{cssxref("@counter-style")}} cho phép tạo [bộ đếm dùng bất kỳ bảng chữ cái nào](https://r12a.github.io/app-counters/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính rút gọn {{Cssxref("list-style")}}
- Thuộc tính {{Cssxref("list-style-image")}}
- Thuộc tính {{Cssxref("list-style-position")}}
- Phần tử giả {{Cssxref("::marker")}}
- Mô-đun [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
- Mô-đun [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
