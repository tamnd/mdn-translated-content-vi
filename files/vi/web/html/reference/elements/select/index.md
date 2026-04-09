---
title: "<select>: Phần tử HTML Select"
slug: Web/HTML/Reference/Elements/select
page-type: html-element
browser-compat: html.elements.select
sidebar: htmlsidebar
---

Phần tử **`<select>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho một điều khiển cung cấp menu các tùy chọn.

{{InteractiveExample("HTML Demo: &lt;select&gt;", "tabbed-standard")}}

```html interactive-example
<label for="pet-select">Choose a pet:</label>

<select name="pets" id="pet-select">
  <option value="">--Please choose an option--</option>
  <option value="dog">Dog</option>
  <option value="cat">Cat</option>
  <option value="hamster">Hamster</option>
  <option value="parrot">Parrot</option>
  <option value="spider">Spider</option>
  <option value="goldfish">Goldfish</option>
</select>
```

```css interactive-example
label {
  font-family: sans-serif;
  font-size: 1rem;
  padding-right: 10px;
}

select {
  font-size: 0.9rem;
  padding: 2px 5px;
}
```

Ví dụ trên cho thấy cách sử dụng `<select>` điển hình. Nó được cung cấp thuộc tính `id` để có thể liên kết với {{htmlelement("label")}} cho mục đích khả năng tiếp cận, cũng như thuộc tính `name` để đại diện cho tên của điểm dữ liệu liên quan được gửi đến server. Mỗi tùy chọn menu được định nghĩa bởi một phần tử {{htmlelement("option")}} lồng bên trong `<select>`.

Mỗi phần tử `<option>` nên có thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/option#value) chứa giá trị dữ liệu cần gửi đến server khi tùy chọn đó được chọn. Nếu không có thuộc tính `value` nào, giá trị mặc định là văn bản bên trong phần tử. Bạn có thể thêm thuộc tính [`selected`](/en-US/docs/Web/HTML/Reference/Elements/option#selected) trên phần tử `<option>` để làm cho nó được chọn theo mặc định khi trang tải lần đầu. Nếu không có thuộc tính `selected` nào được chỉ định, phần tử `<option>` đầu tiên sẽ được chọn theo mặc định.

Phần tử `<select>` được đại diện trong JavaScript bởi đối tượng {{domxref("HTMLSelectElement")}}, và đối tượng này có thuộc tính {{domxref("HTMLSelectElement.value", "value")}} chứa giá trị của `<option>` được chọn.

Phần tử `<select>` có một số thuộc tính độc đáo bạn có thể sử dụng để kiểm soát nó, chẳng hạn như `multiple` để chỉ định nhiều tùy chọn có thể được chọn, và `size` để chỉ định bao nhiêu tùy chọn nên được hiển thị cùng một lúc. Nó cũng chấp nhận hầu hết các thuộc tính nhập liệu form chung như `required`, `disabled`, `autofocus`, v.v.

Bạn có thể lồng thêm các phần tử {{HTMLElement("option")}} bên trong các phần tử {{HTMLElement("optgroup")}} để tạo các nhóm tùy chọn riêng biệt bên trong dropdown. Bạn cũng có thể bao gồm các phần tử {{HTMLElement("hr")}} để tạo các dấu phân cách thêm ngắt trực quan giữa các tùy chọn.

Để biết thêm ví dụ, xem [Các widget form gốc: Nội dung thả xuống](/en-US/docs/Learn_web_development/Extensions/Forms/Other_form_controls#drop-down_controls).

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete)
  - : Chuỗi cung cấp gợi ý cho tính năng tự động hoàn thành của {{Glossary("user agent", "user agent")}}. Xem [Thuộc tính tự động hoàn thành HTML](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete) để có danh sách đầy đủ các giá trị và chi tiết về cách sử dụng tự động hoàn thành.
- `autofocus`
  - : Thuộc tính Boolean này cho phép bạn chỉ định rằng điều khiển form nên có tiêu điểm nhập liệu khi trang tải. Chỉ một phần tử form trong tài liệu có thể có thuộc tính `autofocus`.
- [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled)
  - : Thuộc tính Boolean này cho biết người dùng không thể tương tác với điều khiển. Nếu thuộc tính này không được chỉ định, điều khiển kế thừa cài đặt của nó từ phần tử chứa, ví dụ {{htmlelement("fieldset")}}; nếu không có phần tử chứa nào có thuộc tính `disabled` được đặt, thì điều khiển được bật.
- [`form`](/en-US/docs/Web/HTML/Reference/Attributes/form)
  - : Phần tử {{HTMLElement("form")}} để liên kết `<select>` với (form sở hữu của nó). Giá trị của thuộc tính này phải là [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của `<form>` trong cùng tài liệu. (Nếu thuộc tính này không được đặt, `<select>` được liên kết với phần tử `<form>` tổ tiên của nó, nếu có.)

    Thuộc tính này cho phép bạn liên kết các phần tử `<select>` với `<form>` ở bất kỳ đâu trong tài liệu, không chỉ bên trong `<form>`. Nó cũng có thể ghi đè phần tử `<form>` tổ tiên.

- [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple)
  - : Thuộc tính Boolean này cho biết nhiều tùy chọn có thể được chọn trong danh sách. Nếu không được chỉ định, thì chỉ một tùy chọn có thể được chọn mỗi lần. Khi `multiple` được chỉ định, hầu hết trình duyệt sẽ hiển thị hộp danh sách cuộn thay vì dropdown một dòng. Nhiều tùy chọn được chọn được gửi bằng quy ước mảng {{domxref("URLSearchParams")}}, tức là `name=value1&name=value2`.
- `name`
  - : Thuộc tính này được dùng để chỉ định tên của điều khiển.
- [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required)
  - : Thuộc tính Boolean cho biết phải chọn một tùy chọn có giá trị chuỗi không rỗng.
- [`size`](/en-US/docs/Web/HTML/Reference/Attributes/size)
  - : Nếu điều khiển được trình bày như hộp danh sách cuộn (ví dụ khi `multiple` được chỉ định), thuộc tính này đại diện cho số hàng trong danh sách nên hiển thị cùng một lúc. Trình duyệt không bắt buộc phải trình bày phần tử select như hộp danh sách cuộn. Giá trị mặc định là `0`.

    > [!NOTE]
    > Theo đặc tả HTML, giá trị mặc định cho size nên là `1`; tuy nhiên, trong thực tế, điều này đã được phát hiện là làm hỏng một số website, và không có trình duyệt nào khác hiện tại làm điều đó, vì vậy Mozilla đã chọn tiếp tục trả về `0` cho Firefox cho đến thời điểm này.

## Ghi chú sử dụng

### Chọn nhiều tùy chọn

Trên máy tính để bàn, có một số cách để chọn nhiều tùy chọn trong phần tử `<select>` với thuộc tính `multiple`:

Người dùng chuột có thể giữ phím <kbd>Ctrl</kbd>, <kbd>Command</kbd>, hoặc <kbd>Shift</kbd> (tùy theo hệ điều hành) và sau đó nhấp nhiều tùy chọn để chọn/bỏ chọn chúng.

> [!WARNING]
> Cơ chế để chọn nhiều mục không liên tiếp qua bàn phím được mô tả bên dưới hiện chỉ hoạt động trong Firefox.
>
> Trên macOS, các phím tắt <kbd>Ctrl</kbd> + <kbd>Up</kbd> và <kbd>Ctrl</kbd> + <kbd>Down</kbd> xung đột với các phím tắt mặc định của OS cho _Mission Control_ và _Application windows_, vì vậy bạn phải tắt những phím tắt này trước khi nó hoạt động.

Người dùng bàn phím có thể chọn nhiều mục liên tiếp bằng cách:

- Lấy tiêu điểm trên phần tử `<select>` (ví dụ sử dụng <kbd>Tab</kbd>).
- Chọn một mục ở đầu hoặc cuối phạm vi họ muốn chọn bằng phím mũi tên <kbd>Up</kbd> và <kbd>Down</kbd> để đi lên và xuống các tùy chọn.
- Giữ phím <kbd>Shift</kbd> và sau đó sử dụng phím mũi tên <kbd>Up</kbd> và <kbd>Down</kbd> để tăng hoặc giảm phạm vi các mục được chọn.

Người dùng bàn phím có thể chọn nhiều mục không liên tiếp bằng cách:

- Lấy tiêu điểm trên phần tử `<select>` (ví dụ sử dụng <kbd>Tab</kbd>).
- Giữ phím <kbd>Ctrl</kbd> sau đó sử dụng phím mũi tên <kbd>Up</kbd> và <kbd>Down</kbd> để thay đổi tùy chọn "được tập trung", tức là tùy chọn sẽ được chọn nếu bạn chọn làm vậy. Tùy chọn select "được tập trung" được làm nổi bật bằng đường viền chấm, theo cách tương tự như liên kết được tập trung bằng bàn phím.
- Nhấn <kbd>Space</kbd> để chọn/bỏ chọn các tùy chọn select "được tập trung".

## Tạo kiểu với CSS

Phần tử `<select>` lịch sử đã khó tạo kiểu hiệu quả với CSS.
Các hướng dẫn sau đây chứa thông tin về các tính năng cho phép tùy chỉnh đầy đủ phần tử select:

- [Phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select)
- [Hộp danh sách select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select_listboxes)

### Tạo kiểu select cũ

Trong các trình duyệt không hỗ trợ các tính năng tùy chỉnh hiện đại (hoặc cơ sở mã cũ không thể sử dụng), bạn bị giới hạn trong việc thao tác [mô hình hộp](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model), [font được hiển thị](/en-US/docs/Web/CSS/Guides/Fonts), v.v. Bạn cũng có thể sử dụng thuộc tính {{cssxref("appearance")}} để loại bỏ `appearance` mặc định của hệ thống.

Tuy nhiên, thật khó để đạt được kết quả nhất quán trên các trình duyệt với các phần tử `<select>` truyền thống. Nếu bạn muốn có toàn quyền kiểm soát, bạn nên cân nhắc sử dụng thư viện có cơ sở tốt để tạo kiểu widget form, hoặc thử tạo menu dropdown của riêng bạn bằng cách sử dụng các phần tử không ngữ nghĩa, JavaScript, và [WAI-ARIA](/en-US/docs/Learn_web_development/Core/Accessibility/WAI-ARIA_basics) để cung cấp ngữ nghĩa.

Bạn có thể sử dụng lớp pseudo {{cssxref(":open")}} để tạo kiểu cho các phần tử `<select>` ở trạng thái mở, tức là khi danh sách tùy chọn thả xuống được hiển thị. Điều này không áp dụng cho các phần tử `<select>` nhiều dòng (những phần tử có thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple) được đặt) — chúng thường hiển thị như hộp danh sách cuộn thay vì thả xuống, vì vậy không có trạng thái mở.

Để biết thêm thông tin về tạo kiểu `<select>` cũ, xem:

- [Tạo kiểu HTML forms](/en-US/docs/Learn_web_development/Extensions/Forms/Styling_web_forms)
- [Tạo kiểu nâng cao cho HTML forms](/en-US/docs/Learn_web_development/Extensions/Forms/Advanced_form_styling)
- Thuộc tính {{cssxref("field-sizing")}}, kiểm soát cách các phần tử `<select>` được định cỡ liên quan đến các tùy chọn chứa của chúng.

## Khả năng tiếp cận

`<hr>` bên trong `<select>` nên được coi là thuần trang trí, vì chúng hiện không được hiển thị trong cây tiếp cận và do đó không được hiển thị cho công nghệ hỗ trợ.

## Ví dụ

### Select cơ bản

Ví dụ sau tạo menu thả xuống ba giá trị, tùy chọn thứ hai được chọn theo mặc định.

```html
<!-- Giá trị thứ hai sẽ được chọn ban đầu -->
<select name="choice">
  <option value="first">First Value</option>
  <option value="second" selected>Second Value</option>
  <option value="third">Third Value</option>
</select>
```

#### Kết quả

{{EmbedLiveSample("Basic_select", "", "100")}}

### Select với các tùy chọn được nhóm

Ví dụ sau tạo menu thả xuống với nhóm bằng {{HTMLElement("optgroup")}} và {{HTMLElement("hr")}} để giúp người dùng dễ hiểu nội dung trong dropdown hơn.

```html
<label for="hr-select">Your favorite food</label> <br />

<select name="foods" id="hr-select">
  <option value="">Choose a food</option>
  <hr />
  <optgroup label="Fruit">
    <option value="apple">Apples</option>
    <option value="banana">Bananas</option>
    <option value="cherry">Cherries</option>
    <option value="damson">Damsons</option>
  </optgroup>
  <hr />
  <optgroup label="Vegetables">
    <option value="artichoke">Artichokes</option>
    <option value="broccoli">Broccoli</option>
    <option value="cabbage">Cabbages</option>
  </optgroup>
  <hr />
  <optgroup label="Meat">
    <option value="beef">Beef</option>
    <option value="chicken">Chicken</option>
    <option value="pork">Pork</option>
  </optgroup>
  <hr />
  <optgroup label="Fish">
    <option value="cod">Cod</option>
    <option value="haddock">Haddock</option>
    <option value="salmon">Salmon</option>
    <option value="turbot">Turbot</option>
  </optgroup>
</select>
```

#### Kết quả

{{EmbedLiveSample("select_with_grouping_options", "", "100")}}

### Select nâng cao với nhiều tính năng

Ví dụ sau phức tạp hơn, hiển thị nhiều tính năng hơn bạn có thể sử dụng trên phần tử `<select>`:

```html
<label>
  Please choose one or more pets:
  <select name="pets" multiple size="4">
    <optgroup label="4-legged pets">
      <option value="dog">Dog</option>
      <option value="cat">Cat</option>
      <option value="hamster" disabled>Hamster</option>
    </optgroup>
    <optgroup label="Flying pets">
      <option value="parrot">Parrot</option>
      <option value="macaw">Macaw</option>
      <option value="albatross">Albatross</option>
    </optgroup>
  </select>
</label>
```

#### Kết quả

{{EmbedLiveSample("Advanced_select_with_multiple_features", "", "100")}}

Bạn sẽ thấy rằng:

- Nhiều tùy chọn có thể được chọn vì chúng tôi đã bao gồm thuộc tính `multiple`.
- Thuộc tính `size` khiến chỉ 4 dòng hiển thị cùng một lúc; bạn có thể cuộn để xem tất cả các tùy chọn.
- Chúng tôi đã bao gồm các phần tử {{htmlelement("optgroup")}} để chia các tùy chọn thành các nhóm khác nhau. Đây là nhóm thuần trực quan, hình ảnh của nó thường bao gồm tên nhóm được in đậm và các tùy chọn được thụt lề.
- Tùy chọn "Hamster" bao gồm thuộc tính `disabled` và do đó không thể được chọn chút nào.

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
        >,
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#interactive_content"
          >nội dung tương tác</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#listed"
          >được liệt kê</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#labelable"
          >có thể gắn nhãn</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#resettable"
          >có thể đặt lại</a
        >, và
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#submittable"
          >có thể gửi</a
        >
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#form-associated_content"
          >phần tử liên kết form</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung cho phép</th>
      <td>
        Không hoặc nhiều phần tử {{HTMLElement("option")}},
        {{HTMLElement("optgroup")}}, hoặc {{HTMLElement("hr")}} trong các phần tử <code>&lt;select&gt;</code> truyền thống. Trong <a href="/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select">phần tử select có thể tùy chỉnh</a>:
        <ul>
        <li>{{htmlelement("button")}} select được tùy chọn bao gồm như một phần tử <code>&lt;button&gt;</code> con với phần tử {{htmlelement("selectedcontent")}} lồng bên trong.</li>
        <li>Bộ chọn thả xuống được định nghĩa là bất kỳ nội dung nào khác, có thể bao gồm không hoặc nhiều phần tử <code>&lt;option&gt;</code>, <code>&lt;optgroup&gt;</code>, <code>&lt;hr&gt;</code>, {{htmlelement("div")}}, {{htmlelement("script")}}, {{htmlelement("template")}}, và {{htmlelement("noscript")}}.
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
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role"><code>combobox</code></a> khi <strong>không</strong> có
        thuộc tính <code>multiple</code> và <strong>không</strong>
        có thuộc tính <code>size</code> lớn hơn 1, ngược lại là
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role"><code>listbox</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA cho phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role"><code>menu</code></a> khi <strong>không</strong> có
        thuộc tính <code>multiple</code> và <strong>không</strong>
        có thuộc tính <code>size</code> lớn hơn 1, ngược lại không có
        <code>role</code> nào được phép
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLSelectElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện được kích hoạt bởi `<select>`: {{domxref("HTMLElement/change_event", "change")}}, {{domxref("Element/input_event", "input")}}
- Phần tử {{HTMLElement("option")}}
- Phần tử {{HTMLElement("optgroup")}}
- [Phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select)
