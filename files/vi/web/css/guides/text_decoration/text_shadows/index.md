---
title: Introduction to text shadows
short-title: Text shadows
slug: Web/CSS/Guides/Text_decoration/Text_shadows
page-type: guide
sidebar: cssref
---

Bạn có thể áp dụng shadow cho văn bản bằng cách sử dụng thuộc tính {{cssxref("text-shadow")}}. Thuộc tính này chấp nhận một danh sách các giá trị shadow được phân tách bằng dấu phẩy. Mỗi shadow yêu cầu ít nhất hai giá trị {{cssxref("length")}} nhưng có thể bao gồm tối đa ba giá trị `<length>` và một giá trị {{cssxref("color")}}.

```css
text-shadow: 1px 3px;
text-shadow: 1px -2px 3px white;
text-shadow:
  5px 5px mediumblue,
  10px 10px magenta,
  15px 15px rebeccapurple;
```

Để xóa bất kỳ shadow nào khỏi văn bản, hãy sử dụng từ khóa `none`.

```css
text-shadow: none;
```

Trong hướng dẫn này, chúng ta xem xét các thành phần của text shadow và cách bạn có thể áp dụng nhiều text shadow cho một phần tử.

## Các thành phần của text shadow

Mỗi shadow bao gồm một horizontal offset, một vertical offset, và một blur radius tùy chọn, theo thứ tự đó. Bạn cũng có thể định nghĩa màu của shadow.

### Horizontal offset

Giá trị {{cssxref("length")}} đầu tiên trong giá trị của `text-shadow` đại diện cho horizontal offset của shadow so với văn bản gốc. Các giá trị dương di chuyển shadow sang phải, trong khi các giá trị âm di chuyển nó sang trái. Giá trị `0` là một giá trị hợp lệ phổ biến.

Trong ví dụ này, các khai báo `text-shadow` khác nhau chỉ ở horizontal offset của chúng. Giá trị `<length>` đầu tiên di chuyển shadow sang trái (`-30px`) hoặc sang phải (`30px`).

```css live-sample___horizontal
.negative {
  text-shadow: -30px 0 1px red;
}

.positive {
  text-shadow: 30px 0 1px red;
}

.zero {
  text-shadow: 0 0 1px red;
}
```

```html hidden live-sample___horizontal live-sample___vertical live-sample___blur
<p class="negative">Negative</p>
<p class="positive">Positive</p>
<p class="zero">Zero</p>
```

```css hidden live-sample___horizontal live-sample___vertical live-sample___blur live-sample___multiple1
p {
  border: 1px solid;
  padding: 20px;
  font-family: sans-serif;
  font-size: 1.25rem;
}
```

{{EmbedLiveSample('horizontal','auto','320')}}

Bạn có thể nhận thấy rằng thuộc tính `text-shadow` không có hiệu lực trên [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model/Introduction), tương tự như thuộc tính {{cssxref("outline")}}. Giống như {{cssxref("box-shadow")}}, text shadow không ảnh hưởng đến bố cục, không kích hoạt cuộn, và không ảnh hưởng đến kích thước của vùng overflow có thể cuộn. Mặc dù text shadow có thể làm cho văn bản của một phần tử trông lớn hơn, chúng không có tác động thực tế lên chiều rộng (hoặc chiều cao) của nội dung.

### Vertical offset

Giá trị {{cssxref("length")}} thứ hai trong giá trị của `text-shadow` đại diện cho vertical offset của shadow so với văn bản gốc. Giá trị bắt buộc này hoạt động tương tự như horizontal offset, ngoại trừ nó di chuyển shadow lên hoặc xuống thay vì sang trái hoặc phải.

Trong ví dụ này, các khai báo `text-shadow` khác nhau chỉ ở vertical offset của chúng. Giá trị `<length>` thứ hai di chuyển shadow lên (`-30px`) hoặc xuống (`30px`).

```css live-sample___vertical
.negative {
  text-shadow: 0 -30px 1px red;
}

.positive {
  text-shadow: 0 30px 1px red;
}

.zero {
  text-shadow: 0 0 1px red;
}
```

{{EmbedLiveSample('vertical','auto','320')}}

### Blur radius

Blur radius được định nghĩa bởi giá trị {{cssxref("length")}} thứ ba và là tùy chọn. Nếu bị bỏ qua, blur radius là `0`, tạo ra một bản sao của văn bản được định vị bởi hai giá trị length đầu tiên. Giá trị phải là `0` hoặc lớn hơn; giá trị càng lớn, hiệu ứng shadow sẽ được phân tán rộng hơn.

Trong ví dụ này, các khai báo `text-shadow` khác nhau chỉ ở blur radius của chúng. Giá trị `<length>` thứ ba này hoặc không hợp lệ (`-5px`), làm mờ shadow (`5px`), hoặc tạo ra một bản sao của văn bản (`0`).

```css live-sample___blur
.negative {
  /* invalid */
  text-shadow: 30px 30px -5px red;
}

.positive {
  text-shadow: 30px 30px 5px red;
}

.zero {
  text-shadow: 30px 30px 0 red;
}
```

{{EmbedLiveSample('blur','auto','320')}}

### Màu shadow

Mặc dù bạn có thể áp dụng [nhiều shadow](#nhiều-shadow) cho văn bản, mỗi shadow bao gồm một màu cơ bản duy nhất. Màu đó có thể là bất kỳ giá trị CSS {{cssxref("color")}} hợp lệ nào, mặc định là [`currentcolor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword) nếu bị bỏ qua.

Ba shadow sau đây tương đương nhau về màu shadow:

```css
.shadow-color {
  text-shadow:
    5px 5px mediumblue,
    10px 10px magenta,
    15px 15px rebeccapurple;
}

.shadow-color-hex {
  text-shadow:
    5px 5px #0000cd,
    10px 10px #ff00ff,
    15px 15px #663399;
}

.shadow-color-rgb {
  text-shadow:
    5px 5px rgb(0 0 205),
    10px 10px rgb(255 0 255),
    15px 15px rgb(102 51 153);
}
```

## Nhiều shadow

Bạn có thể áp dụng nhiều shadow cho cùng một văn bản bằng cách bao gồm nhiều giá trị shadow được phân tách bằng dấu phẩy.

Các hiệu ứng shadow được áp dụng theo thứ tự từ trước ra sau: shadow đầu tiên ở trên cùng.

Trong ví dụ của chúng ta về `text-shadow: 5px 5px mediumblue, 10px 10px magenta, 15px 15px rebeccapurple;`, nó định nghĩa ba shadow, với shadow màu xanh ở trên màu hồng, màu hồng ở trên màu tím:

```css hidden live-sample___multiple1
p {
  text-shadow:
    5px 5px mediumblue,
    10px 10px magenta,
    15px 15px rebeccapurple;
}
```

```html hidden live-sample___multiple1
<p>I have three shadows</p>
```

{{EmbedLiveSample('multiple1','auto','120')}}

## Nhiều shadow với văn bản trong suốt

Các shadow được vẽ phía trên bất kỳ màu nền hoặc hình ảnh nào và bên dưới bất kỳ border nào. Mặc dù các shadow chồng lên nhau, chúng không chồng lên văn bản. Không có tương đương với từ khóa `inset` của thuộc tính {{cssxref("box-shadow")}} trong thế giới text shadow. Không giống như box shadow, text shadow không bị cắt theo hình dạng shadow và có thể hiển thị qua nếu văn bản có một phần trong suốt.

Các ví dụ sau áp dụng cùng các shadow cho văn bản nhưng với các giá trị thuộc tính {{cssxref("color")}} khác nhau. Các ví dụ bán trong suốt khó đọc nhưng được bao gồm để minh họa cách shadow hiển thị:

```css live-sample___opaque
p {
  text-shadow:
    5px 5px 0 mediumblue,
    10px 10px 5px magenta,
    15px 15px 10px rebeccapurple;
}

.opaque {
  color: black;
}

.semitransparent {
  color: rgb(0 0 0 / 0.5);
}

.transparent {
  color: transparent;
}

.white {
  color: white;
}

.semi-white {
  color: rgb(255 255 255 / 0.75);
}
```

```html hidden live-sample___opaque
<p class="opaque">The text is opaque black</p>
<p class="semitransparent">The text is semiopaque black</p>
<p class="transparent">The text is transparent black</p>
<p class="white">The text is opaque white</p>
<p class="semi-white">The text is semiopaque white</p>
```

```css hidden live-sample___opaque
p {
  border: 1px solid black;
  padding: 20px;
  font-family: sans-serif;
  font-size: 1.75rem;
  font-weight: bold;
}
```

{{EmbedLiveSample('opaque','auto','540')}}

Trong ví dụ "transparent", văn bản trong suốt nhưng hoàn toàn có thể đọc được vì shadow trên cùng không bị mờ. Lưu ý cách shadow xuất hiện phía sau văn bản và có thể nhìn thấy khi văn bản ít hơn hoàn toàn mờ. Điều này đặc biệt dễ thấy trong ví dụ "semi-opaque white". Hành vi này khác với các non-inset box shadow, nơi shadow bị cắt ở cạnh ngoài của border.
