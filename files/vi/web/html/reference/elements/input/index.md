---
title: "<input>: The HTML Input element"
slug: Web/HTML/Reference/Elements/input
page-type: html-element
browser-compat: html.elements.input
sidebar: htmlsidebar
---

Phần tử **`<input>`** [HTML](/en-US/docs/Web/HTML) được dùng để tạo các điều khiển tương tác trong biểu mẫu web nhằm nhận dữ liệu từ người dùng; có nhiều loại dữ liệu đầu vào và widget điều khiển khác nhau tùy theo thiết bị và {{Glossary("user agent")}}. Phần tử `<input>` là một trong những phần tử mạnh mẽ và phức tạp nhất trong HTML do số lượng lớn các kết hợp giữa loại input và thuộc tính.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;text&quot;&gt;", "tabbed-shorter")}}

```html interactive-example
<label for="name">Name (4 to 8 characters):</label>

<input
  type="text"
  id="name"
  name="name"
  required
  minlength="4"
  maxlength="8"
  size="10" />
```

```css interactive-example
label {
  display: block;
  font:
    1rem "Fira Sans",
    sans-serif;
}

input,
label {
  margin: 0.4rem 0;
}
```

## Các loại \<input>

Cách hoạt động của `<input>` thay đổi đáng kể tùy theo giá trị của thuộc tính [`type`](#type), vì vậy các loại khác nhau được đề cập trong các trang tham khảo riêng. Nếu thuộc tính này không được chỉ định, loại mặc định là `text`.

Các loại có sẵn như sau:

<table class="no-markdown">
  <colgroup>
    <col />
    <col style="width: 50%" />
    <col />
  </colgroup>
  <thead>
    <tr>
      <th>Loại</th>
      <th>Mô tả</th>
      <th>Ví dụ cơ bản</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{HTMLElement("input/button", "button")}}</td>
      <td>
        Nút nhấn không có hành vi mặc định, hiển thị giá trị của thuộc tính <a href="#value"><code>value</code></a>, mặc định để trống.
      </td>
      <td id="examplebutton">
        <pre class="brush: html hidden">
&#x3C;input type="button" name="button" value="Button" /></pre>
        {{EmbedLiveSample("examplebutton",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/checkbox", "checkbox")}}</td>
      <td>Hộp kiểm cho phép chọn/bỏ chọn các giá trị đơn.</td>
      <td id="examplecheckbox">
        <pre class="brush: html hidden">
&#x3C;input type="checkbox" name="checkbox"/></pre>
        {{EmbedLiveSample("examplecheckbox",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/color", "color")}}</td>
      <td>
        Điều khiển để chỉ định màu sắc; mở bộ chọn màu khi hoạt động trên các trình duyệt hỗ trợ.
      </td>
      <td id="examplecolor">
        <pre class="brush: html hidden">
&#x3C;input type="color" name="color"/></pre>
        {{EmbedLiveSample("examplecolor",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/date", "date")}}</td>
      <td>
        Điều khiển để nhập ngày (năm, tháng, ngày, không có giờ).
        Mở bộ chọn ngày hoặc bánh xe số cho năm, tháng, ngày khi hoạt động trên các trình duyệt hỗ trợ.
      </td>
      <td id="exampledate">
        <pre class="brush: html hidden">
&#x3C;input type="date" name="date"/></pre>
        {{EmbedLiveSample("exampledate",200,55)}}
      </td>
    </tr>
    <tr>
      <td>
        {{HTMLElement("input/datetime-local", "datetime-local")}}
      </td>
      <td>
        Điều khiển để nhập ngày và giờ, không có múi giờ. Mở bộ chọn ngày
        hoặc bánh xe số cho các thành phần ngày và giờ khi hoạt động trên các trình duyệt hỗ trợ.
      </td>
      <td id="exampledtl">
        <pre class="brush: html hidden">
&#x3C;input type="datetime-local" name="datetime-local"/></pre>
        {{EmbedLiveSample("exampledtl",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/email", "email")}}</td>
      <td>
        Trường để chỉnh sửa địa chỉ email. Trông giống input
        <code>text</code>, nhưng có tham số xác thực và bàn phím phù hợp trên các trình duyệt và thiết bị hỗ trợ có bàn phím động.
      </td>
      <td id="exampleemail">
        <pre class="brush: html hidden">
&#x3C;input type="email" name="email"/></pre>
        {{EmbedLiveSample("exampleemail",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/file", "file")}}</td>
      <td>
        Điều khiển cho phép người dùng chọn tệp.
        Dùng thuộc tính <a href="#accept"><code>accept</code></a> để định nghĩa loại tệp mà điều khiển có thể chọn.
      </td>
      <td id="examplefile">
        <pre class="brush: html hidden">
&#x3C;input type="file" accept="image/*, text/*" name="file"/></pre>
        {{EmbedLiveSample("examplefile",'100%',55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/hidden", "hidden")}}</td>
      <td>
        Điều khiển không hiển thị nhưng giá trị của nó được gửi lên server. Có ví dụ ở cột bên, nhưng nó ẩn!
      </td>
      <td id="examplehidden">
        <pre class="brush: html hidden">
&#x3C;input id="userId" name="userId" type="hidden" value="abc123" /></pre
        >
        {{EmbedLiveSample("examplehidden",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/image", "image")}}</td>
      <td>
        Nút <code>submit</code> dạng đồ họa. Hiển thị hình ảnh được định nghĩa bởi thuộc tính <code>src</code>.
        Thuộc tính <a href="#alt"><code>alt</code></a> hiển thị nếu hình ảnh <a href="#src"><code>src</code></a> bị thiếu.
      </td>
      <td id="exampleimage">
        <pre class="brush: html hidden">
&#x3C;input type="image" name="image" src="" alt="image input"/></pre>
        {{EmbedLiveSample("exampleimage",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/month", "month")}}</td>
      <td>Điều khiển để nhập tháng và năm, không có múi giờ.</td>
      <td id="examplemonth">
        <pre class="brush: html hidden">
&#x3C;input type="month" name="month"/></pre>
        {{EmbedLiveSample("examplemonth",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/number", "number")}}</td>
      <td>
        Điều khiển để nhập số. Hiển thị spinner và thêm xác thực mặc định.
        Hiển thị bàn phím số trên một số thiết bị có bàn phím động.
      </td>
      <td id="examplenumber">
        <pre class="brush: html hidden">
&#x3C;input type="number" name="number"/></pre>
        {{EmbedLiveSample("examplenumber",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/password", "password")}}</td>
      <td>
        Trường văn bản một dòng có giá trị bị che khuất.
        Sẽ cảnh báo người dùng nếu trang web không an toàn.
      </td>
      <td id="examplepassword">
        <pre class="brush: html hidden">
&#x3C;input type="password" name="password"/></pre>
        {{EmbedLiveSample("examplepassword",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/radio", "radio")}}</td>
      <td>
        Nút radio, cho phép chọn một giá trị duy nhất trong số nhiều lựa chọn có cùng giá trị <a href="#name"><code>name</code></a>.
      </td>
      <td id="exampleradio">
        <pre class="brush: html hidden">
&#x3C;input type="radio" name="radio"/></pre
        >
        {{EmbedLiveSample("exampleradio",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/range", "range")}}</td>
      <td>
        Điều khiển để nhập số có giá trị chính xác không quan trọng.
        Hiển thị dưới dạng widget phạm vi mặc định là giá trị ở giữa.
        Dùng kết hợp với <a href="#min"><code>min</code></a> và <a href="#max"><code>max</code></a> để xác định phạm vi giá trị chấp nhận được.
      </td>
      <td id="examplerange">
        <pre class="brush: html hidden">
&#x3C;input type="range" name="range" min="0" max="25"/></pre>
        {{EmbedLiveSample("examplerange",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/reset", "reset")}}</td>
      <td>
        Nút đặt lại nội dung biểu mẫu về giá trị mặc định. Không khuyến khích sử dụng.
      </td>
      <td id="examplereset">
        <pre class="brush: html hidden">
&#x3C;input type="reset" name="reset"/></pre
        >
        {{EmbedLiveSample("examplereset",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/search", "search")}}</td>
      <td>
        Trường văn bản một dòng để nhập chuỗi tìm kiếm. Ngắt dòng được tự động xóa khỏi giá trị input. Có thể bao gồm biểu tượng xóa trên các trình duyệt hỗ trợ. Hiển thị biểu tượng tìm kiếm thay vì phím enter trên một số thiết bị có bàn phím động.
      </td>
      <td id="examplesearch">
        <pre class="brush: html hidden">
&#x3C;input type="search" name="search"/></pre>
        {{EmbedLiveSample("examplesearch",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/submit", "submit")}}</td>
      <td>Nút gửi biểu mẫu.</td>
      <td id="examplesubmit">
        <pre class="brush: html hidden">
&#x3C;input type="submit" name="submit"/></pre>
        {{EmbedLiveSample("examplesubmit",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/tel", "tel")}}</td>
      <td>
        Điều khiển để nhập số điện thoại. Hiển thị bàn phím điện thoại
        trên một số thiết bị có bàn phím động.
      </td>
      <td id="exampletel">
        <pre class="brush: html hidden">
&#x3C;input type="tel" name="tel"/></pre>
        {{EmbedLiveSample("exampletel",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/text", "text")}}</td>
      <td>
        Giá trị mặc định. Trường văn bản một dòng. Ngắt dòng được tự động xóa khỏi giá trị input.
      </td>
      <td id="exampletext">
        <pre class="brush: html hidden">
&#x3C;input type="text" name="text"/></pre
        >
        {{EmbedLiveSample("exampletext",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/time", "time")}}</td>
      <td>Điều khiển để nhập giá trị thời gian không có múi giờ.</td>
      <td id="exampletime">
        <pre class="brush: html hidden">
&#x3C;input type="time" name="time"/></pre>
        {{EmbedLiveSample("exampletime",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/url", "url")}}</td>
      <td>
        Trường để nhập URL. Trông giống input <code>text</code>, nhưng có tham số xác thực và bàn phím phù hợp trên các trình duyệt và thiết bị hỗ trợ có bàn phím động.
      </td>
      <td id="exampleurl">
        <pre class="brush: html hidden">
&#x3C;input type="url" name="url"/></pre
        >
        {{EmbedLiveSample("exampleurl",200,55)}}
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/week", "week")}}</td>
      <td>
        Điều khiển để nhập ngày bao gồm số tuần-năm và số tuần không có múi giờ.
      </td>
      <td id="exampleweek">
        <pre class="brush: html hidden">
&#x3C;input type="week" name="week"/></pre>
        {{EmbedLiveSample("exampleweek",200,55)}}
      </td>
    </tr>
    <tr>
      <th colspan="3">Giá trị lỗi thời</th>
    </tr>
    <tr>
      <td><code>datetime</code> {{deprecated_inline}}</td>
      <td>
        Điều khiển để nhập ngày và giờ (giờ, phút, giây, và phần thập phân của giây) dựa trên múi giờ UTC.
      </td>
      <td id="exampledatetime">
        <pre class="brush: html hidden">
&#x3C;input type="datetime" name="datetime"/></pre>
        {{EmbedLiveSample("exampledatetime",200,75)}}
      </td>
    </tr>
  </tbody>
</table>

## Thuộc tính

Phần tử `<input>` rất mạnh mẽ nhờ các thuộc tính của nó; thuộc tính [`type`](#type), được mô tả với các ví dụ ở trên, là quan trọng nhất. Vì mọi phần tử `<input>`, bất kể loại nào, đều dựa trên giao diện {{domxref("HTMLInputElement")}}, về mặt kỹ thuật chúng chia sẻ cùng một tập hợp thuộc tính. Tuy nhiên, trên thực tế, hầu hết các thuộc tính chỉ có tác dụng trên một tập con cụ thể của các loại input.

Bảng dưới đây liệt kê tất cả các thuộc tính với mô tả ngắn gọn, tiếp theo là danh sách mô tả chi tiết từng thuộc tính:

| Thuộc tính                                    | Loại                                                                    | Mô tả                                                                                                 |
| --------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| [`accept`](#accept)                           | `file`                                                                  | Gợi ý loại tệp dự kiến trong điều khiển tải lên tệp                                                  |
| [`alpha`](#alpha)                             | `color`                                                                 | Độ trong suốt của màu sắc                                                                             |
| [`alt`](#alt)                                 | `image`                                                                 | Thuộc tính alt cho loại image. Bắt buộc cho khả năng tiếp cận                                        |
| [`autocapitalize`](#autocapitalize)           | tất cả trừ `url`, `email`, và `password`                                | Kiểm soát viết hoa tự động trong văn bản nhập vào                                                    |
| [`autocomplete`](#autocomplete)               | tất cả trừ `checkbox`, `radio`, và buttons                              | Gợi ý cho tính năng tự động điền biểu mẫu                                                            |
| [`capture`](#capture)                         | `file`                                                                  | Phương thức chụp media trong điều khiển tải lên tệp                                                  |
| [`checked`](#checked)                         | `checkbox`, `radio`                                                     | Liệu lệnh hoặc điều khiển có được chọn không                                                         |
| [`colorspace`](#colorspace)                   | `color`                                                                 | [Không gian màu](/en-US/docs/Glossary/Color_space) dùng để chọn giá trị màu                          |
| [`dirname`](#dirname)                         | `hidden`, `text`, `search`, `url`, `tel`, `email`                       | Tên trường biểu mẫu để gửi hướng của phần tử khi submit                                              |
| [`disabled`](#disabled)                       | tất cả                                                                  | Liệu điều khiển biểu mẫu có bị vô hiệu hóa không                                                    |
| [`form`](#form)                               | tất cả                                                                  | Liên kết điều khiển với phần tử form                                                                  |
| [`formaction`](#formaction)                   | `image`, `submit`                                                       | URL để gửi biểu mẫu                                                                                   |
| [`formenctype`](#formenctype)                 | `image`, `submit`                                                       | Loại mã hóa tập dữ liệu biểu mẫu khi gửi                                                             |
| [`formmethod`](#formmethod)                   | `image`, `submit`                                                       | Phương thức HTTP để gửi biểu mẫu                                                                      |
| [`formnovalidate`](#formnovalidate)           | `image`, `submit`                                                       | Bỏ qua xác thực điều khiển biểu mẫu khi gửi                                                          |
| [`formtarget`](#formtarget)                   | `image`, `submit`                                                       | Ngữ cảnh duyệt để gửi biểu mẫu                                                                       |
| [`height`](#height)                           | `image`                                                                 | Tương tự thuộc tính height cho {{htmlelement('img')}}; chiều cao                                      |
| [`list`](#list)                               | tất cả trừ `hidden`, `password`, `checkbox`, `radio`, và buttons        | Giá trị thuộc tính id của {{htmlelement('datalist')}} chứa các tùy chọn autocomplete                 |
| [`max`](#max)                                 | `date`, `month`, `week`, `time`, `datetime-local`, `number`, `range`    | Giá trị tối đa                                                                                        |
| [`maxlength`](#maxlength)                     | `text`, `search`, `url`, `tel`, `email`, `password`                     | Độ dài tối đa (số ký tự) của `value`                                                                  |
| [`min`](#min)                                 | `date`, `month`, `week`, `time`, `datetime-local`, `number`, `range`    | Giá trị tối thiểu                                                                                     |
| [`minlength`](#minlength)                     | `text`, `search`, `url`, `tel`, `email`, `password`                     | Độ dài tối thiểu (số ký tự) của `value`                                                               |
| [`multiple`](#multiple)                       | `email`, `file`                                                         | Boolean. Liệu có cho phép nhiều giá trị không                                                         |
| [`name`](#name)                               | tất cả                                                                  | Tên của điều khiển biểu mẫu. Được gửi cùng với giá trị khi submit                                    |
| [`pattern`](#pattern)                         | `text`, `search`, `url`, `tel`, `email`, `password`                     | Mẫu mà `value` phải khớp để hợp lệ                                                                   |
| [`placeholder`](#placeholder)                 | `text`, `search`, `url`, `tel`, `email`, `password`, `number`           | Văn bản hiển thị trong điều khiển biểu mẫu khi chưa có giá trị                                       |
| [`popovertarget`](#popovertarget)             | `button`                                                                | Chỉ định `<input type="button">` là điều khiển cho phần tử popover                                   |
| [`popovertargetaction`](#popovertargetaction) | `button`                                                                | Chỉ định hành động mà điều khiển popover thực hiện                                                    |
| [`readonly`](#readonly)                       | tất cả trừ `hidden`, `range`, `color`, `checkbox`, `radio`, và buttons  | Boolean. Giá trị không thể chỉnh sửa                                                                  |
| [`required`](#required)                       | tất cả trừ `hidden`, `range`, `color`, và buttons                       | Boolean. Giá trị bắt buộc hoặc phải được chọn để biểu mẫu có thể submit                              |
| [`size`](#size)                               | `text`, `search`, `url`, `tel`, `email`, `password`                     | Kích thước của điều khiển                                                                             |
| [`src`](#src)                                 | `image`                                                                 | Tương tự thuộc tính `src` cho {{htmlelement('img')}}; địa chỉ tài nguyên hình ảnh                    |
| [`step`](#step)                               | `date`, `month`, `week`, `time`, `datetime-local`, `number`, `range`    | Các giá trị tăng dần hợp lệ                                                                           |
| [`switch`](#switch)                           | `checkbox`                                                              | Liệu input checkbox có nên được hiển thị dưới dạng switch không                                       |
| [`type`](#type)                               | tất cả                                                                  | Loại điều khiển biểu mẫu                                                                              |
| [`value`](#value)                             | tất cả trừ `image`                                                      | Giá trị của điều khiển. Khi được chỉ định trong HTML, tương ứng với giá trị ban đầu                   |
| [`width`](#width)                             | `image`                                                                 | Tương tự thuộc tính `width` cho {{htmlelement('img')}}                                                |

### Các thuộc tính riêng lẻ

- [`accept`](/en-US/docs/Web/HTML/Reference/Attributes/accept)
  - : Chỉ hợp lệ cho loại input `file`, thuộc tính `accept` xác định loại tệp nào có thể được chọn trong điều khiển tải lên `file`. Xem loại input {{HTMLElement("input/file", "file")}}.

- `alpha` {{experimental_inline}}
  - : Chỉ hợp lệ cho loại input `color`, thuộc tính `alpha` cung cấp cho người dùng cuối khả năng đặt độ trong suốt của màu đang được chọn.

- `alt`
  - : Chỉ hợp lệ cho nút `image`, thuộc tính `alt` cung cấp văn bản thay thế cho hình ảnh, hiển thị giá trị của thuộc tính nếu [`src`](#src) bị thiếu hoặc không tải được. Xem loại input {{HTMLElement("input/image", "image")}}.

- `autocapitalize`
  - : Kiểm soát liệu văn bản nhập vào có được viết hoa tự động hay không. Xem trang thuộc tính toàn cục [`autocapitalize`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocapitalize).

- [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete)
  - : (**Không** phải thuộc tính Boolean!) Thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete) nhận giá trị là chuỗi phân cách bằng khoảng trắng mô tả loại chức năng autocomplete mà input cần cung cấp. Xem [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete#value) cho các giá trị được phép.

- `autofocus`
  - : Thuộc tính Boolean, nếu có, chỉ ra rằng input sẽ tự động nhận focus khi trang tải xong.

    > [!NOTE]
    > Phần tử có thuộc tính `autofocus` có thể nhận focus trước khi sự kiện {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}} được kích hoạt.

    > [!WARNING]
    > Tự động focus vào điều khiển biểu mẫu có thể gây nhầm lẫn cho người dùng khiếm thị dùng công nghệ đọc màn hình và người dùng có khiếm khuyết nhận thức.

- [`capture`](/en-US/docs/Web/HTML/Reference/Attributes/capture)
  - : Chỉ hợp lệ cho loại input `file`, thuộc tính `capture` xác định media nào — microphone, video, hay camera — sẽ được dùng để chụp tệp mới cho việc tải lên.

- `checked`
  - : Hợp lệ cho cả `radio` và `checkbox`, `checked` là thuộc tính Boolean. Nếu có trên loại `radio`, cho biết nút radio đó đang được chọn trong nhóm. Nếu có trên `checkbox`, cho biết checkbox mặc định được chọn khi trang tải.

- `colorspace` {{experimental_inline}}
  - : Chỉ hợp lệ cho loại input `color`, thuộc tính `colorspace` xác định [không gian màu](/en-US/docs/Glossary/Color_space) được sử dụng. Giá trị có thể là `"limited-srgb"` (mặc định) hoặc `"display-p3"`.

- [`dirname`](/en-US/docs/Web/HTML/Reference/Attributes/dirname)
  - : Hợp lệ cho `hidden`, `text`, `search`, `url`, `tel`, và `email`, thuộc tính `dirname` cho phép gửi hướng của phần tử. Khi được bao gồm, điều khiển biểu mẫu sẽ gửi hai cặp name/value.

- [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled)
  - : Thuộc tính Boolean, nếu có, chỉ ra rằng người dùng không thể tương tác với input. Input bị vô hiệu hóa thường được hiển thị với màu tối hơn.

- [`form`](/en-US/docs/Web/HTML/Reference/Attributes/form)
  - : Chuỗi chỉ định phần tử {{HTMLElement("form")}} mà input được liên kết. Giá trị phải khớp với `id` của phần tử `<form>` trong cùng tài liệu.

- `formaction`
  - : Chỉ hợp lệ cho loại input `image` và `submit`. Xem loại input {{HTMLElement("input/submit", "submit")}}.

- `formenctype`
  - : Chỉ hợp lệ cho loại input `image` và `submit`. Xem loại input {{HTMLElement("input/submit", "submit")}}.

- `formmethod`
  - : Chỉ hợp lệ cho loại input `image` và `submit`. Xem loại input {{HTMLElement("input/submit", "submit")}}.

- `formnovalidate`
  - : Chỉ hợp lệ cho loại input `image` và `submit`. Xem loại input {{HTMLElement("input/submit", "submit")}}.

- `formtarget`
  - : Chỉ hợp lệ cho loại input `image` và `submit`. Xem loại input {{HTMLElement("input/submit", "submit")}}.

- `height`
  - : Chỉ hợp lệ cho nút input `image`, `height` là chiều cao của tệp hình ảnh để hiển thị. Xem loại input {{HTMLElement("input/image", "image")}}.

- `id`
  - : Thuộc tính toàn cục hợp lệ cho tất cả phần tử, định nghĩa định danh duy nhất (ID) phải là duy nhất trong toàn bộ tài liệu.

- `inputmode`
  - : Giá trị toàn cục hợp lệ cho tất cả phần tử, cung cấp gợi ý cho trình duyệt về cấu hình bàn phím ảo khi chỉnh sửa phần tử này. Các giá trị bao gồm `none`, `text`, `tel`, `url`, `email`, `numeric`, `decimal`, và `search`.

- `list`
  - : Giá trị của thuộc tính `list` phải là `id` của phần tử {{HTMLElement("datalist")}} trong cùng tài liệu. `<datalist>` cung cấp danh sách các giá trị được định nghĩa trước để gợi ý cho người dùng.

- [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max)
  - : Hợp lệ cho `date`, `month`, `week`, `time`, `datetime-local`, `number`, và `range`, xác định giá trị lớn nhất trong phạm vi giá trị được phép.

- [`maxlength`](/en-US/docs/Web/HTML/Reference/Attributes/maxlength)
  - : Hợp lệ cho `text`, `search`, `url`, `tel`, `email`, và `password`, xác định độ dài chuỗi tối đa (tính bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào trường.

- [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min)
  - : Hợp lệ cho `date`, `month`, `week`, `time`, `datetime-local`, `number`, và `range`, xác định giá trị nhỏ nhất trong phạm vi giá trị được phép.

- [`minlength`](/en-US/docs/Web/HTML/Reference/Attributes/minlength)
  - : Hợp lệ cho `text`, `search`, `url`, `tel`, `email`, và `password`, xác định độ dài chuỗi tối thiểu mà người dùng có thể nhập vào trường.

- [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple)
  - : Thuộc tính Boolean `multiple`, nếu được đặt, có nghĩa là người dùng có thể nhập địa chỉ email phân cách bằng dấu phẩy trong widget email hoặc chọn nhiều tệp với input `file`.

- `name`
  - : Chuỗi chỉ định tên cho điều khiển input. Tên này được gửi cùng với giá trị điều khiển khi dữ liệu biểu mẫu được gửi.

- [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern)
  - : Hợp lệ cho `text`, `search`, `url`, `tel`, `email`, và `password`, thuộc tính `pattern` được dùng để biên dịch biểu thức chính quy mà [`value`](#value) của input phải khớp để vượt qua xác thực ràng buộc.

- [`placeholder`](/en-US/docs/Web/HTML/Reference/Attributes/placeholder)
  - : Hợp lệ cho `text`, `search`, `url`, `tel`, `email`, `password`, và `number`, thuộc tính `placeholder` cung cấp gợi ý ngắn gọn cho người dùng về loại thông tin dự kiến trong trường.

- `popovertarget`
  - : Biến phần tử `<input type="button">` thành nút điều khiển popover; nhận ID của phần tử popover cần điều khiển làm giá trị.

- `popovertargetaction`
  - : Chỉ định hành động thực hiện trên phần tử popover được điều khiển. Các giá trị có thể là `"hide"`, `"show"`, hoặc `"toggle"` (mặc định).

- [`readonly`](/en-US/docs/Web/HTML/Reference/Attributes/readonly)
  - : Thuộc tính Boolean, nếu có, chỉ ra rằng người dùng không thể chỉnh sửa giá trị của input.

- [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required)
  - : `required` là thuộc tính Boolean, nếu có, chỉ ra rằng người dùng phải chỉ định giá trị cho input trước khi biểu mẫu có thể được gửi.

- [`size`](/en-US/docs/Web/HTML/Reference/Attributes/size)
  - : Hợp lệ cho `email`, `password`, `tel`, `url`, và `text`, thuộc tính `size` chỉ định bao nhiêu input được hiển thị.

- `src`
  - : Chỉ hợp lệ cho nút input `image`, `src` là chuỗi chỉ định URL của tệp hình ảnh cần hiển thị. Xem loại input {{HTMLElement("input/image", "image")}}.

- [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step)
  - : Hợp lệ cho `date`, `month`, `week`, `time`, `datetime-local`, `number`, và `range`, thuộc tính `step` là số chỉ định độ chi tiết mà giá trị phải tuân thủ.

- [`switch`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox#switch) {{experimental_inline}} {{non-standard_inline}}
  - : Chỉ hợp lệ cho input `checkbox`, `switch` là thuộc tính Boolean chỉ ra liệu input checkbox có nên được hiển thị dưới dạng switch không.

- `tabindex`
  - : Thuộc tính toàn cục hợp lệ cho tất cả phần tử, một thuộc tính integer chỉ ra liệu phần tử có thể nhận focus input không.

- `title`
  - : Thuộc tính toàn cục hợp lệ cho tất cả phần tử bao gồm tất cả loại input, chứa văn bản thể hiện thông tin tư vấn liên quan đến phần tử.

- `type`
  - : Chuỗi chỉ định loại điều khiển cần hiển thị. Ví dụ, để tạo checkbox, sử dụng giá trị `checkbox`. Nếu bỏ qua, loại input `text` được sử dụng.

- `value`
  - : Giá trị của điều khiển input. Khi được chỉ định trong HTML, đây là giá trị ban đầu, và từ đó có thể được thay đổi hoặc truy xuất bất cứ lúc nào bằng JavaScript.

- `width`
  - : Chỉ hợp lệ cho nút input `image`, `width` là chiều rộng của tệp hình ảnh để hiển thị. Xem loại input {{HTMLElement("input/image", "image")}}.

### Thuộc tính không chuẩn

Các thuộc tính không chuẩn sau cũng có sẵn trên một số trình duyệt. Thông thường nên tránh sử dụng chúng trừ khi không có cách khác.

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Thuộc tính</th>
      <th scope="col">Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="#incremental"><code>incremental</code></a></td>
      <td>
        Liệu có gửi các sự kiện {{domxref("HTMLInputElement/search_event", "search")}} lặp đi lặp lại để cho phép cập nhật kết quả tìm kiếm trực tiếp trong khi người dùng vẫn đang chỉnh sửa hay không.
        <strong>Chỉ WebKit và Blink (Safari, Chrome, Opera, v.v.).</strong>
      </td>
    </tr>
    <tr>
      <td><code>mozactionhint</code> {{deprecated_inline}}</td>
      <td>
        <p>Chuỗi chỉ ra loại hành động sẽ được thực hiện khi người dùng nhấn phím <kbd>Enter</kbd> hoặc <kbd>Return</kbd>. <strong>Vì thuộc tính này đã bị ngừng hỗ trợ, hãy dùng <a href="/en-US/docs/Web/HTML/Reference/Global_attributes/enterkeyhint"><code>enterkeyhint</code></a> thay thế.</strong></p>
      </td>
    </tr>
    <tr>
      <td><a href="#orient"><code>orient</code></a></td>
      <td>
        Đặt hướng của thanh trượt range. <strong>Chỉ Firefox.</strong>
      </td>
    </tr>
    <tr>
      <td><a href="#results"><code>results</code></a></td>
      <td>
        Số lượng mục tối đa nên hiển thị trong danh sách thả xuống các truy vấn tìm kiếm trước đó. <strong>Chỉ Safari.</strong>
      </td>
    </tr>
    <tr>
      <td>
        <a href="#webkitdirectory"><code>webkitdirectory</code></a>
      </td>
      <td>
        Boolean chỉ ra liệu có chỉ cho phép người dùng chọn thư mục không.
      </td>
    </tr>
  </tbody>
</table>

- `incremental` {{non-standard_inline}}
  - : Thuộc tính Boolean `incremental` là phần mở rộng WebKit và Blink, nếu có, báo cho {{Glossary("user agent")}} xử lý input như tìm kiếm trực tiếp.

- `orient` {{non-standard_inline}}
  - : Tương tự thuộc tính CSS không chuẩn `-moz-orient`, thuộc tính `orient` xác định hướng của thanh trượt range. Các giá trị bao gồm `horizontal` và `vertical`.

- `results` {{non-standard_inline}}
  - : Thuộc tính `results` — chỉ được hỗ trợ bởi Safari — là giá trị số cho phép ghi đè số lượng mục tối đa được hiển thị trong menu thả xuống của các truy vấn tìm kiếm trước đó.

- `webkitdirectory` {{non-standard_inline}}
  - : Thuộc tính Boolean `webkitdirectory`, nếu có, chỉ ra rằng chỉ có thể chọn thư mục. Xem {{domxref("HTMLInputElement.webkitdirectory")}} để biết thêm chi tiết.

## Phương thức

Các phương thức sau được cung cấp bởi giao diện {{domxref("HTMLInputElement")}}:

- {{domxref("HTMLInputElement.checkValidity", "checkValidity()")}}
  - : Trả về `true` nếu giá trị của phần tử vượt qua kiểm tra tính hợp lệ; ngược lại, trả về `false` và kích hoạt sự kiện {{domxref("HTMLInputElement.invalid_event", "invalid")}}.

- {{domxref("HTMLInputElement.reportValidity", "reportValidity()")}}
  - : Trả về `true` nếu giá trị của phần tử vượt qua kiểm tra tính hợp lệ; ngược lại, trả về `false`, kích hoạt sự kiện `invalid`, và báo cáo vấn đề cho người dùng.

- {{domxref("HTMLInputElement.select", "select()")}}
  - : Chọn toàn bộ nội dung của phần tử `<input>`, nếu nội dung phần tử có thể được chọn.

- {{domxref("HTMLInputElement.setCustomValidity", "setCustomValidity()")}}
  - : Đặt thông báo tùy chỉnh để hiển thị nếu giá trị của phần tử input không hợp lệ.

- {{domxref("HTMLInputElement.setRangeText", "setRangeText()")}}
  - : Đặt nội dung của phạm vi ký tự được chỉ định trong phần tử input thành một chuỗi cho trước.

- {{domxref("HTMLInputElement.setSelectionRange", "setSelectionRange()")}}
  - : Chọn phạm vi ký tự được chỉ định trong phần tử input văn bản.

- {{domxref("HTMLInputElement.showPicker", "showPicker()")}}
  - : Hiển thị bộ chọn trình duyệt cho phần tử input.

- {{domxref("HTMLInputElement.stepDown", "stepDown()")}}
  - : Giảm giá trị của input số đi một, theo mặc định, hoặc theo số đơn vị được chỉ định.

- {{domxref("HTMLInputElement.stepUp", "stepUp()")}}
  - : Tăng giá trị của input số lên một hoặc theo số đơn vị được chỉ định.

## CSS

Input, là replaced elements, có một số tính năng không áp dụng cho các phần tử không phải biểu mẫu.

### Pseudo-class giao diện người dùng

<table class="no-markdown">
  <caption>
    Các pseudo-class liên quan đến phần tử
    <code>&#x3C;input></code>:
  </caption>
  <thead>
    <tr>
      <th>Pseudo-class</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{Cssxref(":enabled")}}</td>
      <td>Bất kỳ phần tử nào hiện đang được bật có thể được kích hoạt.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":disabled")}}</td>
      <td>Bất kỳ phần tử nào hiện đang bị vô hiệu hóa.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":read-only")}}</td>
      <td>Phần tử không thể chỉnh sửa bởi người dùng</td>
    </tr>
    <tr>
      <td>{{Cssxref(":read-write")}}</td>
      <td>Phần tử có thể chỉnh sửa bởi người dùng.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":placeholder-shown")}}</td>
      <td>Phần tử hiện đang hiển thị văn bản <a href="#placeholder"><code>placeholder</code></a>.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":default")}}</td>
      <td>Các phần tử biểu mẫu là mặc định trong nhóm các phần tử liên quan.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":checked")}}</td>
      <td>Các phần tử checkbox và radio input hiện đang được chọn.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":indeterminate")}}</td>
      <td>Các phần tử checkbox có thuộc tính indeterminate được đặt là true.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":valid")}}</td>
      <td>Các điều khiển biểu mẫu có thể áp dụng xác thực ràng buộc và hiện đang hợp lệ.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":invalid")}}</td>
      <td>Các điều khiển biểu mẫu có xác thực ràng buộc được áp dụng và hiện không hợp lệ.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":in-range")}}</td>
      <td>Input không rỗng có giá trị hiện tại trong phạm vi được chỉ định bởi `min` và `max`.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":out-of-range")}}</td>
      <td>Input không rỗng có giá trị hiện tại KHÔNG nằm trong phạm vi.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":required")}}</td>
      <td>Phần tử `<input>` có thuộc tính <a href="#required"><code>required</code></a>.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":optional")}}</td>
      <td>Phần tử `<input>` KHÔNG có thuộc tính <a href="#required"><code>required</code></a>.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":blank")}}</td>
      <td>Phần tử `<input>` hiện không có giá trị.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":user-invalid")}}</td>
      <td>Tương tự `:invalid`, nhưng được kích hoạt khi blur. Khớp input không hợp lệ chỉ sau khi người dùng tương tác.</td>
    </tr>
    <tr>
      <td>{{Cssxref(":open")}}</td>
      <td>
        Phần tử `<input>` hiển thị bộ chọn — nhưng chỉ khi phần tử ở trạng thái mở, tức là khi bộ chọn được hiển thị.
      </td>
    </tr>
  </tbody>
</table>

#### Ví dụ pseudo-class

Chúng ta có thể tạo kiểu cho nhãn checkbox dựa trên việc checkbox có được chọn hay không:

```html hidden
<input id="checkboxInput" type="checkbox" />
<label for="checkboxInput">Bật/tắt checkbox</label>
```

```css
input:checked + label {
  color: red;
  font-weight: bold;
}
```

{{EmbedLiveSample('Pseudo-classes_example', 500, 80)}}

### Bộ chọn thuộc tính

Có thể nhắm mục tiêu các loại điều khiển biểu mẫu khác nhau dựa trên [`type`](#type) của chúng bằng [bộ chọn thuộc tính](/en-US/docs/Learn_web_development/Core/Styling_basics/Attribute_selectors):

```css
/* khớp input password */
input[type="password"] {
}

/* khớp điều khiển biểu mẫu có phạm vi giá trị giới hạn */
input[min][max] {
}

/* khớp điều khiển biểu mẫu có thuộc tính pattern */
input[pattern] {
}
```

### ::placeholder

Theo mặc định, giao diện văn bản placeholder là xám nhạt hoặc trong suốt. Pseudo-element {{cssxref('::placeholder')}} là văn bản [`placeholder`](#placeholder) của input.

```css
::placeholder {
  color: blue;
}
```

### caret-color

Thuộc tính CSS {{cssxref("caret-color")}} cho phép đặt màu dùng để vẽ dấu nháy nhập văn bản:

#### HTML

```html
<label for="textInput">Lưu ý dấu nháy màu đỏ:</label>
<input id="textInput" class="custom" size="32" />
```

#### CSS

```css
input.custom {
  caret-color: red;
  font:
    16px "Helvetica",
    "Arial",
    sans-serif;
}
```

#### Kết quả

{{EmbedLiveSample('caret-color', 500, 80)}}

### field-sizing

Thuộc tính {{cssxref("field-sizing")}} cho phép kiểm soát hành vi kích thước của input biểu mẫu, cho phép các điều khiển biểu mẫu điều chỉnh kích thước để phù hợp với nội dung.

### object-position và object-fit

Trong một số trường hợp (thường liên quan đến input không phải văn bản), phần tử `<input>` là {{ glossary("replaced elements", "replaced element")}}. Khi đó, vị trí và kích thước của phần tử trong khung có thể được điều chỉnh bằng các thuộc tính CSS {{cssxref("object-position")}} và {{cssxref("object-fit")}}.

## Tính năng bổ sung

### Nhãn

Nhãn cần thiết để liên kết văn bản trợ giúp với `<input>`. Phần tử {{HTMLElement("label")}} cung cấp thông tin giải thích về trường biểu mẫu.

#### Nhãn liên kết

Việc ghép cặp `<input>` và `<label>` hữu ích cho công nghệ hỗ trợ như trình đọc màn hình. Bằng cách ghép cặp chúng bằng thuộc tính [`for`](/en-US/docs/Web/HTML/Reference/Elements/label#for) của `<label>`, bạn liên kết nhãn với input.

```html
<!-- không thể tiếp cận -->
<p>Nhập tên của bạn: <input id="name" type="text" size="30" /></p>

<!-- nhãn ngầm định -->
<p>
  <label>Nhập tên của bạn: <input id="name" type="text" size="30" /></label>
</p>

<!-- nhãn tường minh -->
<p>
  <label for="name">Nhập tên của bạn: </label>
  <input id="name" type="text" size="30" />
</p>
```

#### Placeholder không thể tiếp cận

Thuộc tính [`placeholder`](#placeholder) không phải là nhãn và không nên được dùng thay thế cho nhãn vì không thể tiếp cận được với trình đọc màn hình.

> [!NOTE]
> Đừng dùng thuộc tính [`placeholder`](#placeholder) nếu có thể tránh được. Nếu cần nhãn cho phần tử `<input>`, hãy dùng phần tử {{HTMLElement("label")}}.

### Xác thực phía client

> [!WARNING]
> Xác thực phía client là hữu ích, nhưng _không_ đảm bảo rằng server sẽ nhận được dữ liệu hợp lệ. Nếu dữ liệu phải ở định dạng cụ thể, _luôn_ xác minh ở server.

Trình duyệt cung cấp xác thực phía client khi gửi biểu mẫu. Nếu có điều khiển biểu mẫu không vượt qua xác thực ràng buộc, các trình duyệt hỗ trợ sẽ hiển thị thông báo lỗi.

Đối tượng `validityState` bao gồm:

- {{domxref('validityState.valueMissing')}}
- {{domxref('validityState.typeMismatch')}}
- {{domxref('validityState.patternMismatch')}}
- {{domxref('validityState.tooLong')}}
- {{domxref('validityState.tooShort')}}
- {{domxref('validityState.rangeUnderflow')}}
- {{domxref('validityState.rangeOverflow')}}
- {{domxref('validityState.stepMismatch')}}
- {{domxref('validityState.badInput')}}
- {{domxref('validityState', 'validityState.valid')}}
- {{domxref('validityState', 'validityState.customError')}}

```js
function validate(input) {
  let validityState = input.validity;
  if (validityState.valueMissing) {
    input.setCustomValidity("A value is required");
  } else if (validityState.rangeUnderflow) {
    input.setCustomValidity("Your value is too low");
  } else if (validityState.rangeOverflow) {
    input.setCustomValidity("Your value is too high");
  } else {
    input.setCustomValidity("");
  }
}
```

#### Ví dụ lỗi xác thực tùy chỉnh

```html
<form>
  <label for="name">Enter username (upper and lowercase letters): </label>
  <input type="text" name="name" id="name" required pattern="[A-Za-z]+" />
  <button>Submit</button>
</form>
```

```js
const nameInput = document.querySelector("input");

nameInput.addEventListener("input", () => {
  nameInput.setCustomValidity("");
  nameInput.checkValidity();
});

nameInput.addEventListener("invalid", () => {
  if (nameInput.value === "") {
    nameInput.setCustomValidity("Enter your username!");
  } else {
    nameInput.setCustomValidity(
      "Usernames can only contain upper and lowercase letters. Try again!",
    );
  }
});
```

{{EmbedLiveSample('Custom_validation_error_example')}}

> [!NOTE]
> Luôn xác thực các ràng buộc input ở cả phía client lẫn server. Xác thực ràng buộc không loại bỏ nhu cầu xác thực ở _server_.

### Bản địa hóa

Các input được phép cho một số loại `<input>` phụ thuộc vào ngôn ngữ địa phương.

## Khả năng tiếp cận

### Nhãn

Khi bao gồm input, đây là yêu cầu về khả năng tiếp cận để thêm nhãn đi kèm. Điều này cần thiết để những người dùng công nghệ hỗ trợ có thể biết input dùng để làm gì.

```html
<label for="peas">Do you like peas?</label>
<input type="checkbox" name="peas" id="peas" />
```

### Kích thước

Các phần tử tương tác như input biểu mẫu nên cung cấp khu vực đủ lớn để dễ dàng kích hoạt. Kích thước tương tác tối thiểu 44×44 [CSS pixels](https://w3c.github.io/wcag/guidelines/22/#dfn-css-pixels) được khuyến nghị.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Flow content</a>, listed, submittable, resettable, form-associated element,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">phrasing content</a>. Nếu <a href="#type"><code>type</code></a> không phải
        <code>hidden</code>, thì là labelable element, palpable content.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Không có; đây là {{Glossary("void element")}}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Phải có thẻ mở và không được có thẻ đóng.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">phrasing content</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <ul>
          <li><code>type=button</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role">button</a></code></li>
          <li><code>type=checkbox</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role">checkbox</a></code></li>
          <li><code>type=email</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role">textbox</a></code> hoặc <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role"><code>combobox</code></a></li>
          <li><code>type=image</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role">button</a></code></li>
          <li><code>type=number</code>: <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role"><code>spinbutton</code></a></li>
          <li><code>type=radio</code>: <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role"><code>radio</code></a></li>
          <li><code>type=range</code>: <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role"><code>slider</code></a></li>
          <li><code>type=reset</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role">button</a></code></li>
          <li><code>type=search</code>: <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role"><code>searchbox</code></a> hoặc <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role"><code>combobox</code></a></li>
          <li><code>type=submit</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role">button</a></code></li>
          <li><code>type=tel</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role">textbox</a></code> hoặc <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role"><code>combobox</code></a></li>
          <li><code>type=text</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role">textbox</a></code> hoặc <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role"><code>combobox</code></a></li>
          <li><code>type=url</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role">textbox</a></code> hoặc <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role"><code>combobox</code></a></li>
          <li><code>type=color|date|datetime-local|file|hidden|month|password|time|week</code>: <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role">không có vai trò tương ứng</a></li>
        </ul>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLInputElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("appearance")}}
- [Biểu mẫu HTML đầu tiên của bạn](/en-US/docs/Learn_web_development/Extensions/Forms/Your_first_form)
- [Cách cấu trúc biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_structure_a_web_form)
- [Các widget biểu mẫu gốc](/en-US/docs/Learn_web_development/Extensions/Forms/Basic_native_form_controls)
- [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data)
- [Xác thực ràng buộc biểu mẫu](/en-US/docs/Web/HTML/Guides/Constraint_validation)
