---
title: :nth-child()
slug: Web/CSS/Reference/Selectors/:nth-child
page-type: css-pseudo-class
browser-compat: css.selectors.nth-child
sidebar: cssref
---

Lớp giả **`:nth-child()`** [CSS](/vi/docs/Web/CSS) [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) khớp với các phần tử dựa trên chỉ số của chúng trong danh sách con của phần tử cha. Nói cách khác, bộ chọn `:nth-child()` chọn các phần tử con theo vị trí của chúng trong số tất cả các phần tử anh chị em trong một phần tử cha.

{{InteractiveExample("CSS Demo: :nth-child", "tabbed-shorter")}}

```css interactive-example
p {
  font-weight: bold;
}

li:nth-child(-n + 3) {
  border: 2px solid orange;
  margin-bottom: 1px;
}

li:nth-child(even) {
  background-color: lightyellow;
}
```

```html interactive-example
<p>Track &amp; field champions:</p>
<ul>
  <li>Adhemar da Silva</li>
  <li>Wang Junxia</li>
  <li>Wilma Rudolph</li>
  <li>Babe Didrikson-Zaharias</li>
  <li>Betty Cuthbert</li>
  <li>Fanny Blankers-Koen</li>
  <li>Florence Griffith-Joyner</li>
  <li>Irena Szewinska</li>
  <li>Jackie Joyner-Kersee</li>
  <li>Shirley Strickland</li>
  <li>Carl Lewis</li>
  <li>Emil Zatopek</li>
  <li>Haile Gebrselassie</li>
  <li>Jesse Owens</li>
  <li>Jim Thorpe</li>
  <li>Paavo Nurmi</li>
  <li>Sergei Bubka</li>
  <li>Usain Bolt</li>
</ul>
```

> [!NOTE]
> Trong cú pháp `element:nth-child()`, số lượng con bao gồm các phần tử con anh chị em của bất kỳ loại phần tử nào; nhưng nó chỉ được coi là khớp nếu phần tử _ở vị trí con đó_ khớp với các thành phần khác của bộ chọn.

## Cú pháp

```css-nolint
:nth-child([ <An+B> | even | odd ] [of <complex-selector-list>]?) {
  /* ... */
}
```

### Tham số

`:nth-child()` nhận một đối số duy nhất mô tả một mẫu để khớp các chỉ số phần tử trong danh sách các phần tử anh chị em. Chỉ số phần tử bắt đầu từ 1.

#### Giá trị từ khóa

- `odd`
  - : Đại diện cho các phần tử có vị trí số trong một chuỗi anh chị em là số lẻ: 1, 3, 5, v.v.
- `even`
  - : Đại diện cho các phần tử có vị trí số trong một chuỗi anh chị em là số chẵn: 2, 4, 6, v.v.

#### Ký hiệu hàm

- `<An+B>`
  - : Đại diện cho các phần tử có vị trí số trong một chuỗi anh chị em khớp với mẫu `An+B`, với mọi giá trị số nguyên dương hoặc bằng không của `n`, trong đó:
    - `A` là kích thước bước số nguyên,
    - `B` là độ lệch số nguyên,
    - `n` là tất cả các số nguyên không âm, bắt đầu từ 0.

    Nó có thể được đọc là phần tử thứ `An+B` trong danh sách. Cả `A` và `B` đều phải có giá trị {{cssxref("&lt;integer&gt;")}}.

#### Cú pháp `of <selector>`

Bằng cách truyền đối số bộ chọn, chúng ta có thể chọn phần tử thứ **nth** khớp với bộ chọn đó. Ví dụ, bộ chọn sau khớp với ba mục danh sách đầu tiên có `class="important"` được đặt.

```css
:nth-child(-n + 3 of li.important) {
}
```

Điều này khác với việc di chuyển bộ chọn ra ngoài hàm, như:

```css
li.important:nth-child(-n + 3) {
}
```

Bộ chọn này chọn các mục danh sách nếu chúng nằm trong ba phần tử con đầu tiên và khớp với bộ chọn `li.important`.

## Ví dụ

### Các bộ chọn mẫu

- `tr:nth-child(odd)` hoặc `tr:nth-child(2n+1)`
  - : Đại diện cho các hàng lẻ của bảng HTML: 1, 3, 5, v.v.
- `tr:nth-child(even)` hoặc `tr:nth-child(2n)`
  - : Đại diện cho các hàng chẵn của bảng HTML: 2, 4, 6, v.v.
- `:nth-child(7)`
  - : Đại diện cho phần tử thứ bảy.
- `:nth-child(5n)`
  - : Đại diện cho các phần tử **5** \[=5×1], **10** \[=5×2], **15** \[=5×3], **v.v.** Phần tử đầu tiên được trả về là **0** \[=5x0], dẫn đến không khớp, vì các phần tử được đánh chỉ số từ 1, trong khi `n` bắt đầu từ 0. Điều này có vẻ lạ lúc đầu, nhưng có ý nghĩa hơn khi phần `B` của công thức là `>0`, như trong ví dụ tiếp theo.
- `:nth-child(n+7)`
  - : Đại diện cho phần tử thứ bảy và tất cả các phần tử tiếp theo: **7** \[=0+7], **8** \[=1+7], **9** \[=2+7], **v.v.**
- `:nth-child(3n+4)`
  - : Đại diện cho các phần tử **4** \[=(3×0)+4], **7** \[=(3×1)+4], **10** \[=(3×2)+4], **13** \[=(3×3)+4], **v.v.**
- `:nth-child(-n+3)`
  - : Đại diện cho ba phần tử đầu tiên. \[=-0+3, -1+3, -2+3]
- `p:nth-child(n)`
  - : Đại diện cho mọi phần tử `<p>` trong một nhóm anh chị em. Điều này chọn các phần tử giống như bộ chọn `p` đơn giản (mặc dù với độ đặc hiệu cao hơn).
- `p:nth-child(1)` hoặc `p:nth-child(0n+1)`
  - : Đại diện cho mọi `<p>` là phần tử đầu tiên trong một nhóm anh chị em. Điều này giống với bộ chọn {{cssxref(":first-child")}} (và có cùng độ đặc hiệu).
- `p:nth-child(n+8):nth-child(-n+15)`
  - : Đại diện cho các phần tử `<p>` từ thứ tám đến thứ mười lăm trong một nhóm anh chị em.

### Ví dụ chi tiết

#### HTML

```html
<h3>
  <code>span:nth-child(2n+1)</code>, WITHOUT an <code>&lt;em&gt;</code> among
  the child elements.
</h3>
<p>Children 1, 3, 5, and 7 are selected.</p>
<div class="first">
  <span>Span 1!</span>
  <span>Span 2</span>
  <span>Span 3!</span>
  <span>Span 4</span>
  <span>Span 5!</span>
  <span>Span 6</span>
  <span>Span 7!</span>
</div>

<br />

<h3>
  <code>span:nth-child(2n+1)</code>, WITH an <code>&lt;em&gt;</code> among the
  child elements.
</h3>
<p>
  Children 1, 5, and 7 are selected.<br />
  3 is used in the counting because it is a child, but it isn't selected because
  it isn't a <code>&lt;span&gt;</code>.
</p>
<div class="second">
  <span>Span!</span>
  <span>Span</span>
  <em>This is an `em`.</em>
  <span>Span</span>
  <span>Span!</span>
  <span>Span</span>
  <span>Span!</span>
  <span>Span</span>
</div>

<br />

<h3>
  <code>span:nth-of-type(2n+1)</code>, WITH an <code>&lt;em&gt;</code> among the
  child elements.
</h3>
<p>
  Children 1, 4, 6, and 8 are selected.<br />
  3 isn't used in the counting or selected because it is an
  <code>&lt;em&gt;</code>, not a <code>&lt;span&gt;</code>, and
  <code>nth-of-type</code> only selects children of that type. The
  <code>&lt;em&gt;</code> is completely skipped over and ignored.
</p>
<div class="third">
  <span>Span!</span>
  <span>Span</span>
  <em>This is an `em`.</em>
  <span>Span!</span>
  <span>Span</span>
  <span>Span!</span>
  <span>Span</span>
  <span>Span!</span>
</div>
```

#### CSS

```css hidden
* {
  font-family: sans-serif;
}

span,
div em {
  padding: 5px;
  border: 1px solid tomato;
  display: inline-block;
  margin-bottom: 3px;
}
```

```css
.first span:nth-child(2n + 1),
.second span:nth-child(2n + 1),
.third span:nth-of-type(2n + 1) {
  background-color: tomato;
}
```

#### Kết quả

{{EmbedLiveSample('Detailed_example', 550, 550)}}

### Sử dụng 'of &lt;selector&gt;'

Trong ví dụ này có một danh sách không có thứ tự gồm các tên, một số trong đó đã được đánh dấu là **noted** bằng `class="noted"`. Chúng đã được làm nổi bật với đường viền dưới dày.

#### HTML

```html
<ul>
  <li class="noted">Diego</li>
  <li>Shilpa</li>
  <li class="noted">Caterina</li>
  <li>Jayla</li>
  <li>Tyrone</li>
  <li>Ricardo</li>
  <li class="noted">Gila</li>
  <li>Sienna</li>
  <li>Titilayo</li>
  <li class="noted">Lexi</li>
  <li>Aylin</li>
  <li>Leo</li>
  <li>Leyla</li>
  <li class="noted">Bruce</li>
  <li>Aisha</li>
  <li>Veronica</li>
  <li class="noted">Kyouko</li>
  <li>Shireen</li>
  <li>Tanya</li>
  <li class="noted">Marlene</li>
</ul>
```

#### CSS

```css hidden
* {
  font-family: sans-serif;
}

ul {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  font-size: 1.2rem;
  padding-left: 0;
}

li {
  margin: 0.125rem;
  padding: 0.25rem;
}

li {
  border: 1px solid tomato;
}

.noted {
  border-bottom: 5px solid tomato;
}
```

Trong CSS sau chúng ta đang nhắm mục tiêu các mục danh sách **chẵn** được đánh dấu với `class="noted"`.

```css
li:nth-child(even of .noted) {
  background-color: tomato;
  border-bottom-color: seagreen;
}
```

#### Kết quả

Các mục có `class="noted"` có đường viền dưới dày và các mục 3, 10 và 17 có nền đặc vì chúng là các mục danh sách _chẵn_ với `class="noted"`.

{{EmbedLiveSample('of_selector_syntax_example', 550, 120)}}

### So sánh cú pháp of selector với selector nth-child

Trong ví dụ này, có hai danh sách không có thứ tự gồm các tên. Danh sách đầu tiên cho thấy hiệu ứng của `li:nth-child(-n + 3 of .noted)` và danh sách thứ hai cho thấy hiệu ứng của `li.noted:nth-child(-n + 3)`.

#### HTML

```html
<ul class="one">
  <li class="noted">Diego</li>
  <li>Shilpa</li>
  <li class="noted">Caterina</li>
  <li>Jayla</li>
  <li>Tyrone</li>
  <li>Ricardo</li>
  <li class="noted">Gila</li>
  <li>Sienna</li>
  <li>Titilayo</li>
  <li class="noted">Lexi</li>
</ul>
<ul class="two">
  <li class="noted">Diego</li>
  <li>Shilpa</li>
  <li class="noted">Caterina</li>
  <li>Jayla</li>
  <li>Tyrone</li>
  <li>Ricardo</li>
  <li class="noted">Gila</li>
  <li>Sienna</li>
  <li>Titilayo</li>
  <li class="noted">Lexi</li>
</ul>
```

#### CSS

```css hidden
* {
  font-family: sans-serif;
}

ul {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  font-size: 1.2rem;
  padding-left: 0;
}

li {
  margin: 0.125rem;
  padding: 0.25rem;
}

li {
  border: 1px solid tomato;
}

.noted {
  border-bottom: 5px solid tomato;
}
```

```css
ul.one > li:nth-child(-n + 3 of .noted) {
  background-color: tomato;
  border-bottom-color: seagreen;
}

ul.two > li.noted:nth-child(-n + 3) {
  background-color: tomato;
  border-bottom-color: seagreen;
}
```

#### Kết quả

Trường hợp đầu tiên áp dụng kiểu cho ba mục danh sách đầu tiên có `class="noted"` dù chúng có phải là ba mục đầu tiên trong danh sách hay không.

Trường hợp thứ hai áp dụng kiểu cho các mục có `class="noted"` nếu chúng nằm trong 3 mục đầu tiên của danh sách.

{{EmbedLiveSample('of_selector_syntax_vs_selector_nth-child', 550, 150)}}

### Sử dụng of selector để sửa bảng có sọc

Một thực hành phổ biến cho bảng là sử dụng _zebra-stripes_ xen kẽ giữa màu nền sáng và tối cho các hàng, làm cho bảng dễ đọc hơn và dễ tiếp cận hơn. Nếu một hàng bị ẩn, các sọc sẽ xuất hiện hợp nhất và thay đổi hiệu ứng mong muốn. Trong ví dụ này, bạn có thể thấy hai bảng với một hàng `hidden`. Bảng thứ hai xử lý các hàng ẩn bằng cách sử dụng `of :not([hidden])`.

#### HTML

```html-nolint
<table class="broken">
  <thead>
    <tr><th>Name</th><th>Age</th><th>Country</th></tr>
  </thead>
  <tbody>
    <tr><td>Mamitiana</td><td>23</td><td>Madagascar</td></tr>
    <tr><td>Yuki</td><td>48</td><td>Japan</td></tr>
    <tr hidden><td>Tlayolotl</td><td>36</td><td>Mexico</td></tr>
    <tr><td>Adilah</td><td>27</td><td>Morocco</td></tr>
    <tr><td>Vieno</td><td>55</td><td>Finland</td></tr>
    <tr><td>Ricardo</td><td>66</td><td>Brazil</td></tr>
  </tbody>
</table>
<table class="fixed">
  <thead>
    <tr><th>Name</th><th>Age</th><th>Country</th></tr>
  </thead>
  <tbody>
    <tr><td>Mamitiana</td><td>23</td><td>Madagascar</td></tr>
    <tr><td>Yuki</td><td>48</td><td>Japan</td></tr>
    <tr hidden><td>Tlayolotl</td><td>36</td><td>Mexico</td></tr>
    <tr><td>Adilah</td><td>27</td><td>Morocco</td></tr>
    <tr><td>Vieno</td><td>55</td><td>Finland</td></tr>
    <tr><td>Ricardo</td><td>66</td><td>Brazil</td></tr>
  </tbody>
</table>
```

#### CSS

```css hidden
body {
  display: flex;
  justify-content: space-around;
}
td {
  padding: 0.125rem 0.5rem;
}
```

```css
.broken > tbody > tr:nth-child(even) {
  background-color: silver;
}
```

```css
.fixed > tbody > tr:nth-child(even of :not([hidden])) {
  background-color: silver;
}
```

#### Kết quả

Trong bảng đầu tiên, chỉ sử dụng `:nth-child(even)`, hàng thứ ba có thuộc tính `hidden` được áp dụng. Vì vậy trong trường hợp này, hàng thứ 3 không hiển thị và các hàng thứ 2 & 4 được tính là chẵn, về mặt kỹ thuật chúng là vậy nhưng về mặt trực quan thì không.

Trong bảng thứ hai, _cú pháp of_ được sử dụng để nhắm mục tiêu chỉ các `tr` **không** bị ẩn bằng `:nth-child(even of :not([hidden]))`.

{{EmbedLiveSample('Using_of_selector_to_fix_striped_tables', 550, 180)}}

### Tạo kiểu cột bảng

Để tạo kiểu cho một cột bảng, bạn không thể đặt kiểu trên phần tử {{HTMLElement("col")}} vì các ô bảng không phải là con của nó (như bạn có thể làm với phần tử hàng, {{HTMLElement("tr")}}). Các lớp giả như `:nth-child()` rất hữu ích để chọn các ô cột.

Trong ví dụ này, chúng ta đặt các kiểu khác nhau cho mỗi cột.

#### HTML

```html-nolint
<table>
<caption>Student roster</caption>
<colgroup>
  <col/>
  <col/>
  <col/>
</colgroup>
  <thead>
    <tr><th>Name</th><th>Age</th><th>Country</th></tr>
  </thead>
  <tbody>
    <tr><td>Mamitiana</td><td>23</td><td>Madagascar</td></tr>
    <tr><td>Yuki</td><td>48</td><td>Japan</td></tr>
  </tbody>
</table>

```

#### CSS

```css
td {
  padding: 0.125rem 0.5rem;
  height: 3rem;
  border: 1px solid black;
}

tr :nth-child(1) {
  text-align: left;
  vertical-align: bottom;
  background-color: silver;
}

tbody tr :nth-child(2) {
  text-align: center;
  vertical-align: middle;
}

tbody tr :nth-child(3) {
  text-align: right;
  vertical-align: top;
  background-color: tomato;
}
```

#### Kết quả

{{EmbedLiveSample('Styling_a_table_column', 100, 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ Cssxref(":nth-of-type", ":nth-of-type()") }}
- {{ Cssxref(":nth-last-child", ":nth-last-child()") }}
- {{ Cssxref(":has", ":has()") }}: lớp giả để chọn phần tử cha
- [Các lớp giả cấu trúc cây](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes#tree-structural_pseudo-classes)
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors) module
