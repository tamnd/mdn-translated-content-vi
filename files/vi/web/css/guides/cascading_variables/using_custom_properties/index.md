---
title: Using CSS custom properties (variables)
short-title: Using custom properties
slug: Web/CSS/Guides/Cascading_variables/Using_custom_properties
page-type: guide
sidebar: cssref
---

**Custom properties** (đôi khi được gọi là **biến CSS** hoặc **cascading variables**) là các thực thể được tác giả CSS định nghĩa để đại diện cho các giá trị cụ thể được tái sử dụng trong tài liệu. Chúng được đặt bằng at-rule {{cssxref("@property")}} hoặc bằng [cú pháp custom property](/en-US/docs/Web/CSS/Reference/Properties/--*) (ví dụ: **`--primary-color: blue;`**). Custom properties được truy cập bằng hàm CSS {{cssxref("var()")}} (ví dụ: **`color: var(--primary-color);`**).

Các trang web phức tạp có lượng CSS rất lớn, và điều này thường dẫn đến nhiều giá trị CSS bị lặp lại. Ví dụ, việc thấy cùng một màu được sử dụng ở hàng trăm nơi khác nhau trong stylesheet là điều phổ biến. Việc thay đổi một màu đã được sao chép ở nhiều nơi đòi hỏi tìm kiếm và thay thế trên tất cả các quy tắc và tệp CSS. Custom properties cho phép một giá trị được định nghĩa ở một nơi, sau đó được tham chiếu ở nhiều nơi khác để dễ làm việc hơn. Một lợi ích khác là khả năng đọc và ngữ nghĩa. Ví dụ, `--main-text-color` dễ hiểu hơn màu hex `#00ff00`, đặc biệt nếu màu được sử dụng trong các ngữ cảnh khác nhau.

Custom properties được định nghĩa [bằng hai dấu gạch ngang (`--`)](/en-US/docs/Web/CSS/Reference/Properties/--*) tuân theo [cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) và kế thừa giá trị từ phần tử cha.
At-rule {{cssxref("@property")}} cho phép kiểm soát nhiều hơn đối với custom property và cho phép bạn chỉ định liệu nó có kế thừa giá trị từ cha hay không, giá trị ban đầu là gì và các ràng buộc kiểu nên áp dụng.

> [!NOTE]
> Biến không hoạt động bên trong media query và container query.
> Bạn có thể sử dụng hàm {{cssxref("var()")}} trong bất kỳ phần nào của giá trị trong bất kỳ thuộc tính nào trên một phần tử.
> Bạn không thể sử dụng {{cssxref("var()")}} cho tên thuộc tính, selector hoặc bất kỳ thứ gì ngoài giá trị thuộc tính, có nghĩa là bạn không thể sử dụng nó trong media query hoặc container query.

## Khai báo custom properties

Trong CSS, bạn có thể khai báo custom property bằng hai dấu gạch ngang làm tiền tố cho tên thuộc tính, hoặc bằng cách sử dụng at-rule {{cssxref("@property")}}.
Các phần sau mô tả cách sử dụng hai phương pháp này.

### Sử dụng tiền tố hai dấu gạch ngang (`--`)

Custom property có tiền tố hai dấu gạch ngang bắt đầu bằng `--`, theo sau là tên thuộc tính (ví dụ: `--my-property`), và một giá trị thuộc tính có thể là bất kỳ [giá trị CSS hợp lệ](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units) nào.
Giống như bất kỳ thuộc tính nào khác, điều này được viết bên trong một ruleset.
Ví dụ sau đây cho thấy cách tạo custom property `--main-bg-color` và sử dụng giá trị {{cssxref("named-color")}} là `brown`:

```css
section {
  --main-bg-color: brown;
}
```

Selector được đưa cho ruleset (các phần tử [`<section>`](/en-US/docs/Web/HTML/Reference/Elements/section) trong ví dụ trên) xác định phạm vi mà custom property có thể được sử dụng.
Vì lý do này, một thực hành phổ biến là định nghĩa custom properties trên pseudo-class {{cssxref(":root")}}, để nó có thể được tham chiếu toàn cục:

```css
:root {
  --main-bg-color: brown;
}
```

Điều này không nhất thiết phải như vậy: bạn có thể có lý do tốt để giới hạn phạm vi của custom properties.

> [!NOTE]
> Tên custom property phân biệt chữ hoa chữ thường — `--my-color` sẽ được coi là custom property riêng biệt so với `--My-color`.

### Sử dụng at-rule `@property`

At-rule {{cssxref("@property")}} cho phép bạn thể hiện rõ ràng hơn trong định nghĩa custom property với khả năng liên kết kiểu với thuộc tính, đặt giá trị mặc định và kiểm soát kế thừa.
Ví dụ sau tạo custom property tên `--logo-color` yêu cầu một {{cssxref("&lt;color&gt;")}}:

```css
@property --logo-color {
  syntax: "<color>";
  inherits: false;
  initial-value: #c0ffee;
}
```

Nếu bạn muốn định nghĩa hoặc làm việc với custom properties trong JavaScript thay vì trực tiếp trong CSS, có một API tương ứng cho mục đích này.
Bạn có thể đọc về cách hoạt động trong trang [CSS Properties and Values API](/en-US/docs/Web/API/CSS_Properties_and_Values_API).

### Tham chiếu custom properties với `var()`

Bất kể phương pháp bạn chọn để định nghĩa custom property, bạn sử dụng chúng bằng cách tham chiếu thuộc tính trong hàm {{cssxref("var()")}} thay cho giá trị thuộc tính chuẩn:

```css
details {
  background-color: var(--main-bg-color);
}
```

## Những bước đầu tiên với custom properties

Hãy bắt đầu với một số HTML mà chúng ta muốn áp dụng một số style.
Có một `<div>` hoạt động như container bao gồm một số phần tử con, một số có phần tử lồng nhau:

```html
<div class="container">
  <div class="one">
    <p>One</p>
  </div>
  <div class="two">
    <p>Two</p>
    <div class="three">
      <p>Three</p>
    </div>
  </div>
  <input class="four" placeholder="Four" />
  <textarea class="five">Five</textarea>
</div>
```

Chúng ta sẽ sử dụng CSS sau để tạo kiểu cho một số phần tử khác nhau dựa trên class của chúng (một số quy tắc bố cục không được hiển thị bên dưới để chúng ta có thể tập trung vào màu sắc).
Tùy thuộc vào class, chúng ta đang cho các phần tử màu nền `teal` hoặc `pink`:

```css hidden
/* Set fonts, borders and padding */
body,
textarea,
::placeholder {
  font-family: sans-serif;
  color: white;
}

div,
input,
textarea {
  border: 2px black solid;
  padding: 4px;
  margin: 4px;
}

.container {
  display: grid;
  gap: 10px;
}
```

```css
/* For each class, set some colors */
.one {
  background-color: teal;
}

.two {
  color: black;
  background-color: pink;
}

.three {
  color: white;
  background-color: teal;
}

.four {
  background-color: teal;
}

.five {
  background-color: teal;
}
```

Điều này tạo ra kết quả sau:

{{EmbedLiveSample("First_steps_with_custom_properties",600,360)}}

Có cơ hội sử dụng custom properties để thay thế các giá trị lặp lại trong các quy tắc này.
Sau khi định nghĩa `--main-bg-color` trong phạm vi `.container` và tham chiếu giá trị của nó ở nhiều nơi, các style được cập nhật trông như thế này:

```css
/* Define --main-bg-color here */
.container {
  --main-bg-color: teal;
}

/* For each class, set some colors */
.one {
  background-color: var(--main-bg-color);
}

.two {
  color: black;
  background-color: pink;
}

.three {
  color: white;
  background-color: var(--main-bg-color);
}

.four {
  background-color: var(--main-bg-color);
}

.five {
  background-color: var(--main-bg-color);
}
```

## Sử dụng pseudo-class :root

Đối với một số khai báo CSS, có thể khai báo điều này cao hơn trong cascade và để CSS inheritance giải quyết vấn đề này. Đối với các dự án không tầm thường, điều này không phải lúc nào cũng có thể. Bằng cách khai báo custom property trên pseudo-class {{cssxref(":root")}} và sử dụng nó ở nơi cần thiết trong tài liệu, tác giả CSS có thể giảm bớt sự cần thiết phải lặp lại:

```css
/* Define --main-bg-color here */
:root {
  --main-bg-color: teal;
}

/* For each class, set some colors */
.one,
.three,
.four,
.five {
  background-color: var(--main-bg-color);
}

.two {
  color: black;
  background-color: pink;
}
```

Điều này dẫn đến kết quả tương tự như ví dụ trước, nhưng cho phép một khai báo chuẩn của giá trị thuộc tính mong muốn (`--main-bg-color: teal;`), rất hữu ích nếu bạn muốn thay đổi giá trị trên toàn bộ dự án sau này.

## Kế thừa của custom properties

Custom property được định nghĩa bằng hai dấu gạch ngang `--` thay vì `@property` luôn kế thừa giá trị từ phần tử cha.
Điều này được minh họa trong ví dụ sau:

```html live-sample___dash-custom-property-inheritance
<div class="one">
  <p>One</p>
  <div class="two">
    <p>Two</p>
    <div class="three"><p>Three</p></div>
    <div class="four"><p>Four</p></div>
  </div>
</div>
```

```css hidden live-sample___dash-custom-property-inheritance
div {
  color: black;
  font-family: sans-serif;
  width: 75%;
  height: 80%;
  margin: 4px;
  border: 2px black solid;
  display: inline-block;
}

p {
  margin: 0;
}

.one {
  height: 250px;
}

.two {
  color: white;
  height: 80%;
}

.three {
  color: black;
  height: 40%;
}

.four {
  color: white;
  height: 40%;
}
```

```css live-sample___dash-custom-property-inheritance
div {
  background-color: var(--box-color);
}

.two {
  --box-color: teal;
}

.three {
  --box-color: pink;
}
```

{{embedlivesample("dash-custom-property-inheritance", "100%", "280px")}}

Kết quả của `var(--box-color)` phụ thuộc vào kế thừa như sau:

- `class="one"`: _giá trị không hợp lệ_, là giá trị mặc định của custom property được định nghĩa theo cách này
- `class="two"`: `teal`
- `class="three"`: `pink`
- `class="four"`: `teal` (kế thừa từ phần tử cha)

Một khía cạnh của custom properties mà các ví dụ trên minh họa là chúng không hoạt động hoàn toàn giống như biến trong các ngôn ngữ lập trình khác.
Giá trị được tính toán nơi nó cần thiết, không được lưu trữ và tái sử dụng ở các nơi khác trong stylesheet.
Ví dụ, bạn không thể đặt giá trị của một thuộc tính và mong đợi truy xuất giá trị trong quy tắc descendant của một phần tử anh em.
Thuộc tính chỉ được đặt cho selector phù hợp và các descendant của nó.

### Sử dụng `@property` để kiểm soát kế thừa

At-rule `@property` cho phép bạn chỉ định rõ ràng liệu thuộc tính có kế thừa hay không.
Ví dụ sau tạo custom property bằng at-rule `@property`.
Kế thừa bị tắt, có kiểu dữ liệu {{cssxref("&lt;color&gt;")}} được định nghĩa và giá trị ban đầu là `teal`.

Phần tử cha đặt `--box-color` thành giá trị `green` và sử dụng `--box-color` làm giá trị cho màu nền của nó.
Phần tử con cũng sử dụng `background-color: var(--box-color)`, và chúng ta sẽ mong đợi nó có màu `green` nếu kế thừa được bật (hoặc nếu nó được định nghĩa bằng cú pháp hai dấu gạch ngang).

```html live-sample___at-property-inheritance
<div class="parent">
  <p>Parent element</p>
  <div class="child">
    <p>Child element with inheritance disabled for --box-color.</p>
  </div>
</div>
```

```css hidden live-sample___at-property-inheritance
div {
  color: white;
  font-family: sans-serif;
  width: 200px;
  height: 200px;
  margin: 4px;
  padding: 8px;
  border: 2px black solid;
  display: inline-block;
}
```

```css live-sample___at-property-inheritance
@property --box-color {
  syntax: "<color>";
  inherits: false;
  initial-value: teal;
}

.parent {
  --box-color: green;
  background-color: var(--box-color);
}

.child {
  width: 80%;
  height: 40%;
  background-color: var(--box-color);
}
```

Vì `inherits: false;` được đặt trong at-rule, và một giá trị cho thuộc tính `--box-color` không được khai báo trong phạm vi `.child`, giá trị ban đầu là `teal` được sử dụng thay vì `green` lẽ ra đã được kế thừa từ cha:

{{embedlivesample("at-property-inheritance", "100%", "250px")}}

## Giá trị fallback của custom property

Bạn có thể định nghĩa giá trị fallback cho custom properties bằng hàm `var()` và `initial-value` của at-rule `@property`.

> [!NOTE]
> Giá trị fallback không được sử dụng để khắc phục sự cố tương thích khi CSS custom properties không được hỗ trợ, vì giá trị fallback sẽ không giúp ích trong trường hợp này.
> Fallback bao gồm trường hợp trình duyệt hỗ trợ CSS custom properties và có thể sử dụng giá trị khác nếu biến mong muốn chưa được định nghĩa hoặc có giá trị không hợp lệ.

### Định nghĩa fallback trong hàm `var()`

Sử dụng hàm [`var()`](/en-US/docs/Web/CSS/Reference/Values/var), bạn có thể định nghĩa nhiều **giá trị fallback** khi biến đã cho chưa được định nghĩa; điều này có thể hữu ích khi làm việc với [Custom Elements](/en-US/docs/Web/API/Web_components/Using_custom_elements) và [Shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM).

Đối số đầu tiên của hàm là tên của custom property. Đối số thứ hai của hàm là giá trị fallback tùy chọn, được sử dụng làm giá trị thay thế khi custom property được tham chiếu không hợp lệ.
Hàm chấp nhận hai tham số, gán mọi thứ sau dấu phẩy đầu tiên làm tham số thứ hai. Nếu tham số thứ hai không hợp lệ, fallback sẽ thất bại. Ví dụ:

```css
.one {
  /* Red if --my-var is not defined */
  color: var(--my-var, red);
}

.two {
  /* pink if --my-var and --my-background are not defined */
  color: var(--my-var, var(--my-background, pink));
}

.three {
  /* Invalid: "--my-background, pink" */
  color: var(--my-var, --my-background, pink);
}
```

Bao gồm custom property làm fallback, như đã thấy trong ví dụ thứ hai ở trên (`var(--my-var, var(--my-background, pink))`), là cách đúng để cung cấp nhiều hơn một fallback với `var()`.
Tuy nhiên, bạn nên lưu ý về tác động hiệu năng của phương pháp này, vì nó mất nhiều thời gian hơn để phân tích qua các biến lồng nhau.

> [!NOTE]
> Cú pháp của fallback, giống như custom properties, cho phép dấu phẩy. Ví dụ, `var(--foo, red, blue)` định nghĩa fallback là `red, blue` — bất kỳ thứ gì giữa dấu phẩy đầu tiên và cuối hàm được coi là giá trị fallback.

### Fallback sử dụng giá trị ban đầu của `@property`

Ngoài việc sử dụng `var()`, `initial-value` được định nghĩa trong at-rule `@property` có thể được sử dụng như một cơ chế fallback.
Thực ra, chúng ta đã thấy điều này trong phần [kế thừa `@property`](#sử_dụng_property_để_kiểm_soát_kế_thừa).

<!-- cSpell:ignore peenk -->

Ví dụ sau đặt giá trị ban đầu của `--box-color` thành `teal` bằng at-rule `@property`.
Trong ruleset theo sau at-rule, chúng ta muốn đặt `--box-color` thành `pink`, nhưng có lỗi đánh máy trong tên giá trị.
Điều tương tự đúng với `<div>` thứ ba nơi chúng ta đã sử dụng `2rem` cho custom property đang mong đợi giá trị [`<color>` hợp lệ](/en-US/docs/Web/CSS/Reference/Values/color_value).
Cả `2rem` và `peenk` đều là giá trị màu không hợp lệ, vì vậy giá trị ban đầu là `teal` được áp dụng:

```css live-sample___at-property-initial-value
@property --box-color {
  syntax: "<color>";
  initial-value: teal;
  inherits: false;
}

.one {
  --box-color: pink;
  background-color: var(--box-color);
}

.two {
  --box-color: peenk;
  background-color: var(--box-color);
}

.three {
  --box-color: 2rem;
  background-color: var(--box-color);
}
```

```css hidden live-sample___at-property-initial-value
div {
  color: white;
  font-family: sans-serif;
  width: 100px;
  height: 100px;
  margin: 4px;
  padding: 8px;
  border: 2px black solid;
  display: inline-block;
}

.one {
  color: black;
}
```

```html hidden live-sample___at-property-initial-value
<div class="one">
  <p>One</p>
</div>
<div class="two">
  <p>Two.</p>
</div>
<div class="three">
  <p>Three.</p>
</div>
```

{{embedlivesample("at-property-initial-value", "100%", "150px")}}

## Custom properties không hợp lệ

Mỗi thuộc tính CSS có thể được gán một [tập hợp giá trị](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units) xác định.
Nếu bạn cố gắng gán giá trị cho thuộc tính nằm ngoài tập hợp giá trị hợp lệ của nó, nó được coi là _không hợp lệ_.

Khi trình duyệt gặp giá trị không hợp lệ cho thuộc tính CSS thông thường (ví dụ: giá trị `16px` cho thuộc tính {{cssxref("color")}}), nó loại bỏ khai báo đó và các phần tử được gán các giá trị mà chúng sẽ có nếu khai báo không tồn tại.
Trong ví dụ sau, chúng ta thấy điều gì xảy ra khi khai báo CSS thông thường không hợp lệ; `color: 16px;` bị loại bỏ và quy tắc `color: blue` trước đó được áp dụng thay thế:

```html live-sample___invalid-property
<p>This paragraph is initially black.</p>
```

```css live-sample___invalid-property
p {
  font-weight: bold;
  color: blue;
}

p {
  /* oops, not a valid color */
  color: 16px;
}
```

{{EmbedLiveSample('invalid-property', 100, 50)}}

Tuy nhiên, khi các giá trị của custom properties được phân tích cú pháp, trình duyệt chưa biết chúng sẽ được sử dụng ở đâu, vì vậy nó phải coi hầu hết tất cả các giá trị là _hợp lệ_.
Thật không may, các giá trị hợp lệ này có thể được sử dụng, thông qua ký hiệu hàm `var()`, trong ngữ cảnh mà chúng có thể không có nghĩa.
Các thuộc tính và biến tùy chỉnh có thể dẫn đến các câu lệnh CSS không hợp lệ, dẫn đến khái niệm _hợp lệ tại thời điểm tính toán_.

Khi trình duyệt gặp thay thế `var()` không hợp lệ, thì giá trị [ban đầu](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) hoặc [kế thừa](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance) của thuộc tính được sử dụng.
Ví dụ này giống như ví dụ cuối cùng, ngoại trừ chúng ta sử dụng custom property.

Trình duyệt thay thế giá trị của `--text-color` vào chỗ của `var(--text-color)`, nhưng `16px` không phải là giá trị thuộc tính hợp lệ cho {{cssxref("color")}}.
Sau khi thay thế, thuộc tính không có nghĩa, vì vậy trình duyệt xử lý tình huống này trong hai bước:

1. Kiểm tra xem thuộc tính {{cssxref("color")}} có thể kế thừa không. Có, nhưng `<p>` này không có phần tử cha nào có thuộc tính `color` được đặt. Vì vậy chúng ta chuyển sang bước tiếp theo.
2. Đặt giá trị thành **giá trị ban đầu mặc định** của nó, là màu đen.

```html live-sample___invalid-custom-property
<p>This paragraph is initially black.</p>
```

```css live-sample___invalid-custom-property
:root {
  --text-color: 16px;
}

p {
  font-weight: bold;
  color: blue;
}

p {
  color: var(--text-color);
}
```

{{EmbedLiveSample('invalid-custom-property', 100, 50)}}

Đối với các trường hợp như vậy, at-rule `@property` có thể ngăn chặn kết quả bất ngờ bằng cách cho phép định nghĩa giá trị ban đầu của thuộc tính:

```html live-sample___invalid-custom-property-fallbacks
<p>This paragraph is initially black.</p>
```

```css live-sample___invalid-custom-property-fallbacks
@property --text-color {
  syntax: "<color>";
  inherits: false;
  initial-value: teal;
}

:root {
  --text-color: 16px;
}

p {
  font-weight: bold;
  color: blue;
}

p {
  color: var(--text-color);
}
```

{{EmbedLiveSample('invalid-custom-property-fallbacks', 100, 50)}}

## Giá trị trong JavaScript

Để sử dụng các giá trị của custom properties trong JavaScript, giống như các thuộc tính tiêu chuẩn.

```js
// get variable from inline style
element.style.getPropertyValue("--my-var");

// get variable from wherever
getComputedStyle(element).getPropertyValue("--my-var");

// set variable on inline style
element.style.setProperty("--my-var", jsVar + 4);
```

## Xem thêm

- At-rule {{cssxref("@property")}}
- [`var()`](/en-US/docs/Web/CSS/Reference/Values/var)
- Mô-đun [CSS custom properties for cascading variables](/en-US/docs/Web/CSS/Guides/Cascading_variables)
- [Cú pháp custom property](/en-US/docs/Web/CSS/Reference/Properties/--*)
- [CSS Properties and Values API](/en-US/docs/Web/API/CSS_Properties_and_Values_API)
