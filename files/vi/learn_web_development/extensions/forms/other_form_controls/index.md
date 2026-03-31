---
title: Other form controls
slug: Learn_web_development/Extensions/Forms/Other_form_controls
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/HTML5_input_types","Learn_web_development/Extensions/Forms/Styling_web_forms", "Learn_web_development/Extensions/Forms")}}

Bây giờ chúng ta xem xét chi tiết chức năng của các phần tử biểu mẫu không phải `<input>`, từ các loại điều khiển khác như danh sách thả xuống và trường văn bản nhiều dòng, đến các tính năng biểu mẫu hữu ích khác như phần tử {{htmlelement('output')}} (mà chúng ta đã thấy hoạt động trong bài viết trước), và thanh tiến trình.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết cơ bản về
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >HTML</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu các tính năng biểu mẫu không phải <code>&#x3C;input></code> và cách triển khai chúng bằng HTML.
      </td>
    </tr>
  </tbody>
</table>

## Trường văn bản nhiều dòng

Trường văn bản nhiều dòng được chỉ định bằng phần tử {{HTMLElement("textarea")}}, thay vì sử dụng phần tử {{HTMLElement("input")}}.

```html
<textarea cols="30" rows="8"></textarea>
```

Nó hiển thị như sau:

{{EmbedLiveSample("Multi-line_text_fields", 120, 160)}}

Sự khác biệt chính giữa `<textarea>` và trường văn bản một dòng thông thường là người dùng được phép bao gồm xuống dòng cứng (tức là nhấn Enter) sẽ được đưa vào khi dữ liệu được gửi.

`<textarea>` cũng nhận một thẻ đóng; bất kỳ văn bản mặc định nào bạn muốn nó chứa nên được đặt giữa thẻ mở và thẻ đóng. Ngược lại, {{HTMLElement("input")}} là {{glossary("void element")}} không có thẻ đóng — bất kỳ giá trị mặc định nào được đặt bên trong thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value).

Lưu ý rằng mặc dù bạn có thể đặt bất cứ thứ gì bên trong phần tử `<textarea>` (bao gồm các phần tử HTML khác, CSS và JavaScript), vì bản chất của nó, tất cả đều được hiển thị như thể nó là nội dung văn bản thuần. (Sử dụng [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) trên các điều khiển không phải biểu mẫu cung cấp API để thu thập nội dung HTML/"phong phú" thay vì văn bản thuần).

Về mặt trực quan, văn bản được nhập sẽ xuống dòng và điều khiển biểu mẫu có thể thay đổi kích thước theo mặc định. Hầu hết các trình duyệt cung cấp tay cầm kéo mà bạn có thể kéo để tăng/giảm kích thước vùng văn bản.

Bạn có thể tìm thấy ví dụ sử dụng vùng văn bản trong [ví dụ](https://mdn.github.io/learning-area/html/forms/your-first-HTML-form/first-form-styled.html) mà chúng ta đã xây dựng trong bài viết đầu tiên này.

### Kiểm soát hiển thị nhiều dòng

{{htmlelement("textarea")}} chấp nhận ba thuộc tính để kiểm soát hiển thị của nó trên nhiều dòng:

- [`cols`](/en-US/docs/Web/HTML/Reference/Elements/textarea#cols)
  - : Chỉ định chiều rộng hiển thị (cột) của điều khiển văn bản, được đo bằng độ rộng ký tự trung bình. Đây thực sự là chiều rộng bắt đầu, vì nó có thể thay đổi bằng cách thay đổi kích thước `<textarea>` và bị ghi đè bằng CSS. Giá trị mặc định nếu không được chỉ định là 20.
- [`rows`](/en-US/docs/Web/HTML/Reference/Elements/textarea#rows)
  - : Chỉ định số dòng văn bản hiển thị cho điều khiển. Đây thực sự là chiều cao bắt đầu, vì nó có thể thay đổi bằng cách thay đổi kích thước `<textarea>` và bị ghi đè bằng CSS. Giá trị mặc định nếu không được chỉ định là 2.
- [`wrap`](/en-US/docs/Web/HTML/Reference/Elements/textarea#wrap)
  - : Chỉ định cách điều khiển bao văn bản. Các giá trị là `soft` (giá trị mặc định), có nghĩa là văn bản được gửi không bị bao nhưng văn bản được hiển thị bởi trình duyệt bị bao; `hard` (thuộc tính `cols` phải được chỉ định khi sử dụng giá trị này), có nghĩa là cả văn bản được gửi và được hiển thị đều bị bao, và `off`, ngừng bao.

### Kiểm soát khả năng thay đổi kích thước textarea

Khả năng thay đổi kích thước `<textarea>` được kiểm soát bằng thuộc tính CSS `resize`. Các giá trị có thể là:

- `both`: Mặc định — cho phép thay đổi kích thước theo chiều ngang và dọc.
- `horizontal`: Chỉ cho phép thay đổi kích thước theo chiều ngang.
- `vertical`: Chỉ cho phép thay đổi kích thước theo chiều dọc.
- `none`: Không cho phép thay đổi kích thước.
- `block` và `inline`: Các giá trị thử nghiệm cho phép thay đổi kích thước theo hướng `block` hoặc `inline` (điều này thay đổi tùy theo hướng văn bản của bạn; đọc [Xử lý các hướng văn bản khác nhau](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions) nếu bạn muốn tìm hiểu thêm.)

Hãy thử với ví dụ tương tác ở đầu trang tham chiếu {{cssxref("resize")}} để xem minh họa về cách các thuộc tính này hoạt động.

## Điều khiển thả xuống

Điều khiển thả xuống là cách đơn giản để cho phép người dùng chọn từ nhiều tùy chọn mà không chiếm nhiều không gian trong giao diện người dùng. HTML có hai loại điều khiển thả xuống: **hộp select** và **hộp tự động hoàn thành**. Tương tác giống nhau trong cả hai loại điều khiển thả xuống — sau khi điều khiển được kích hoạt, trình duyệt hiển thị danh sách các giá trị người dùng có thể chọn.

> [!NOTE]
> Bạn có thể tìm ví dụ về tất cả các loại hộp thả xuống trên GitHub tại [drop-down-content.html](https://github.com/mdn/learning-area/blob/main/html/forms/native-form-widgets/drop-down-content.html) ([xem trực tiếp cũng được](https://mdn.github.io/learning-area/html/forms/native-form-widgets/drop-down-content.html)).

### Hộp select

Một hộp select đơn giản được tạo bằng phần tử {{HTMLElement("select")}} với một hoặc nhiều phần tử {{HTMLElement("option")}} là con của nó, mỗi cái chỉ định một trong các giá trị có thể có.

#### Ví dụ cơ bản

```html
<select id="simple" name="simple">
  <option>Banana</option>
  <option selected>Cherry</option>
  <option>Lemon</option>
</select>
```

{{EmbedLiveSample("Basic_example", 120, 120)}}

Nếu cần, giá trị mặc định cho hộp select có thể được đặt bằng cách sử dụng thuộc tính [`selected`](/en-US/docs/Web/HTML/Reference/Elements/option#selected) trên phần tử {{HTMLElement("option")}} mong muốn — tùy chọn này sau đó được chọn trước khi trang tải.

#### Sử dụng optgroup

Các phần tử {{HTMLElement("option")}} có thể được lồng bên trong các phần tử {{HTMLElement("optgroup")}} để tạo ra các nhóm giá trị liên quan về mặt trực quan:

```html
<select id="groups" name="groups">
  <optgroup label="fruits">
    <option>Banana</option>
    <option selected>Cherry</option>
    <option>Lemon</option>
  </optgroup>
  <optgroup label="vegetables">
    <option>Carrot</option>
    <option>Eggplant</option>
    <option>Potato</option>
  </optgroup>
</select>
```

{{EmbedLiveSample("Using_optgroup", 120, 120)}}

Trên phần tử {{HTMLElement("optgroup")}}, giá trị của thuộc tính [`label`](/en-US/docs/Web/HTML/Reference/Elements/optgroup#label) được hiển thị trước các giá trị của các tùy chọn lồng nhau. Trình duyệt thường phân biệt chúng về mặt trực quan so với các tùy chọn (tức là bằng cách in đậm và ở mức lồng khác) để chúng ít có khả năng bị nhầm lẫn với các tùy chọn thực tế.

#### Sử dụng thuộc tính value

Nếu phần tử {{HTMLElement("option")}} có thuộc tính `value` rõ ràng được đặt trên nó, giá trị đó được gửi khi biểu mẫu được gửi với tùy chọn đó được chọn. Nếu thuộc tính `value` bị bỏ qua, như với các ví dụ trên, nội dung của phần tử {{HTMLElement("option")}} được sử dụng làm giá trị. Vì vậy, thuộc tính `value` không cần thiết, nhưng bạn có thể tìm thấy lý do muốn gửi giá trị rút gọn hoặc khác đến máy chủ so với những gì được hiển thị trực quan trong hộp select.

Ví dụ:

```html
<select id="simple" name="simple">
  <option value="banana">Big, beautiful yellow banana</option>
  <option value="cherry">Succulent, juicy cherry</option>
  <option value="lemon">Sharp, powerful lemon</option>
</select>
```

Theo mặc định, chiều cao của hộp select đủ để hiển thị một giá trị duy nhất. Thuộc tính [`size`](/en-US/docs/Web/HTML/Reference/Attributes/size) tùy chọn cung cấp khả năng kiểm soát bao nhiêu tùy chọn hiển thị khi select không có focus.

### Hộp select chọn nhiều

Theo mặc định, hộp select cho phép người dùng chỉ chọn một giá trị. Bằng cách thêm thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/select#multiple) vào phần tử {{HTMLElement("select")}}, bạn có thể cho phép người dùng chọn nhiều giá trị. Người dùng có thể chọn nhiều giá trị bằng cách sử dụng cơ chế mặc định do hệ điều hành cung cấp (ví dụ, trên máy tính để bàn, nhiều giá trị có thể được nhấp trong khi giữ phím <kbd>Cmd</kbd>/<kbd>Ctrl</kbd>).

```html
<select id="multi" name="multi" multiple size="2">
  <optgroup label="fruits">
    <option>Banana</option>
    <option selected>Cherry</option>
    <option>Lemon</option>
  </optgroup>
  <optgroup label="vegetables">
    <option>Carrot</option>
    <option>Eggplant</option>
    <option>Potato</option>
  </optgroup>
</select>
```

{{EmbedLiveSample("Multiple_choice_select_box", 120, 120)}}

> [!NOTE]
> Trong trường hợp hộp select chọn nhiều, bạn sẽ nhận thấy rằng hộp select không còn hiển thị các giá trị dưới dạng nội dung thả xuống — thay vào đó, tất cả các giá trị được hiển thị cùng một lúc trong danh sách, với thuộc tính [`size`](/en-US/docs/Web/HTML/Reference/Attributes/size) tùy chọn xác định chiều cao của widget.

> [!NOTE]
> Tất cả các trình duyệt hỗ trợ phần tử {{HTMLElement("select")}} cũng hỗ trợ thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/select#multiple).

### Hộp tự động hoàn thành

Bạn có thể cung cấp các giá trị được đề xuất, tự động hoàn thành cho các widget biểu mẫu bằng cách sử dụng phần tử {{HTMLElement("datalist")}} với các phần tử {{HTMLElement("option")}} con để chỉ định các giá trị cần hiển thị. `<datalist>` cần được cung cấp `id`.

Sau đó danh sách dữ liệu được liên kết với phần tử {{htmlelement("input")}} (ví dụ, loại trường nhập liệu `text` hoặc `email`) bằng cách sử dụng thuộc tính [`list`](/en-US/docs/Web/HTML/Reference/Elements/input#list), giá trị của nó là `id` của danh sách dữ liệu cần liên kết.

Khi danh sách dữ liệu được liên kết với widget biểu mẫu, các tùy chọn của nó được sử dụng để tự động hoàn thành văn bản được nhập bởi người dùng; thường điều này được trình bày cho người dùng dưới dạng hộp thả xuống liệt kê các kết quả phù hợp có thể với những gì họ đã nhập vào trường nhập liệu.

#### Ví dụ cơ bản

Hãy xem một ví dụ.

```html
<label for="myFruit">What's your favorite fruit?</label>
<input type="text" name="myFruit" id="myFruit" list="mySuggestion" />
<datalist id="mySuggestion">
  <option>Apple</option>
  <option>Banana</option>
  <option>Blackberry</option>
  <option>Blueberry</option>
  <option>Lemon</option>
  <option>Lychee</option>
  <option>Peach</option>
  <option>Pear</option>
</datalist>
```

{{EmbedLiveSample("Basic_example_2", 120, 120)}}

#### Các cách sử dụng datalist ít rõ ràng hơn

Theo [đặc tả HTML](https://html.spec.whatwg.org/multipage/input.html#attr-input-list), thuộc tính [`list`](/en-US/docs/Web/HTML/Reference/Elements/input#list) và phần tử {{HTMLElement("datalist")}} có thể được sử dụng với bất kỳ loại widget nào yêu cầu đầu vào của người dùng. Điều này dẫn đến một số cách sử dụng có vẻ hơi không rõ ràng.

Ví dụ, trong các trình duyệt hỗ trợ `{{htmlelement("datalist")}}` trên các loại trường nhập liệu `range`, một dấu tích nhỏ sẽ được hiển thị phía trên thanh phạm vi cho mỗi giá trị `{{htmlelement("option")}}` của datalist. Bạn có thể xem ví dụ triển khai [trên trang tham chiếu `<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range#adding_tick_marks).

Và các trình duyệt hỗ trợ {{htmlelement('datalist')}} và [`<input type="color">`](/en-US/docs/Web/HTML/Reference/Elements/input/color) nên hiển thị bảng màu tùy chỉnh làm mặc định, đồng thời vẫn cung cấp bảng màu đầy đủ.

Trong trường hợp này, các trình duyệt khác nhau hoạt động khác nhau tùy từng trường hợp, vì vậy hãy coi những cách sử dụng như vậy là cải tiến dần dần và đảm bảo chúng giảm cấp một cách duyên dáng.

## Các tính năng biểu mẫu khác

Có một vài tính năng biểu mẫu khác không rõ ràng như những cái chúng ta đã đề cập, nhưng vẫn hữu ích trong một số tình huống, vì vậy chúng tôi nghĩ sẽ đáng để đề cập ngắn gọn về chúng.

> [!NOTE]
> Bạn có thể tìm các ví dụ từ phần này trên GitHub là [other-examples.html](https://github.com/mdn/learning-area/blob/main/html/forms/native-form-widgets/other-examples.html) ([xem trực tiếp cũng được](https://mdn.github.io/learning-area/html/forms/native-form-widgets/other-examples.html)).

### Đồng hồ đo và thanh tiến trình

Đồng hồ đo và thanh tiến trình là biểu diễn trực quan của các giá trị số. Hỗ trợ cho {{HTMLElement("progress")}} và {{HTMLElement("meter")}} có sẵn trong tất cả các trình duyệt hiện đại.

#### Đồng hồ đo

Thanh đồng hồ đo đại diện cho một giá trị cố định trong một phạm vi được phân cách bởi các giá trị [`max`](/en-US/docs/Web/HTML/Reference/Elements/meter#max) và [`min`](/en-US/docs/Web/HTML/Reference/Elements/meter#min). Giá trị này được hiển thị trực quan dưới dạng thanh, và để biết thanh này trông như thế nào, chúng ta so sánh giá trị với một số giá trị thiết lập khác:

- Các giá trị [`low`](/en-US/docs/Web/HTML/Reference/Elements/meter#low) và [`high`](/en-US/docs/Web/HTML/Reference/Elements/meter#high) chia phạm vi thành ba phần sau:
  - Phần dưới của phạm vi nằm giữa các giá trị [`min`](/en-US/docs/Web/HTML/Reference/Elements/meter#min) và [`low`](/en-US/docs/Web/HTML/Reference/Elements/meter#low), bao gồm.
  - Phần trung bình của phạm vi nằm giữa các giá trị [`low`](/en-US/docs/Web/HTML/Reference/Elements/meter#low) và [`high`](/en-US/docs/Web/HTML/Reference/Elements/meter#high), không bao gồm.
  - Phần trên của phạm vi nằm giữa các giá trị [`high`](/en-US/docs/Web/HTML/Reference/Elements/meter#high) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/meter#max), bao gồm.

- Giá trị [`optimum`](/en-US/docs/Web/HTML/Reference/Elements/meter#optimum) xác định giá trị tối ưu cho phần tử {{HTMLElement("meter")}}. Kết hợp với giá trị [`low`](/en-US/docs/Web/HTML/Reference/Elements/meter#low) và [`high`](/en-US/docs/Web/HTML/Reference/Elements/meter#high), nó xác định phần nào của phạm vi được ưa thích:
  - Nếu giá trị [`optimum`](/en-US/docs/Web/HTML/Reference/Elements/meter#optimum) nằm ở phần dưới của phạm vi, phạm vi dưới được coi là phần ưa thích, phạm vi trung bình được coi là phần trung bình, và phạm vi trên được coi là phần tệ nhất.
  - Nếu giá trị [`optimum`](/en-US/docs/Web/HTML/Reference/Elements/meter#optimum) nằm ở phần trung bình của phạm vi, phạm vi dưới được coi là phần trung bình, phạm vi trung bình được coi là phần ưa thích, và phạm vi trên cũng được coi là trung bình.
  - Nếu giá trị [`optimum`](/en-US/docs/Web/HTML/Reference/Elements/meter#optimum) nằm ở phần trên của phạm vi, phạm vi dưới được coi là phần tệ nhất, phạm vi trung bình được coi là phần trung bình và phạm vi trên được coi là phần ưa thích.

Tất cả các trình duyệt triển khai phần tử {{HTMLElement("meter")}} sử dụng các giá trị đó để thay đổi màu của thanh đồng hồ đo:

- Nếu giá trị hiện tại nằm ở phần ưa thích của phạm vi, thanh có màu xanh lá.
- Nếu giá trị hiện tại nằm ở phần trung bình của phạm vi, thanh có màu vàng.
- Nếu giá trị hiện tại nằm ở phần tệ nhất của phạm vi, thanh có màu đỏ.

Thanh như vậy được tạo bằng cách sử dụng phần tử {{HTMLElement("meter")}}. Điều này dùng để triển khai bất kỳ loại đồng hồ đo nào; ví dụ, thanh hiển thị tổng dung lượng đã sử dụng trên đĩa, chuyển sang màu đỏ khi bắt đầu đầy.

```html
<meter min="0" max="100" value="75" low="33" high="66" optimum="0">75</meter>
```

{{EmbedLiveSample("Meter", 120, 120)}}

Nội dung bên trong phần tử {{HTMLElement("meter")}} là dự phòng cho các trình duyệt không hỗ trợ phần tử và cho công nghệ hỗ trợ để đọc ra.

#### Tiến trình

Thanh tiến trình đại diện cho một giá trị thay đổi theo thời gian đến giá trị tối đa được chỉ định bởi thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Elements/progress#max). Một thanh như vậy được tạo bằng phần tử {{ HTMLElement("progress")}}.

```html
<progress max="100" value="75">75/100</progress>
```

{{EmbedLiveSample("Progress", 120, 120)}}

Điều này dùng để triển khai bất kỳ thứ gì cần báo cáo tiến trình, chẳng hạn như phần trăm tổng số tệp đã tải xuống, hoặc số lượng câu hỏi đã được điền trong bảng câu hỏi.

Nội dung bên trong phần tử {{HTMLElement("progress")}} là dự phòng cho các trình duyệt không hỗ trợ phần tử và cho trình đọc màn hình để đọc ra.

## Tóm tắt

Như bạn sẽ thấy trong vài bài viết cuối, có nhiều loại điều khiển biểu mẫu. Bạn không cần phải nhớ tất cả các chi tiết này ngay, và có thể quay lại các bài viết này bất cứ khi nào bạn muốn kiểm tra chi tiết.

Bây giờ bạn đã nắm được HTML đằng sau các điều khiển biểu mẫu có sẵn khác nhau, chúng ta sẽ xem xét [Tạo kiểu cho chúng](/en-US/docs/Learn_web_development/Extensions/Forms/Styling_web_forms).

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/HTML5_input_types","Learn_web_development/Extensions/Forms/Styling_web_forms", "Learn_web_development/Extensions/Forms")}}
