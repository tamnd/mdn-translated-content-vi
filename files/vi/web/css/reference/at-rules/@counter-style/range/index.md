---
title: range
slug: Web/CSS/Reference/At-rules/@counter-style/range
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.counter-style.range
sidebar: cssref
---

Descriptor **`range`** cho phép tác giả chỉ định một hoặc nhiều phạm vi giá trị bộ đếm mà kiểu được áp dụng khi định nghĩa kiểu bộ đếm tùy chỉnh với at-rule {{cssxref("@counter-style")}}. Khi descriptor `range` được bao gồm, bộ đếm đã định nghĩa sẽ chỉ được dùng cho các giá trị trong phạm vi được đặt. Nếu giá trị bộ đếm nằm ngoài phạm vi được chỉ định, kiểu fallback sẽ được dùng để xây dựng biểu diễn của marker đó.

## Cú pháp

```css
/* Giá trị từ khóa */
range: auto;

/* Giá trị phạm vi */
range: 2 5;
range: infinite 10;
range: 6 infinite;
range: infinite infinite;

/* Nhiều giá trị phạm vi */
range:
  2 5,
  8 10;
range:
  infinite 6,
  10 infinite;
```

### Giá trị

Giá trị là danh sách các phạm vi được phân tách bằng dấu phẩy, mỗi phạm vi bao gồm giới hạn dưới và giới hạn trên hoặc từ khóa `auto`.

- `auto`
  - : Toàn bộ tập hợp số có thể biểu diễn bởi {{cssxref("@counter-style/system","system")}} bộ đếm. Các giá trị phạm vi đó phụ thuộc vào hệ thống bộ đếm:
    - Đối với hệ thống `cyclic`, `numeric` và `fixed`, phạm vi là âm `infinity` đến dương `infinity`.
    - Đối với hệ thống `alphabetic` và `symbolic`, phạm vi là `1` đến dương `infinity`.
    - Đối với hệ thống `additive`, phạm vi là `0` đến dương `infinity`.
    - Khi dùng `extend` để mở rộng một hệ thống, phạm vi là những gì `auto` tạo ra cho hệ thống đang được mở rộng, bao gồm cả các phần mở rộng của các kiểu được định nghĩa sẵn phức tạp, chẳng hạn như một số kiểu bộ đếm tiếng Nhật, Hàn, Trung và Ethiopia.

- `[ [ <integer> | infinite ]{2} ]#`
  - : Mỗi phạm vi trong danh sách các phạm vi được phân tách bằng dấu phẩy bao gồm hai giá trị, mỗi giá trị là {{cssxref("integer")}} hoặc từ khóa `infinite`. Nếu `infinite` được dùng làm giá trị đầu tiên trong một phạm vi, nó đại diện cho âm vô cực; nếu được dùng làm giá trị thứ hai, nó đại diện cho dương vô cực. Giá trị đầu tiên của mỗi phạm vi là giới hạn dưới và giá trị thứ hai là giới hạn trên, bao gồm cả hai đầu. Nếu giới hạn dưới của bất kỳ phạm vi nào trong danh sách cao hơn giới hạn trên, toàn bộ descriptor `range` là không hợp lệ và sẽ bị bỏ qua.

## Mô tả

Giá trị của descriptor `range` có thể là `auto` hoặc danh sách các phạm vi giới hạn dưới và giới hạn trên được phân tách bằng dấu phẩy, được chỉ định bằng số nguyên âm hoặc dương hoặc từ khóa `infinite`.

### Hiểu về `auto`

Khi giá trị được đặt là `auto`, phạm vi là phạm vi mặc định cho hệ thống bộ đếm. Nếu `system` là `cyclic`, `numeric` hoặc `fixed`, phạm vi sẽ từ âm vô cực đến dương vô cực. Nếu `system` là `alphabetic` hoặc `symbolic`, phạm vi sẽ từ `1` đến dương `infinity`. Đối với `system: additive`, `auto` dẫn đến phạm vi `0` đến dương `infinity`.

Khi mở rộng một bộ đếm, nếu `range` được đặt là `auto`, giá trị phạm vi sẽ là phạm vi của `system` của bộ đếm đang được mở rộng, không phải giá trị `range`, nếu có, của bộ đếm đó. Ví dụ: nếu bộ đếm "B" có `system: extends A` được đặt, với bộ đếm A là bộ đếm `alphabetic`, việc đặt `range: auto` trên "B" sẽ thiết lập phạm vi của "B" từ `1` đến `infinity`. Đây là phạm vi của hệ thống `alphabetic`, không nhất thiết là phạm vi được đặt trong định nghĩa kiểu bộ đếm "A". Với `range: auto` được đặt trên "B", `range` được thiết lập theo phạm vi mặc định của hệ thống `alphabetic`, không phải giá trị `range` được đặt trong danh sách descriptor của bộ đếm A.

### Giải thích về `infinite`

Khi phạm vi được chỉ định dưới dạng số nguyên (thay vì `auto`), giá trị `infinite` có thể được dùng để biểu thị vô cực. Nếu _infinite_ được chỉ định là giá trị đầu tiên trong một phạm vi, thì nó được hiểu là âm vô cực. Nếu được dùng làm giới hạn trên, giá trị thứ hai trong cặp phạm vi, nó được hiểu là dương vô cực.

### Danh sách các phạm vi

Giá trị của `range` là `auto`, được thảo luận ở trên, hoặc danh sách một hoặc nhiều phạm vi được phân tách bằng dấu phẩy. Phạm vi của kiểu bộ đếm là hợp của tất cả các phạm vi được định nghĩa trong danh sách.

Mỗi phạm vi trong danh sách các phạm vi nhận hai giá trị. Những giá trị đó là {{cssxref("integer")}} hoặc từ khóa `infinite`. Giá trị đầu tiên là _giới hạn dưới_, bao gồm. Giá trị thứ hai là _giới hạn trên_, bao gồm. Đối với hai giá trị số nguyên, giá trị nhỏ hơn phải đứng trước. Nếu giới hạn dưới của bất kỳ phạm vi nào trong danh sách cao hơn giới hạn trên, toàn bộ descriptor `range` là không hợp lệ và sẽ bị bỏ qua. Từ khóa `infinite` sẽ không làm cho phạm vi không hợp lệ, vì vị trí của `infinite` xác định giá trị của nó; âm vô cực hoặc dương vô cực tùy thuộc vào việc nó là giới hạn dưới hay giới hạn trên, tương ứng.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt kiểu bộ đếm trên một phạm vi

#### HTML

```html
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

#### CSS

```css
@counter-style range-multi-example {
  system: cyclic;
  symbols: "\25A0" "\25A1";
  range:
    2 4,
    7 9;
}

.list {
  list-style: range-multi-example;
}
```

#### Kết quả

{{EmbedLiveSample('Setting counter style over a range')}}

Phạm vi đầu tiên trong danh sách các phạm vi bao gồm 2, 3 và 4. Phạm vi thứ hai bao gồm 7, 8 và 9. Phạm vi là hợp của hai phạm vi này, tức là 2, 3, 4, 7, 8 và 9.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các descriptor khác của {{cssxref("@counter-style")}}: {{cssxref("@counter-style/system","system")}}, {{cssxref("@counter-style/symbols", "symbols")}}, {{cssxref("@counter-style/additive-symbols", "additive-symbols")}}, {{cssxref("@counter-style/negative", "negative")}}, {{cssxref("@counter-style/prefix", "prefix")}}, {{cssxref("@counter-style/suffix", "suffix")}}, {{cssxref("@counter-style/pad", "pad")}}, {{cssxref("@counter-style/speak-as", "speak-as")}}, và {{cssxref("@counter-style/fallback", "fallback")}}
- {{Cssxref("list-style")}}, {{Cssxref("list-style-image")}}, {{Cssxref("list-style-position")}}
- {{cssxref("symbols()")}}: ký hiệu hàm để tạo kiểu bộ đếm ẩn danh.
- Module [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
- Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
