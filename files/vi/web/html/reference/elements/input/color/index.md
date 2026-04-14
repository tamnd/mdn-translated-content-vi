---
title: <input type="color">
slug: Web/HTML/Reference/Elements/input/color
page-type: html-attribute-value
browser-compat:
  - html.elements.input.type_color
  - html.elements.input.alpha
  - html.elements.input.colorspace
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} có kiểu **`color`** cung cấp phần tử giao diện người dùng cho phép người dùng chỉ định màu sắc, bằng cách dùng giao diện chọn màu trực quan hoặc nhập màu vào trường văn bản theo định dạng [giá trị màu CSS](/en-US/docs/Web/CSS/Reference/Values/color_value).

Giao diện của phần tử có thể thay đổi đáng kể từ trình duyệt này sang trình duyệt khác và/hoặc từ nền tảng này sang nền tảng khác — có thể là ô nhập văn bản cơ bản tự động xác thực để đảm bảo thông tin màu được nhập đúng định dạng, hoặc bộ chọn màu theo tiêu chuẩn nền tảng, hoặc cửa sổ chọn màu tùy chỉnh.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;color&quot;&gt;", "tabbed-standard")}}

```html interactive-example
<p>Choose your colors:</p>

<div>
  <input type="color" id="foreground" name="foreground" value="#e66465" />
  <label for="foreground">Foreground color</label>
</div>

<div>
  <input
    type="color"
    id="background"
    name="background"
    value="oklab(50% 0.1 0.1 / 0.5)"
    colorspace="display-p3"
    alpha />
  <label for="background">Background color</label>
</div>
```

```css interactive-example
p,
label {
  font:
    1rem "Fira Sans",
    sans-serif;
}

input {
  margin: 0.4rem;
}
```

## Giá trị

Một [giá trị màu CSS](/en-US/docs/Web/CSS/Reference/Values/color_value).

> [!NOTE]
> Trước đây, chỉ các màu thập lục phân cơ bản (không có kênh alpha) được cho phép. Hiện nay, bất kỳ định dạng màu CSS nào, bao gồm màu được đặt tên, ký hiệu hàm và màu thập lục phân có kênh alpha đều có thể được sử dụng. Giá trị mặc định là `#000000` (màu đen) nếu `value` bị bỏ qua hoặc không hợp lệ.

## Thuộc tính bổ sung

Ngoài [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) và [thuộc tính đầu vào](/en-US/docs/Web/HTML/Reference/Elements/input#attributes) chung cho tất cả các phần tử {{HTMLElement("input")}}, đầu vào `color` cũng hỗ trợ các thuộc tính sau:

- `alpha` {{experimental_inline}}
  - : Thuộc tính [boolean](/en-US/docs/Glossary/Boolean/HTML), nếu có, cho biết thành phần alpha của màu có thể được người dùng thao tác và không nhất thiết phải hoàn toàn mờ đục.

- `colorspace` {{experimental_inline}}
  - : Xác định {{glossary("color space")}} cho màu sắc và gợi ý giao diện người dùng mong muốn cho widget chọn màu. Các giá trị {{Glossary("enumerated")}} có thể là:
    - `"limited-srgb"`: Màu nằm trong không gian màu {{glossary("RGB", "sRGB")}}. Bao gồm các giá trị {{cssxref("color_value/rgb", "rgb()")}}, {{cssxref("color_value/hsl", "hsl()")}}, {{cssxref("color_value/hwb", "hwb()")}}, và {{cssxref("hex-color")}}. Giá trị màu bị giới hạn ở 8-bit mỗi thành phần `r`, `g`, và `b`. Đây là giá trị mặc định.
    - `"display-p3"`: [Không gian màu Display P3](/en-US/docs/Glossary/Color_space#display-p3), ví dụ: `color(display-p3 1.84 -0.19 0.72 / 0.6)`

## Sử dụng đầu vào color

Đầu vào kiểu `color` đơn giản do số lượng thuộc tính hỗ trợ hạn chế.

### Cung cấp màu mặc định

Bạn có thể cập nhật ví dụ trên để đặt giá trị mặc định, sao cho bộ chọn màu được điền sẵn với màu mặc định và bộ chọn màu (nếu có) cũng mặc định theo màu đó.

```html
<input type="color" value="#ff0000" />
<input
  type="color"
  id="body"
  name="body"
  value="oklab(50% 0.1 0.1 / 0.5)"
  colorspace="display-p3"
  alpha />
```

{{EmbedLiveSample("Providing_a_default_color", 700, 30)}}

Nếu bạn không chỉ định giá trị hoặc giá trị không hợp lệ hoặc không được trình duyệt hỗ trợ, giá trị mặc định sẽ là `#000000`, màu đen mờ đục.

### Theo dõi thay đổi màu

Như với các kiểu {{HTMLElement("input")}} khác, có hai sự kiện có thể được dùng để phát hiện thay đổi giá trị màu: {{domxref("Element/input_event", "input")}} và {{domxref("HTMLElement/change_event", "change")}}. `input` được kích hoạt trên phần tử `<input>` mỗi khi màu thay đổi. Sự kiện `change` được kích hoạt khi người dùng đóng bộ chọn màu. Trong cả hai trường hợp, bạn có thể xác định giá trị mới của phần tử bằng cách xem [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của nó.

Đây là một ví dụ theo dõi thay đổi theo thời gian của giá trị màu:

```js
colorPicker.addEventListener("input", updateFirst);
colorPicker.addEventListener("change", watchColorPicker);

function watchColorPicker(event) {
  document.querySelectorAll("p").forEach((p) => {
    p.style.color = event.target.value;
  });
}
```

### Chọn giá trị

Khi trình duyệt không hỗ trợ giao diện chọn màu, triển khai đầu vào màu sẽ là ô văn bản tự động xác thực nội dung để đảm bảo giá trị đúng định dạng. Trong trường hợp này bạn có thể dùng phương thức {{domxref("HTMLInputElement.select", "select()")}} để chọn văn bản đang có trong trường chỉnh sửa.

Nếu trình duyệt thay vào đó dùng bộ chọn màu, `select()` không có tác dụng. Bạn nên lưu ý hành vi này để mã của bạn có thể phản hồi phù hợp trong cả hai trường hợp.

```js
colorPicker.select();
```

## Kiểm tra hợp lệ

Giá trị đầu vào màu được coi là không hợp lệ nếu {{Glossary("user agent")}} không thể chuyển đổi đầu vào của người dùng sang ký hiệu thập lục phân chữ thường bảy ký tự. Nếu điều này xảy ra, pseudo-class {{cssxref(":invalid")}} được áp dụng cho phần tử.

## Ví dụ

Hãy tạo một ví dụ làm nhiều hơn với đầu vào màu bằng cách theo dõi các sự kiện {{domxref("HTMLElement/change_event", "change")}} và {{domxref("Element/input_event", "input")}} để lấy màu mới và áp dụng nó cho mọi phần tử {{HTMLElement("p")}} trong tài liệu.

### HTML

HTML khá đơn giản — một vài đoạn văn bản mô tả với {{HTMLElement("input")}} kiểu `color` có ID `color-picker`, mà chúng ta sẽ dùng để thay đổi màu văn bản của các đoạn.

```html
<p>
  An example demonstrating the use of the
  <code>&lt;input type="color"&gt;</code> control.
</p>

<label for="color-picker">Color:</label>
<input type="color" value="#ff0000" id="color-picker" />

<p>
  Watch the paragraph colors change when you adjust the color picker. As you
  make changes in the color picker, the first paragraph's color changes, as a
  preview (this uses the <code>input</code> event). When you close the color
  picker, the <code>change</code> event fires, and we detect that to change
  every paragraph to the selected color.
</p>
```

### JavaScript

#### Khởi tạo

Đoạn mã sau khởi tạo đầu vào màu:

```js
const defaultColor = "#0000ff";
const colorPicker = document.querySelector("#color-picker");
colorPicker.value = defaultColor;
colorPicker.addEventListener("input", updateFirst);
colorPicker.addEventListener("change", updateAll);
colorPicker.select();
```

Đoạn này lấy tham chiếu đến phần tử `<input>` màu trong biến `colorPicker`, sau đó đặt giá trị đầu vào màu thành giá trị trong `defaultColor`. Tiếp theo, sự kiện {{domxref("Element/input_event", "input")}} của đầu vào màu được thiết lập để gọi hàm `updateFirst()`, và sự kiện {{domxref("HTMLElement/change_event", "change")}} được thiết lập để gọi `updateAll()`. Cả hai đều được xem bên dưới.

Cuối cùng, chúng ta gọi {{domxref("HTMLInputElement.select", "select()")}} để chọn nội dung văn bản của đầu vào màu nếu điều khiển được triển khai dưới dạng trường văn bản (điều này không có tác dụng nếu giao diện bộ chọn màu được cung cấp thay thế).

#### Phản hồi thay đổi màu

Chúng ta cung cấp hai hàm xử lý thay đổi màu. Hàm `updateFirst()` được gọi để phản hồi sự kiện `input`. Nó thay đổi màu của phần tử đoạn đầu tiên trong tài liệu để khớp với giá trị mới của đầu vào màu. Vì sự kiện `input` được kích hoạt mỗi khi có điều chỉnh giá trị (ví dụ: khi độ sáng của màu được tăng lên), chúng sẽ xảy ra nhiều lần khi sử dụng bộ chọn màu.

```js
function updateFirst(event) {
  const p = document.querySelector("p");
  if (p) {
    p.style.color = event.target.value;
  }
}
```

Khi bộ chọn màu được đóng, cho biết giá trị sẽ không thay đổi nữa (trừ khi người dùng mở lại bộ chọn màu), sự kiện `change` được gửi đến phần tử. Chúng ta xử lý sự kiện đó bằng hàm `updateAll()`, sử dụng [`Event.target.value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) để lấy màu cuối cùng được chọn:

```js
function updateAll(event) {
  document.querySelectorAll("p").forEach((p) => {
    p.style.color = event.target.value;
  });
}
```

Hàm này đặt màu của mọi khối {{HTMLElement("p")}} sao cho thuộc tính {{cssxref("color")}} của nó khớp với giá trị hiện tại của đầu vào màu, được tham chiếu bằng {{domxref("Event.target", "event.target")}}.

### Kết quả

Kết quả cuối cùng trông như thế này:

{{EmbedLiveSample("Example", 700, 200)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Bất kỳ giá trị {{cssxref("&lt;color&gt;")}} CSS nào ở bất kỳ ký hiệu nào.
      </td>
    </tr>
    <tr>
      <td><strong>Sự kiện</strong></td>
      <td>
        {{domxref("HTMLElement/change_event", "change")}} và
        {{domxref("Element/input_event", "input")}}
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính chung được hỗ trợ</strong></td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete"><code>autocomplete</code></a> và
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#list"><code>list</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td>
        <a href="/en-US/docs/Web/API/HTMLInputElement/alpha"><code>alpha</a></code>,
        <a href="/en-US/docs/Web/API/HTMLInputElement/colorSpace"><code>colorSpace</code></a>,
        <a href="/en-US/docs/Web/API/HTMLInputElement/list"><code>list</code></a>, và
        <a href="/en-US/docs/Web/API/HTMLInputElement/value"><code>value</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Giao diện DOM</strong></td>
      <td><p>{{domxref("HTMLInputElement")}}</p></td>
    </tr>
    <tr>
      <td><strong>Phương thức</strong></td>
      <td>
        {{domxref("HTMLInputElement.select", "select()")}}
      </td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td><a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role">không có vai trò tương ứng</a></td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('HTMLInputElement.alpha')}}
- {{domxref('HTMLInputElement.colorspace')}}
