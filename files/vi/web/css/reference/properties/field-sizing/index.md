---
title: field-sizing
slug: Web/CSS/Reference/Properties/field-sizing
page-type: css-property
browser-compat: css.properties.field-sizing
sidebar: cssref
---

Thuộc tính **`field-sizing`** trong [CSS](/vi/docs/Web/CSS) cho phép bạn kiểm soát hành vi định kích thước của các phần tử được cấp kích thước ưu tiên mặc định, chẳng hạn như các phần tử điều khiển biểu mẫu. Thuộc tính này cho phép ghi đè hành vi định kích thước mặc định, cho phép các điều khiển biểu mẫu tự điều chỉnh kích thước theo nội dung của chúng.

Thuộc tính này thường được dùng để tạo kiểu cho các phần tử {{htmlelement("input")}} và {{htmlelement("textarea")}} dạng văn bản, cho phép chúng co lại theo nội dung cũng như mở rộng khi người dùng nhập thêm văn bản vào điều khiển biểu mẫu.

## Cú pháp

```css
/* Giá trị từ khóa */
field-sizing: content;
field-sizing: fixed;

/* Giá trị toàn cục */
field-sizing: inherit;
field-sizing: initial;
field-sizing: revert;
field-sizing: revert-layer;
field-sizing: unset;
```

### Giá trị

- `content`
  - : Cho phép phần tử điều chỉnh kích thước để vừa với nội dung của nó.
- `fixed`
  - : Đặt kích thước cố định cho phần tử. Đây là giá trị mặc định.

## Mô tả

`field-sizing: content` ghi đè kích thước ưu tiên mặc định của các phần tử biểu mẫu. Cài đặt này cung cấp cách để cấu hình các ô nhập văn bản co lại theo nội dung và mở rộng khi nhập thêm văn bản. Chúng ngừng mở rộng khi đạt đến giới hạn kích thước tối đa (được xác định bởi kích thước của phần tử chứa hoặc đặt qua CSS), lúc đó cần cuộn để xem toàn bộ nội dung.

### Các phần tử bị ảnh hưởng bởi `field-sizing: content`

Cụ thể, `field-sizing` với giá trị `content` ảnh hưởng đến các phần tử sau:

- Các loại input biểu mẫu chấp nhận nhập văn bản trực tiếp từ người dùng. Bao gồm các loại [`email`](/vi/docs/Web/HTML/Reference/Elements/input/email), [`number`](/vi/docs/Web/HTML/Reference/Elements/input/number), [`password`](/vi/docs/Web/HTML/Reference/Elements/input/password), [`search`](/vi/docs/Web/HTML/Reference/Elements/input/search), [`tel`](/vi/docs/Web/HTML/Reference/Elements/input/tel), [`text`](/vi/docs/Web/HTML/Reference/Elements/input/text), và [`url`](/vi/docs/Web/HTML/Reference/Elements/input/url).
  - Nếu không có chiều rộng tối thiểu nào được đặt trên điều khiển, nó chỉ rộng bằng con trỏ văn bản.
  - Các điều khiển có thuộc tính [`placeholder`](/vi/docs/Web/HTML/Reference/Elements/input#placeholder) sẽ được hiển thị đủ rộng để hiển thị văn bản placeholder.
  - Thuộc tính [`size`](/vi/docs/Web/HTML/Reference/Elements/input#size) điều chỉnh kích thước ưu tiên mặc định của các phần tử `<input>` đó. Do đó, `size` không có hiệu lực trên các phần tử `<input>` có `field-sizing: content`.
- Các input [`file`](/vi/docs/Web/HTML/Reference/Elements/input/file). Không thể nhập văn bản trực tiếp; tuy nhiên, tên tệp được hiển thị thay đổi khi người dùng chọn tệp mới để tải lên. Khi `field-sizing: content` được đặt, điều khiển sẽ thay đổi kích thước để co lại theo tên tệp.
- Các điều khiển {{htmlelement("textarea")}}. Cần lưu ý rằng các phần tử `<textarea>` có `field-sizing: content` hoạt động giống như các điều khiển văn bản một dòng, với các bổ sung sau:
  - Nếu các phần tử `<textarea>` không thể mở rộng do ràng buộc chiều rộng, chúng sẽ bắt đầu tăng chiều cao để hiển thị thêm hàng nội dung. Khi đạt đến ràng buộc chiều cao, chúng sẽ hiển thị thanh cuộn để có thể xem toàn bộ nội dung.
  - Các thuộc tính [`rows`](/vi/docs/Web/HTML/Reference/Elements/textarea#cols) và [`cols`](/vi/docs/Web/HTML/Reference/Elements/textarea#cols) điều chỉnh kích thước ưu tiên mặc định của `<textarea>`. Do đó, `rows`/`cols` không có hiệu lực trên các phần tử `<textarea>` có `field-sizing: content`.
- Các điều khiển {{htmlelement("select")}}. Chúng hoạt động hơi khác so với những gì bạn có thể mong đợi với `field-sizing: content`. Hiệu ứng phụ thuộc vào loại điều khiển `<select>` bạn đang tạo:
  - Các hộp thả xuống thông thường sẽ thay đổi chiều rộng để luôn phù hợp với giá trị tùy chọn được hiển thị khi các giá trị mới được chọn. (Theo mặc định, kích thước của hộp thả xuống được đặt đủ lớn để hiển thị giá trị tùy chọn dài nhất.)
  - Các hộp danh sách (các phần tử `<select>` có thuộc tính [`multiple`](/vi/docs/Web/HTML/Reference/Elements/select#multiple) hoặc [`size`](/vi/docs/Web/HTML/Reference/Elements/select#multiple)) sẽ đủ lớn để hiển thị tất cả các tùy chọn mà không cần cuộn. (Theo mặc định, hộp thả xuống sẽ cần cuộn để xem tất cả các giá trị tùy chọn.)
  - Thuộc tính [`size`](/vi/docs/Web/HTML/Reference/Elements/select#size) có rất ít hiệu lực trên các phần tử `<select>` có `field-sizing: content`. Trong những trường hợp đó, trình duyệt kiểm tra xem `size` có bằng `1` hay không để xác định xem điều khiển `<select>` sẽ xuất hiện dưới dạng hộp thả xuống hay hộp danh sách. Tuy nhiên, nó sẽ luôn hiển thị tất cả các tùy chọn của hộp danh sách, ngay cả khi `size` nhỏ hơn số lượng tùy chọn.

### Tương tác của `field-sizing` với các cài đặt kích thước khác

Tính linh hoạt trong định kích thước được cung cấp cho các điều khiển biểu mẫu bởi `field-sizing: content` có thể bị ghi đè nếu bạn sử dụng các thuộc tính định kích thước CSS khác. Tránh đặt {{cssxref("width")}} và {{cssxref("height")}} cố định khi sử dụng `field-sizing: content` vì chúng sẽ áp đặt lại kích thước cố định trên điều khiển. Tuy nhiên, việc sử dụng các thuộc tính như {{cssxref("min-width")}} và {{cssxref("max-width")}} cùng với `field-sizing: content` rất hiệu quả vì chúng cho phép điều khiển mở rộng và thu hẹp theo văn bản đã nhập đồng thời ngăn điều khiển trở nên quá lớn hoặc quá nhỏ.

Thuộc tính [`maxlength`](/vi/docs/Web/HTML/Reference/Elements/input#maxlength) làm cho điều khiển ngừng tăng kích thước khi đạt đến giới hạn ký tự tối đa.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Trường văn bản tự mở rộng và thu hẹp

Ví dụ này minh họa hiệu ứng của `field-sizing: content` trên các trường văn bản một dòng và nhiều dòng. Các trường điều chỉnh kích thước khi văn bản được thêm vào hoặc xóa đi, co lại theo nội dung cho đến khi đạt giới hạn kích thước nhỏ nhất hoặc lớn nhất.

#### HTML

HTML trong ví dụ này chứa ba trường biểu mẫu, mỗi trường có {{htmlelement("label")}} tương ứng: hai phần tử `<input>` loại [`text`](/vi/docs/Web/HTML/Reference/Elements/input/text) và [`email`](/vi/docs/Web/HTML/Reference/Elements/input/email) và một phần tử {{htmlelement("textarea")}}.

```html
<div>
  <label for="name">Enter name:</label>
  <input type="text" id="name" maxlength="50" />
</div>
<div>
  <label for="email">Enter email:</label>
  <input type="email" id="email" maxlength="50" placeholder="e.g. a@b.com" />
</div>
<div>
  <label for="comment">Enter comment:</label>
  <textarea id="comment">This is a comment.</textarea>
</div>
```

Lưu ý những điểm sau về HTML:

- Hai trường đầu tiên có thuộc tính [`maxlength`](/vi/docs/Web/HTML/Reference/Elements/input#maxlength), ngăn kích thước trường tăng lên khi đạt giới hạn ký tự.
- `<textarea>` sẽ mở rộng theo hướng nội tuyến cho đến khi đạt cạnh của ràng buộc {{cssxref("min-width")}} (được đặt trong mã CSS bên dưới), sau đó bắt đầu thêm dòng mới theo hướng khối để chứa các ký tự tiếp theo.
- Input `email` có placeholder được đặt. Điều này làm cho trường hiển thị đủ lớn để hiển thị toàn bộ placeholder. Khi trường được focus và người dùng bắt đầu gõ, trường thay đổi kích thước về giá trị `min-width`. Trường `text`, không có placeholder, ban đầu hiển thị ở `min-width`.

#### CSS

Trong CSS, chúng ta đặt `field-sizing: content` trên ba trường biểu mẫu, cùng với {{cssxref("min-width")}} và {{cssxref("max-width")}} để giới hạn kích thước input. Cần lưu ý rằng nếu không có chiều rộng tối thiểu được đặt trên các trường, chúng sẽ chỉ hiển thị rộng bằng con trỏ văn bản.

Chúng ta cũng cấp cho `<label>` một số kiểu dáng cơ bản để chúng hiển thị gọn gàng bên cạnh các trường.

```css hidden
body {
  box-sizing: border-box;
  padding: 20px;
}

div {
  margin-bottom: 20px;
  display: flex;
}
```

```css
input,
textarea {
  field-sizing: content;
  min-width: 50px;
  max-width: 350px;
}

label {
  width: 150px;
  margin-right: 20px;
  text-align: right;
}
```

#### Kết quả

Hãy thử nhập và xóa văn bản trong các trường bên dưới để khám phá các hiệu ứng của `field-sizing: content` cùng với các thuộc tính định kích thước khác.

{{ EmbedLiveSample('Growing/shrinking text fields', '100%', '200') }}

### Kiểm soát hiển thị phần tử `<select>`

Ví dụ này minh họa hiệu ứng của `field-sizing: content` trên các phần tử {{htmlelement("select")}}, cả loại menu thả xuống và loại hộp danh sách nhiều dòng.

#### HTML

HTML chứa hai bộ phần tử `<select>`: một bộ với `field-sizing: content` được áp dụng và một bộ không có, cho phép bạn thấy sự khác biệt (mặc dù hiệu ứng có thể kém rõ ràng hơn so với trên các trường văn bản). Mỗi bộ bao gồm một loại menu thả xuống và một loại hộp danh sách nhiều dòng (với thuộc tính [`multiple`](/vi/docs/Web/HTML/Reference/Elements/select#multiple) được đặt).

```html
<div class="field-sizing">
  <h2>With <code>field-sizing: content</code></h2>
  <select>
    <option>Bananas</option>
    <option>Strawberries</option>
    <option selected>Apples</option>
    <option>Raspberries</option>
    <option>Pomegranate</option>
  </select>
  <select multiple>
    <option>Bananas</option>
    <option>Strawberries</option>
    <option>Apples</option>
    <option>Raspberries</option>
    <option>Pomegranate</option>
  </select>
</div>
<div>
  <h2>Without <code>field-sizing: content</code></h2>
  <select>
    <option>Bananas</option>
    <option>Strawberries</option>
    <option selected>Apples</option>
    <option>Raspberries</option>
    <option>Pomegranate</option>
  </select>
  <select multiple>
    <option>Bananas</option>
    <option>Strawberries</option>
    <option>Apples</option>
    <option>Raspberries</option>
    <option>Pomegranate</option>
  </select>
</div>
```

> [!NOTE]
> Thực hành tốt nhất là bao gồm phần tử {{htmlelement("label")}} cho mỗi điều khiển biểu mẫu, để liên kết mô tả văn bản có ý nghĩa với mỗi trường cho mục đích trợ năng (xem [Sử dụng nhãn văn bản có ý nghĩa](/vi/docs/Learn_web_development/Core/Accessibility/HTML#use_meaningful_text_labels) để biết thêm thông tin). Chúng tôi không làm như vậy trong ví dụ này vì nó tập trung hoàn toàn vào các khía cạnh kết xuất hình ảnh của các điều khiển biểu mẫu, nhưng bạn nên đảm bảo bao gồm nhãn biểu mẫu trong mã thực tế.

#### CSS

Trong CSS, `field-sizing: content` chỉ được đặt trên bộ phần tử `<select>` đầu tiên.

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
.field-sizing select {
  field-sizing: content;
}
```

#### Kết quả

{{ EmbedLiveSample('Controlling select element display', '100%', '170') }}

Lưu ý các hiệu ứng sau của `field-sizing: content`:

- Menu thả xuống luôn phù hợp với kích thước của tùy chọn được hiển thị, thay đổi kích thước khi các tùy chọn khác nhau được chọn. Không có `field-sizing: content`, kích thước được cố định rộng bằng tùy chọn dài nhất.
- Hộp danh sách nhiều lựa chọn hiển thị tất cả các tùy chọn cùng một lúc. Không có `field-sizing: content`, người dùng phải cuộn hộp để xem tất cả các tùy chọn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{htmlelement("input")}}
- {{htmlelement("select")}}
- {{htmlelement("textarea")}}
