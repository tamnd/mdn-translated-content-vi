---
title: Creating vertical form controls
short-title: Vertical form controls
slug: Web/CSS/Guides/Writing_modes/Vertical_controls
page-type: guide
sidebar: cssref
---

Hướng dẫn này giải thích cách sử dụng các thuộc tính CSS {{cssxref("writing-mode")}} và {{cssxref("direction")}} để tạo và cấu hình các form control dọc. Bao gồm:

- Slider [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range), thanh {{htmlelement("progress")}}, và phần tử {{htmlelement("meter")}}.
- Phần tử {{htmlelement("select")}}.
- Phần tử {{htmlelement("button")}} và các kiểu input button như [`<input type="button">`](/en-US/docs/Web/HTML/Reference/Elements/input/button), [`<input type="reset">`](/en-US/docs/Web/HTML/Reference/Elements/input/reset), và [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit).
- Phần tử {{htmlelement("textarea")}} và các kiểu input dựa trên văn bản như [`<input type="text">`](/en-US/docs/Web/HTML/Reference/Elements/input/text), [`<input type="datetime-local">`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local), và [`<input type="url">`](/en-US/docs/Web/HTML/Reference/Elements/input/url).

## Kỹ thuật chung

Trong các trình duyệt hiện đại, thuộc tính {{cssxref("writing-mode")}} có thể được đặt thành giá trị dọc để hiển thị các form control theo chiều dọc với các ký tự văn bản thường là ngang (ví dụ trong các ngôn ngữ Latin), với văn bản được hiển thị ở góc 90 độ so với mặc định. Các ký tự văn bản dọc thông thường, ví dụ trong tiếng Trung Quốc hay Nhật Bản, không bị ảnh hưởng về mặt này.

Điều này hữu ích khi tạo form cho các ngôn ngữ dọc.

Cụ thể:

- `writing-mode: vertical-lr` sẽ tạo ra các form control dọc với hướng luồng block từ trái sang phải, nghĩa là trong các control có ngắt dòng hoặc nhiều dòng văn bản, các dòng tiếp theo sẽ xuất hiện bên phải của các dòng trước.
- `writing-mode: vertical-rl` sẽ tạo ra các form control dọc với hướng luồng block từ phải sang trái, nghĩa là trong các control có ngắt dòng hoặc nhiều dòng văn bản, các dòng tiếp theo sẽ xuất hiện bên trái của các dòng trước.

Bạn có thể dùng [transform](/en-US/docs/Web/CSS/Reference/Properties/transform) để xoay các control 90 độ, nhưng điều đó sẽ đặt các control vào layer riêng của chúng và gây ra các tác dụng phụ về layout không mong muốn như nội dung khác bị chồng lên. Sử dụng `writing-mode` cung cấp giải pháp đáng tin cậy hơn.

> [!NOTE]
> Mặc dù thuộc tính {{cssxref("writing-mode")}} được hỗ trợ tốt, việc tạo các form control theo hướng dọc với `writing-mode` chỉ đạt được hỗ trợ đầy đủ trên các trình duyệt vào năm 2024.

> [!NOTE]
> Các giá trị thực nghiệm `sideways-lr` và `sideways-rl` có tác dụng tương tự như `vertical-lr` và `vertical-rl` tương ứng, ngoại trừ các ký tự văn bản dọc thông thường (ví dụ trong tiếng Trung Quốc hay Nhật Bản) sẽ bị xoay 90 độ để hiển thị nghiêng, trong khi các ký tự văn bản ngang (ví dụ trong các ngôn ngữ Latin) không bị ảnh hưởng bởi các giá trị này.

Ngoài ra, thuộc tính {{cssxref("direction")}} có thể được dùng để kiểm soát hướng của nội dung bên trong các control:

- `direction: ltr` sẽ khiến nội dung bắt đầu từ trên và chảy xuống dưới.
- `direction: rtl` sẽ khiến nội dung bắt đầu từ dưới và chảy lên trên.

Thuộc tính `direction` có thể được dùng để đặt **hướng cơ sở inline** — hướng chính trong đó nội dung được sắp xếp trên một dòng, xác định phía nào là "bắt đầu" và "kết thúc" của dòng. Đối với các form control dựa trên văn bản, sự khác biệt là rõ ràng — luồng văn bản bắt đầu từ trên hoặc dưới. Trong các control không dựa trên văn bản như slider phạm vi, `direction` đặt hướng vẽ control. Ví dụ, bao gồm `direction: ltr` trên một slider dọc sẽ đặt giá trị thấp nhất ở đầu slider và giá trị cao nhất ở cuối slider.

Các phần bên dưới cho thấy cách tạo các loại form control dọc khác nhau, cùng với ví dụ cho từng loại. Hãy tham khảo thông tin tương thích trình duyệt trên mỗi trang tham chiếu được liên kết để biết thông tin hỗ trợ chính xác cho từng loại.

## Slider phạm vi, meter và thanh tiến trình

Hãy xem cách tạo các slider phạm vi, meter và thanh tiến trình dọc.

### Ví dụ cơ bản

Một bộ control trực quan điển hình gồm slider [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range), {{htmlelement("progress")}}, và {{htmlelement("meter")}} được tạo như sau:

```html
<form>
  <input type="range" min="0" max="11" value="9" step="1" />
  <meter id="fuel" min="0" max="100" low="33" high="66" optimum="80" value="20">
    at 50/100
  </meter>
  <progress id="file" max="100" value="70">70%</progress>
</form>
```

> [!NOTE]
> Thực hành tốt nhất là bao gồm một phần tử {{htmlelement("label")}} cho mỗi form control, để liên kết mô tả văn bản có ý nghĩa với mỗi trường cho mục đích trợ năng (xem [Use meaningful text labels](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_meaningful_text_labels) để biết thêm). Chúng ta chưa làm điều đó ở đây, vì bài viết này tập trung thuần túy vào các khía cạnh hiển thị trực quan của form control, nhưng bạn nên đảm bảo làm vậy trong mã sản phẩm.

Để hiển thị các control theo chiều dọc, chúng ta có thể dùng CSS như sau:

```css
input[type="range"],
meter,
progress {
  margin-block-end: 20px;
  writing-mode: vertical-lr;
}
```

{{cssxref("writing-mode", "writing-mode: vertical-lr")}} (và `vertical-rl`) khiến các control được hiển thị theo chiều dọc trong các trình duyệt hiện đại.

Kết quả trông như sau:

{{ EmbedLiveSample("Basic example", "100%", "170") }}

### Vẽ control từ dưới lên trên

Theo mặc định, các control có giá trị {{cssxref("direction")}} là `ltr`. Điều này khiến slider, meter và thanh tiến trình được vẽ từ trên xuống dưới, như thấy ở trên.

Bạn có thể thay đổi điều này bằng cách đặt `direction: rtl` — điều này khiến chúng được vẽ từ dưới lên trên:

```html hidden
<form>
  <input type="range" min="0" max="11" value="9" step="1" />
  <meter id="fuel" min="0" max="100" low="33" high="66" optimum="80" value="20">
    at 50/100
  </meter>
  <progress id="file" max="100" value="70">70%</progress>
</form>
```

```css
input[type="range"],
meter,
progress {
  margin-block-end: 20px;
  writing-mode: vertical-lr;
  direction: rtl;
}
```

Kết quả trông như sau:

{{ EmbedLiveSample("Drawing the control from bottom to top", "100%", "170") }}

### Tạo slider phạm vi dọc trong các trình duyệt cũ

Trong các trình duyệt cũ không hỗ trợ tạo form control dọc với `writing-mode` và `direction`, có những lựa chọn thay thế hạn chế có sẵn. Các lựa chọn sau chỉ hoạt động với `<input type="range">`, khiến văn bản chảy từ dưới lên trên — chúng không có tác dụng với phần tử `<meter>` và `<progress>`:

- Thuộc tính không chuẩn [`appearance: slider-vertical`](/en-US/docs/Web/CSS/Reference/Properties/appearance) có thể được dùng trong các phiên bản cũ hơn của Safari và Chrome.
- Thuộc tính không chuẩn `orient="vertical"` có thể được thêm vào phần tử `<input type="range">` trong các phiên bản cũ hơn của Firefox.

HTML cho ví dụ này bao gồm một slider [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range) duy nhất, với `orient="vertical"` được thêm vào để hiển thị theo chiều dọc trong các phiên bản Firefox cũ hơn:

```html
<form>
  <input type="range" min="0" max="11" value="9" step="1" orient="vertical" />
</form>
```

Để khiến các control cũng hiển thị theo chiều dọc trong các phiên bản cũ hơn của Chrome và Safari, chúng ta có thể dùng `appearance: slider-vertical`:

```css
input[type="range"] {
  margin-block-end: 20px;
  appearance: slider-vertical;
}
```

Kết quả trông như sau:

{{ EmbedLiveSample("Creating vertical range sliders in older browsers", "100%", "190") }}

## Phần tử Select

Phần này cho thấy cách xử lý các phần tử {{htmlelement("select")}} dọc.

### Ví dụ cơ bản Select

HTML dưới đây tạo hai phần tử `<select>`, một phần tử cho phép chọn một mục và một phần tử cho phép chọn nhiều mục:

```html
<form>
  <select multiple>
    <option>First</option>
    <option>Second</option>
    <option>Third</option>
    <option>Fourth</option>
    <option>Fifth</option>
  </select>
  <select>
    <option>First</option>
    <option>Second</option>
    <option>Third</option>
    <option>Fourth</option>
    <option>Fifth</option>
  </select>
</form>
```

Để hiển thị các control theo chiều dọc, chúng ta có thể dùng CSS như sau:

```css
select {
  inline-size: 100px;
  margin-block-end: 20px;
  writing-mode: vertical-rl;
}
```

Kết quả trông như sau:

{{ EmbedLiveSample("Select basic example", "100%", "130") }}

### Điều chỉnh hướng văn bản và thứ tự tùy chọn

Tương tự, có thể dùng giá trị thuộc tính {{cssxref("direction")}} là `rtl` để đặt hướng văn bản từ dưới lên trên, thay vì hướng mặc định từ trên xuống dưới.

Cũng đáng chú ý rằng trong ví dụ trên, hướng inline cho các tùy chọn select đi từ phải sang trái vì chúng ta đã dùng `writing-mode: vertical-rl`. Nếu chúng ta dùng `writing-mode: vertical-lr` thay thế, văn bản `<option>` sẽ xuất hiện từ trái sang phải.

Chúng ta sẽ khám phá hai trường hợp sử dụng này bằng ba phần tử `<select>` listbox (`multiple`), để có thể so sánh các tác dụng cạnh nhau.

```html
<form>
  <div>
    <h2>writing-mode: vertical-lr</h2>
    <select multiple>
      <option>First</option>
      <option>Second</option>
      <option>Third</option>
      <option>Fourth</option>
      <option>Fifth</option>
    </select>
  </div>
  <div class="direction">
    <h2>direction: rtl & writing-mode: vertical-lr</h2>
    <select multiple>
      <option>First</option>
      <option>Second</option>
      <option>Third</option>
      <option>Fourth</option>
      <option>Fifth</option>
    </select>
  </div>
  <div class="reverse-option-order">
    <h2>writing-mode: vertical-rl</h2>
    <select multiple>
      <option>First</option>
      <option>Second</option>
      <option>Third</option>
      <option>Fourth</option>
      <option>Fifth</option>
    </select>
  </div>
</form>
```

Trong CSS cho ví dụ này, chúng ta đặt các thuộc tính sau trên ba listbox:

1. `writing-mode: vertical-rl`, hiển thị giống như trong ví dụ trước — văn bản chảy từ trên xuống dưới, và tùy chọn hiển thị từ phải sang trái.
2. `writing-mode: vertical-rl` và `direction: rtl`, với các tùy chọn từ phải sang trái nhưng đảo ngược luồng văn bản từ dưới lên trên.
3. `writing-mode: vertical-lr`, với văn bản đi từ trên xuống dưới trong khi đảo ngược thứ tự tùy chọn từ trái sang phải.

```css hidden
form {
  box-sizing: border-box;
  display: flex;
  gap: 20px;
  font-family: sans-serif;
}

h2 {
  margin-top: 0;
  font-size: 1rem;
  text-align: center;
  flex: 1 0 100%;
}

div {
  margin-bottom: 20px;
  flex: 1;
  display: flex;
  align-items: flex-start;
  justify-content: space-around;
  flex-flow: row wrap;
}
```

```css
select {
  inline-size: 100px;
  margin-block-end: 20px;
  writing-mode: vertical-rl;
}

.direction select {
  direction: rtl;
}

.reverse-option-order select {
  writing-mode: vertical-lr;
}
```

Kết quả trông như sau:

{{ EmbedLiveSample("Adjusting text direction and option order", "100%", "200") }}

## Button

Phần này cho thấy cách xử lý các phần tử {{htmlelement("button")}} dọc. Lưu ý rằng mặc dù chúng ta chỉ sử dụng phần tử `<button>` trong các ví dụ bên dưới, hành vi là giống nhau với các phần tử khác tạo ra button, chẳng hạn như các kiểu [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input) như [`button`](/en-US/docs/Web/HTML/Reference/Elements/input/button), [`reset`](/en-US/docs/Web/HTML/Reference/Elements/input/reset), và [`submit`](/en-US/docs/Web/HTML/Reference/Elements/input/submit).

### Ví dụ cơ bản Button

HTML dưới đây tạo hai phần tử `<button>`, một phần tử với một dòng văn bản, và một phần tử với ba dòng:

```html
<button>Press me</button> <button>Press me<br />Please?<br />Thanks</button>
```

Để hiển thị các button theo chiều dọc, chúng ta có thể dùng CSS như sau:

```css
button {
  inline-size: 100px;
  margin-block-end: 20px;
  writing-mode: vertical-rl;
}
```

Kết quả trông như sau:

{{ EmbedLiveSample("Basic button example", "100%", "130") }}

### Điều chỉnh thứ tự dòng văn bản button

Khi bạn thay đổi giá trị `writing-mode` từ `vertical-rl` thành `vertical-lr`, các dòng văn bản tiếp theo sẽ xuất hiện bên phải của các dòng trước, thay vì bên trái.

Ví dụ này sử dụng hai bản sao của button có ba dòng văn bản mà chúng ta đã thấy trong ví dụ trước, để bạn có thể dễ dàng thấy tác dụng của việc thay đổi writing mode:

```html
<div>
  <h2>writing-mode: vertical-lr</h2>
  <button>Press me<br />Please?<br />Thanks</button>
</div>
<div class="reverse-line-order">
  <h2>writing-mode: vertical-rl</h2>
  <button>Press me<br />Please?<br />Thanks</button>
</div>
```

Trong CSS, chúng ta đặt `writing-mode: vertical-rl` trên button đầu tiên để bố trí thứ tự dòng từ phải sang trái. Trên button thứ hai, chúng ta đặt `writing-mode: vertical-lr` để đảo ngược thứ tự dòng — trái sang phải:

```css hidden
body {
  box-sizing: border-box;
  display: flex;
  gap: 20px;
  font-family: sans-serif;
}

h2 {
  margin-top: 0;
  font-size: 1rem;
  text-align: center;
  flex: 1 0 100%;
}

div {
  margin-bottom: 20px;
  flex: 1;
  display: flex;
  align-items: flex-start;
  justify-content: space-around;
  flex-flow: row wrap;
}
```

```css
button {
  inline-size: 100px;
  margin-block-end: 20px;
  writing-mode: vertical-rl;
}

.reverse-line-order button {
  writing-mode: vertical-lr;
}
```

Kết quả trông như sau:

{{ EmbedLiveSample("Adjusting button text line order", "100%", "160") }}

## Form control dựa trên văn bản

Cuối cùng, chúng ta sẽ xem xét cách xử lý các phần tử {{htmlelement("textarea")}} dọc và các kiểu `<input>` dạng văn bản. Lưu ý rằng, mặc dù kiểu `<input>` duy nhất chúng ta bao gồm là phần tử `<input type="text">` trong các ví dụ bên dưới, hành vi là giống nhau với các kiểu [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input) dạng văn bản khác: [`password`](/en-US/docs/Web/HTML/Reference/Elements/input/button), [`number`](/en-US/docs/Web/HTML/Reference/Elements/input/reset), [`url`](/en-US/docs/Web/HTML/Reference/Elements/input/submit), v.v.

### Ví dụ cơ bản input văn bản và textarea

HTML dưới đây tạo một phần tử `<textarea>` và một `<input type="text">`:

```html
<form>
  <textarea>This is my textarea</textarea>
  <input type="text" value="Input text" />
</form>
```

Để hiển thị input và textarea theo chiều dọc, chúng ta có thể dùng CSS như sau:

```css
textarea,
input[type="text"] {
  inline-size: 100px;
  margin-block-end: 20px;
  writing-mode: vertical-rl;
}
```

Kết quả trông như sau:

{{ EmbedLiveSample("Basic text input and textarea example", "100%", "130") }}

### Điều chỉnh hướng văn bản và thứ tự dòng

Bạn có thể dùng giá trị thuộc tính {{cssxref("direction")}} là `rtl` để thay đổi hướng văn bản từ mặc định từ trên xuống dưới thành từ dưới lên trên. Bạn cũng có thể đặt `writing-mode` thành `vertical-lr` thay vì `vertical-rl`, để khiến nhiều dòng văn bản trong `<textarea>` xuất hiện từ trái sang phải thay vì mặc định từ phải sang trái.

Ví dụ này sử dụng ba bản sao của cùng các control văn bản mà chúng ta đã thấy trong ví dụ trước, để bạn có thể dễ dàng thấy tác dụng của việc thay đổi `direction` và `writing-mode` như đã thảo luận ở trên:

```html
<form>
  <div>
    <h2>writing-mode: vertical-lr</h2>
    <textarea>This is my textarea</textarea>
    <input type="text" value="Input text" />
  </div>
  <div class="direction">
    <h2>direction: rtl & writing-mode: vertical-lr</h2>
    <textarea>This is my textarea</textarea>
    <input type="text" value="Input text" />
  </div>
  <div class="reverse-line-order">
    <h2>writing-mode: vertical-rl</h2>
    <textarea>This is my textarea</textarea>
    <input type="text" value="Input text" />
  </div>
</form>
```

Trong CSS, chúng ta đặt các thuộc tính sau trên ba bộ control văn bản:

1. `writing-mode: vertical-rl` để hiển thị giống như trong ví dụ trước — văn bản chảy từ trên xuống dưới, và các dòng chảy từ phải sang trái.
2. `writing-mode: vertical-rl` và `direction: rtl` để các dòng chảy từ phải sang trái nhưng đảo ngược luồng văn bản từ dưới lên trên.
3. `writing-mode: vertical-lr` để văn bản chảy từ trên xuống dưới nhưng đảo ngược luồng dòng — trái sang phải. Lưu ý điều này không có tác dụng với phần tử `<input type="text">`, vì chúng luôn là một dòng đơn.

```css hidden
form {
  box-sizing: border-box;
  display: flex;
  gap: 20px;
  font-family: sans-serif;
}

h2 {
  margin-top: 0;
  font-size: 1rem;
  text-align: center;
  flex: 1 0 100%;
}

div {
  margin-bottom: 20px;
  flex: 1;
  display: flex;
  align-items: flex-start;
  justify-content: space-around;
  flex-flow: row wrap;
}
```

```css
textarea,
input[type="text"] {
  inline-size: 100px;
  margin-block-end: 20px;
  writing-mode: vertical-rl;
}

.direction textarea,
.direction input[type="text"] {
  writing-mode: vertical-rl;
  direction: rtl;
}

.reverse-line-order textarea,
.reverse-line-order input[type="text"] {
  writing-mode: vertical-lr;
}
```

Kết quả trông như sau:

{{ EmbedLiveSample("Adjusting text direction and line layout order", "100%", "180") }}

## Xem thêm

- Phần tử [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input).
- Các phần tử liên quan khác: {{htmlelement("button")}}, {{htmlelement("meter")}}, {{htmlelement("progress")}}, và {{htmlelement("select")}}.
- [Học: Xử lý các hướng văn bản khác nhau](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions)
- [Tạo kiểu cho web form](/en-US/docs/Learn_web_development/Extensions/Forms/Styling_web_forms)
