---
title: calc-size()
slug: Web/CSS/Reference/Values/calc-size
page-type: css-function
status:
  - experimental
browser-compat: css.types.calc-size
sidebar: cssref
---

{{seecompattable}}

Hàm **`calc-size()`** trong [CSS](/vi/docs/Web/CSS) cho phép bạn thực hiện tính toán trên các giá trị {{glossary("intrinsic size")}} (kích thước nội tại) như `auto`, {{cssxref("fit-content")}}, và {{cssxref("max-content")}}; điều này không được hỗ trợ bởi hàm {{cssxref("calc()")}} thông thường.

Các giá trị trả về của `calc-size()` cũng có thể được [nội suy](/vi/docs/Glossary/Interpolation), cho phép các giá trị từ khóa kích thước được sử dụng trong [animations](/vi/docs/Web/CSS/Guides/Animations) và [transitions](/vi/docs/Web/CSS/Guides/Transitions). Trên thực tế, việc đưa `calc-size()` vào giá trị thuộc tính sẽ tự động áp dụng [`interpolate-size: allow-keywords`](/vi/docs/Web/CSS/Reference/Properties/interpolate-size) cho lựa chọn đó.

Tuy nhiên, lưu ý rằng `interpolate-size` được kế thừa, do đó áp dụng nó cho một phần tử sẽ kích hoạt nội suy các từ khóa kích thước nội tại cho mọi thuộc tính được áp dụng cho phần tử đó và các phần tử con của nó. Do đó, `interpolate-size` là giải pháp ưu tiên để kích hoạt các animation kích thước nội tại. Bạn chỉ nên sử dụng `calc-size()` để kích hoạt các animation kích thước nội tại nếu chúng cũng yêu cầu tính toán.

## Cú pháp

```css
/* Truyền một giá trị qua calc-size() */
calc-size(auto, size)
calc-size(fit-content, size)

/* Thực hiện tính toán */
calc-size(min-content, size + 100px)
calc-size(fit-content, size / 2)

/* Tính toán bao gồm một hàm */
calc-size(auto, round(up, size, 50px))
```

### Tham số

Cú pháp của hàm `calc-size()` như sau:

```plain
calc-size(<calc-size-basis>, <calc-sum>)
```

Các tham số là:

- `<calc-size-basis>`
  - : Giá trị (thường là kích thước nội tại) mà bạn muốn thực hiện tính toán trên đó.

- {{cssxref("calc-sum")}}
  - : Một biểu thức xác định phép tính được thực hiện trên `<calc-size-basis>`.

### Giá trị trả về

Trả về một giá trị bằng `<calc-size-basis>` được sửa đổi bởi biểu thức `<calc-sum>`. Vì giá trị `<calc-size-basis>` là một giá trị kích thước nội tại, giá trị trả về là một giá trị kích thước nội tại đã được sửa đổi, hoạt động giống như giá trị kích thước nội tại đưa vào hàm.

## Mô tả

Một số thuật toán bố cục trình duyệt có các hành vi đặc biệt đối với các từ khóa kích thước nội tại. Hàm `calc-size()` được định nghĩa rõ ràng để đại diện cho một kích thước nội tại thay vì một {{cssxref("length-percentage")}}, từ đó đảm bảo tính chính xác. `calc-size()` cho phép thực hiện tính toán trên các giá trị kích thước nội tại một cách an toàn và có xác định rõ ràng.

### Giá trị hợp lệ cho đối số đầu tiên (`<calc-size-basis>`)

Đối số `calc-size()` đầu tiên có thể là một trong các giá trị nội tại sau:

- `auto`
- {{cssxref("min-content")}}
- {{cssxref("max-content")}}
- {{cssxref("fit-content")}}
- `content` (cho các container được định kích thước bằng {{cssxref("flex-basis")}}).

Ngoài ra còn có một số giá trị đặc biệt mà đối số này có thể nhận:

- Giá trị `calc-size()` lồng nhau. Đây không phải điều bạn thường làm, nhưng nó có sẵn để đảm bảo việc sử dụng [biến CSS](/vi/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) làm `<calc-size-basis>` luôn hoạt động, miễn là biến là giá trị hợp lệ cho thuộc tính mà `calc-size()` đang được đặt. Ví dụ, điều này sẽ hoạt động:

  ```css
  section {
    height: calc-size(calc-size(max-content, size), size + 2rem);
  }
  ```

  Cũng như điều này:

  ```css
  :root {
    --intrinsic-size: calc-size(max-content, size);
  }

  section {
    height: calc-size(var(--intrinsic-size), size + 2rem);
  }
  ```

- Một `<calc-sum>` khác, với các hạn chế tương tự như `<calc-sum>` được chỉ định cho đối số thứ hai, ngoại trừ từ khóa `size` không thể được đưa vào. Bạn có thể sẽ không làm điều này, vì bạn không còn thực hiện tính toán trên giá trị kích thước nội tại, nhưng nếu giá trị thuộc tính tùy chỉnh là `<calc-sum>`, hàm vẫn sẽ hoạt động. Ví dụ, điều này sẽ hoạt động trực tiếp hoặc nếu bạn sử dụng thuộc tính tùy chỉnh với giá trị là `300px + 2rem`:

  ```css
  section {
    height: calc-size(300px + 2rem, size / 2);
  }
  ```

- Từ khóa `any`, đại diện cho một kích thước xác định không chỉ định. Trong trường hợp này, từ khóa `size` không thể được đưa vào đối số thứ hai, và `calc-size()` trả về kết quả của phép tính đối số thứ hai. Ví dụ:

  ```css
  section {
    height: calc-size(any, 300px * 1.5); /* Returns 450px */
  }
  ```

Việc kết hợp các kích thước nội tại khác nhau trong cùng một phép tính không hoạt động. Ví dụ, `max-content - min-content` không có ý nghĩa. `calc-size()` chỉ cho phép một giá trị kích thước nội tại duy nhất trong mỗi phép tính, tránh vấn đề này.

### Giá trị hợp lệ cho đối số thứ hai (`<calc-sum>`)

Đối số `calc-size()` thứ hai là một biểu thức {{cssxref("calc-sum")}}.

Trong biểu thức này:

- Từ khóa `size` đại diện cho `<calc-size-basis>` được chỉ định làm đối số đầu tiên.
- Các toán hạng có thể bao gồm `size`, và bất kỳ kiểu giá trị nào có ý nghĩa trong ngữ cảnh.
- Các toán tử `+`, `-`, `*`, và `/` có thể được bao gồm.
- Các hàm toán học khác có thể được bao gồm như {{cssxref("round()")}}, {{cssxref("max()")}}, hoặc thậm chí một `calc-size()` lồng nhau.
- Biểu thức tổng thể phải khớp với {{cssxref("length-percentage")}}, và giải thành {{cssxref("length")}}.

### Kích hoạt animation của các giá trị kích thước nội tại

Các giá trị trả về của `calc-size()` có thể được nội suy, cho phép animation giữa giá trị {{cssxref("length-percentage")}} và giá trị trả về kích thước nội tại của `calc-size()`.

> [!NOTE]
> Bạn nên tránh animate các thuộc tính mô hình hộp nếu có thể, để giảm các sự kiện bố cục và giảm thiểu tác động đến hiệu suất (xem [Critical rendering path > Layout](/vi/docs/Web/Performance/Guides/Critical_rendering_path#layout)).

Ví dụ, bạn có thể sử dụng [transition](/vi/docs/Web/CSS/Guides/Transitions) để animate `width` của container giữa `0` và `auto` như sau:

```css
section {
  width: 0;
  transition: width ease 1s;
}

section:hover,
section:focus {
  width: calc-size(auto, size);
}
```

Trong trường hợp trên, chúng ta không tính toán gì — chúng ta đưa `auto` vào `calc-size()` và trả về nó không thay đổi. Thuộc tính {{cssxref("interpolate-size")}} làm cho các animation như trên đơn giản hơn để thực hiện trong hầu hết các trường hợp, đặc biệt khi có nhiều animation cần xem xét. Nó được kế thừa và do đó chỉ cần được khai báo một lần trên thuộc tính tổ tiên, có nghĩa là chúng ta có thể đã chuyển đổi giữa `0` và `auto` mà không cần sử dụng `calc-size()`.

Hàm `calc-size()` chỉ nên được sử dụng để kích hoạt animation kích thước nội tại nếu chúng cũng yêu cầu tính toán. Ví dụ, trong trường hợp sau đây, chúng ta đang animate `width` _và_ áp dụng tính toán cho trạng thái kết thúc kích thước nội tại:

```css
section {
  width: 0;
  transition: width ease 1s;
}

section:hover,
section:focus {
  width: calc-size(auto, size + 2rem);
}
```

Một trường hợp trong đó `calc-size()` hữu ích là khi bạn muốn animate giữa một kích thước nội tại và phiên bản đã sửa đổi của cùng kích thước nội tại đó. Điều này không thể thực hiện với `interpolate-size` và `calc()`. Ví dụ, định nghĩa {{cssxref("@keyframes")}} sau đây animate `width` của container giữa `fit-content` và 70% của `fit-content`.

```css
@keyframes narrower {
  from {
    width: fit-content;
  }

  to {
    width: calc-size(fit-content, size * 0.7);
  }
}
```

> [!NOTE]
> Lưu ý rằng `calc-size()` không cho phép animate giữa hai giá trị kích thước nội tại khác nhau.

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản `calc-size`

Ví dụ này cho thấy cách định kích thước cơ bản của container bằng `calc-size()`

#### HTML

HTML chứa một phần tử {{htmlelement("section")}} duy nhất chứa một số nội dung con.

```html
<section>
  <h2>Favorite quote</h2>

  <p>
    Fashion is something so ugly it has to be changed every fifteen minutes.
  </p>
</section>
```

#### CSS

```css hidden
* {
  box-sizing: border-box;
}

section {
  font-family: "Helvetica", "Arial", sans-serif;
  border: 1px solid black;
}

h2 {
  margin: 0;
  font-weight: normal;
  font-size: 1.1rem;
  text-align: center;
  letter-spacing: 1px;
}

p {
  font-size: 0.8rem;
}
```

Trong CSS, chúng ta sử dụng [flexbox](/vi/docs/Web/CSS/Guides/Flexible_box_layout) để căn giữa các phần tử con bên trong `<section>`, và đặt `width` và `height` của `<section>` thành các hàm `calc-size()`. `width` được đặt bằng `fit-content` cộng `6rem`. `height` được đặt thành `auto` nhân với hai.

```css
section {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  width: calc-size(fit-content, size + 6rem);
  height: calc-size(auto, size * 2);
}
```

Phần còn lại của CSS đã được ẩn để ngắn gọn.

#### Kết quả

Chúng ta đã tạo ra một số không gian ngang và dọc để văn bản được căn giữa, mà không cần sử dụng padding.

{{ EmbedLiveSample('Basic `calc-size` usage', '100%', '150') }}

### Animation cơ bản `calc-size`

Ví dụ này minh họa cách sử dụng `calc-size()` để animate giữa một kích thước cụ thể và kích thước nội tại. Demo có một thẻ nhân vật/"tên thẻ", có thể được hover hoặc focus để hiển thị thông tin về nhân vật. Việc hiển thị được xử lý bằng một transition `height` giữa độ dài cố định và `max-content`.

#### HTML

HTML chứa một phần tử {{htmlelement("section")}} duy nhất với [`tabindex="0"`](/vi/docs/Web/HTML/Reference/Global_attributes/tabindex) được đặt trên nó để nó có thể nhận focus bàn phím. `<section>` chứa các phần tử {{htmlelement("header")}} và {{htmlelement("main")}}, mỗi phần tử với nội dung con của riêng chúng.

```html
<section tabindex="0">
  <header>
    <h2>Chris Mills</h2>
  </header>
  <main>
    <p>Chris is the silent phantom of MDN.</p>
    <ul>
      <li><strong>Height</strong>: 3.03m</li>
      <li><strong>Weight</strong>: 160kg</li>
      <li><strong>Tech Fu</strong>: 7</li>
      <li><strong>Bad Jokes</strong>: 9</li>
    </ul>
  </main>
</section>
```

#### CSS

```css hidden
* {
  box-sizing: border-box;
}

section {
  font-family: "Helvetica", "Arial", sans-serif;
  width: 175px;
  border-radius: 5px;
  background: #eeeeee;
  box-shadow:
    inset 1px 1px 4px rgb(255 255 255 / 0.5),
    inset -1px -1px 4px rgb(0 0 0 / 0.5);
}

header {
  padding: 10px;
  border-bottom: 2px solid #cccccc;
}

main {
  padding: 0.7rem;
}

h2 {
  margin: 0;
  font-weight: normal;
  font-size: 1.1rem;
  text-align: center;
  letter-spacing: 1px;
}

p,
li {
  font-size: 0.8rem;
  line-height: 1.5;
}

p {
  margin-top: 0;
}
```

Trong CSS, chúng ta đặt `height` của `<section>` thành `2.5rem` và `overflow` thành `hidden` để chỉ `<header>` được hiển thị theo mặc định, sau đó chỉ định một `transition` animate `height` của `<section>` trong 1 giây trong quá trình thay đổi trạng thái. Cuối cùng, chúng ta đặt `height` của `<section>` thành một lần gọi hàm `calc-size()` khi {{cssxref(":hover")}} và {{cssxref(":focus")}}. Giá trị trả về của hàm tương đương với `max-content` + `2rem`.

```css
section {
  height: 2.5rem;
  overflow: hidden;
  transition: height ease 1s;
}

section:hover,
section:focus {
  height: calc-size(max-content, size + 2rem);
}
```

Phần còn lại của CSS đã được ẩn để ngắn gọn.

#### Kết quả

Thử hover qua `<section>` hoặc focus nó qua bàn phím — nó sẽ animate đến chiều cao đầy đủ + 2rem, hiển thị tất cả nội dung với 2rem không gian thêm ở dưới cùng.

{{ EmbedLiveSample('Basic `calc-size` animations', '100%', '250') }}

### Điều chỉnh chiều rộng đọc dựa trên `fit-content`

Ví dụ này cho thấy một container với văn bản bên trong, và một nút có thể được nhấp để làm cho chiều rộng của container hẹp hơn hoặc rộng hơn tùy thuộc vào sở thích đọc.

#### HTML

HTML chứa một phần tử {{htmlelement("section")}} duy nhất chứa nội dung văn bản con, cộng với một {{htmlelement("button")}} để thay đổi chiều rộng `<section>`.

```html
<section class="easy-reader">
  <h2>Easy reader</h2>

  <p>
    Eius velit aperiam ipsa. Deleniti eum excepturi ut magni maxime maxime
    beatae. Dicta aperiam est laudantium ut illum facere qui officiis. Sunt
    deleniti quam id. Quis sunt voluptatem praesentium minima dolorum autem
    consequatur velit.
  </p>

  <p>
    Vitae ab incidunt velit aspernatur deleniti distinctio rerum. Et natus sed
    et quos mollitia quia quod. Quae officia ex ea. Ducimus ut voluptatem et et
    debitis. Quidem provident laboriosam exercitationem similique deleniti.
    Temporibus vel veniam mollitia magni unde a nostrum.
  </p>

  <button class="width-adjust">Narrower</button>
</section>
```

#### CSS

```css hidden
* {
  box-sizing: border-box;
}

body {
  width: 600px;
  margin: 0 auto;
}

section {
  margin-top: 20px;
  font-family: "Helvetica", "Arial", sans-serif;
  background: #eeeeee;
  border: 2px solid #cccccc;
  padding: 0 20px;
  position: relative;
}

p,
li {
  font-size: 0.8rem;
  line-height: 1.5;
}

button {
  position: absolute;
  top: 2px;
  right: 2px;
}
```

Trong CSS, chúng ta đặt `width` của `<section>` mặc định thành {{cssxref("fit-content")}}. Sau đó chúng ta định nghĩa hai tập hợp {{cssxref("@keyframes")}}, `narrower`, animate từ `fit-content` đến 70% của `fit-content` (tính bằng `calc-size()`), và `wider`, animate các giá trị tương tự nhưng theo hướng ngược lại. Cuối cùng, chúng ta gắn các animation đó vào hai lớp — `.narrower` và `.wider`. Mỗi animation được định nghĩa kéo dài một giây và giữ trạng thái cuối cùng sau khi kết thúc.

```css
section {
  width: fit-content;
}

@keyframes narrower {
  from {
    width: fit-content;
  }

  to {
    width: calc-size(fit-content, size * 0.7);
  }
}

@keyframes wider {
  from {
    width: calc-size(fit-content, size * 0.7);
  }

  to {
    width: fit-content;
  }
}

.narrower {
  animation: narrower 1s ease forwards;
}

.wider {
  animation: wider 1s ease forwards;
}
```

Phần còn lại của CSS đã được ẩn để ngắn gọn.

#### JavaScript

JavaScript cung cấp một nút toggle hẹp hơn/rộng hơn áp dụng lớp liên quan cho `<section>` khi nút được nhấp:

```js
const widthAdjustBtn = document.querySelector(".width-adjust");
const easyReader = document.querySelector(".easy-reader");

widthAdjustBtn.addEventListener("click", () => {
  if (easyReader.classList.length === 1) {
    easyReader.classList.add("narrower");
    widthAdjustBtn.textContent = "Wider";
  } else if (easyReader.classList.contains("wider")) {
    easyReader.classList.replace("wider", "narrower");
    widthAdjustBtn.textContent = "Wider";
  } else if (easyReader.classList.contains("narrower")) {
    easyReader.classList.replace("narrower", "wider");
    widthAdjustBtn.textContent = "Narrower";
  }
});
```

#### Kết quả

Thử nhấp nút `<button>` vài lần để điều chỉnh `<section>` giữa chiều rộng đọc rộng và hẹp, đạt được bằng cách thao tác `width` dựa trên giá trị `fit-content`.

{{ EmbedLiveSample('Adjusting reading width based on `fit-content`', '100%', '300') }}

### Sử dụng hàm bên trong hàm `calc-size()`

Như đã đề cập trước đó, có thể sử dụng một hàm khác bên trong `calc-size()`. Ví dụ này đặt [`field-sizing: content`](/vi/docs/Web/CSS/Reference/Properties/field-sizing) trên các phần tử {{htmlelement("input")}} để làm cho chúng rộng bằng nội dung đã nhập, và sau đó sử dụng hàm [`max()`](/vi/docs/Web/CSS/Reference/Values/max) bên trong `calc-size()` để đảm bảo rằng các `<input>` ít nhất có kích thước tối thiểu, và chỉ bắt đầu phát triển khi văn bản đã nhập trở nên rộng hơn kích thước đó — bằng cách đặt thành `fit-content` cộng `20px`.

#### HTML

HTML chứa một phần tử {{htmlelement("form")}} chứa ba kiểu `<input>` văn bản. Mỗi `<input>` có một {{htmlelement("label")}} liên kết với nó để làm cho form dễ tiếp cận, và một [`maxlength`](/vi/docs/Web/HTML/Reference/Attributes/maxlength) được áp dụng để ngăn các giá trị nhập quá dài làm vỡ bố cục form.

```html
<form>
  <div>
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" maxlength="48" />
  </div>
  <div>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" maxlength="48" />
  </div>
  <div>
    <label for="address">Address:</label>
    <input type="text" id="address" name="address" maxlength="60" />
  </div>
</form>
```

#### CSS

```css hidden
* {
  box-sizing: border-box;
}

body {
  width: 600px;
  margin: 0 auto;
}

form {
  margin-top: 20px;
  padding: 20px;
  font-family: "Helvetica", "Arial", sans-serif;
  background: #eeeeee;
  border: 2px solid #cccccc;
}

div {
  display: flex;
  align-items: center;
}

div:not(div:last-child) {
  margin-bottom: 20px;
}
```

Trong CSS, chúng ta đặt `width` của các phần tử `<label>` thành `100px`. Chúng ta đặt `field-sizing: content` trên các phần tử {{htmlelement("input")}} để làm cho chúng rộng bằng nội dung đã nhập — theo mặc định chúng sẽ không có chiều rộng vì không có gì được nhập vào. Để bù lại điều này, chúng ta đặt giá trị `width` của chúng thành `calc-size(fit-content, max(100px, size + 20px))`. Điều này có nghĩa là chúng rộng tối thiểu `100px`, ngay cả khi không có giá trị nào được nhập. Khi giá trị đã nhập trở nên rộng hơn `100px`, `width` của chúng thay đổi thành `fit-content` cộng `20px`, có nghĩa là chúng bắt đầu phát triển theo kích thước nội dung nhưng giữ khoảng cách `20px` ở phía bên phải.

```css
label {
  width: 100px;
}

input {
  field-sizing: content;
  width: calc-size(fit-content, max(100px, size + 20px));
}
```

Phần còn lại của CSS đã được ẩn để ngắn gọn.

#### Kết quả

Thử nhập một số văn bản vào các trường form, và xem chúng phát triển như thế nào khi các giá trị bắt đầu trở nên rộng bằng chiều rộng tối thiểu được áp dụng bởi hàm `max()`.

{{ EmbedLiveSample('Using a function inside the `calc-size()` function', '100%', '200') }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("interpolate-size")}}
- {{cssxref("calc()")}}
- {{cssxref("round()")}}
- [Animate to height: auto; (and other intrinsic sizing keywords) in CSS](https://developer.chrome.com/docs/css-ui/animate-to-height-auto) trên developer.chrome.com (2024)
