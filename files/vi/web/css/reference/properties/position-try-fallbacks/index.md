---
title: position-try-fallbacks
slug: Web/CSS/Reference/Properties/position-try-fallbacks
page-type: css-property
browser-compat: css.properties.position-try-fallbacks
sidebar: cssref
---

Thuộc tính **`position-try-fallbacks`** của [CSS](/vi/docs/Web/CSS) cho phép bạn chỉ định danh sách một hoặc nhiều **tùy chọn dự phòng position try** thay thế cho các phần tử được định vị theo neo, để đặt chúng tương đối với các phần tử neo liên kết. Khi phần tử sẽ tràn ra ngoài khối chứa có phần bù inset, trình duyệt sẽ thử đặt phần tử được định vị vào các vị trí dự phòng khác nhau này, theo thứ tự được cung cấp, cho đến khi tìm được giá trị ngăn nó tràn ra ngoài container hoặc viewport.

> [!NOTE]
> Có thể dùng thuộc tính viết tắt {{cssxref("position-try")}} để chỉ định các giá trị {{cssxref("position-try-order")}} và `position-try-fallbacks` trong một khai báo duy nhất.

> [!NOTE]
> Thuộc tính này ban đầu được đặt tên và hỗ trợ trong các trình duyệt Chromium là `position-try-options`, với cùng giá trị thuộc tính. Cho đến khi `position-try-fallbacks` được hỗ trợ, hãy sử dụng thuộc tính viết tắt {{cssxref("position-try")}} thay thế.

## Cú pháp

```css
/* Giá trị mặc định: không có tùy chọn dự phòng */
position-try-fallbacks: none;

/* Tùy chọn thử đơn lẻ */
position-try-fallbacks: flip-block;
position-try-fallbacks: top;
position-try-fallbacks: --custom-try-option;

/* Tùy chọn kết hợp nhiều giá trị */
position-try-fallbacks: flip-block flip-inline;

/* Nhiều giá trị */
position-try-fallbacks: flip-block, flip-inline;
position-try-fallbacks: top, right, bottom;
position-try-fallbacks: --custom-try-option1, --custom-try-option2;
position-try-fallbacks:
  flip-block,
  flip-inline,
  flip-block flip-inline;
position-try-fallbacks:
  flip-block,
  --custom-try-option,
  --custom-try-option flip-inline,
  right;

/* Giá trị toàn cục */
position-try-fallbacks: inherit;
position-try-fallbacks: initial;
position-try-fallbacks: revert;
position-try-fallbacks: revert-layer;
position-try-fallbacks: unset;
```

Thuộc tính `position-try-fallbacks` có thể được chỉ định là giá trị từ khóa `none` hoặc danh sách được phân tách bằng dấu phẩy gồm một hoặc nhiều tên tùy chọn vị trí tùy chỉnh được phân tách bằng dấu cách, hoặc `<try-tactic>`, hoặc giá trị `position-area`.

### Giá trị

- `none`
  - : Giá trị mặc định. Không có tùy chọn dự phòng position try nào được đặt.
- `<try-tactic>`
  - : Các tùy chọn dự phòng được định nghĩa sẵn di chuyển phần tử được định vị bằng cách lấy vị trí đã tính của nó và biến đổi qua một trục cụ thể của neo, phản chiếu bất kỳ lề nào. Các giá trị có thể là:
    - `flip-block`
      - : Lật vị trí phần tử theo trục block.
    - `flip-inline`
      - : Lật vị trí phần tử theo trục inline.
    - `flip-start`
      - : Lật cả giá trị trục inline và block, hoán đổi các thuộc tính `start` với nhau và các thuộc tính `end` với nhau.
- Giá trị {{cssxref("position-area")}}
  - : Định vị phần tử tương đối với các cạnh của phần tử neo liên kết bằng cách đặt phần tử được định vị trên một hoặc nhiều ô của lưới [position area](/en-US/docs/Web/CSS/Reference/Properties/position-area#description) ngầm 3x3 dựa trên giá trị {{cssxref("position-area_value","&lt;position-area>")}} được chỉ định; hiệu ứng giống như một tùy chọn dự phòng {{cssxref("@position-try")}} tùy chỉnh chỉ chứa descriptor {{cssxref("position-area")}}.
- {{cssxref("dashed-ident")}}
  - : Thêm tùy chọn {{cssxref("@position-try")}} tùy chỉnh vào danh sách tùy chọn dự phòng, tên định danh của nó khớp với `dashed-ident` được chỉ định. Nếu không có tùy chọn vị trí tùy chỉnh nào với tên đó tồn tại, tùy chọn này sẽ bị bỏ qua.

> [!NOTE]
> Có thể chỉ định nhiều tùy chọn, được phân tách bằng dấu phẩy.

## Mô tả

Các phần tử được định vị theo neo nên luôn xuất hiện ở vị trí thuận tiện cho người dùng tương tác, nếu có thể, bất kể neo được đặt ở đâu. Để ngăn phần tử được định vị tràn ra ngoài viewport, thường cần thay đổi vị trí của nó khi neo tiếp cận cạnh của phần tử chứa hoặc viewport.

Điều này được thực hiện bằng cách cung cấp một hoặc nhiều tùy chọn dự phòng position-try trong thuộc tính `position-try-fallbacks`. Nếu vị trí ban đầu của phần tử được định vị sẽ tràn ra ngoài, trình duyệt sẽ thử từng tùy chọn vị trí dự phòng; tùy chọn dự phòng đầu tiên không gây ra phần tử tràn ra ngoài khối chứa sẽ được áp dụng. Theo mặc định, trình duyệt sẽ thử chúng theo thứ tự xuất hiện trong danh sách, áp dụng tùy chọn đầu tiên tìm thấy sẽ ngăn phần tử được định vị tràn ra ngoài.

Nếu không tìm thấy tùy chọn nào có thể đặt phần tử được định vị hoàn toàn trên màn hình, trình duyệt sẽ trở về hiển thị phần tử được định vị ở vị trí mặc định trước khi bất kỳ tùy chọn dự phòng nào được áp dụng.

> [!NOTE]
> Trong một số trường hợp, bạn có thể muốn ẩn hoàn toàn các phần tử được định vị tràn ra ngoài, điều này có thể thực hiện bằng thuộc tính {{cssxref("position-visibility")}}. Tuy nhiên trong hầu hết các trường hợp, tốt hơn là giữ chúng hiển thị trên màn hình và có thể sử dụng.

Để biết thông tin chi tiết về tính năng neo và cách sử dụng dự phòng position try, xem module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning) và hướng dẫn [Fallback options and conditional hiding for overflow](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding).

### Các giá trị &lt;try-tactic&gt; định sẵn

Được gọi là `<try-tactic>` trong đặc tả, các giá trị định sẵn di chuyển phần tử được định vị bằng cách lấy vị trí đã tính của nó và biến đổi qua một trục cụ thể của neo. Các giá trị định sẵn là:

- `flip-block`
  - : Lật vị trí phần tử theo trục block để nó xuất hiện cùng khoảng cách từ neo nhưng ở phía đối diện. Nói cách khác, nó phản chiếu vị trí phần tử qua một trục inline kẻ qua tâm neo. Ví dụ, nếu phần tử được định vị bắt đầu tràn ra ở đầu neo, giá trị này sẽ lật vị trí xuống phía dưới.
- `flip-inline`
  - : Lật vị trí phần tử theo trục inline để nó xuất hiện cùng khoảng cách từ neo nhưng ở phía đối diện. Nói cách khác, nó phản chiếu vị trí phần tử qua một trục block kẻ qua tâm neo. Ví dụ, nếu phần tử được định vị bắt đầu tràn ở phía bên trái của neo, giá trị này sẽ lật vị trí sang phía bên phải.
- `flip-start`
  - : Phản chiếu vị trí phần tử qua một trục kẻ chéo qua tâm neo, đi qua điểm giao của block axis start và inline axis start, và điểm giao của block axis end và inline axis end. Ví dụ, nếu phần tử được định vị bắt đầu tràn ở phía bên trái của neo, giá trị này sẽ lật phần tử được định vị lên trên.

### Tùy chọn kết hợp

Một tùy chọn dự phòng position-try đơn lẻ có thể bao gồm nhiều hơn một tùy chọn `<try-tactic>` hoặc `dashed-ident`, hoặc kết hợp cả hai bằng cách khai báo chúng làm một tùy chọn được phân tách bằng dấu cách:

- Trong trường hợp nhiều tùy chọn `<try-tactic>` được định nghĩa sẵn, các phép biến đổi của chúng được kết hợp lại.
- Trong trường hợp khai báo một `<try-tactic>` định sẵn và một tùy chọn `@position-try` được đặt tên `<dashed-ident>`, tùy chọn vị trí tùy chỉnh được áp dụng trước, sau đó phép biến đổi `<try-tactic>` được áp dụng.

Giá trị `position-area` không thể kết hợp theo cách này.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cách sử dụng cơ bản

Ví dụ này minh họa cách sử dụng cơ bản của một vài tùy chọn dự phòng `<try-tactic>` định sẵn.

#### HTML

HTML bao gồm hai phần tử {{htmlelement("div")}} sẽ trở thành một neo và một phần tử được định vị theo neo:

```html
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>
```

#### CSS

Chúng ta tạo kiểu cho phần tử `<body>` rất lớn để kích hoạt cuộn cả chiều ngang lẫn chiều dọc.

Neo được đặt {{cssxref("anchor-name")}} và lề lớn để đặt nó ở gần trung tâm của phần hiển thị của `<body>`:

```css hidden
.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}
```

```css
body {
  width: 1500px;
  height: 500px;
}

.anchor {
  anchor-name: --my-anchor;
  margin: 100px 350px;
}
```

Infobox được đặt vị trí cố định, có thuộc tính {{cssxref("position-anchor")}} tham chiếu đến `anchor-name` của neo để liên kết chúng, và được neo vào góc trên bên trái của neo bằng `position-area`.

Chúng ta thêm danh sách `position-try-fallbacks` (và khai báo lại với thuộc tính viết tắt `position-try` phòng trường hợp tên thuộc tính longhand chưa được hỗ trợ), cung cấp hai tùy chọn dự phòng position-try định sẵn để ngăn nó tràn khi neo tiếp cận cạnh viewport, bằng cách lật theo trục inline hoặc block của neo.

```css hidden
.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

```css
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  position-area: top left;

  position-try-fallbacks: flip-block, flip-inline;
  position-try: flip-block, flip-inline;
}
```

#### Kết quả

Kết quả như sau:

{{ EmbedLiveSample("Predefined try options", "100%", "250") }}

Thử cuộn để neo tiếp cận các cạnh:

- Nếu bạn di chuyển neo về phía trên cùng của viewport, bạn sẽ thấy phần tử được định vị lật xuống phía dưới bên trái của neo để tránh tràn.
- Nếu bạn di chuyển neo về phía bên trái của viewport, bạn sẽ thấy phần tử được định vị lật lên phía trên bên phải của neo để tránh tràn.

Tùy thuộc vào trình duyệt, khi phần tử được định vị di chuyển sang vị trí dự phòng, nó có thể ở lại vị trí dự phòng ngay cả khi việc định vị dự phòng không còn cần thiết nữa.

Tuy nhiên, nếu bạn di chuyển neo về phía góc trên bên trái của viewport, bạn sẽ nhận thấy một vấn đề — khi phần tử được định vị bắt đầu tràn theo hướng block và inline, nó lật trở về vị trí mặc định phía trên bên trái và tràn theo cả hai hướng, điều này không phải là những gì chúng ta muốn.

Điều này là do chúng ta chỉ cung cấp cho trình duyệt các tùy chọn vị trí `flip-block` _hoặc_ `flip-inline`. Chúng ta chưa cho nó tùy chọn thử cả hai cùng một lúc. Ví dụ tiếp theo sẽ cho bạn thấy cách khắc phục vấn đề này.

### Kết hợp nhiều giá trị thành một tùy chọn

Hãy sử dụng một tùy chọn dự phòng kết hợp để khắc phục vấn đề trong bản demo trước.

#### HTML và CSS

Tất cả HTML và CSS trong bản demo này đều giống nhau, ngoại trừ mã của phần tử được định vị. Trong trường hợp này, nó được cung cấp thêm tùy chọn dự phòng position try thứ ba: `flip-block flip-inline`:

```html hidden
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>
```

```css hidden
body {
  width: 1500px;
  height: 500px;
}

.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}

.anchor {
  anchor-name: --my-anchor;
  margin: 100px 350px;
}

.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

```css
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  position-area: top left;

  position-try:
    flip-block,
    flip-inline,
    flip-block flip-inline;
  position-try-fallbacks:
    flip-block,
    flip-inline,
    flip-block flip-inline;
}
```

#### Kết quả

{{ EmbedLiveSample("Combining multiple values into one option", "100%", "250") }}

Tùy chọn dự phòng position-try thứ ba có nghĩa là trình duyệt sẽ thử `flip-block` rồi `flip-inline` để tránh tràn, và nếu các dự phòng đó thất bại, nó sẽ kết hợp cả hai, lật vị trí phần tử theo cả hướng block và inline cùng lúc. Bây giờ khi bạn cuộn neo về phía cạnh trên _và_ bên trái của viewport, phần tử được định vị sẽ lật sang góc dưới bên phải.

### Tùy chọn dự phòng `position-area`

Ví dụ này minh họa một số tùy chọn dự phòng position-try với `position-area` đang hoạt động.

#### HTML và CSS

Tất cả HTML và CSS trong bản demo này đều giống nhau, ngoại trừ mã của phần tử được định vị. Trong trường hợp này, các tùy chọn dự phòng position try đều là giá trị `position-area` — `top`, `top right`, `right`, `bottom right`, `bottom`, `bottom left` và `left`.

Điều này có nghĩa là phần tử được định vị sẽ tìm được vị trí hợp lý để hiển thị, bất kể cạnh viewport nào mà neo đang gần. Cách tiếp cận này dài dòng hơn cách tiếp cận với các giá trị định sẵn, nhưng cũng chi tiết và linh hoạt hơn.

```html hidden
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>
```

```css hidden
body {
  width: 1500px;
  height: 500px;
}

.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}

.anchor {
  anchor-name: --my-anchor;
  margin: 100px 350px;
}

.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

```css-nolint
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  position-area: top left;

  position-try:
    top, top right, right,
    bottom right, bottom,
    bottom left, left;

  position-try-fallbacks:
    top, top right, right,
    bottom right, bottom,
    bottom left, left;
}
```

#### Kết quả

{{ EmbedLiveSample("`position-area` try fallback options", "100%", "250") }}

Cuộn trang và xem hiệu ứng của các tùy chọn dự phòng position-try này khi neo tiếp cận cạnh viewport.

### Ví dụ tùy chọn thử tùy chỉnh

Xem trang tham khảo {{cssxref("@position-try")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("position-try")}}
- {{cssxref("position-try-order")}}
- Quy tắc at {{cssxref("@position-try")}}
- {{cssxref("position-area")}}
- Giá trị [`<position-area>`](/en-US/docs/Web/CSS/Reference/Values/position-area_value)
- Hướng dẫn [Fallback options and conditional hiding for overflow](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding)
- Hướng dẫn [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using)
- Module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
