---
title: Basic native form controls
slug: Learn_web_development/Extensions/Forms/Basic_native_form_controls
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/How_to_structure_a_web_form", "Learn_web_development/Extensions/Forms/HTML5_input_types", "Learn_web_development/Extensions/Forms")}}

Trong [bài viết trước](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_structure_a_web_form), chúng ta đã đánh dấu một ví dụ biểu mẫu web chức năng, giới thiệu một số điều khiển biểu mẫu và các phần tử cấu trúc phổ biến, và tập trung vào các thực hành tốt nhất về khả năng tiếp cận. Tiếp theo, chúng ta sẽ xem xét chức năng của các điều khiển biểu mẫu, hay widget, khác nhau một cách chi tiết — nghiên cứu tất cả các tùy chọn có sẵn để thu thập các loại dữ liệu khác nhau. Trong bài viết cụ thể này, chúng ta sẽ xem xét bộ điều khiển biểu mẫu gốc ban đầu, có sẵn trong tất cả các trình duyệt từ thời kỳ đầu của web.

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
        Hiểu chi tiết bộ điều khiển biểu mẫu gốc ban đầu có sẵn trong trình duyệt để thu thập dữ liệu, và cách triển khai chúng bằng HTML.
      </td>
    </tr>
  </tbody>
</table>

Bạn đã gặp một số phần tử biểu mẫu, bao gồm {{HTMLelement('form')}}, {{HTMLelement('fieldset')}}, {{HTMLelement('legend')}}, {{HTMLelement('textarea')}}, {{HTMLelement('label')}}, {{HTMLelement('button')}}, và {{HTMLelement('input')}}. Bài viết này đề cập đến:

- Các loại trường nhập liệu phổ biến {{HTMLelement('input/button', 'button')}}, {{HTMLelement('input/checkbox', 'checkbox')}}, {{HTMLelement('input/file', 'file')}}, {{HTMLelement('input/hidden', 'hidden')}}, {{HTMLelement('input/image', 'image')}}, {{HTMLelement('input/password', 'password')}}, {{HTMLelement('input/radio', 'radio')}}, {{HTMLelement('input/reset', 'reset')}}, {{HTMLelement('input/submit', 'submit')}}, và {{HTMLelement('input/text', 'text')}}.
- Một số thuộc tính phổ biến cho tất cả các điều khiển biểu mẫu.

> [!NOTE]
> Chúng ta đề cập đến các điều khiển biểu mẫu bổ sung và mạnh mẽ hơn trong hai bài viết tiếp theo. Nếu bạn muốn có tài liệu tham khảo nâng cao hơn, bạn nên tham khảo [tài liệu tham khảo phần tử biểu mẫu HTML](/en-US/docs/Web/HTML/Reference/Elements#forms), và đặc biệt là tài liệu tham khảo [`<input>` types](/en-US/docs/Web/HTML/Reference/Elements/input) mở rộng của chúng ta.

## Trường văn bản đầu vào

Các trường {{htmlelement("input")}} văn bản là những widget biểu mẫu cơ bản nhất. Chúng là một cách rất thuận tiện để cho phép người dùng nhập bất kỳ loại dữ liệu nào, và chúng ta đã thấy một vài ví dụ đơn giản.

> [!NOTE]
> Các trường văn bản biểu mẫu HTML là các điều khiển nhập văn bản thuần đơn giản. Điều này có nghĩa là bạn không thể sử dụng chúng để thực hiện chỉnh sửa văn bản phong phú (in đậm, in nghiêng, v.v.). Tất cả các trình soạn thảo văn bản phong phú bạn gặp là các widget tùy chỉnh được tạo bằng HTML, CSS và JavaScript.

Tất cả các điều khiển văn bản cơ bản đều có một số hành vi chung:

- Chúng có thể được đánh dấu là [`readonly`](/en-US/docs/Web/HTML/Reference/Elements/input#readonly) (người dùng không thể sửa đổi giá trị đầu vào nhưng nó vẫn được gửi với phần còn lại của dữ liệu biểu mẫu) hoặc [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/input#disabled) (giá trị đầu vào không thể được sửa đổi và không bao giờ được gửi với phần còn lại của dữ liệu biểu mẫu).
- Chúng có thể có [`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder); đây là văn bản xuất hiện bên trong hộp nhập văn bản nên được dùng để mô tả ngắn gọn mục đích của hộp.
- Chúng có thể bị ràng buộc về [`size`](/en-US/docs/Web/HTML/Reference/Attributes/size) (kích thước vật lý của hộp) và [`maxlength`](/en-US/docs/Web/HTML/Reference/Attributes/maxlength) (số ký tự tối đa có thể nhập vào hộp).
- Chúng có thể được hưởng lợi từ kiểm tra chính tả (sử dụng thuộc tính [`spellcheck`](/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck)).

> [!NOTE]
> Phần tử {{htmlelement("input")}} là duy nhất trong các phần tử HTML vì nó có thể có nhiều dạng khác nhau tùy thuộc vào giá trị thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) của nó. Nó được sử dụng để tạo hầu hết các loại widget biểu mẫu bao gồm trường văn bản một dòng, điều khiển ngày và giờ, điều khiển không có văn bản đầu vào như hộp kiểm, nút chọn và bộ chọn màu, và các nút.

### Trường văn bản một dòng

Trường văn bản một dòng được tạo bằng phần tử {{HTMLElement("input")}} có giá trị thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) được đặt thành `text`, hoặc bằng cách bỏ qua thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) hoàn toàn (`text` là giá trị mặc định). Giá trị `text` cho thuộc tính này cũng là giá trị dự phòng nếu giá trị bạn chỉ định cho thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) không được trình duyệt nhận biết (ví dụ nếu bạn chỉ định `type="color"` và trình duyệt không hỗ trợ bộ chọn màu gốc).

> [!NOTE]
> Bạn có thể tìm ví dụ về tất cả các loại trường văn bản một dòng trên GitHub tại [single-line-text-fields.html](https://github.com/mdn/learning-area/blob/main/html/forms/native-form-widgets/single-line-text-fields.html) ([xem trực tiếp cũng được](https://mdn.github.io/learning-area/html/forms/native-form-widgets/single-line-text-fields.html)).

Đây là ví dụ trường văn bản một dòng cơ bản:

```html
<input type="text" id="comment" name="comment" value="I'm a text field" />
```

Trường văn bản một dòng chỉ có một ràng buộc thực sự: nếu bạn nhập văn bản có xuống dòng, trình duyệt sẽ xóa những xuống dòng đó trước khi gửi dữ liệu lên máy chủ.

Ảnh chụp màn hình bên dưới hiển thị một trường nhập văn bản ở trạng thái mặc định, được focus, và bị vô hiệu hóa. Hầu hết các trình duyệt cho biết trạng thái được focus bằng cách sử dụng vòng focus xung quanh điều khiển và trạng thái bị vô hiệu hóa bằng văn bản màu xám hoặc điều khiển mờ/bán trong suốt.

![Screenshot of the default, focused and disabled states text input in Chrome on macOS](disabled.png)

Các ảnh chụp màn hình được sử dụng trong tài liệu này được chụp trong trình duyệt Chrome trên macOS. Có thể có những biến thể nhỏ trong các trường/nút này trên các trình duyệt khác nhau, nhưng kỹ thuật tô sáng cơ bản vẫn giống nhau.

> [!NOTE]
> Chúng ta thảo luận về các giá trị của thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) áp đặt các ràng buộc xác nhận cụ thể bao gồm các loại trường nhập liệu màu, email và url trong bài viết tiếp theo, [Các loại đầu vào HTML5](/en-US/docs/Learn_web_development/Extensions/Forms/HTML5_input_types).

#### Trường mật khẩu

Một trong những loại trường nhập liệu ban đầu là loại trường văn bản `password`:

```html
<input type="password" id="pwd" name="pwd" />
```

Ảnh chụp màn hình sau cho thấy trường nhập liệu Mật khẩu trong đó mỗi ký tự được nhập hiển thị dưới dạng dấu chấm.

![Password field in chrome 115 on macOS](password.png)

Giá trị `password` không thêm bất kỳ ràng buộc đặc biệt nào vào văn bản đã nhập, nhưng nó ẩn giá trị được nhập vào trường (ví dụ, với các dấu chấm hoặc dấu hoa thị) để người khác không thể dễ dàng đọc được.

Hãy lưu ý rằng đây chỉ là tính năng giao diện người dùng; trừ khi bạn gửi biểu mẫu một cách an toàn, nó sẽ được gửi dưới dạng văn bản thuần, điều này tệ cho bảo mật — một bên độc hại có thể chặn dữ liệu của bạn và đánh cắp mật khẩu, chi tiết thẻ tín dụng, hoặc bất cứ thứ gì bạn đã gửi. Cách tốt nhất để bảo vệ người dùng khỏi điều này là lưu trữ bất kỳ trang nào liên quan đến biểu mẫu qua kết nối an toàn (tức là, nằm tại địa chỉ `https://`), để dữ liệu được mã hóa trước khi được gửi.

Các trình duyệt nhận biết các hàm ý bảo mật của việc gửi dữ liệu biểu mẫu qua kết nối không an toàn và có các cảnh báo để ngăn người dùng sử dụng biểu mẫu không an toàn.

### Nội dung ẩn

Một điều khiển văn bản gốc khác là loại đầu vào `hidden`. Nó được sử dụng để tạo điều khiển biểu mẫu vô hình với người dùng, nhưng vẫn được gửi lên máy chủ cùng với phần còn lại của dữ liệu biểu mẫu khi được gửi — ví dụ bạn có thể muốn gửi dấu thời gian đến máy chủ cho biết khi nào đơn hàng được đặt. Vì nó bị ẩn, người dùng không thể nhìn thấy hoặc cố ý chỉnh sửa giá trị, nó sẽ không bao giờ nhận được focus, và trình đọc màn hình cũng sẽ không nhận thấy nó.

```html
<input type="hidden" id="timestamp" name="timestamp" value="1286705410" />
```

Nếu bạn tạo phần tử như vậy, bạn phải đặt thuộc tính `name` và `value` của nó. Giá trị có thể được đặt động thông qua JavaScript. Loại trường nhập liệu `hidden` không nên có nhãn liên kết.

Các loại trường nhập văn bản khác, như {{HTMLElement("input/search", "search")}}, {{HTMLElement("input/url", "url")}}, và {{HTMLElement("input/tel", "tel")}}, sẽ được đề cập trong hướng dẫn tiếp theo, [Các loại đầu vào HTML5](/en-US/docs/Learn_web_development/Extensions/Forms/HTML5_input_types).

## Các mục có thể chọn: hộp kiểm và nút chọn

Các mục có thể chọn là các điều khiển mà bạn có thể thay đổi trạng thái bằng cách nhấp vào chúng hoặc vào nhãn liên kết của chúng. Có hai loại mục có thể chọn: hộp kiểm và nút chọn. Cả hai đều sử dụng thuộc tính [`checked`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox#checked) để cho biết liệu widget có được chọn theo mặc định hay không.

Đáng lưu ý là các widget này không hoạt động hoàn toàn giống như các widget biểu mẫu khác. Đối với hầu hết các widget biểu mẫu, khi biểu mẫu được gửi tất cả các widget có thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name) đều được gửi, ngay cả khi không có giá trị nào được điền. Trong trường hợp các mục có thể chọn, giá trị của chúng chỉ được gửi nếu chúng được chọn. Nếu chúng không được chọn, không có gì được gửi, thậm chí cả tên của chúng. Nếu chúng được chọn nhưng không có giá trị, tên được gửi với giá trị _on._

> [!NOTE]
> Bạn có thể tìm các ví dụ từ phần này trên GitHub là [checkable-items.html](https://github.com/mdn/learning-area/blob/main/html/forms/native-form-widgets/checkable-items.html) ([xem trực tiếp cũng được](https://mdn.github.io/learning-area/html/forms/native-form-widgets/checkable-items.html)).

Để có khả năng sử dụng/tiếp cận tối đa, bạn được khuyến nghị bao quanh mỗi danh sách các mục liên quan trong {{htmlelement("fieldset")}}, với {{htmlelement("legend")}} cung cấp mô tả tổng thể của danh sách. Mỗi cặp phần tử {{htmlelement("label")}}/{{htmlelement("input")}} riêng lẻ nên được chứa trong mục danh sách riêng (hoặc tương tự). {{htmlelement('label')}} liên kết thường được đặt ngay trước hoặc sau nút chọn hoặc hộp kiểm, với hướng dẫn cho nhóm nút chọn hoặc hộp kiểm thường là nội dung của {{htmlelement("legend")}}. Xem các ví dụ được liên kết ở trên để biết các ví dụ về cấu trúc.

### Hộp kiểm

Hộp kiểm được tạo bằng phần tử {{HTMLElement("input")}} với thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) được đặt thành giá trị {{HTMLElement("input/checkbox", "checkbox")}}.

```html
<input type="checkbox" id="questionOne" name="subscribe" value="yes" checked />
```

Các mục hộp kiểm liên quan nên sử dụng cùng thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name). Bao gồm thuộc tính [`checked`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox#checked) sẽ tự động chọn hộp kiểm khi trang tải. Nhấp vào hộp kiểm hoặc nhãn liên kết của nó sẽ bật/tắt hộp kiểm.

```html
<fieldset>
  <legend>Choose all the vegetables you like to eat</legend>
  <ul>
    <li>
      <label for="carrots">Carrots</label>
      <input
        type="checkbox"
        id="carrots"
        name="vegetable"
        value="carrots"
        checked />
    </li>
    <li>
      <label for="peas">Peas</label>
      <input type="checkbox" id="peas" name="vegetable" value="peas" />
    </li>
    <li>
      <label for="cabbage">Cabbage</label>
      <input type="checkbox" id="cabbage" name="vegetable" value="cabbage" />
    </li>
  </ul>
</fieldset>
```

Ảnh chụp màn hình sau cho thấy các hộp kiểm ở trạng thái mặc định, được focus và bị vô hiệu hóa. Các hộp kiểm ở trạng thái mặc định và bị vô hiệu hóa hiển thị được chọn, trong khi ở trạng thái được focus, hộp kiểm không được chọn, với vòng focus xung quanh nó.

![Default, focused and disabled Checkboxes in chrome 115 on macOS](checkboxes.png)

> [!NOTE]
> Bất kỳ hộp kiểm và nút chọn nào có thuộc tính [`checked`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox#checked) khi tải sẽ khớp với lớp giả {{cssxref(':default')}}, ngay cả khi chúng không còn được chọn nữa. Bất kỳ cái nào hiện đang được chọn sẽ khớp với lớp giả {{cssxref(':checked')}}.

Do tính chất bật/tắt của hộp kiểm, hộp kiểm được coi là nút chuyển đổi, với nhiều nhà phát triển và nhà thiết kế mở rộng kiểu hộp kiểm mặc định để tạo ra các nút trông giống công tắc chuyển đổi. Bạn có thể [xem ví dụ hoạt động tại đây](https://mdn.github.io/learning-area/html/forms/toggle-switch-example/) (cũng xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/forms/toggle-switch-example/index.html)).

### Nút chọn

Nút chọn được tạo bằng phần tử {{HTMLElement("input")}} với thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) được đặt thành giá trị `radio`:

```html
<input type="radio" id="soup" name="meal" value="soup" checked />
```

Một số nút chọn có thể được liên kết với nhau. Nếu chúng có cùng giá trị cho thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name), chúng sẽ được coi là trong cùng nhóm nút. Chỉ có một nút trong nhóm nhất định có thể được chọn tại một thời điểm; điều này có nghĩa là khi một trong số chúng được chọn tất cả những cái khác tự động không được chọn. Khi biểu mẫu được gửi, chỉ có giá trị của nút chọn được chọn mới được gửi. Nếu không có cái nào được chọn, toàn bộ nhóm nút chọn được coi là ở trạng thái không xác định và không có giá trị nào được gửi với biểu mẫu. Khi một trong các nút chọn trong nhóm có tên giống nhau được chọn, người dùng không thể bỏ chọn tất cả các nút mà không cần đặt lại biểu mẫu.

```html
<fieldset>
  <legend>What is your favorite meal?</legend>
  <ul>
    <li>
      <label for="soup">Soup</label>
      <input type="radio" id="soup" name="meal" value="soup" checked />
    </li>
    <li>
      <label for="curry">Curry</label>
      <input type="radio" id="curry" name="meal" value="curry" />
    </li>
    <li>
      <label for="pizza">Pizza</label>
      <input type="radio" id="pizza" name="meal" value="pizza" />
    </li>
  </ul>
</fieldset>
```

Ảnh chụp màn hình sau cho thấy các nút chọn mặc định và bị vô hiệu hóa ở trạng thái được chọn, cùng với một nút chọn được focus ở trạng thái không được chọn.

![Default, focused and disabled Radio buttons in chrome 115 on macOS](radios.png)

## Các nút thực sự

Nút chọn thực ra không phải là nút, mặc dù có tên đó; hãy tiếp tục và xem các nút thực sự! Có ba loại trường nhập liệu tạo ra các nút:

- `submit`
  - : Gửi dữ liệu biểu mẫu lên máy chủ. Đối với các phần tử {{HTMLElement("button")}}, bỏ qua thuộc tính `type` (hoặc giá trị `type` không hợp lệ) sẽ tạo ra nút submit.
- `reset`
  - : Đặt lại tất cả các widget biểu mẫu về giá trị mặc định của chúng.
- `button`
  - : Các nút không có hiệu ứng tự động nhưng có thể được tùy chỉnh bằng mã JavaScript.

Sau đó chúng ta cũng có phần tử {{htmlelement("button")}} chính nó. Nó có thể nhận thuộc tính `type` với giá trị `submit`, `reset`, hoặc `button` để bắt chước hành vi của ba loại `<input>` được đề cập ở trên. Sự khác biệt chính giữa hai loại là các phần tử `<button>` thực sự dễ tạo kiểu hơn nhiều.

```html live-sample___actual_buttons_ex
<p>Using &lt;input></p>
<p>
  <input type="submit" value="Submit this form" />
  <input type="reset" value="Reset this form" />
  <input type="button" value="Do Nothing without JavaScript" />
</p>
<p>Using &lt;button></p>
<p>
  <button type="submit">Submit this form</button>
  <button type="reset">Reset this form</button>
  <button type="button">Do Nothing without JavaScript</button>
</p>
```

{{ EmbedLiveSample('actual_buttons_ex', '500', '250') }}

> [!NOTE]
> Loại trường nhập liệu `image` cũng hiển thị dưới dạng nút. Chúng ta sẽ đề cập đến điều đó sau.

> [!NOTE]
> Bạn có thể tìm các ví dụ từ phần này trên GitHub là [button-examples.html](https://github.com/mdn/learning-area/blob/main/html/forms/native-form-widgets/button-examples.html) ([xem trực tiếp cũng được](https://mdn.github.io/learning-area/html/forms/native-form-widgets/button-examples.html)).

Bên dưới bạn có thể tìm thấy ví dụ về mỗi loại nút `<input>`, cùng với loại `<button>` tương đương.

### submit

```html
<button type="submit">This is a <strong>submit button</strong></button>

<input type="submit" value="This is a submit button" />
```

### reset

```html
<button type="reset">This is a <strong>reset button</strong></button>

<input type="reset" value="This is a reset button" />
```

### anonymous

```html
<button type="button">This is an <strong>anonymous button</strong></button>

<input type="button" value="This is an anonymous button" />
```

Các nút luôn hoạt động giống nhau dù bạn sử dụng phần tử {{HTMLElement("button")}} hay phần tử {{HTMLElement("input")}}. Tuy nhiên, như bạn thấy từ các ví dụ, các phần tử {{HTMLElement("button")}} cho phép bạn sử dụng HTML trong nội dung của chúng, được chèn giữa thẻ mở và thẻ đóng `<button>`. Các phần tử {{HTMLElement("input")}} mặt khác là {{glossary("void element", "phần tử rỗng")}}; nội dung hiển thị của chúng được chèn vào trong thuộc tính `value`, và do đó chỉ chấp nhận văn bản thuần làm nội dung.

Ảnh chụp màn hình sau cho thấy một nút ở trạng thái mặc định, được focus và bị vô hiệu hóa. Ở trạng thái được focus, có vòng focus xung quanh nút, và ở trạng thái bị vô hiệu hóa, nút được tô xám.

![Default, focus, and disabled button states in chrome 115 on macOS](buttons.png)

### Nút hình ảnh

Điều khiển **nút hình ảnh** được hiển thị chính xác như phần tử {{HTMLElement("img")}}, ngoại trừ khi người dùng nhấp vào nó, nó hoạt động như nút submit.

Nút hình ảnh được tạo bằng phần tử {{HTMLElement("input")}} với thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) được đặt thành giá trị `image`. Phần tử này hỗ trợ đúng cùng bộ thuộc tính như phần tử {{HTMLElement("img")}}, cộng với tất cả các thuộc tính được hỗ trợ bởi các nút biểu mẫu khác.

```html
<input type="image" alt="Click me!" src="my-img.png" width="80" height="30" />
```

Nếu nút hình ảnh được sử dụng để gửi biểu mẫu, điều khiển này không gửi giá trị của nó — thay vào đó, tọa độ X và Y của cú nhấp vào hình ảnh được gửi (tọa độ liên quan đến hình ảnh, nghĩa là góc trên bên trái của hình ảnh đại diện cho tọa độ (0, 0)). Tọa độ được gửi dưới dạng hai cặp khóa/giá trị:

- Khóa giá trị X là giá trị của thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name) theo sau là chuỗi "_.x_".
- Khóa giá trị Y là giá trị của thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name) theo sau là chuỗi "_.y_".

Ví dụ khi bạn nhấp vào hình ảnh tại tọa độ (123, 456) và nó gửi qua phương thức `get`, bạn sẽ thấy các giá trị được thêm vào URL như sau:

```url
https://example.com?pos.x=123&pos.y=456
```

Đây là cách rất thuận tiện để xây dựng "bản đồ điểm nóng". Cách các giá trị này được gửi và truy xuất được mô tả chi tiết trong bài viết [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data).

## Bộ chọn tệp

Có một loại `<input>` cuối cùng đến với chúng ta từ thời HTML đầu: loại đầu vào tệp. Biểu mẫu có thể gửi tệp lên máy chủ (hành động cụ thể này cũng được mô tả chi tiết trong bài viết [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data)). Widget bộ chọn tệp có thể được sử dụng để chọn một hoặc nhiều tệp để gửi.

Để tạo [widget bộ chọn tệp](/en-US/docs/Web/HTML/Reference/Elements/input/file), bạn sử dụng phần tử {{HTMLElement("input")}} với thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) được đặt thành `file`. Các loại tệp được chấp nhận có thể bị ràng buộc bằng thuộc tính [`accept`](/en-US/docs/Web/HTML/Reference/Elements/input#accept). Ngoài ra, nếu bạn muốn cho phép người dùng chọn nhiều hơn một tệp, bạn có thể làm như vậy bằng cách thêm thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/input#multiple).

### Ví dụ

Trong ví dụ này, một bộ chọn tệp được tạo yêu cầu các tệp hình ảnh đồ họa. Người dùng được phép chọn nhiều tệp trong trường hợp này.

```html
<input type="file" name="file" id="file" accept="image/*" multiple />
```

Trên một số thiết bị di động, bộ chọn tệp có thể truy cập ảnh, video và âm thanh được chụp trực tiếp bởi máy ảnh và microphone của thiết bị bằng cách thêm thông tin chụp vào thuộc tính `accept` như sau:

```html
<input type="file" accept="image/*;capture=camera" />
<input type="file" accept="video/*;capture=camcorder" />
<input type="file" accept="audio/*;capture=microphone" />
```

Ảnh chụp màn hình sau cho thấy widget bộ chọn tệp ở trạng thái mặc định, focus và bị vô hiệu hóa khi không có tệp nào được chọn.

![File picker widget in default, focus, and disabled states in chrome 115 on macOS](filepickers.png)

## Các thuộc tính phổ biến

Nhiều phần tử được sử dụng để định nghĩa điều khiển biểu mẫu có một số thuộc tính cụ thể riêng. Tuy nhiên, có một bộ thuộc tính chung cho tất cả các phần tử biểu mẫu. Bạn đã gặp một số trong số này, nhưng bên dưới là danh sách các thuộc tính phổ biến đó, để tham khảo:

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Tên thuộc tính</th>
      <th scope="col">Giá trị mặc định</th>
      <th scope="col">Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <code
          ><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/autofocus"
            >autofocus</a
          ></code
        >
      </td>
      <td>false</td>
      <td>
        Thuộc tính Boolean này cho phép bạn chỉ định rằng phần tử tự động nhận focus khi trang tải.
        Chỉ có một phần tử liên kết với biểu mẫu trong tài liệu có thể có thuộc tính này được chỉ định.
      </td>
    </tr>
    <tr>
      <td>
        <code
          ><a href="/en-US/docs/Web/HTML/Reference/Attributes/disabled">disabled</a></code
        >
      </td>
      <td>false</td>
      <td>
        Thuộc tính Boolean này cho biết người dùng không thể tương tác với phần tử.
        Nếu thuộc tính này không được chỉ định, phần tử kế thừa cài đặt của nó từ phần tử chứa, ví dụ, {{HTMLElement("fieldset")}};
        nếu không có phần tử chứa nào có thuộc tính <code>disabled</code> được đặt, thì phần tử được bật.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/input#form">form</a></code>
      </td>
      <td></td>
      <td>
        Phần tử <code>&#x3C;form></code> mà widget được liên kết, được sử dụng nếu nó không được lồng trong biểu mẫu đó.
        Giá trị của thuộc tính phải là thuộc tính <code>id</code> của phần tử {{HTMLElement("form")}} trong cùng tài liệu.
        Điều này cho phép bạn liên kết điều khiển biểu mẫu với biểu mẫu mà nó ở bên ngoài, ngay cả khi nó ở bên trong phần tử biểu mẫu khác.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/input#name">name</a></code>
      </td>
      <td></td>
      <td>Tên của phần tử; được gửi cùng với dữ liệu biểu mẫu.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/input#value">value</a></code>
      </td>
      <td></td>
      <td>Giá trị ban đầu của phần tử.</td>
    </tr>
  </tbody>
</table>

## Tóm tắt

Bài viết này đã đề cập đến các loại trường nhập liệu cũ hơn — bộ gốc được giới thiệu từ những ngày đầu của HTML được hỗ trợ tốt trong tất cả các trình duyệt. Trong phần tiếp theo, chúng ta sẽ xem xét các giá trị hiện đại hơn của thuộc tính `type`.

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/How_to_structure_a_web_form", "Learn_web_development/Extensions/Forms/HTML5_input_types", "Learn_web_development/Extensions/Forms")}}
