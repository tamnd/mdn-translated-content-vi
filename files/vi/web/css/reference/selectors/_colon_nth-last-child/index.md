---
title: :nth-last-child()
slug: Web/CSS/Reference/Selectors/:nth-last-child
page-type: css-pseudo-class
browser-compat: css.selectors.nth-last-child
sidebar: cssref
---

Lớp giả **`:nth-last-child()`** [CSS](/vi/docs/Web/CSS) [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) khớp với các phần tử dựa trên vị trí của chúng trong một nhóm anh chị em, đếm từ cuối.

{{InteractiveExample("CSS Demo: :nth-last-child", "tabbed-shorter")}}

```css interactive-example
p {
  font-weight: bold;
}

li:nth-last-child(-n + 3) {
  border: 2px solid orange;
  margin-top: 1px;
}

li:nth-last-child(even) {
  background-color: lightyellow;
}
```

```html interactive-example
<p>Eight deadliest wildfires:</p>
<ol reversed>
  <li>Matheson Fire</li>
  <li>Miramichi Fire</li>
  <li>1997 Indonesian fires</li>
  <li>Thumb Fire</li>
  <li>Great Hinckley Fire</li>
  <li>Cloquet Fire</li>
  <li>Kursha-2 Fire</li>
  <li>Peshtigo Fire</li>
</ol>
```

## Cú pháp

```css-nolint
:nth-last-child(<nth> [of <complex-selector-list>]?) {
  /* ... */
}
```

### Tham số

Lớp giả `:nth-last-child()` được chỉ định bằng một đối số duy nhất, đại diện cho mẫu để khớp các phần tử, đếm từ cuối.

#### Giá trị từ khóa

- `odd`
  - : Đại diện cho các phần tử có vị trí số trong một chuỗi anh chị em là số lẻ: 1, 3, 5, v.v., đếm từ cuối.
- `even`
  - : Đại diện cho các phần tử có vị trí số trong một chuỗi anh chị em là số chẵn: 2, 4, 6, v.v., đếm từ cuối.

#### Ký hiệu hàm

- `<An+B>`
  - : Đại diện cho các phần tử có vị trí số trong một chuỗi anh chị em khớp với mẫu `An+B`, với mọi giá trị số nguyên dương hoặc bằng không của `n`, trong đó:
    - `A` là kích thước bước số nguyên,
    - `B` là độ lệch số nguyên,
    - `n` là tất cả các số nguyên không âm, bắt đầu từ 0.

    Nó có thể được đọc là phần tử thứ `An+B` trong danh sách. Chỉ số của phần tử đầu tiên, đếm từ cuối, là `1`. Cả `A` và `B` đều phải có giá trị {{cssxref("&lt;integer&gt;")}}.

#### Cú pháp `of <selector>`

Bằng cách truyền đối số bộ chọn, chúng ta có thể chọn phần tử thứ **nth-last** khớp với bộ chọn đó. Ví dụ, bộ chọn sau khớp với ba mục danh sách _quan trọng_ cuối cùng, được gán với `class="important"`.

```css
:nth-last-child(-n + 3 of li.important) {
}
```

> [!NOTE]
> Điều này khác với việc di chuyển bộ chọn ra ngoài hàm, như:

```css
li.important:nth-last-child(-n + 3) {
}
```

Bộ chọn này áp dụng kiểu cho các mục danh sách nếu chúng cũng nằm trong ba phần tử con cuối cùng.

## Ví dụ

### Các bộ chọn mẫu

- `tr:nth-last-child(odd)` hoặc `tr:nth-last-child(2n+1)`
  - : Đại diện cho các hàng lẻ của bảng HTML: 1, 3, 5, v.v., đếm từ cuối.
- `tr:nth-last-child(even)` hoặc `tr:nth-last-child(2n)`
  - : Đại diện cho các hàng chẵn của bảng HTML: 2, 4, 6, v.v., đếm từ cuối.
- `:nth-last-child(7)`
  - : Đại diện cho phần tử thứ bảy, đếm từ cuối.
- `:nth-last-child(5n)`
  - : Đại diện cho các phần tử 5, 10, 15, v.v., đếm từ cuối.
- `:nth-last-child(3n+4)`
  - : Đại diện cho các phần tử 4, 7, 10, 13, v.v., đếm từ cuối.
- `:nth-last-child(-n+3)`
  - : Đại diện cho ba phần tử cuối cùng trong một nhóm anh chị em.
- `p:nth-last-child(n)` hoặc `p:nth-last-child(n+1)`
  - : Đại diện cho mọi phần tử `<p>` trong một nhóm anh chị em. Điều này giống với bộ chọn `p` đơn giản. (Vì `n` bắt đầu từ không, trong khi phần tử cuối cùng bắt đầu từ một, `n` và `n+1` đều chọn cùng một phần tử.)
- `p:nth-last-child(1)` hoặc `p:nth-last-child(0n+1)`
  - : Đại diện cho mọi `<p>` là phần tử đầu tiên trong một nhóm anh chị em, đếm từ cuối. Điều này giống với bộ chọn {{cssxref(":last-child")}}.

### Ví dụ bảng

#### HTML

```html
<table>
  <tbody>
    <tr>
      <td>First line</td>
    </tr>
    <tr>
      <td>Second line</td>
    </tr>
    <tr>
      <td>Third line</td>
    </tr>
    <tr>
      <td>Fourth line</td>
    </tr>
    <tr>
      <td>Fifth line</td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
table {
  border: 1px solid blue;
}

/* Selects the last three elements */
tr:nth-last-child(-n + 3) {
  background-color: pink;
}

/* Selects every element starting from the second to last item */
tr:nth-last-child(n + 2) {
  color: blue;
}

/* Select only the last second element */
tr:nth-last-child(2) {
  font-weight: 600;
}
```

#### Kết quả

{{EmbedLiveSample('Table_example', 300, 150)}}

### Truy vấn số lượng

Một _truy vấn số lượng_ tạo kiểu cho các phần tử tùy thuộc vào số lượng của chúng. Trong ví dụ này, các mục danh sách chuyển sang màu đỏ khi có ít nhất ba mục trong một danh sách nhất định. Điều này được thực hiện bằng cách kết hợp khả năng của lớp giả `nth-last-child` và [bộ kết hợp anh chị em tiếp theo](/vi/docs/Web/CSS/Reference/Selectors/Subsequent-sibling_combinator).

#### HTML

```html
<h4>A list of four items (styled):</h4>
<ol>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
</ol>

<h4>A list of two items (unstyled):</h4>
<ol>
  <li>One</li>
  <li>Two</li>
</ol>
```

#### CSS

```css
/* If there are at least three list items,
   style them all */
li:nth-last-child(n + 3),
li:nth-last-child(3) ~ li {
  color: red;
}
```

#### Kết quả

{{EmbedLiveSample('Quantity_query', '100%', 270)}}

### Ví dụ cú pháp `of <selector>`

Trong ví dụ này, có một danh sách không có thứ tự gồm các tên. Một số mục có lớp `noted` được áp dụng và sau đó được làm nổi bật với đường viền dưới dày.

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

```css
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
  border: 1px solid tomato;
}

.noted {
  border-bottom: 5px solid tomato;
}
```

Trong CSS sau chúng ta đang nhắm mục tiêu các mục danh sách **lẻ** được đánh dấu với `class="noted"`.

```css
li:nth-last-child(odd of .noted) {
  background-color: tomato;
  border-bottom-color: seagreen;
}
```

#### Kết quả

Các mục có `class="noted"` có đường viền dưới dày và các mục 1, 7, 14 và 20 có nền đặc vì chúng là các mục danh sách _lẻ_ với `class="noted"`.

{{EmbedLiveSample('of_selector_syntax_example', 550, 120)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref(":nth-child")}}
- {{Cssxref(":nth-last-of-type")}}
- [Quantity Queries for CSS](https://alistapart.com/article/quantity-queries-for-css/)
