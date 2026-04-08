---
title: "<datalist>: Phần tử HTML Data List"
slug: Web/HTML/Reference/Elements/datalist
page-type: html-element
browser-compat: html.elements.datalist
sidebar: htmlsidebar
---

Phần tử **`<datalist>`** trong [HTML](/en-US/docs/Web/HTML) chứa tập hợp các phần tử {{HTMLElement("option")}} đại diện cho các tùy chọn được phép hoặc được khuyến nghị để chọn trong các điều khiển khác.

{{InteractiveExample("HTML Demo: &lt;datalist&gt;", "tabbed-standard")}}

```html interactive-example
<label for="ice-cream-choice">Choose a flavor:</label>
<input list="ice-cream-flavors" id="ice-cream-choice" name="ice-cream-choice" />

<datalist id="ice-cream-flavors">
  <option value="Chocolate"></option>
  <option value="Coconut"></option>
  <option value="Mint"></option>
  <option value="Strawberry"></option>
  <option value="Vanilla"></option>
</datalist>
```

```css interactive-example
label {
  display: block;
  margin-bottom: 10px;
}
```

Để liên kết phần tử `<datalist>` với điều khiển, chúng tôi cung cấp cho nó một định danh duy nhất trong thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id), và sau đó thêm thuộc tính [`list`](/en-US/docs/Web/HTML/Reference/Elements/input#list) vào phần tử {{HTMLElement("input")}} với cùng định danh làm giá trị.
Chỉ một số loại {{HTMLElement("input")}} nhất định hỗ trợ hành vi này, và nó cũng có thể thay đổi tùy theo trình duyệt.

Mỗi phần tử `<option>` nên có thuộc tính `value`, đại diện cho một gợi ý để nhập vào input. Nó cũng có thể có thuộc tính `label`, hoặc thiếu điều đó, một số nội dung văn bản, có thể được trình duyệt hiển thị thay vì `value` (Firefox), hoặc ngoài `value` (Chrome và Safari, như văn bản bổ sung). Nội dung chính xác của menu thả xuống phụ thuộc vào trình duyệt, nhưng khi nhấp, nội dung được nhập vào trường điều khiển sẽ luôn đến từ thuộc tính `value`.

> [!NOTE]
> `<datalist>` không phải là thay thế cho {{HTMLElement("select")}}. `<datalist>` không đại diện cho một input trong chính nó; đó là danh sách các giá trị được gợi ý cho điều khiển liên kết. Điều khiển vẫn có thể chấp nhận bất kỳ giá trị nào vượt qua xác thực, ngay cả khi nó không có trong danh sách gợi ý này.

## Thuộc tính

Phần tử này không có thuộc tính nào khác ngoài các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes), chung cho tất cả các phần tử.

## Khả năng tiếp cận

Khi quyết định sử dụng phần tử `<datalist>`, đây là một số vấn đề khả năng tiếp cận cần lưu ý:

- Kích thước font của các tùy chọn danh sách dữ liệu không phóng to, luôn duy trì cùng kích thước. Nội dung của gợi ý tự động không tăng hoặc thu nhỏ khi phần còn lại của nội dung được phóng to hoặc thu nhỏ.
- Vì việc nhắm đến danh sách tùy chọn bằng CSS rất hạn chế hoặc không tồn tại, việc hiển thị không thể được tạo kiểu cho chế độ tương phản cao.
- Một số kết hợp screen reader/trình duyệt, bao gồm NVDA và Firefox, không thông báo nội dung của popup gợi ý tự động.

## Ví dụ

### Các loại văn bản

Các giá trị được khuyến nghị trong các loại {{HTMLElement("input/text", "text")}}, {{HTMLElement("input/search", "search")}}, {{HTMLElement("input/url", "url")}}, {{HTMLElement("input/tel", "tel")}}, {{HTMLElement("input/email", "email")}} và {{HTMLElement("input/number", "number")}}, được hiển thị trong menu thả xuống khi người dùng nhấp hoặc nhấp đôi vào điều khiển.
Thường thì phía bên phải của điều khiển cũng có mũi tên chỉ ra sự hiện diện của các giá trị được xác định trước.

```html
<label for="myBrowser">Choose a browser from this list:</label>
<input list="browsers" id="myBrowser" name="myBrowser" />
<datalist id="browsers">
  <option value="Chrome"></option>
  <option value="Firefox"></option>
  <option value="Opera"></option>
  <option value="Safari"></option>
  <option value="Microsoft Edge"></option>
</datalist>
```

{{EmbedLiveSample("Textual_types", 600, 40)}}

### Các loại Ngày và Thời gian

Các loại {{HTMLElement("input/month", "month")}}, {{HTMLElement("input/week", "week")}}, {{HTMLElement("input/date", "date")}}, {{HTMLElement("input/time", "time")}} và {{HTMLElement("input/datetime-local", "datetime-local")}} có thể hiển thị giao diện cho phép chọn ngày và thời gian thuận tiện.
Các giá trị được xác định trước có thể được hiển thị ở đó, cho phép người dùng nhanh chóng điền giá trị điều khiển.

> [!NOTE]
> Khi các loại này không được hỗ trợ, loại `text` cơ bản sẽ được hiển thị thay thế, tạo ra trường văn bản. Trường đó sẽ nhận dạng đúng các giá trị được khuyến nghị và hiển thị chúng cho người dùng trong menu thả xuống.

```html
<input type="time" list="popularHours" />
<datalist id="popularHours">
  <option value="12:00"></option>
  <option value="13:00"></option>
  <option value="14:00"></option>
</datalist>
```

{{EmbedLiveSample("Date_and_Time_types", 600, 40)}}

### Loại Range

Khi các thuộc tính `value` được bao gồm trên các phần tử `<option>` được cung cấp cho datalist liên kết với loại input {{HTMLElement("input/range", "range")}}, chúng sẽ được hiển thị như một loạt các dấu tick mà người dùng có thể dễ dàng chọn.

```html
<label for="tick">Tip amount:</label>
<input type="range" list="tickmarks" min="0" max="100" id="tick" name="tick" />
<datalist id="tickmarks">
  <option value="0" label="0%"></option>
  <option value="10" label="Minimum Tip"></option>
  <option value="20" label="Standard"></option>
  <option value="30" label="Generous"></option>
  <option value="50" label="Very Generous"></option>
</datalist>
```

{{EmbedLiveSample("Range_type", 600, 70)}}

> [!NOTE]
> Thuộc tính `label` có mục đích cung cấp nhãn cho các dấu tick, như được định nghĩa trong [HTML Standard](<https://html.spec.whatwg.org/multipage/input.html#range-state-(type=range)>). Tuy nhiên, hỗ trợ trình duyệt hiện tại khác nhau; nhãn có thể không hiển thị trực quan hoặc như chú giải công cụ.

### Loại Color

Loại {{HTMLElement("input/color", "color")}} có thể hiển thị các màu được xác định trước trong giao diện do trình duyệt cung cấp.

```html
<label for="colors">Pick a color (preferably a red tone):</label>
<input type="color" list="redColors" id="colors" />
<datalist id="redColors">
  <option value="#800000"></option>
  <option value="#8B0000"></option>
  <option value="#A52A2A"></option>
  <option value="#DC143C"></option>
</datalist>
```

{{EmbedLiveSample("Color_type", 600, 70)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung cho phép</th>
      <td>
        Hoặc là
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >
        hoặc không hoặc nhiều phần tử {{HTMLElement("option")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha cho phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role"
          >listbox</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA cho phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLDataListElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("input")}}, và cụ thể hơn là thuộc tính [`list`](/en-US/docs/Web/HTML/Reference/Elements/input#list) của nó;
- Phần tử {{HTMLElement("option")}}.
