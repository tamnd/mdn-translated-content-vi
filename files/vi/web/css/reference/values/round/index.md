---
title: round()
slug: Web/CSS/Reference/Values/round
page-type: css-function
browser-compat: css.types.round
sidebar: cssref
---

Hàm **`round()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) trả về một số được làm tròn dựa trên chiến lược làm tròn được chọn.

Các tác giả nên sử dụng [thuộc tính CSS tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) (ví dụ: `--my-property`) cho giá trị làm tròn, khoảng cách làm tròn, hoặc cả hai; sử dụng hàm `round()` là dư thừa nếu những giá trị này đã được biết.

## Cú pháp

```css
width: round(var(--width), 50px);
width: round(up, 101px, var(--interval));
width: round(down, var(--height), var(--interval));
margin: round(to-zero, -105px, 10px);
```

### Tham số

Hàm `round(<rounding-strategy>, valueToRound, roundingInterval)` chỉ định một chiến lược làm tròn tùy chọn, một giá trị (hoặc biểu thức toán học) cần làm tròn và một khoảng cách làm tròn (hoặc biểu thức toán học).
`valueToRound` được làm tròn theo chiến lược làm tròn, đến bội số nguyên gần nhất của `roundingInterval`.

- `<rounding-strategy>`
  - : Chiến lược làm tròn.
    Đây có thể là một trong các giá trị sau:
    - `up`
      - : Làm tròn `valueToRound` lên bội số nguyên gần nhất của `roundingInterval` (nếu giá trị là âm, nó sẽ trở nên "dương hơn"). Tương đương với phương thức [`Math.ceil()`](/vi/docs/Web/JavaScript/Reference/Global_Objects/Math/ceil) trong JavaScript.
    - `down`
      - : Làm tròn `valueToRound` xuống bội số nguyên gần nhất của `roundingInterval` (nếu giá trị là âm, nó sẽ trở nên "âm hơn"). Tương đương với phương thức [`Math.floor()`](/vi/docs/Web/JavaScript/Reference/Global_Objects/Math/floor) trong JavaScript.
    - `nearest` (mặc định)
      - : Làm tròn `valueToRound` đến bội số nguyên gần nhất của `roundingInterval`, có thể lớn hơn hoặc nhỏ hơn giá trị.
        Nếu `valueToRound` nằm chính giữa hai mục tiêu làm tròn ở trên và dưới (không có cái nào là "gần nhất"), nó sẽ được làm tròn lên.
        Tương đương với [`Math.round()`](/vi/docs/Web/JavaScript/Reference/Global_Objects/Math/round) trong JavaScript.
    - `to-zero`
      - : Làm tròn `valueToRound` đến bội số nguyên gần nhất của `roundingInterval` gần hơn về phía/hướng về không (số dương sẽ giảm, trong khi giá trị âm sẽ trở nên "ít âm hơn"). Tương đương với phương thức [`Math.trunc()`](/vi/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc) trong JavaScript.

- `valueToRound`
  - : Giá trị cần làm tròn.
    Đây phải là {{CSSxREF("&lt;number&gt;")}}, {{CSSxREF("&lt;dimension&gt;")}}, hoặc {{CSSxREF("&lt;percentage&gt;")}}, hoặc một biểu thức toán học trả về một trong những giá trị đó.

- `roundingInterval`
  - : Khoảng cách làm tròn.
    Đây là {{CSSxREF("&lt;number&gt;")}}, {{CSSxREF("&lt;dimension&gt;")}}, hoặc {{CSSxREF("&lt;percentage&gt;")}}, hoặc một biểu thức toán học trả về một trong những giá trị đó. Nếu `valueToRound` là {{CSSxREF("&lt;number&gt;")}}, `roundingInterval` có thể bị bỏ qua và mặc định là `1`. Nếu không, bỏ qua nó sẽ dẫn đến biểu thức không hợp lệ.

### Giá trị trả về

Giá trị của `valueToRound`, được làm tròn đến bội số nguyên thấp hơn hoặc cao hơn gần nhất của `roundingInterval`, tùy thuộc vào chiến lược làm tròn.

- Nếu `roundingInterval` là 0, kết quả là `NaN`.
- Nếu cả `valueToRound` và `roundingInterval` đều là `vô cùng`, kết quả là `NaN`.
- Nếu `valueToRound` là vô cùng nhưng `roundingInterval` là hữu hạn, kết quả là cùng một giá trị `vô cùng`.
- Nếu `valueToRound` là hữu hạn nhưng `roundingInterval` là vô cùng, kết quả phụ thuộc vào chiến lược làm tròn và dấu của `A`:
  - `up` - Nếu `valueToRound` là dương (không phải không), trả về `+∞`. Nếu `valueToRound` là `0⁺`, trả về `0⁺`. Nếu không, trả về `0⁻`.
  - `down` - Nếu `valueToRound` là âm (không phải không), trả về `−∞`. Nếu `valueToRound` là `0⁻`, trả về `0⁻`. Nếu không, trả về `0⁺`.
  - `nearest`, `to-zero` - Nếu `valueToRound` là dương hoặc `0⁺`, trả về `0⁺`. Nếu không, trả về `0⁻`.

- Các phép tính đối số có thể trả về {{CSSxREF("&lt;number&gt;")}}, {{CSSxREF("&lt;dimension&gt;")}}, hoặc {{CSSxREF("&lt;percentage&gt;")}}, nhưng phải có cùng kiểu, nếu không hàm không hợp lệ; kết quả sẽ có cùng kiểu với các đối số.
- Nếu `valueToRound` chính xác bằng một bội số nguyên của `roundingInterval`, `round()` trả về chính xác `valueToRound` (giữ nguyên liệu `valueToRound` là `0⁻` hay `0⁺`, nếu có liên quan). Nếu không, có hai bội số nguyên của `roundingInterval` có thể "gần nhất" với `valueToRound`, `roundingInterval` thấp hơn gần `−∞` hơn và `roundingInterval` cao hơn gần `+∞` hơn.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Làm tròn các giá trị dương

Ví dụ này minh họa cách các chiến lược làm tròn của hàm `round()` hoạt động với các giá trị dương.

Trong số năm hộp bên dưới, hàm `round()` được sử dụng để đặt chiều cao của bốn hộp cuối.
Giá trị cần làm tròn nằm trong khoảng từ 100 px đến 125 px trong mỗi trường hợp, và giá trị làm tròn là 25px trong tất cả các trường hợp.
Do đó, chiều cao của các hộp được làm tròn lên đến 125 px hoặc xuống đến 100 px.

#### HTML

HTML xác định 5 phần tử `div` sẽ được hiển thị dưới dạng hộp bởi CSS.
Các phần tử chứa văn bản cho biết chiến lược làm tròn, giá trị ban đầu, và chiều cao cuối cùng dự kiến của hộp (trong ngoặc đơn).

```html
<div class="box box-1">height: 100px</div>
<div class="box box-2">up 101px (125px)</div>
<div class="box box-3">down 122px (100px)</div>
<div class="box box-4">to-zero 120px (100px)</div>
<div class="box box-5">nearest 117px (125px)</div>
```

#### CSS

```css hidden
body {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 50px;
}
```

CSS được áp dụng cho tất cả các hộp được hiển thị bên dưới.
Lưu ý rằng chúng ta áp dụng [thuộc tính CSS tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) có tên `--rounding-interval`, mà chúng ta sẽ sử dụng cho khoảng cách làm tròn.

```css
div.box {
  width: 100px;
  height: 100px;
  background: lightblue;
  --rounding-interval: 25px;
}
```

`div` đầu tiên từ bên trái không được nhắm mục tiêu với các quy tắc CSS cụ thể, vì vậy nó sẽ có chiều cao mặc định là 100px.
CSS cho `div` hai, ba và bốn được hiển thị bên dưới, làm tròn lên, xuống và về không tương ứng.

```css
div.box-2 {
  height: round(up, 101px, var(--rounding-interval));
}
div.box-3 {
  height: round(down, 122px, var(--rounding-interval));
}
div.box-4 {
  height: round(to-zero, 120px, var(--rounding-interval));
}
```

Lưu ý cách ở trên chúng ta chỉ định khoảng cách làm tròn bằng `var()` và thuộc tính CSS tùy chỉnh `--rounding-interval`.

Hộp cuối cùng được đặt mà không chỉ định chiến lược làm tròn, do đó mặc định là `nearest`.
Trong trường hợp này, khoảng cách gần nhất với 117 px là 125px, vì vậy nó sẽ làm tròn lên.
Để so sánh, ở đây chúng ta chỉ định các giá trị được mã hóa cứng cho cả giá trị làm tròn và khoảng cách.
Mặc dù điều này được phép, bạn thường không làm vậy vì không có ý nghĩa gì khi làm tròn một số khi bạn đã biết kết quả phải là gì.

```css
div.box-5 {
  height: round(117px, 25px);
}
```

#### Kết quả

Nếu trình duyệt hỗ trợ hàm CSS `round()`, bạn sẽ thấy năm cột với chiều cao được làm tròn như được chỉ định trong văn bản chứa.

{{EmbedLiveSample('Round positive values', '100%', '200px')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("mod")}}
- {{CSSxRef("rem")}}
