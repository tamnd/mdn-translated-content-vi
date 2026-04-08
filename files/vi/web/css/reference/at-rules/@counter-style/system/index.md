---
title: system
slug: Web/CSS/Reference/At-rules/@counter-style/system
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.counter-style.system
sidebar: cssref
---

Descriptor **`system`** chỉ định thuật toán được dùng để chuyển đổi giá trị số nguyên của bộ đếm thành biểu diễn chuỗi. Nó được dùng trong {{cssxref("@counter-style")}} để xác định hành vi của kiểu đã định nghĩa.

Nếu thuật toán được chỉ định trong descriptor `system` không thể xây dựng biểu diễn cho một giá trị bộ đếm cụ thể, thì biểu diễn của giá trị đó sẽ được xây dựng bằng hệ thống fallback được cung cấp.

## Cú pháp

```css
/* Giá trị từ khóa */
system: cyclic;
system: numeric;
system: alphabetic;
system: symbolic;
system: additive;
system: fixed;

/* Các giá trị khác */
system: fixed 3;
system: extends decimal;
system: extends circled-letters;
```

## Giá trị

Giá trị có thể có một trong ba dạng:

- Một trong các giá trị từ khóa `cyclic`, `numeric`, `alphabetic`, `symbolic`, `additive` hoặc `fixed`.
- Giá trị từ khóa `fixed` kèm theo một số nguyên.
- Giá trị từ khóa `extends` kèm theo giá trị [`<counter-style-name>`](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style#counter-style-name).

Các giá trị bao gồm:

- `cyclic`
  - : Lặp qua danh sách các ký hiệu được cung cấp trong descriptor [`symbols`](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style/symbols). Khi đến cuối danh sách, vòng lặp sẽ quay lại đầu và bắt đầu lại. Giá trị này hữu ích cho cả các kiểu dấu đầu dòng cơ bản với chỉ một ký hiệu và cho các kiểu với nhiều ký hiệu. Phải có ít nhất một ký hiệu được chỉ định trong descriptor `symbols`, nếu không kiểu bộ đếm không hợp lệ.

- `numeric`
  - : Diễn giải các ký hiệu bộ đếm là các chữ số trong một [hệ thống đánh số theo vị trí](https://en.wikipedia.org/wiki/Positional_notation). Hệ thống numeric tương tự hệ thống `alphabetic`, được mô tả ở trên. Sự khác biệt chính là trong hệ thống `alphabetic`, ký hiệu bộ đếm đầu tiên được cho trong descriptor `symbols` được hiểu là `1`, tiếp theo là `2`, v.v. Tuy nhiên, trong hệ thống numeric, ký hiệu bộ đếm đầu tiên được hiểu là 0, tiếp theo là `1`, rồi `2`, v.v.

    Phải có ít nhất hai ký hiệu bộ đếm được chỉ định trong descriptor `symbols` nếu không kiểu bộ đếm không hợp lệ.

- `alphabetic`
  - : Diễn giải các ký hiệu được chỉ định là các chữ số, theo hệ thống đánh số chữ cái. Nếu các ký tự `"a"` đến `"z"` được chỉ định làm ký hiệu trong một kiểu bộ đếm, với hệ thống `alphabetic`, thì 26 biểu diễn bộ đếm đầu tiên sẽ là `"a"`, `"b"` đến `"z"`. Cho đến điểm này, hành vi giống với hệ thống `symbolic`, được mô tả ở trên. Tuy nhiên, sau `"z"`, nó sẽ tiếp tục là `"aa"`, `"ab"`, `"ac"`…

    Descriptor `symbols` phải chứa ít nhất hai ký hiệu nếu không kiểu bộ đếm không hợp lệ. Ký hiệu bộ đếm đầu tiên được cung cấp trong descriptor `symbols` được hiểu là `1`, tiếp theo là `2`, v.v. Hệ thống này cũng được định nghĩa chặt chẽ cho các giá trị bộ đếm dương.

- `symbolic`
  - : Lặp qua các ký hiệu được cung cấp trong danh sách descriptor `symbols` nhiều lần, nhân đôi, nhân ba, v.v. các ký hiệu trong mỗi lần lặp qua danh sách. Ví dụ: nếu hai ký hiệu "◽" và "◾" được chỉ định trong descriptor `symbols`, trong mỗi lần lặp kế tiếp, chúng sẽ trở thành "◽◽" và "◾◾", rồi "◽◽◽" và "◾◾◾", v.v. trong các lần lặp tiếp theo. Phải có ít nhất một ký hiệu được chỉ định trong descriptor `symbols`, nếu không kiểu bộ đếm không hợp lệ. Hệ thống bộ đếm này chỉ hoạt động cho các giá trị bộ đếm dương.

- `additive`
  - : Được dùng để biểu diễn các hệ thống đánh số "giá trị dấu hiệu", chẳng hạn như chữ số La Mã, thay vì tái sử dụng các chữ số ở các vị trí khác nhau để có các giá trị khác nhau, định nghĩa thêm chữ số cho các giá trị lớn hơn. Giá trị của một số trong hệ thống như vậy có thể được tìm thấy bằng cách cộng các chữ số trong số đó.

    Một descriptor bổ sung gọi là `additive-symbols` phải được chỉ định với ít nhất một _additive tuple_, nếu không quy tắc kiểu bộ đếm sẽ không hợp lệ. Một additive tuple tương tự như ký hiệu bộ đếm tổng hợp, được tạo thành từ hai phần: một ký hiệu bộ đếm thông thường và một trọng số số nguyên không âm. Các additive tuple phải được chỉ định theo thứ tự giảm dần của trọng số nếu không hệ thống không hợp lệ.

- `fixed` hoặc `fixed <integer>`
  - : Xác định một tập hữu hạn các ký hiệu, lặp một lần qua danh sách các ký hiệu được cung cấp trong descriptor `symbols`. Khi các ký hiệu được chỉ định đã được lặp qua, kiểu bộ đếm fallback sẽ được dùng. Giá trị từ khóa này hữu ích trong các trường hợp giá trị kiểu bộ đếm là hữu hạn. Phải có ít nhất một ký hiệu được chỉ định trong descriptor `symbols`, nếu không kiểu bộ đếm không hợp lệ. Từ khóa `fixed` có thể được theo sau bởi giá trị {{cssxref("&lt;integer&gt;")}} tùy chọn. Nếu được chỉ định, giá trị `<integer>` chỉ ra mục trong danh sách sẽ nhận ký hiệu đầu tiên từ danh sách ký hiệu. Nếu bị bỏ qua, giá trị mặc định của `integer` là `1`, tức là mục đầu tiên trong danh sách nhận ký hiệu đầu tiên.

- `extends`
  - : Mở rộng thuật toán của một kiểu bộ đếm do trình duyệt hoặc tác giả định nghĩa khác bằng cách cho phép thay đổi một số khía cạnh của kiểu bộ đếm được mở rộng. Bất kỳ descriptor nào không được chỉ định và giá trị của chúng đều được kế thừa từ kiểu bộ đếm được mở rộng được chỉ định. Nếu tên kiểu bộ đếm được chỉ định với `extends` chưa được định nghĩa, kiểu bộ đếm `decimal` sẽ được mở rộng theo mặc định.

    Nó không được chứa descriptor `symbols` hoặc `additive-symbols`, nếu không quy tắc kiểu bộ đếm sẽ không hợp lệ. Nếu một hoặc nhiều định nghĩa kiểu bộ đếm tạo thành một vòng lặp với các giá trị `extends` của chúng, trình duyệt sẽ xử lý tất cả các kiểu bộ đếm tham gia như đang mở rộng từ kiểu `decimal`.

> [!NOTE]
> Descriptor [`symbols`](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style/symbols) là bắt buộc khi giá trị là `cyclic`, `numeric`, `alphabetic`, `symbolic` hoặc `fixed`. Descriptor [`additive-symbols`](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style/additive-symbols) là bắt buộc nếu giá trị `additive` được đặt.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Bộ đếm cyclic

Giá trị `cyclic` lặp qua danh sách các ký hiệu, lặp lại danh sách khi cần:

#### CSS

```html hidden
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
  <li>Six</li>
</ul>
```

```css
@counter-style fisheye {
  system: cyclic;
  symbols: ◉ ➀;
  suffix: ": ";
}

ul {
  list-style: fisheye;
}
```

#### Kết quả

{{ EmbedLiveSample('Cyclic_counter') }}

### Bộ đếm fixed

Giá trị `fixed` lặp qua danh sách ký hiệu chỉ một lần, bắt đầu vòng lặp đơn tại mục danh sách được chỉ định bởi giá trị `integer`:

#### CSS

```html hidden
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
  <li>Six</li>
</ul>
```

```css
@counter-style circled-digits {
  system: fixed 3;
  symbols: ➀ ➁ ➂;
  suffix: ": ";
}

ul {
  list-style: circled-digits;
}
```

#### Kết quả

{{ EmbedLiveSample('Fixed_counter') }}

### Bộ đếm symbolic

Giá trị `symbolic` lặp qua danh sách được định nghĩa trong descriptor `symbols`, nhân đôi và nhân ba số ký hiệu cho vòng lặp thứ hai và thứ ba qua danh sách, tương ứng:

#### CSS

```html hidden
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
  <li>Six</li>
  <li>Seven</li>
  <li>Eight</li>
</ul>
```

```css
@counter-style abc {
  system: symbolic;
  symbols: a b c;
  suffix: ". ";
}

ul {
  list-style: abc;
}
```

#### Kết quả

{{ EmbedLiveSample('Symbolic_counter') }}

### Bộ đếm alphabetic

#### CSS

```html hidden
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
  <li>Six</li>
  <li>Seven</li>
  <li>Eight</li>
</ul>
```

```css
@counter-style abc {
  system: alphabetic;
  symbols: a b c;
  suffix: ". ";
}

ul {
  list-style: abc;
}
```

#### Kết quả

{{ EmbedLiveSample('Alphabetic_counter') }}

### Bộ đếm numeric

Ký hiệu đầu tiên được cung cấp trong descriptor `symbols` được hiểu là `0` ở đây.

#### CSS

```html hidden
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
  <li>Six</li>
  <li>Seven</li>
  <li>Eight</li>
</ul>
```

```css
@counter-style abc {
  system: numeric;
  symbols: a b c;
  suffix: ". ";
}

ul {
  list-style: abc;
}
```

#### Kết quả

{{ EmbedLiveSample('Numeric_counter') }}

### Bộ đếm numeric với ký hiệu số

Như trong ví dụ sau, nếu các chữ số từ `0` đến `9` được chỉ định làm ký hiệu, kiểu bộ đếm này sẽ hiển thị các ký hiệu giống kiểu bộ đếm decimal.

#### CSS

```html hidden
<ul class="list">
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
  <li>Six</li>
  <li>Seven</li>
  <li>Eight</li>
  <li>Nine</li>
  <li>Ten</li>
</ul>
```

```css
@counter-style numbers {
  system: numeric;
  symbols: "0" "1" "2" "3" "4" "5" "6" "7" "8" "9";
  suffix: ".";
}

ul {
  list-style: numbers;
}
```

#### Kết quả

{{ EmbedLiveSample('Numeric_counter_with_numeric_symbols') }}

### Bộ đếm additive

Ví dụ này hiển thị danh sách sử dụng chữ số La Mã. Lưu ý rằng `range` được chỉ định. Điều này là vì biểu diễn sẽ tạo ra chữ số La Mã chính xác chỉ đến giá trị bộ đếm `3999`. Khi nằm ngoài phạm vi, phần còn lại của các biểu diễn bộ đếm sẽ dựa trên kiểu `decimal`, đây là kiểu fallback. Nếu bạn cần biểu diễn giá trị bộ đếm dưới dạng chữ số La Mã, bạn có thể dùng một trong các kiểu bộ đếm được định nghĩa sẵn, `upper-roman` hoặc `lower-roman`, thay vì tự tạo quy tắc.

#### HTML

Chúng ta dùng thuộc tính [`start`](/en-US/docs/Web/HTML/Reference/Elements/ol#start) trên phần tử {{HTMLElement("ol")}} để chứng minh rằng việc đếm không cần bắt đầu từ `1`. Ngoài ra, chúng ta dùng thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/li#value) trên phần tử {{HTMLElement("li")}} thứ năm để chứng minh rằng các bộ đếm bạn định nghĩa bằng `@counter-style` hoạt động giống như các bộ đếm gốc.

```html
<ol start="48">
  <li>48</li>
  <li>49</li>
  <li>50</li>
  <li>51</li>
  <li value="109">109</li>
  <li>110</li>
</ol>
```

#### CSS

```css
@counter-style uppercase-roman {
  system: additive;
  range: 1 3999;
  additive-symbols:
    1000 M,
    900 CM,
    500 D,
    400 CD,
    100 C,
    90 XC,
    50 L,
    40 XL,
    10 X,
    9 IX,
    5 V,
    4 IV,
    1 I;
}

ol {
  list-style: uppercase-roman;
  padding-left: 5em;
}
```

#### Kết quả

{{ EmbedLiveSample('Additive_counter', '') }}

### Mở rộng bộ đếm

Ví dụ này sử dụng thuật toán, ký hiệu và các thuộc tính khác của [`lower-alpha`](/en-US/docs/Web/CSS/Reference/Properties/list-style-type#lower-alpha), một trong nhiều giá trị bộ đếm {{CSSXref("list-style-type")}} gốc, nhưng mở rộng nó bằng cách xóa dấu chấm (`.`) sau biểu diễn bộ đếm và đặt các ký tự trong ngoặc đơn, như trong `(a)` và `(b)`.

#### HTML

```html
<ul class="list">
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
</ul>
```

#### CSS

```css
@counter-style alpha-modified {
  system: extends lower-alpha;
  prefix: "(";
  suffix: ") ";
}

ul {
  list-style: alpha-modified;
}
```

#### Kết quả

{{ EmbedLiveSample('Extending_a_counter') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các descriptor khác của {{cssxref("@counter-style")}}, bao gồm {{cssxref("@counter-style/symbols", "symbols")}}, {{cssxref("@counter-style/additive-symbols", "additive-symbols")}}, {{cssxref("@counter-style/negative", "negative")}}, {{cssxref("@counter-style/prefix", "prefix")}}, {{cssxref("@counter-style/suffix", "suffix")}}, {{cssxref("@counter-style/range", "range")}}, {{cssxref("@counter-style/pad", "pad")}}, {{cssxref("@counter-style/speak-as", "speak-as")}}, và {{cssxref("@counter-style/fallback", "fallback")}}
- {{cssxref("list-style")}}, {{cssxref("list-style-image")}}, {{cssxref("list-style-position")}}
- {{cssxref("symbols()")}}, ký hiệu hàm tạo kiểu bộ đếm ẩn danh.
