---
title: OpenType font features
short-title: OpenType features
slug: Web/CSS/Guides/Fonts/OpenType_fonts
page-type: guide
sidebar: cssref
---

Các tính năng hoặc biến thể font đề cập đến các glyph hoặc kiểu ký tự khác nhau có trong font OpenType. Những thứ này bao gồm ligature (glyph đặc biệt kết hợp các ký tự như 'fi' hoặc 'ffl'), kerning (điều chỉnh khoảng cách giữa các cặp chữ cái cụ thể), phân số, kiểu số, và một số thứ khác. Tất cả những điều này được gọi là các tính năng OpenType, và được cung cấp để sử dụng trên web thông qua các thuộc tính cụ thể và thuộc tính điều khiển cấp thấp — {{cssxref("font-feature-settings")}}. Bài viết này cung cấp cho bạn tất cả những gì bạn cần biết về việc sử dụng các tính năng font OpenType trong CSS.

Một số font sẽ có một hoặc nhiều tính năng này được bật theo mặc định (kerning và ligature mặc định là các ví dụ phổ biến), trong khi các tính năng khác được để cho nhà thiết kế hoặc lập trình viên chọn để bật trong các tình huống cụ thể.

Ngoài các bộ tính năng rộng như ligature hoặc lining figures (chữ số căn hàng đều so với 'oldstyle', trông giống chữ thường hơn), còn có các tính năng rất cụ thể như stylistic sets (có thể bao gồm một số biến thể glyph cụ thể được sử dụng cùng nhau), alternates (có thể là một hoặc nhiều biến thể của chữ 'a'), hoặc thậm chí các thay đổi dành riêng cho ngôn ngữ cho các ngôn ngữ Đông Á. Trong trường hợp sau, những thay đổi này thực sự cần thiết để diễn đạt đúng ngôn ngữ, vì vậy chúng vượt ra ngoài sở thích tạo kiểu của hầu hết các tính năng OpenType khác.

> [!WARNING]
> Có nhiều thuộc tính CSS được định nghĩa để tận dụng các tính năng font, nhưng tiếc thay nhiều thuộc tính chưa được triển khai đầy đủ. Tất cả chúng đều được định nghĩa và hiển thị ở đây, nhưng nhiều thuộc tính sẽ chỉ hoạt động bằng cách sử dụng thuộc tính cấp thấp hơn {{cssxref("font-feature-settings")}}. Có thể viết CSS hoạt động theo cả hai cách nhưng điều này có thể trở nên rườm rà. Vấn đề với việc sử dụng `font-feature-settings` cho mọi thứ là mỗi khi bạn muốn thay đổi một trong các tính năng riêng lẻ, bạn phải khai báo lại toàn bộ chuỗi (tương tự như khi thao tác với variable fonts bằng {{cssxref("font-variation-settings")}}).

## Khám phá tính năng có sẵn trong các font

Đây đôi khi là điều khó khăn nhất cần tìm hiểu nếu bạn không có tài liệu đi kèm với các font (nhiều nhà thiết kế kiểu chữ và xưởng đúc chữ sẽ cung cấp các trang mẫu và CSS chính cho mục đích này). Nhưng có một số trang web giúp tìm hiểu dễ hơn. Bạn có thể truy cập [wakamaifondue.com](https://wakamaifondue.com/), thả tệp font của bạn vào vòng tròn theo hướng dẫn, và trong vài giây bạn sẽ có báo cáo đầy đủ về tất cả khả năng và tính năng của font. [Axis-praxis.org](https://www.axis-praxis.org/) cũng cung cấp khả năng tương tự, với khả năng nhấp vào các tính năng để bật hoặc tắt chúng trong một khối văn bản nhất định.

## Tại sao bạn nên sử dụng chúng?

Vì những tính năng này cần một chút công sức để khám phá và sử dụng, có thể đặt câu hỏi hợp lý tại sao một người lại bận tâm sử dụng chúng. Câu trả lời nằm ở các tính năng cụ thể sẽ giúp trang web hữu ích hơn, dễ đọc hơn và bóng bẩy hơn:

- **Ligature** như 'ff' hoặc 'fi' làm cho khoảng cách chữ cái và đọc đều đặn và mượt mà hơn.
- **Phân số** có thể làm cho các trang cải thiện nhà và công thức nấu ăn dễ đọc và hiểu hơn nhiều.
- **Chữ số** trong các đoạn văn bản được đặt là 'oldstyle' ngồi thoải mái hơn giữa các chữ thường, và tương tự đặt chúng là 'tabular numbers' sẽ làm cho chúng căn hàng tốt hơn khi đặt danh sách chi phí trong bảng. Mặt khác, chữ số 'lining' ngồi đồng đều hơn khi đứng riêng hoặc trước các từ viết hoa.

Mặc dù không có tính năng nào trong số này riêng lẻ sẽ làm cho trang web trở nên vô dụng do vắng mặt của chúng, nhưng mỗi tính năng lần lượt có thể làm cho trang dễ sử dụng hơn và đáng nhớ hơn nhờ sự chú ý đến chi tiết.

> Các tính năng OpenType giống như những ngăn bí mật trong font. Mở khóa chúng và bạn sẽ tìm thấy những cách làm cho font trông và hoạt động khác biệt theo những cách tinh tế và ấn tượng. Không phải tất cả các tính năng OpenType đều phù hợp để sử dụng mọi lúc, nhưng một số tính năng rất quan trọng đối với typography xuất sắc. _-- Tim Brown, Trưởng bộ phận Typography tại Adobe_.

### Đôi khi là nội dung, không chỉ là phong cách

Trong một số trường hợp — như với {{cssxref("font-variant-east-asian")}} — các tính năng OpenType gắn trực tiếp với việc sử dụng các dạng glyph khác nhau, có thể ảnh hưởng đến ý nghĩa và khả năng đọc. Trong những trường hợp như vậy, đây không chỉ là sự tiện lợi mà còn là một phần không thể thiếu của nội dung.

## Các tính năng font

Có một số tính năng khác nhau cần xem xét. Chúng được nhóm và giải thích ở đây theo các thuộc tính và tùy chọn chính được đề cập trong các đặc tả W3C.

> [!NOTE]
> Các ví dụ bên dưới hiển thị các thuộc tính và một số kết hợp ví dụ, cùng với các tương đương cú pháp cấp thấp hơn. Chúng có thể không khớp chính xác do sự không nhất quán trong triển khai trình duyệt, nhưng trong nhiều trường hợp, ví dụ đầu tiên sẽ khớp với ví dụ thứ hai. Các typeface được hiển thị là Playfair Display, Source Serif Pro, IBM Plex Serif, Dancing Script, và Kokoro (tất cả đều có sẵn và miễn phí để sử dụng, hầu hết có trên Google Fonts và các dịch vụ khác).

### Kerning

Thuộc tính CSS liên quan: {{cssxref("font-kerning")}}

Điều này đề cập đến khoảng cách giữa các cặp glyph cụ thể. Điều này thường được bật theo mặc định (theo khuyến nghị của đặc tả OpenType). Cần lưu ý rằng nếu {{cssxref("letter-spacing")}} cũng được đặt trên văn bản của bạn, nó sẽ được áp dụng sau kerning.
Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html hidden live-sample___font-kerning-example
<fieldset>
  <legend>Using <code>font-kerning</code> property</legend>
  <div class="container container1">
    <p>Puffy Pangolins</p>
  </div>
  <input type="checkbox" name="checkbox1" id="checkbox1" value="on" checked />
  <label for="checkbox1">Kerning active</label>
</fieldset>

<fieldset>
  <legend>Using <code>font-feature-settings</code> property</legend>
  <div class="container container2">
    <p>Puffy Pangolins</p>
  </div>
  <input type="checkbox" name="checkbox2" id="checkbox2" value="on" checked />
  <label for="checkbox2">Kerning active</label>
</fieldset>
```

```css hidden live-sample___font-kerning-example
@font-face {
  font-family: "Plex Serif";
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  src:
    url("https://mdn.github.io/shared-assets/fonts/plex/IBMPlexSerif-Regular.woff")
      format("woff"),
    url("https://mdn.github.io/shared-assets/fonts/plex/IBMPlexSerif-Regular.woff2")
      format("woff2");
}

body {
  font:
    1.2em "Plex Serif",
    "Times New Roman",
    serif;
  margin: 1rem;
}

fieldset {
  margin-bottom: 1rem;
}

label {
  user-select: none;
}

.container > p {
  font-size: 4rem;
  margin: 1.5rem 0;
}
```

```css live-sample___font-kerning-example
/* kerning: auto|normal|none */
.container1 * {
  font-kerning: normal;
}
.inactive.container1 * {
  font-kerning: none;
}

/* 'kern' 1|0 (on or off) */
.container2 * {
  font-feature-settings: "kern" 1;
}
.inactive.container2 * {
  font-feature-settings: "kern" 0;
}
```

```js hidden live-sample___font-kerning-example
const checkBox1 = document.getElementById("checkbox1");
const checkBox2 = document.getElementById("checkbox2");
const container1 = document.querySelector(".container1");
const container2 = document.querySelector(".container2");

const toggleInactive = (checkBox, container) => {
  if (checkBox.checked) {
    container.classList.remove("inactive");
  } else {
    container.classList.add("inactive");
  }
};

checkBox1.addEventListener("change", () => {
  toggleInactive(checkBox1, container1);
});

checkBox2.addEventListener("change", () => {
  toggleInactive(checkBox2, container2);
});
```

{{EmbedLiveSample("font-kerning-example", "", "450px")}}

### Alternates

Thuộc tính CSS liên quan: {{cssxref("font-variant-alternates")}}

Các font có thể cung cấp một số alternates khác nhau cho các glyph khác nhau, chẳng hạn như các kiểu chữ thường 'a' khác nhau hoặc các swash công phu hơn hoặc ít hơn trong một typeface script. Thuộc tính này có thể kích hoạt toàn bộ bộ alternates hoặc chỉ một cái cụ thể, tùy thuộc vào các giá trị được cung cấp. Ví dụ bên dưới cho thấy một số khía cạnh khác nhau của việc làm việc với các ký tự alternate. Các font có các glyph alternate có thể cung cấp chúng trên diện rộng hoặc riêng lẻ trong các stylistic set riêng biệt, hoặc thậm chí các ký tự riêng lẻ. Trong ví dụ này bạn có thể thấy hai typeface khác nhau, và việc giới thiệu at-rule {{cssxref("@font-feature-values")}}. Điều này được sử dụng để định nghĩa các shortcut hoặc tùy chọn được đặt tên có thể được định nghĩa cho mỗi font family. Theo cách này bạn có thể tạo một tùy chọn được đặt tên chỉ áp dụng cho một font duy nhất, hoặc một tùy chọn được chia sẻ và có thể được áp dụng rộng rãi hơn. Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html hidden live-sample___font-variant-alternates-example
<fieldset>
  <legend>Using <code>font-variant-alternates</code> property</legend>
  <div class="container container1">
    <p><span class="script">My</span> Perfidious pangram</p>
  </div>
  <input type="checkbox" name="checkbox1" id="checkbox1" value="on" checked />
  <label for="checkbox1">Alternates active</label>
</fieldset>

<fieldset>
  <legend>Using <code>font-feature-settings</code> property</legend>
  <div class="container container2">
    <p><span class="script">My</span> Perfidious pangram</p>
  </div>
  <input type="checkbox" name="checkbox2" id="checkbox2" value="on" checked />
  <label for="checkbox2">Alternates active</label>
</fieldset>
```

```css hidden live-sample___font-variant-alternates-example
@font-face {
  font-family: "Plex Serif";
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  src:
    url("https://mdn.github.io/shared-assets/fonts/plex/IBMPlexSerif-Regular.woff")
      format("woff"),
    url("https://mdn.github.io/shared-assets/fonts/plex/IBMPlexSerif-Regular.woff2")
      format("woff2");
}

@font-face {
  font-family: "Dancing Script";
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  src:
    url("https://mdn.github.io/shared-assets/fonts/dancing-script/dancing-script-regular.woff")
      format("woff"),
    url("https://mdn.github.io/shared-assets/fonts/dancing-script/dancing-script-regular.woff2")
      format("woff2");
}

body {
  font:
    1.2em "Plex Serif",
    "Times New Roman",
    serif;
  margin: 1rem;
}

.script {
  font-family: "Dancing Script", serif;
}

fieldset {
  margin-bottom: 1rem;
}

label {
  user-select: none;
}

.container > * {
  font-size: 4rem;
  margin: 1.5rem 0;
}
```

```css live-sample___font-variant-alternates-example
@font-feature-values "Plex Serif" {
  @styleset {
    alt-a: 1;
    alt-g: 2;
  }
  @stylistic {
    alternates: 1;
  }
}

@font-feature-values "Dancing Script" {
  @stylistic {
    alternates: 1;
  }
}

.container1 * {
  font-variant-alternates: styleset(alt-a);
}
.container1 .script {
  font-variant-alternates: stylistic(alternates);
}
.inactive.container1 * {
  font-variant-alternates: normal;
}

.container2 * {
  font-feature-settings: "ss01";
}
.container2 .script {
  font-feature-settings: "salt";
}
.inactive.container2 * {
  font-feature-settings:
    "ss01" 0,
    "salt" 0;
}
```

```js hidden live-sample___font-variant-alternates-example
const checkBox1 = document.getElementById("checkbox1");
const checkBox2 = document.getElementById("checkbox2");
const container1 = document.querySelector(".container1");
const container2 = document.querySelector(".container2");

const toggleInactive = (checkBox, container) => {
  if (checkBox.checked) {
    container.classList.remove("inactive");
  } else {
    container.classList.add("inactive");
  }
};

checkBox1.addEventListener("change", () => {
  toggleInactive(checkBox1, container1);
});

checkBox2.addEventListener("change", () => {
  toggleInactive(checkBox2, container2);
});
```

{{EmbedLiveSample("font-variant-alternates-example", "", "600px")}}

Trong trường hợp này, `@stylistic(alternates)` sẽ hiển thị tất cả các ký tự alternate cho một trong hai font. Áp dụng điều này chỉ cho từ 'My' làm thay đổi cách hiển thị 'M', và áp dụng `@styleset(alt-a)` chỉ thay đổi chữ thường 'a'.

Hãy thử thay đổi dòng

```css
font-variant-alternates: styleset(alt-a);
```

thành

```css
font-variant-alternates: styleset(alt-g);
```

và chú ý rằng chữ thường 'a' quay lại dạng thông thường và chữ thường 'g' thay đổi thay thế.

### Ligature

Thuộc tính CSS liên quan: {{cssxref("font-variant-ligatures")}}

Ligature là các glyph thay thế hai hoặc nhiều glyph riêng biệt để biểu diễn chúng mượt mà hơn (từ góc độ khoảng cách hoặc thẩm mỹ). Một số phổ biến nhất là các chữ cái như 'fi', 'fl', hoặc 'ffl' — nhưng có nhiều khả năng khác. Có những cái thường xuyên nhất (được gọi là common ligatures), và cũng có các danh mục chuyên biệt hơn như 'discretionary ligatures', 'historical ligatures', và 'contextual alternates'. Trong khi những cái sau này về mặt kỹ thuật không phải là ligature, chúng thường tương tự ở chỗ chúng thay thế các kết hợp chữ cái cụ thể khi chúng xuất hiện cùng nhau.

Mặc dù phổ biến hơn trong các typeface script, trong ví dụ bên dưới chúng được sử dụng để tạo mũi tên. Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html hidden live-sample___font-variant-ligatures-example
<fieldset>
  <legend>Using <code>font-variant-ligatures</code> property</legend>
  <div class="container container1">
    <p>Puffy Perfect -^ &lt;-&gt;</p>
  </div>
  <input type="checkbox" name="checkbox1" id="checkbox1" value="on" checked />
  <label for="checkbox1">Ligatures active</label>
</fieldset>

<fieldset>
  <legend>Using <code>font-feature-settings</code> property</legend>
  <div class="container container2">
    <p>Puffy Perfect -^ &lt;-&gt;</p>
  </div>
  <input type="checkbox" name="checkbox2" id="checkbox2" value="on" checked />
  <label for="checkbox2">Ligatures active</label>
</fieldset>
```

```css hidden live-sample___font-variant-ligatures-example
@font-face {
  font-family: "Playfair Display";
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  src:
    url("https://mdn.github.io/shared-assets/fonts/playfair-display/playfair-display-regular.woff")
      format("woff"),
    url("https://mdn.github.io/shared-assets/fonts/playfair-display/playfair-display-regular.woff2")
      format("woff2");
}

body {
  font:
    1.2em "Playfair Display",
    "Times New Roman",
    serif;
  margin: 1rem;
}

fieldset {
  margin-bottom: 1rem;
}

label {
  user-select: none;
}

.container > p {
  font-size: 4rem;
  margin: 1.5rem 0;
}
```

```css live-sample___font-variant-ligatures-example
.container1 * {
  font-variant-ligatures: common-ligatures discretionary-ligatures contextual;
}
.inactive.container1 * {
  font-variant-ligatures: none;
}

/* 'liga', 'dlig', 'hlig', 'calt' */
.container2 * {
  font-feature-settings: "dlig", "liga", "calt";
}
.inactive.container2 * {
  font-feature-settings:
    "dlig" 0,
    "liga" 0,
    "calt" 0;
}
```

```js hidden live-sample___font-variant-ligatures-example
const checkBox1 = document.getElementById("checkbox1");
const checkBox2 = document.getElementById("checkbox2");
const container1 = document.querySelector(".container1");
const container2 = document.querySelector(".container2");

const toggleInactive = (checkBox, container) => {
  if (checkBox.checked) {
    container.classList.remove("inactive");
  } else {
    container.classList.add("inactive");
  }
};

checkBox1.addEventListener("change", () => {
  toggleInactive(checkBox1, container1);
});

checkBox2.addEventListener("change", () => {
  toggleInactive(checkBox2, container2);
});
```

{{EmbedLiveSample("font-variant-ligatures-example", "", "550px")}}

### Position

Thuộc tính CSS liên quan: {{cssxref("font-variant-position")}}

Các biến thể position được sử dụng để bật các glyph superscript và subscript typography. Chúng được thiết kế để hoạt động với văn bản xung quanh mà không thay đổi baseline hoặc khoảng cách dòng. Điều này đặc biệt hữu ích với các phần tử {{htmlelement("sub")}} hoặc {{htmlelement("sup")}}. Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html hidden live-sample___font-variant-position-example
<fieldset>
  <legend>Using <code>font-variant-position</code> property</legend>
  <div class="container container1">
    <p>Ups<span class="super">1</span> and downs<span class="sub">2</span></p>
  </div>
  <input type="checkbox" name="checkbox1" id="checkbox1" value="on" checked />
  <label for="checkbox1">Position active</label>
</fieldset>

<fieldset>
  <legend>Using <code>font-feature-settings</code> property</legend>
  <div class="container container2">
    <p>Ups<span class="super">1</span> and downs<span class="sub">2</span></p>
  </div>
  <input type="checkbox" name="checkbox2" id="checkbox2" value="on" checked />
  <label for="checkbox2">Position active</label>
</fieldset>
```

```css hidden live-sample___font-variant-position-example
@font-face {
  font-family: "Playfair Display";
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  src:
    url("https://mdn.github.io/shared-assets/fonts/playfair-display/playfair-display-regular.woff")
      format("woff"),
    url("https://mdn.github.io/shared-assets/fonts/playfair-display/playfair-display-regular.woff2")
      format("woff2");
}

body {
  font:
    1.2em "Playfair Display",
    "Times New Roman",
    serif;
  margin: 1rem;
}

fieldset {
  margin-bottom: 1rem;
}

label {
  user-select: none;
}

.container > p {
  font-size: 4rem;
  margin: 1.5rem 0;
}
```

```css live-sample___font-variant-position-example
/* position: normal|sub|super */
.container1 .super {
  font-variant-position: super;
}
.container1 .sub {
  font-variant-position: sub;
}
.inactive.container1 * {
  font-variant-position: normal;
}

/* 'subs', 'sups' */
.container2 .super {
  font-feature-settings: "sups";
}
.container2 .sub {
  font-feature-settings: "subs";
}
.inactive.container2 * {
  font-feature-settings:
    "sups" 0,
    "subs" 0;
}
```

```js hidden live-sample___font-variant-position-example
const checkBox1 = document.getElementById("checkbox1");
const checkBox2 = document.getElementById("checkbox2");
const container1 = document.querySelector(".container1");
const container2 = document.querySelector(".container2");

const toggleInactive = (checkBox, container) => {
  if (checkBox.checked) {
    container.classList.remove("inactive");
  } else {
    container.classList.add("inactive");
  }
};

checkBox1.addEventListener("change", () => {
  toggleInactive(checkBox1, container1);
});

checkBox2.addEventListener("change", () => {
  toggleInactive(checkBox2, container2);
});
```

{{EmbedLiveSample("font-variant-position-example", "", "550px")}}

### Chữ hoa

Thuộc tính CSS liên quan: {{cssxref("font-variant-caps")}}

Một trong những trường hợp sử dụng phổ biến hơn cho các tính năng OpenType là small caps đúng cách. Đây là các chữ hoa có kích thước phù hợp hơn giữa các chữ thường và thường được sử dụng cho các từ viết tắt và chữ viết tắt. Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html hidden live-sample___font-variant-caps-example
<fieldset>
  <legend>Using <code>font-variant-caps</code> property</legend>
  <div class="container container1">
    <p>
      <span class="small-caps">Small Caps</span> and
      <span class="all-small-caps">All Small Caps</span>
    </p>
  </div>
  <input type="checkbox" name="checkbox1" id="checkbox1" value="on" checked />
  <label for="checkbox1">Caps active</label>
</fieldset>

<fieldset>
  <legend>Using <code>font-feature-settings</code> property</legend>
  <div class="container container2">
    <p>
      <span class="small-caps">Small Caps</span> and
      <span class="all-small-caps">All Small Caps</span>
    </p>
  </div>
  <input type="checkbox" name="checkbox2" id="checkbox2" value="on" checked />
  <label for="checkbox2">Caps active</label>
</fieldset>
```

```css hidden live-sample___font-variant-caps-example
@font-face {
  font-family: "Playfair Display";
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  src:
    url("https://mdn.github.io/shared-assets/fonts/playfair-display/playfair-display-regular.woff")
      format("woff"),
    url("https://mdn.github.io/shared-assets/fonts/playfair-display/playfair-display-regular.woff2")
      format("woff2");
}

body {
  font:
    1.2em "Playfair Display",
    "Times New Roman",
    serif;
  margin: 1rem;
}

fieldset {
  margin-bottom: 1rem;
}

label {
  user-select: none;
}

.container > p {
  font-size: 4rem;
  margin: 1.5rem 0;
}
```

```css live-sample___font-variant-caps-example
/* position: normal | small-caps | all-small-caps | petite-caps | all-petite-caps | unicase | titling-caps */
.container1 .small-caps {
  font-variant-caps: small-caps;
}
.container1 .all-small-caps {
  font-variant-caps: all-small-caps;
}
.inactive.container1 * {
  font-variant-caps: normal;
}

/* 'smcp', 'c2sc' */
.container2 .small-caps {
  font-feature-settings: "smcp" 1;
}
.container2 .all-small-caps {
  font-feature-settings:
    "c2sc" 1,
    "smcp" 1;
}
.inactive.container2 * {
  font-feature-settings:
    "smcp" 0,
    "c2sc" 0;
}
```

```js hidden live-sample___font-variant-caps-example
const checkBox1 = document.getElementById("checkbox1");
const checkBox2 = document.getElementById("checkbox2");
const container1 = document.querySelector(".container1");
const container2 = document.querySelector(".container2");

const toggleInactive = (checkBox, container) => {
  if (checkBox.checked) {
    container.classList.remove("inactive");
  } else {
    container.classList.add("inactive");
  }
};

checkBox1.addEventListener("change", () => {
  toggleInactive(checkBox1, container1);
});

checkBox2.addEventListener("change", () => {
  toggleInactive(checkBox2, container2);
});
```

{{EmbedLiveSample("font-variant-caps-example", "", "700px")}}

### Chữ số

Thuộc tính CSS liên quan: {{cssxref("font-variant-numeric")}}

Có một số kiểu chữ số khác nhau thường được bao gồm trong các font:

- Chữ số 'Lining' đều có cùng chiều cao và trên cùng baseline.
- Chữ số 'Oldstyle' có chiều cao hỗn hợp và được thiết kế để có vẻ ngoài của các ascender và descender giống như các chữ thường khác. Chúng được thiết kế để sử dụng inline với văn bản để các chữ số hòa hợp trực quan với các glyph xung quanh theo cách tương tự như small caps.

Cũng có khái niệm về khoảng cách. Khoảng cách tỷ lệ là cài đặt thông thường, trong khi khoảng cách tabular căn chỉnh các chữ số đều nhau bất kể chiều rộng ký tự, làm cho nó phù hợp hơn để căn hàng các bảng số trong các bảng tài chính.

Có hai loại phân số được hỗ trợ thông qua thuộc tính này:

- Phân số gạch chéo theo đường chéo.
- Phân số xếp theo chiều dọc.

Ordinals cũng được hỗ trợ (như '1st' hoặc '3rd'), cũng như số không có gạch nếu có trong font.

#### Lining và old-style figures

Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html hidden live-sample___font-variant-numeric-example
<fieldset>
  <legend>Using <code>font-variant-numeric</code> property</legend>
  <div class="container container1">
    <p>
      <span class="lining">6,142</span> or <span class="oldstyle">6,142</span>
    </p>
  </div>
  <input type="checkbox" name="checkbox1" id="checkbox1" value="on" checked />
  <label for="checkbox1">Numeric active</label>
</fieldset>

<fieldset>
  <legend>Using <code>font-feature-settings</code> property</legend>
  <div class="container container2">
    <p>
      <span class="lining">6,142</span> or <span class="oldstyle">6,142</span>
    </p>
  </div>
  <input type="checkbox" name="checkbox2" id="checkbox2" value="on" checked />
  <label for="checkbox2">Numeric active</label>
</fieldset>
```

```css hidden live-sample___font-variant-numeric-example
@font-face {
  font-family: "Source Serif";
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  src:
    url("https://mdn.github.io/shared-assets/fonts/source-serif/SourceSerifPro-Regular.ttf.woff")
      format("woff"),
    url("https://mdn.github.io/shared-assets/fonts/source-serif/SourceSerifPro-Regular.ttf.woff2")
      format("woff2");
}

body {
  font:
    1.2em "Source Serif",
    "Times New Roman",
    serif;
  margin: 20px;
  padding: 0;
}

fieldset {
  margin-bottom: 1rem;
}

label {
  user-select: none;
}

.container > p {
  font-size: 4rem;
  margin: 1.5rem 0;
}
```

```css live-sample___font-variant-numeric-example
.container1 .lining {
  font-variant-numeric: lining-nums;
}
.container1 .oldstyle {
  font-variant-numeric: oldstyle-nums;
}
.inactive.container1 * {
  font-variant-numeric: normal;
}

.container2 .lining {
  font-feature-settings: "lnum" 1;
}
.container2 .oldstyle {
  font-feature-settings: "onum" 1;
}
.inactive.container2 * {
  font-feature-settings:
    "lnum" 0,
    "onum" 0;
}
```

```js hidden live-sample___font-variant-numeric-example
const checkBox1 = document.getElementById("checkbox1");
const checkBox2 = document.getElementById("checkbox2");
const container1 = document.querySelector(".container1");
const container2 = document.querySelector(".container2");

const toggleInactive = (checkBox, container) => {
  if (checkBox.checked) {
    container.classList.remove("inactive");
  } else {
    container.classList.add("inactive");
  }
};

checkBox1.addEventListener("change", () => {
  toggleInactive(checkBox1, container1);
});

checkBox2.addEventListener("change", () => {
  toggleInactive(checkBox2, container2);
});
```

{{EmbedLiveSample("font-variant-numeric-example", "", "550px")}}

#### Phân số, ordinals và số không có gạch chéo

Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html hidden live-sample___font-variant-numeric-frac-example
<fieldset>
  <legend>Using <code>font-variant-numeric</code> property</legend>
  <div class="container container1">
    <p>
      <span class="diagonal-fractions">3/16</span>, or
      <span class="ordinal">1st</span> of <span class="zero">0</span>
    </p>
  </div>
  <input type="checkbox" name="checkbox1" id="checkbox1" value="on" checked />
  <label for="checkbox1">Numeric active</label>
</fieldset>

<fieldset>
  <legend>Using <code>font-feature-settings</code> property</legend>
  <div class="container container2">
    <p>
      <span class="diagonal-fractions">3/16</span>, or
      <span class="ordinal">1st</span> of <span class="zero">0</span>
    </p>
  </div>
  <input type="checkbox" name="checkbox2" id="checkbox2" value="on" checked />
  <label for="checkbox2">Numeric active</label>
</fieldset>
```

```css hidden live-sample___font-variant-numeric-frac-example
@font-face {
  font-family: "Source Serif";
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  src:
    url("https://mdn.github.io/shared-assets/fonts/source-serif/SourceSerifPro-Regular.ttf.woff")
      format("woff"),
    url("https://mdn.github.io/shared-assets/fonts/source-serif/SourceSerifPro-Regular.ttf.woff2")
      format("woff2");
}

body {
  font:
    1.2em "Source Serif",
    "Times New Roman",
    serif;
  margin: 20px;
  padding: 0;
}

fieldset {
  margin-bottom: 1rem;
}

label {
  user-select: none;
}

.container > p {
  font-size: 4rem;
  margin: 1.5rem 0;
}
```

```css live-sample___font-variant-numeric-frac-example
.container1 .diagonal-fractions {
  font-variant-numeric: diagonal-fractions;
}
.container1 .ordinal {
  font-variant-numeric: ordinal;
}
.container1 .zero {
  font-variant-numeric: slashed-zero;
}
.inactive.container1 * {
  font-variant-numeric: normal;
}

.container2 .diagonal-fractions {
  font-feature-settings: "frac" 1;
}
.container2 .ordinal {
  font-feature-settings: "ordn" 1;
}
.container2 .zero {
  font-feature-settings: "zero" 1;
}
.inactive.container2 * {
  font-feature-settings:
    "frac" 0,
    "ordn" 0,
    "zero" 0;
}
```

```js hidden live-sample___font-variant-numeric-frac-example
const checkBox1 = document.getElementById("checkbox1");
const checkBox2 = document.getElementById("checkbox2");
const container1 = document.querySelector(".container1");
const container2 = document.querySelector(".container2");

const toggleInactive = (checkBox, container) => {
  if (checkBox.checked) {
    container.classList.remove("inactive");
  } else {
    container.classList.add("inactive");
  }
};

checkBox1.addEventListener("change", () => {
  toggleInactive(checkBox1, container1);
});

checkBox2.addEventListener("change", () => {
  toggleInactive(checkBox2, container2);
});
```

{{EmbedLiveSample("font-variant-numeric-frac-example", "", "550px")}}

### Đông Á

Thuộc tính CSS liên quan: {{cssxref("font-variant-east-asian")}}

Điều này cho phép truy cập các dạng alternate khác nhau của các glyph trong font. Ví dụ bên dưới hiển thị một chuỗi glyph thông thường. Bỏ chọn hộp bên dưới và bạn sẽ thấy các ký tự chỉ có glyph `jis78`. Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html hidden live-sample___font-variant-east-asian-example
<fieldset>
  <legend>Using <code>font-variant-numeric</code> property</legend>
  <div class="container container1">
    <p>唖 芦 溢 茨 鰯 嘘 欝 厩 噂</p>
  </div>
  <input type="checkbox" name="checkbox1" id="checkbox1" value="on" checked />
  <label for="checkbox1">Features disabled</label>
</fieldset>

<fieldset>
  <legend>Using <code>font-feature-settings</code> property</legend>
  <div class="container container2">
    <p>唖 芦 溢 茨 鰯 嘘 欝 厩 噂</p>
  </div>
  <input type="checkbox" name="checkbox2" id="checkbox2" value="on" checked />
  <label for="checkbox2">Features disabled</label>
</fieldset>
```

```css hidden live-sample___font-variant-east-asian-example
@font-face {
  font-family: "Kokoro";
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  src: url("https://mdn.github.io/shared-assets/fonts/kokoro/Kokoro.woff2")
    format("woff2");
}

body {
  font:
    1.2em "Kokoro",
    "Times New Roman",
    serif;
  margin: 20px;
  padding: 0;
}

fieldset {
  margin-bottom: 1rem;
}

label {
  user-select: none;
}

.container > p {
  font-size: 4rem;
  margin: 1.5rem 0;
}
```

```css live-sample___font-variant-east-asian-example
.container1 * {
  font-variant-east-asian: normal;
}
.inactive.container1 * {
  font-variant-east-asian: jis78;
}

.container2 * {
  font-feature-settings: "jp78" 0;
}
.inactive.container2 * {
  font-feature-settings: "jp78";
}
```

```js hidden live-sample___font-variant-east-asian-example
const checkBox1 = document.getElementById("checkbox1");
const checkBox2 = document.getElementById("checkbox2");
const container1 = document.querySelector(".container1");
const container2 = document.querySelector(".container2");

const toggleInactive = (checkBox, container) => {
  if (checkBox.checked) {
    container.classList.remove("inactive");
  } else {
    container.classList.add("inactive");
  }
};

checkBox1.addEventListener("change", () => {
  toggleInactive(checkBox1, container1);
});

checkBox2.addEventListener("change", () => {
  toggleInactive(checkBox2, container2);
});
```

{{EmbedLiveSample("font-variant-east-asian-example", "", "750px")}}

> [!NOTE]
> Các glyph này được sao chép từ mẫu font và không có mục đích là văn xuôi.

### Dạng viết tắt font variant

Thuộc tính {{Cssxref("font-variant")}} là cú pháp viết tắt để định nghĩa tất cả những điều trên. Đặt giá trị `normal` đặt lại tất cả thuộc tính về giá trị khởi tạo. Đặt giá trị `none` đặt `font-variant-ligatures` thành none và tất cả các thuộc tính khác về giá trị khởi tạo. Có nghĩa là nếu kerning được bật theo mặc định, nó vẫn sẽ được bật ngay cả khi giá trị `none` được cung cấp ở đây. Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html hidden live-sample___font-variant-example
<fieldset>
  <legend>Using <code>font-variant</code> property</legend>
  <div class="container container1">
    <p>Spiffy Plastic -> 3/4 time</p>
  </div>
  <input type="checkbox" name="checkbox1" id="checkbox1" value="on" checked />
  <label for="checkbox1">Features active</label>
</fieldset>

<fieldset>
  <legend>Using <code>font-feature-settings</code> property</legend>
  <div class="container container2">
    <p>Spiffy Plastic -> 3/4 time</p>
  </div>
  <input type="checkbox" name="checkbox2" id="checkbox2" value="on" checked />
  <label for="checkbox2">Features active</label>
</fieldset>
```

```css hidden live-sample___font-variant-example
@font-face {
  font-family: "Playfair Display";
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  src:
    url("https://mdn.github.io/shared-assets/fonts/playfair-display/playfair-display-regular.woff")
      format("woff"),
    url("https://mdn.github.io/shared-assets/fonts/playfair-display/playfair-display-regular.woff2")
      format("woff2");
}

body {
  font:
    1.2em "Playfair Display",
    "Times New Roman",
    serif;
  margin: 20px;
  padding: 0;
}

fieldset {
  margin-bottom: 1rem;
}

label {
  user-select: none;
}

.container > p {
  font-size: 4rem;
  margin: 1.5rem 0;
}
```

```css live-sample___font-variant-example
.container1 * {
  font-variant: common-ligatures discretionary-ligatures contextual
    diagonal-fractions;
}
.inactive.container1 * {
  font-variant: none;
}

.container2 * {
  font-feature-settings: "dlig", "liga", "calt", "frac";
}
.inactive.container2 * {
  font-feature-settings:
    "dlig" 0,
    "liga" 0,
    "calt" 0,
    "frac" 0;
}
```

```js hidden live-sample___font-variant-example
const checkBox1 = document.getElementById("checkbox1");
const checkBox2 = document.getElementById("checkbox2");
const container1 = document.querySelector(".container1");
const container2 = document.querySelector(".container2");

const toggleInactive = (checkBox, container) => {
  if (checkBox.checked) {
    container.classList.remove("inactive");
  } else {
    container.classList.add("inactive");
  }
};

checkBox1.addEventListener("change", () => {
  toggleInactive(checkBox1, container1);
});

checkBox2.addEventListener("change", () => {
  toggleInactive(checkBox2, container2);
});
```

{{EmbedLiveSample("font-variant-example", "", "700px")}}

## Font feature settings

{{cssxref("font-feature-settings")}} là 'cú pháp cấp thấp' cho phép truy cập rõ ràng vào mọi tính năng OpenType có tên sẵn có. Điều này cung cấp nhiều quyền kiểm soát nhưng có một số nhược điểm về cách nó ảnh hưởng đến kế thừa và — như đã đề cập ở trên — nếu bạn muốn thay đổi một cài đặt, bạn phải khai báo lại toàn bộ chuỗi (trừ khi bạn đang sử dụng [CSS custom properties](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) để đặt các giá trị). Vì lý do này, tốt nhất là sử dụng các thuộc tính tiêu chuẩn được hiển thị ở trên bất cứ khi nào có thể.

Có rất nhiều tính năng có thể. Bạn có thể thấy ví dụ về một số trong số chúng ở trên, và có một số tài nguyên để tìm thêm về chúng.

Cú pháp chung trông như thế này:

```css
.small-caps {
  font-feature-settings: "smcp", "c2sc";
}
```

Theo đặc tả, bạn có thể cung cấp chỉ mã tính năng 4 ký tự hoặc cung cấp số 1 theo sau mã (để bật tính năng đó) hoặc số 0 (không) để tắt nó. Điều này hữu ích nếu bạn có tính năng như ligatures được bật theo mặc định nhưng bạn muốn tắt chúng như sau:

```css
.no-ligatures {
  font-feature-settings:
    "liga" 0,
    "dlig" 0;
}
```

### Thêm về mã font-feature-settings

- ['The Complete CSS Demo for OpenType Features'](https://sparanoid.com/lab/opentype-features/) (không thể đảm bảo tính đúng đắn của tên, nhưng khá toàn diện)
- [Danh sách các tính năng OpenType trên Wikipedia](https://en.wikipedia.org/wiki/List_of_typographic_features)

## Sử dụng CSS feature detection để triển khai

Vì không phải tất cả các thuộc tính đều được triển khai đồng đều, nên thực tiễn tốt là thiết lập CSS của bạn bằng cách sử dụng feature detection để tận dụng các thuộc tính đúng, với {{cssxref("font-feature-settings")}} là phương án dự phòng.

Ví dụ, small caps có thể được đặt theo một số cách, nhưng nếu bạn muốn đảm bảo rằng bất kể viết hoa cơ bản là gì, bạn kết thúc với tất cả mọi thứ trong small caps, nó đòi hỏi 2 cài đặt với `font-feature-settings` so với một giá trị thuộc tính duy nhất sử dụng {{cssxref("font-variant-caps")}}.

```css
.small-caps {
  font-feature-settings: "smcp", "c2sc";
}

@supports (font-variant-caps: all-small-caps) {
  .small-caps {
    font-feature-settings: normal;
    font-variant-caps: all-small-caps;
  }
}
```

## Xem thêm

### Demo các tính năng CSS OpenType trong CSS

- [The Complete CSS Demo for OpenType Features](https://sparanoid.com/lab/opentype-features/)

### Công cụ phân tích web font

- [Wakamai Fondue](https://wakamaifondue.com/)
- [Axis Praxis](https://www.axis-praxis.org/)

### Đặc tả W3C

- [Font Feature Properties in CSS Fonts Module Level 3](https://drafts.csswg.org/css-fonts-3/#font-rend-props)
- [font-variant-alternatives in CSS Fonts Module Level 4](https://drafts.csswg.org/css-fonts-4/#propdef-font-variant-alternates)

### Tài nguyên khác

- [Using OpenType features](https://helpx.adobe.com/fonts/using/use-open-type-features.html) by Tim Brown, Head of Typography, Adobe
- [Adobe's Syntax for OpenType features in CSS](https://helpx.adobe.com/fonts/using/open-type-syntax.html)
