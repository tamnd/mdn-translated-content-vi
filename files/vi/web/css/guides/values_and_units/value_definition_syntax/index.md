---
title: Value definition syntax
slug: Web/CSS/Guides/Values_and_units/Value_definition_syntax
page-type: guide
spec-urls: https://drafts.csswg.org/css-values/#value-defs
sidebar: cssref
---

**Cú pháp định nghĩa giá trị CSS**, một ngữ pháp hình thức, được sử dụng để định nghĩa tập hợp các giá trị hợp lệ cho một thuộc tính hoặc hàm CSS. Ngoài cú pháp này, tập hợp các giá trị hợp lệ còn có thể bị hạn chế thêm bởi các ràng buộc ngữ nghĩa (ví dụ, để một số phải nghiêm ngặt là dương).

Cú pháp định nghĩa mô tả những giá trị nào được cho phép và các tương tác giữa chúng. Một thành phần có thể là một _keyword_, một số ký tự được coi là _literal_, hoặc một giá trị của một kiểu dữ liệu CSS hoặc thuộc tính CSS khác.

## Kiểu giá trị thành phần

### Keyword

#### Keyword thông thường

Một keyword có ý nghĩa được định sẵn xuất hiện theo nghĩa đen, không có dấu ngoặc. Ví dụ: `auto`, `smaller`, hoặc `ease-in`.

#### CSS-wide keyword

Tất cả các thuộc tính CSS đều chấp nhận các keyword `inherit`, `initial`, `revert`, `revert-layer`, và `unset`. Chúng không được hiển thị trong định nghĩa giá trị và được định nghĩa ngầm định.

### Literal

Trong CSS, một vài ký tự có thể xuất hiện độc lập, như dấu gạch chéo (`/`) hoặc dấu phẩy (`,`), và được sử dụng trong định nghĩa thuộc tính để phân tách các phần của nó. Dấu phẩy thường được dùng để tách các giá trị trong danh sách liệt kê, hoặc các tham số trong các hàm giống toán học; dấu gạch chéo thường phân tách các phần của giá trị có ý nghĩa khác nhau về mặt ngữ nghĩa nhưng có cú pháp chung. Thông thường, dấu gạch chéo được dùng trong các shorthand property; để phân tách các thành phần cùng kiểu nhưng thuộc các thuộc tính khác nhau.

Cả hai ký hiệu đều xuất hiện theo nghĩa đen trong định nghĩa giá trị.

### Kiểu dữ liệu

#### Kiểu dữ liệu cơ bản

Một số kiểu dữ liệu được sử dụng xuyên suốt CSS và được định nghĩa một lần cho tất cả các giá trị trong đặc tả. Được gọi là _kiểu dữ liệu cơ bản_, chúng được biểu diễn bằng tên của chúng được bao quanh bởi ký hiệu `<` và `>`: {{cssxref("angle")}}, {{CSSxRef("&lt;string&gt;")}}, …

#### Kiểu dữ liệu non-terminal

Các kiểu dữ liệu ít phổ biến hơn, được gọi là _kiểu dữ liệu non-terminal_, cũng được bao quanh bởi `<` và `>`.

Kiểu dữ liệu non-terminal có hai loại:

- kiểu dữ liệu _chia sẻ cùng tên với một thuộc tính_, được đặt trong dấu ngoặc kép. Trong trường hợp này, kiểu dữ liệu chia sẻ cùng tập hợp giá trị với thuộc tính. Chúng thường được dùng trong định nghĩa các shorthand property.
- kiểu dữ liệu _không chia sẻ tên với một thuộc tính_. Các kiểu dữ liệu này rất gần với kiểu dữ liệu cơ bản. Chúng chỉ khác với kiểu dữ liệu cơ bản ở vị trí vật lý của định nghĩa của chúng. Trong trường hợp này, định nghĩa thường rất gần với định nghĩa của thuộc tính sử dụng chúng.

## Bộ kết hợp giá trị thành phần

### Dấu ngoặc vuông

_Dấu ngoặc vuông_ bao quanh nhiều thực thể, bộ kết hợp và bộ nhân, sau đó biến đổi chúng thành một thành phần duy nhất. Chúng được dùng để **nhóm các thành phần để bỏ qua quy tắc ưu tiên**.

{{CSSSyntaxRaw(`example = bold [ thin && <length> ]`)}}

Ví dụ này khớp với các giá trị sau:

- `bold thin 2vh`
- `bold 0 thin`
- `bold thin 3.5em`

Nhưng không khớp với:

- `thin bold 3em`, vì `bold` được đặt cạnh nhau với thành phần được định nghĩa bởi dấu ngoặc, nó phải xuất hiện trước nó.

### Juxtaposition

Đặt nhiều keyword, literal hoặc kiểu dữ liệu cạnh nhau, chỉ cách nhau bởi một hoặc nhiều khoảng trắng, được gọi là _juxtaposition_. Tất cả các thành phần được đặt cạnh nhau đều **bắt buộc và phải xuất hiện theo đúng thứ tự**.

{{CSSSyntaxRaw(`example = bold <length>, thin`)}}

Ví dụ này khớp với các giá trị sau:

- `bold 1em, thin`
- `bold 0, thin`
- `bold 2.5cm, thin`
- `bold 3vh, thin`

Nhưng không khớp với:

- `thin 1em, bold`, vì các thực thể phải theo thứ tự đã nêu
- `bold 1em thin`, vì các thực thể là bắt buộc; dấu phẩy, một literal, phải có mặt
- `bold 0.5ms, thin`, vì các giá trị `ms` không phải là {{CSSxRef("&lt;length&gt;")}}

### Double ampersand

Phân tách hai hoặc nhiều thành phần bằng _double ampersand_, `&&`, có nghĩa là tất cả các thực thể này đều **bắt buộc nhưng có thể xuất hiện theo bất kỳ thứ tự nào**.

{{CSSSyntaxRaw(`example = bold && <length>`)}}

Ví dụ này khớp với các giá trị sau:

- `bold 1em`
- `bold 0`
- `2.5cm bold`
- `3vh bold`

Nhưng không khớp với:

- `bold`, vì cả hai thành phần phải xuất hiện trong giá trị.
- `bold 1em bold`, vì cả hai thành phần chỉ được xuất hiện một lần.

> [!NOTE]
> Juxtaposition có ưu tiên cao hơn double ampersand, nghĩa là `bold thin && <length>` tương đương với `[ bold thin ] && <length>`. Nó mô tả `bold thin <length>` hoặc `<length> bold thin` nhưng không phải `bold <length> thin`.

### Double bar

Phân tách hai hoặc nhiều thành phần bằng _double bar_, `||`, có nghĩa là tất cả các thực thể đều là tùy chọn: **ít nhất một phải có mặt, và chúng có thể xuất hiện theo bất kỳ thứ tự nào**. Thông thường điều này được dùng để định nghĩa các giá trị khác nhau của [shorthand property](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties).

{{CSSSyntaxRaw(`example = <number> || <length> || <color>`)}}

Ví dụ này khớp với các giá trị sau:

- `1em 1 blue`
- `blue 1em`
- `1 1px yellow`

Nhưng không khớp với:

- `blue yellow`, vì một thành phần phải xuất hiện nhiều nhất một lần.
- `bold`, vì nó không phải là keyword được phép làm giá trị của bất kỳ thực thể nào.

> [!NOTE]
> Double ampersand có ưu tiên cao hơn double bar, nghĩa là `bold || thin && <length>` tương đương với `bold || [ thin && <length> ]`. Nó mô tả `bold`, `thin <length>`, `bold thin <length>`, hoặc `thin <length> bold` nhưng không phải `<length> bold thin` vì bold, nếu không bị bỏ qua, phải được đặt trước hoặc sau toàn bộ thành phần `thin && <length>`.

### Single bar

Phân tách hai hoặc nhiều thực thể bằng _single bar_, `|`, có nghĩa là tất cả các thực thể là các tùy chọn loại trừ lẫn nhau: **chính xác một trong các tùy chọn này phải có mặt**. Điều này thường được dùng để phân tách danh sách các keyword có thể.

{{CSSSyntaxRaw(`example = <percentage> | <length> | left | center | right | top | bottom`)}}

Ví dụ này khớp với các giá trị sau:

- `3%`
- `0`
- `3.5em`
- `left`
- `center`
- `right`
- `top`
- `bottom`

Nhưng không khớp với:

- `center 3%`, vì chỉ một trong các thành phần phải có mặt.
- `3em 4.5em`, vì một thành phần phải có mặt nhiều nhất một lần.

> [!NOTE]
> Double bar có ưu tiên cao hơn single bar, nghĩa là `bold | thin || <length>` tương đương với `bold | [ thin || <length> ]`. Nó mô tả `bold`, `thin`, `<length>`, `<length> thin`, hoặc `thin <length>` nhưng không phải `bold <length>` vì chỉ một thực thể từ mỗi phía của bộ kết hợp `|` có thể có mặt.

## Bộ nhân giá trị thành phần

Bộ nhân là ký hiệu chỉ ra số lần một thực thể đứng trước có thể được lặp lại. Không có bộ nhân, một thực thể phải xuất hiện đúng một lần.

Bộ nhân không thể được thêm vào và có ưu tiên cao hơn tất cả các bộ kết hợp.

### Dấu hoa thị (`*`)

_Bộ nhân dấu hoa thị_ chỉ ra rằng thực thể có thể xuất hiện **không lần, một lần hoặc nhiều lần**.

{{CSSSyntaxRaw(`example = bold smaller*`)}}

Ví dụ này khớp với các giá trị sau:

- `bold`
- `bold smaller`
- `bold smaller smaller`
- `bold smaller smaller smaller`, và tiếp tục.

Nhưng không khớp với:

- `smaller`, vì `bold` được đặt cạnh nhau và phải xuất hiện trước bất kỳ keyword `smaller` nào.

### Dấu cộng (`+`)

_Bộ nhân dấu cộng_ chỉ ra rằng thực thể có thể xuất hiện **một hoặc nhiều lần**.

{{CSSSyntaxRaw(`example = bold smaller+`)}}

Ví dụ này khớp với các giá trị sau:

- `bold smaller`
- `bold smaller smaller`
- `bold smaller smaller smaller`, và tiếp tục.

Nhưng không khớp với:

- `bold`, vì `smaller` phải xuất hiện ít nhất một lần.
- `smaller`, vì `bold` được đặt cạnh nhau và phải xuất hiện trước bất kỳ keyword `smaller` nào.

### Dấu hỏi chấm (`?`)

_Bộ nhân dấu hỏi chấm_ chỉ ra rằng thực thể là tùy chọn, và **phải xuất hiện không lần hoặc một lần**.

{{CSSSyntaxRaw(`example = bold smaller?`)}}

Ví dụ này khớp với các giá trị sau:

- `bold`
- `bold smaller`

Nhưng không khớp với:

- `bold smaller smaller`, vì `smaller` phải xuất hiện nhiều nhất một lần.
- `smaller`, vì `bold` được đặt cạnh nhau và phải xuất hiện trước bất kỳ keyword `smaller` nào.

### Dấu ngoặc nhọn (`{ }`)

_Bộ nhân dấu ngoặc nhọn_, bao quanh hai số nguyên được phân tách bởi dấu phẩy, A và B, chỉ ra rằng thực thể **phải xuất hiện ít nhất A lần và nhiều nhất B lần**.

{{CSSSyntaxRaw(`example = bold smaller{1,3}`)}}

Ví dụ này khớp với các giá trị sau:

- `bold smaller`
- `bold smaller smaller`
- `bold smaller smaller smaller`

Nhưng không khớp với:

- `bold`, vì `smaller` phải xuất hiện ít nhất một lần.
- `bold smaller smaller smaller smaller`, vì `smaller` phải xuất hiện nhiều nhất ba lần.
- `smaller`, vì `bold` được đặt cạnh nhau và phải xuất hiện trước bất kỳ keyword `smaller` nào

### Dấu thăng (`#`)

_Bộ nhân dấu thăng_ chỉ ra rằng thực thể có thể được lặp lại một hoặc nhiều lần (giống như bộ nhân dấu cộng), nhưng mỗi lần xuất hiện được phân tách bằng dấu phẩy (',').

{{CSSSyntaxRaw(`example = bold smaller#`)}}

Ví dụ này khớp với các giá trị sau:

- `bold smaller`
- `bold smaller, smaller`
- `bold smaller, smaller, smaller`, và tiếp tục.

Nhưng không khớp với:

- `bold`, vì `smaller` phải xuất hiện ít nhất một lần.
- `bold smaller smaller smaller`, vì các lần xuất hiện khác nhau của `smaller` phải được phân tách bằng dấu phẩy.
- `smaller`, vì `bold` được đặt cạnh nhau và phải xuất hiện trước bất kỳ keyword `smaller` nào.

Dấu thăng có thể tùy chọn được theo sau bởi dấu ngoặc nhọn để chỉ ra số lần thực thể lặp lại.

{{CSSSyntaxRaw(`example = bold smaller#{1,3}`)}}

Ví dụ này khớp với các giá trị sau:

- `bold smaller`
- `bold smaller, smaller`
- `bold smaller, smaller, smaller`

Nhưng không khớp với:

- `bold smaller, smaller, smaller, smaller`, vì `smaller` phải xuất hiện nhiều nhất ba lần.

{{CSSSyntaxRaw(`example = bold smaller#{2}`)}}

Ví dụ này khớp với giá trị sau:

- `bold smaller, smaller`

Nhưng không khớp với:

- `bold smaller`, vì `smaller` phải xuất hiện đúng hai lần.

### Dấu chấm than (`!`)

_Bộ nhân dấu chấm than_ sau một nhóm chỉ ra rằng nhóm đó là bắt buộc, và phải tạo ra ít nhất một giá trị; ngay cả khi ngữ pháp của các phần tử bên trong nhóm cho phép bỏ qua toàn bộ nội dung, ít nhất một giá trị thành phần không được bỏ qua.

{{CSSSyntaxRaw(`example = [ bold? smaller? ]!`)}}

Ví dụ này khớp với các giá trị sau:

- `bold`
- `smaller`
- `bold smaller`

Nhưng không khớp với:

- không có `bold` cũng không có `smaller`, vì một trong chúng phải xuất hiện.
- `smaller bold`, vì `bold` được đặt cạnh nhau và phải xuất hiện trước keyword `smaller`.
- `bold smaller bold`, vì `bold` và `smaller` chỉ được xuất hiện một lần.

## Ký hiệu phạm vi với ngoặc (`[min,max]`)

Một số kiểu có thể chấp nhận các giá trị số trong một phạm vi nhất định. Ví dụ, thuộc tính {{cssxref("column-count")}} có thể chấp nhận giá trị số nguyên dương từ 1 đến vô cực, bao gồm cả hai đầu. Cú pháp tương ứng trông như thế này:

{{CSSSyntaxRaw(`example = <integer [1,∞]>`)}}

Bất kỳ giá trị nào nằm ngoài phạm vi được chỉ định này sẽ khiến toàn bộ khai báo không hợp lệ, do đó trình duyệt sẽ bỏ qua nó.

_Ký hiệu phạm vi với ngoặc_ `[min, max]` chỉ ra một phạm vi bao gồm giữa giá trị `min` và `max`. Ký hiệu này được dùng trong ký hiệu kiểu số và có thể bao gồm đơn vị, ví dụ: `<angle [0,180deg]>`. Vô cực dương và âm (-∞ và ∞) không được kèm theo đơn vị. Các kiểu được chỉ định bằng đơn vị có thể có giá trị không với hoặc không có đơn vị, ví dụ `<time [0s,10s]>` hoặc `<time [0,10s]>`.

Dưới đây là thêm ví dụ:

- `<integer [-∞,∞]>`: Bất kỳ số nguyên nào từ âm vô cực đến dương vô cực.
- `<integer [0,∞]>`: Bất kỳ số nguyên nào từ 0 đến dương vô cực là hợp lệ. Số nguyên âm là không hợp lệ.
- `<time [0s,10s]>` hoặc `<time [0,10s]>`: Bất kỳ khoảng thời gian nào từ 0 đến 10 giây là hợp lệ.
- `<integer [-∞,-1]> | <integer [1,∞]>`: Bất kỳ số nguyên nào ngoại trừ không đều hợp lệ.

## Tóm tắt

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Ký hiệu</th>
      <th scope="col">Tên</th>
      <th scope="col">Mô tả</th>
      <th scope="col">Ví dụ</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th colspan="4">Bộ kết hợp</th>
    </tr>
    <tr>
      <td></td>
      <td>Juxtaposition</td>
      <td>Các thành phần bắt buộc và phải xuất hiện theo thứ tự đó</td>
      <td><code>solid &#x3C;length></code></td>
    </tr>
    <tr>
      <td><code>&#x26;&#x26;</code></td>
      <td>Double ampersand</td>
      <td>Các thành phần bắt buộc nhưng có thể xuất hiện theo bất kỳ thứ tự nào</td>
      <td><code>&#x3C;length> &#x26;&#x26; &#x3C;string></code></td>
    </tr>
    <tr>
      <td><code>||</code></td>
      <td>Double bar</td>
      <td>
        Ít nhất một trong các thành phần phải có mặt, và chúng có thể xuất hiện
        theo bất kỳ thứ tự nào.
      </td>
      <td>
        <code>&#x3C;'border-image-outset'> || &#x3C;'border-image-slice'></code>
      </td>
    </tr>
    <tr>
      <td><code>|</code></td>
      <td>Single bar</td>
      <td>Chính xác một trong các thành phần phải có mặt</td>
      <td><code>smaller | small | normal | big | bigger</code></td>
    </tr>
    <tr>
      <td><code>[ ]</code></td>
      <td>Dấu ngoặc vuông</td>
      <td>Nhóm các thành phần để bỏ qua quy tắc ưu tiên</td>
      <td><code>bold [ thin &#x26;&#x26; &#x3C;length> ]</code></td>
    </tr>
    <tr>
      <th colspan="4">Bộ nhân</th>
    </tr>
    <tr>
      <td></td>
      <td>Không có bộ nhân</td>
      <td>Đúng 1 lần</td>
      <td><code>solid</code></td>
    </tr>
    <tr>
      <td><code>*</code></td>
      <td>Dấu hoa thị</td>
      <td>0 hoặc nhiều lần</td>
      <td><code>bold smaller*</code></td>
    </tr>
    <tr>
      <td><code>+</code></td>
      <td>Dấu cộng</td>
      <td>1 hoặc nhiều lần</td>
      <td><code>bold smaller+</code></td>
    </tr>
    <tr>
      <td><code>?</code></td>
      <td>Dấu hỏi chấm</td>
      <td>0 hoặc 1 lần (tức là <em>tùy chọn)</em></td>
      <td><code>bold smaller?</code></td>
    </tr>
    <tr>
      <td><code>{min,max}</code></td>
      <td>Dấu ngoặc nhọn</td>
      <td>Ít nhất <code>min</code> lần, nhiều nhất <code>max</code> lần</td>
      <td><code>bold smaller{1,3}</code></td>
    </tr>
    <tr>
      <td><code>#</code></td>
      <td>Dấu thăng</td>
      <td>
        1 hoặc nhiều lần, với mỗi lần xuất hiện được phân tách bằng dấu phẩy
        (<code>,</code>)
      </td>
      <td><code>bold smaller#</code></td>
    </tr>
    <tr>
      <td><code>!</code></td>
      <td>Dấu chấm than</td>
      <td>Nhóm phải tạo ra ít nhất 1 giá trị</td>
      <td><code>[ bold? smaller? ]!</code></td>
    </tr>
    <tr>
      <th colspan="4">Phạm vi</th>
    </tr>
    <tr>
      <td><code>[min,max]</code></td>
      <td>Phạm vi số với ngoặc</td>
      <td>Chỉ định một phạm vi số</td>
      <td><code>&#x3C;integer [0,∞]></code></td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Xem thêm

- Các khái niệm chính của CSS:
  - [Cú pháp CSS](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
  - [Nhận xét](/en-US/docs/Web/CSS/Guides/Syntax/Comments)
  - [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
  - [Kế thừa](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
  - [Box model](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
  - [Chế độ layout](/en-US/docs/Glossary/Layout_mode)
  - [Mô hình định dạng trực quan](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model)
  - [Margin collapsing](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing)
  - Giá trị
    - [Giá trị khởi tạo](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value)
    - [Giá trị được tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value)
    - [Giá trị được sử dụng](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value)
    - [Giá trị thực tế](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value)
  - **Cú pháp định nghĩa giá trị**
  - [Shorthand properties](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties)
  - {{glossary("Replaced elements")}}
