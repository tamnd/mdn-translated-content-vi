---
title: <input type="search">
slug: Web/HTML/Reference/Elements/input/search
page-type: html-attribute-value
browser-compat: html.elements.input.type_search
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} kiểu **`search`** là các trường văn bản được thiết kế để người dùng nhập truy vấn tìm kiếm. Về mặt chức năng, chúng giống với ô nhập [`text`](/en-US/docs/Web/HTML/Reference/Elements/input/text), nhưng có thể được tạo kiểu khác bởi {{Glossary("user agent")}}.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;search&quot;&gt;", "tabbed-standard")}}

```html interactive-example
<label for="site-search">Search the site:</label>
<input type="search" id="site-search" name="q" />

<button>Search</button>
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

## Giá trị

Thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) chứa chuỗi đại diện cho giá trị chứa trong trường tìm kiếm. Bạn có thể lấy giá trị này bằng thuộc tính [`HTMLInputElement.value`](/en-US/docs/Web/API/HTMLInputElement/value) trong JavaScript.

```js
searchTerms = mySearch.value;
```

Nếu không có ràng buộc xác thực nào được áp dụng cho ô nhập (xem [Xác thực](#validation) để biết thêm chi tiết), giá trị có thể là bất kỳ chuỗi văn bản nào hoặc chuỗi rỗng (`""`).

## Thuộc tính bổ sung

Ngoài các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) và các thuộc tính áp dụng cho tất cả các phần tử {{HTMLElement("input")}} bất kể kiểu, ô nhập trường tìm kiếm hỗ trợ các thuộc tính sau.

### list

Giá trị của thuộc tính list là {{domxref("Element.id", "id")}} của một phần tử {{HTMLElement("datalist")}} nằm trong cùng tài liệu. {{HTMLElement("datalist")}} cung cấp danh sách các giá trị được xác định trước để gợi ý cho người dùng. Bất kỳ giá trị nào trong danh sách không tương thích với [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) sẽ không được đưa vào các tùy chọn gợi ý. Các giá trị được cung cấp là gợi ý, không phải yêu cầu: người dùng có thể chọn từ danh sách này hoặc cung cấp giá trị khác.

### maxlength

Độ dài chuỗi tối đa (đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào trường tìm kiếm. Đây phải là giá trị nguyên từ 0 trở lên. Nếu không có `maxlength` được chỉ định, hoặc một giá trị không hợp lệ được chỉ định, trường tìm kiếm không có độ dài tối đa. Giá trị này cũng phải lớn hơn hoặc bằng giá trị của `minlength`.

Ô nhập sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nếu độ dài văn bản nhập vào trường lớn hơn `maxlength` {{glossary("UTF-16", "đơn vị mã UTF-16")}}. Xác thực ràng buộc chỉ được áp dụng khi giá trị được thay đổi bởi người dùng.

### minlength

Độ dài chuỗi tối thiểu (đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào trường tìm kiếm. Đây phải là giá trị nguyên không âm nhỏ hơn hoặc bằng giá trị được chỉ định bởi `maxlength`. Nếu không có `minlength` được chỉ định, hoặc một giá trị không hợp lệ được chỉ định, ô nhập tìm kiếm không có độ dài tối thiểu.

Trường tìm kiếm sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nếu độ dài văn bản nhập vào trường nhỏ hơn `minlength` {{glossary("UTF-16", "đơn vị mã UTF-16")}}. Xác thực ràng buộc chỉ được áp dụng khi giá trị được thay đổi bởi người dùng.

### pattern

Thuộc tính `pattern`, khi được chỉ định, là biểu thức chính quy mà [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của ô nhập phải khớp để vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nó phải là biểu thức chính quy JavaScript hợp lệ, như được dùng bởi kiểu {{jsxref("RegExp")}}, và được ghi lại trong [hướng dẫn biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) của chúng ta; cờ `'u'` được chỉ định khi biên dịch biểu thức chính quy để mẫu được coi là chuỗi các điểm mã Unicode, thay vì {{Glossary("ASCII")}}. Không nên chỉ định dấu gạch chéo xung quanh văn bản mẫu.

Nếu mẫu được chỉ định không hợp lệ, không có biểu thức chính quy nào được áp dụng và thuộc tính này bị bỏ qua hoàn toàn.

> [!NOTE]
> Dùng thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Elements/input#title) để chỉ định văn bản mà hầu hết các trình duyệt sẽ hiển thị dưới dạng tooltip để giải thích các yêu cầu để khớp mẫu. Bạn cũng nên bao gồm các văn bản giải thích khác ở gần đó.

Xem phần [Chỉ định mẫu](#specifying_a_pattern) để biết chi tiết và ví dụ.

### placeholder

Thuộc tính `placeholder` là một chuỗi cung cấp gợi ý ngắn gọn cho người dùng về loại thông tin cần nhập vào trường. Nó phải là một từ hoặc cụm từ ngắn thể hiện kiểu dữ liệu mong đợi, thay vì một thông báo giải thích. Văn bản _không được_ chứa ký tự xuống dòng hay dòng mới.

Nếu nội dung của điều khiển có một hướng ({{Glossary("LTR")}} hoặc {{Glossary("RTL")}}) nhưng cần hiển thị placeholder theo hướng ngược lại, bạn có thể dùng ký tự định dạng thuật toán bidirectional Unicode để ghi đè hướng trong placeholder; xem [Cách sử dụng điều khiển Unicode cho văn bản bidi](https://www.w3.org/International/questions/qa-bidi-unicode-controls) để biết thêm.

> [!NOTE]
> Hãy tránh dùng thuộc tính `placeholder` nếu có thể. Nó không có giá trị ngữ nghĩa bằng các cách khác để giải thích biểu mẫu và có thể gây ra các sự cố kỹ thuật không mong muốn với nội dung của bạn. Xem [`<input>` labels](/en-US/docs/Web/HTML/Reference/Elements/input#labels) để biết thêm thông tin.

### readonly

Thuộc tính Boolean, khi có mặt, có nghĩa là trường này không thể được chỉnh sửa bởi người dùng. Tuy nhiên, `value` của nó vẫn có thể được thay đổi bằng mã JavaScript trực tiếp đặt thuộc tính `value` của {{domxref("HTMLInputElement")}}.

> [!NOTE]
> Vì trường chỉ đọc không thể có giá trị, `required` không có tác dụng trên các ô nhập cũng có thuộc tính `readonly`.

### size

Thuộc tính `size` là giá trị số chỉ định số ký tự rộng của trường ô nhập. Giá trị phải là số lớn hơn không, và giá trị mặc định là 20. Vì độ rộng ký tự thay đổi, điều này có thể chính xác hoặc không và không nên dựa vào nó; ô nhập kết quả có thể hẹp hơn hoặc rộng hơn số ký tự được chỉ định, tùy thuộc vào ký tự và font chữ (cài đặt {{cssxref("font")}} đang được sử dụng).

Điều này _không_ đặt giới hạn về số ký tự người dùng có thể nhập vào trường. Nó chỉ chỉ định xấp xỉ bao nhiêu ký tự có thể được nhìn thấy cùng một lúc. Để đặt giới hạn trên về độ dài dữ liệu nhập, hãy dùng thuộc tính [`maxlength`](#maxlength).

### spellcheck

[`spellcheck`](/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck) là thuộc tính toàn cục được dùng để chỉ định có bật kiểm tra chính tả cho phần tử hay không. Nó có thể được dùng trên bất kỳ nội dung có thể chỉnh sửa nào, nhưng ở đây chúng ta xem xét các đặc thù liên quan đến việc dùng `spellcheck` trên các phần tử {{HTMLElement("input")}}. Các giá trị được phép cho `spellcheck` là:

- `false`
  - : Tắt kiểm tra chính tả cho phần tử này.
- `true`
  - : Bật kiểm tra chính tả cho phần tử này.
- "" (chuỗi rỗng) hoặc không có giá trị
  - : Theo hành vi mặc định của phần tử cho kiểm tra chính tả. Điều này có thể dựa trên cài đặt `spellcheck` của cha hoặc các yếu tố khác.

Trường ô nhập có thể được bật kiểm tra chính tả nếu nó không có thuộc tính [readonly](#readonly) được đặt và không bị vô hiệu hóa.

Giá trị được trả về khi đọc `spellcheck` có thể không phản ánh trạng thái thực tế của kiểm tra chính tả trong điều khiển, nếu tùy chọn của {{Glossary("user agent", "user agent")}} ghi đè cài đặt.

## Thuộc tính không chuẩn

Các thuộc tính không chuẩn sau đây có sẵn cho các trường ô nhập tìm kiếm. Hãy tránh dùng chúng khi có thể.

### incremental

Thuộc tính Boolean `incremental` là phần mở rộng WebKit và Blink (được hỗ trợ bởi Safari, Opera, Chrome, v.v.) khi có mặt, cho {{Glossary("user agent")}} biết xử lý ô nhập như tìm kiếm trực tiếp. Khi người dùng chỉnh sửa giá trị của trường, user agent gửi sự kiện {{domxref("HTMLInputElement/search_event", "search")}} đến đối tượng {{domxref("HTMLInputElement")}} đại diện cho hộp tìm kiếm. Điều này cho phép mã của bạn cập nhật kết quả tìm kiếm theo thời gian thực khi người dùng chỉnh sửa tìm kiếm.

Nếu `incremental` không được chỉ định, sự kiện {{domxref("HTMLInputElement/search_event", "search")}} chỉ được gửi khi người dùng khởi động tìm kiếm một cách rõ ràng (chẳng hạn bằng cách nhấn phím <kbd>Enter</kbd> hoặc <kbd>Return</kbd> khi chỉnh sửa trường).

Sự kiện `search` được giới hạn tốc độ để không được gửi thường xuyên hơn khoảng thời gian được xác định bởi triển khai.

### results

Thuộc tính `results`—chỉ được hỗ trợ bởi Safari—là giá trị số cho phép bạn ghi đè số mục tối đa được hiển thị trong menu thả xuống được cung cấp bởi phần tử {{HTMLElement("input")}} của các truy vấn tìm kiếm trước đó.

Giá trị phải là số thập phân không âm. Nếu không được cung cấp, hoặc một giá trị không hợp lệ được đưa ra, số mục tối đa mặc định của trình duyệt được sử dụng.

## Sử dụng ô nhập tìm kiếm

Các phần tử `<input>` kiểu `search` rất giống với các phần tử kiểu `text`, ngoại trừ chúng được dùng cụ thể để xử lý các thuật ngữ tìm kiếm. Chúng về cơ bản là tương đương về hành vi, nhưng các user agent có thể chọn tạo kiểu khác nhau theo mặc định (và tất nhiên, các trang web có thể dùng stylesheet để áp dụng các kiểu tùy chỉnh cho chúng).

### Ví dụ cơ bản

```html
<form>
  <div>
    <input type="search" id="mySearch" name="q" />
    <button>Search</button>
  </div>
</form>
```

Điều này hiển thị như sau:

{{EmbedLiveSample("Basic_example", 600, 40)}}

`q` là `name` phổ biến nhất được đặt cho ô nhập tìm kiếm, mặc dù không bắt buộc. Khi được gửi, cặp tên/giá trị dữ liệu được gửi đến máy chủ sẽ là `q=searchTerm`.

> [!NOTE]
> Bạn phải nhớ đặt [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name) cho ô nhập của mình, nếu không sẽ không có gì được gửi.

### Sự khác biệt giữa kiểu search và text

Các khác biệt cơ bản chính đến từ cách các trình duyệt xử lý chúng. Điều đầu tiên cần lưu ý là một số trình duyệt hiển thị biểu tượng hình chữ X có thể được nhấp để xóa thuật ngữ tìm kiếm ngay lập tức nếu muốn, trong Chrome hành động này cũng được kích hoạt khi nhấn escape. Ảnh chụp màn hình sau đây từ Chrome:

![Ô nhập tìm kiếm đang được tập trung, với vòng tập trung, với văn bản 'cats'. Có biểu tượng x trong ô nhập tiếp giáp với bên phải.](chrome-cross-icon.png)

Ngoài ra, các trình duyệt hiện đại cũng có xu hướng tự động lưu trữ các thuật ngữ tìm kiếm đã nhập trước đó trên các miền, sau đó xuất hiện dưới dạng tùy chọn tự động hoàn thành khi các tìm kiếm tiếp theo được thực hiện trong các ô nhập tìm kiếm trên miền đó. Điều này giúp người dùng có xu hướng thực hiện các tìm kiếm giống hoặc tương tự theo thời gian. Ảnh chụp màn hình này từ Firefox:

![Ô nhập ở trạng thái lỗi với vòng tập trung màu đỏ. Người dùng đã nhập chữ 'h'. Danh sách chọn bật lên mở ngay bên dưới hộp ô nhập với hai tùy chọn: hello và hermansje.](firefox-auto-complete.png)

Tại đây, hãy xem xét một số kỹ thuật hữu ích bạn có thể áp dụng cho biểu mẫu tìm kiếm của mình.

### Đặt placeholder

Bạn có thể cung cấp placeholder hữu ích bên trong ô nhập tìm kiếm của mình có thể gợi ý về việc cần làm bằng thuộc tính [`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder). Hãy xem ví dụ sau:

```html
<form>
  <div>
    <input
      type="search"
      id="mySearch"
      name="q"
      placeholder="Search the site…" />
    <button>Search</button>
  </div>
</form>
```

Bạn có thể thấy cách placeholder được hiển thị bên dưới:

{{EmbedLiveSample("Setting_placeholders", 600, 40)}}

### Nhãn biểu mẫu tìm kiếm và khả năng tiếp cận

Một vấn đề với biểu mẫu tìm kiếm là khả năng tiếp cận của chúng; một thực hành thiết kế phổ biến là không cung cấp nhãn cho trường tìm kiếm (mặc dù có thể có biểu tượng kính lúp hoặc tương tự), vì mục đích của biểu mẫu tìm kiếm thường khá rõ ràng với người dùng nhìn thấy do vị trí đặt ([ví dụ này cho thấy mẫu điển hình](https://mdn.github.io/learning-area/accessibility/aria/website-aria-roles/)).

Tuy nhiên, điều này có thể gây nhầm lẫn cho người dùng trình đọc màn hình, vì họ sẽ không nhận được bất kỳ chỉ dẫn bằng lời nào về ô nhập tìm kiếm là gì. Một cách giải quyết không ảnh hưởng đến thiết kế trực quan của bạn là sử dụng [các phần tử landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/landmark_role).

- Bọc toàn bộ chức năng tìm kiếm trong phần tử {{HTMLElement("search")}}, tạo ra vùng landmark mà công nghệ hỗ trợ có thể thông báo và điều hướng nhanh. Nếu `<input>` của bạn đã nằm trong `<form>`, bạn cũng có thể thêm [`role="search"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role) vào phần tử `<form>`.
- Nếu điều đó chưa đủ, bạn có thể dùng thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) trên {{HTMLElement("input")}}. Đây phải là nhãn văn bản mô tả sẽ được đọc bởi trình đọc màn hình; nó được dùng như tương đương không trực quan của `<label>`.

Hãy xem ví dụ:

```html
<search>
  <form>
    <div>
      <input
        type="search"
        id="mySearch"
        name="q"
        placeholder="Search the site…"
        aria-label="Search through site content" />
      <button>Search</button>
    </div>
  </form>
</search>
```

Bạn có thể thấy cách nó được hiển thị bên dưới:

{{EmbedLiveSample("Search_form_labels_and_accessibility", 600, 40)}}

Không có sự khác biệt trực quan so với ví dụ trước, nhưng người dùng trình đọc màn hình có nhiều thông tin hơn.

> [!NOTE]
> Xem [Biển chỉ dẫn/Landmark](/en-US/docs/Learn_web_development/Core/Accessibility/WAI-ARIA_basics#signpostslandmarks) để biết thêm về các tính năng khả năng tiếp cận như vậy.

### Kích thước vật lý của phần tử ô nhập

Kích thước vật lý của hộp ô nhập có thể được kiểm soát bằng thuộc tính [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size). Với nó, bạn có thể chỉ định số ký tự mà hộp ô nhập có thể hiển thị cùng một lúc. Trong ví dụ này, hộp tìm kiếm rộng 30 ký tự:

```html
<form>
  <div>
    <input
      type="search"
      id="mySearch"
      name="q"
      placeholder="Search the site…"
      size="30" />
    <button>Search</button>
  </div>
</form>
```

Kết quả là hộp ô nhập rộng hơn này:

{{ EmbedLiveSample('Physical_input_element_size', 600, 40) }}

## Xác thực

Các phần tử `<input>` kiểu `search` có các tính năng xác thực tương tự với ô nhập `text` thông thường. Ít có khả năng bạn muốn dùng các tính năng xác thực nói chung cho hộp tìm kiếm. Trong nhiều trường hợp, người dùng chỉ cần được phép tìm kiếm bất cứ điều gì, nhưng có một vài trường hợp cần xem xét, chẳng hạn tìm kiếm đối với dữ liệu có định dạng đã biết.

> [!NOTE]
> Xác thực biểu mẫu HTML _không_ phải là thay thế cho các script đảm bảo rằng dữ liệu nhập có định dạng phù hợp. Rất dễ dàng để ai đó điều chỉnh HTML để vượt qua xác thực hoặc xóa nó hoàn toàn. Cũng có thể ai đó bỏ qua HTML của bạn và gửi dữ liệu trực tiếp đến máy chủ của bạn. Nếu mã phía máy chủ của bạn không xác thực dữ liệu nhận được, sẽ xảy ra thảm họa khi dữ liệu định dạng sai (hoặc quá lớn, sai loại, v.v.) được nhập vào cơ sở dữ liệu của bạn.

### Ghi chú về tạo kiểu

Có các lớp giả hữu ích để tạo kiểu cho các phần tử biểu mẫu hợp lệ/không hợp lệ: {{cssxref(":valid")}} và {{cssxref(":invalid")}}. Trong phần này, chúng ta sẽ dùng CSS sau, sẽ đặt dấu kiểm (tích) bên cạnh các ô nhập có giá trị hợp lệ và dấu chéo bên cạnh các ô nhập có giá trị không hợp lệ.

```css
input:invalid ~ span::after {
  content: "✖";
  padding-left: 5px;
  position: absolute;
}

input:valid ~ span::after {
  content: "✓";
  padding-left: 5px;
  position: absolute;
}
```

Kỹ thuật này cũng yêu cầu phần tử {{htmlelement("span")}} được đặt sau phần tử biểu mẫu, đóng vai trò là nơi chứa các biểu tượng. Điều này là cần thiết vì một số loại ô nhập trên một số trình duyệt không hiển thị các biểu tượng được đặt trực tiếp sau chúng rất tốt.

### Yêu cầu nhập bắt buộc

Bạn có thể dùng thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) như một cách dễ dàng để yêu cầu nhập giá trị trước khi gửi biểu mẫu được phép:

```html
<form>
  <div>
    <input
      type="search"
      id="mySearch"
      name="q"
      placeholder="Search the site…"
      required />
    <button>Search</button>
    <span class="validity"></span>
  </div>
</form>
```

```css hidden
input {
  margin-right: 10px;
}

input:invalid ~ span::after {
  content: "✖";
  padding-left: 5px;
  position: absolute;
}

input:valid ~ span::after {
  content: "✓";
  padding-left: 5px;
  position: absolute;
}
```

Điều này hiển thị như sau:

{{ EmbedLiveSample('Making_input_required', 600, 40) }}

Ngoài ra, nếu bạn cố gửi biểu mẫu mà không nhập thuật ngữ tìm kiếm, trình duyệt sẽ hiển thị thông báo. Ví dụ sau từ Firefox:

![form field with attached message that says Please fill out this field](firefox-required-message.png)

Các thông báo khác nhau sẽ được hiển thị khi bạn cố gửi biểu mẫu với các loại dữ liệu không hợp lệ khác nhau chứa trong các ô nhập; xem các ví dụ bên dưới.

### Độ dài giá trị ô nhập

Bạn có thể chỉ định độ dài tối thiểu, tính bằng ký tự, cho giá trị nhập bằng thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Elements/input#minlength); tương tự, dùng [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/input#maxlength) để đặt độ dài tối đa của giá trị nhập.

Ví dụ dưới đây yêu cầu rằng giá trị nhập phải có độ dài từ 4–8 ký tự.

```html
<form>
  <div>
    <label for="mySearch">Search for user</label>
    <input
      type="search"
      id="mySearch"
      name="q"
      placeholder="User IDs are 4–8 characters in length"
      required
      size="30"
      minlength="4"
      maxlength="8" />
    <button>Search</button>
    <span class="validity"></span>
  </div>
</form>
```

```css hidden
input {
  margin-right: 10px;
}

input:invalid ~ span::after {
  content: "✖";
  padding-left: 5px;
  position: absolute;
}

input:valid ~ span::after {
  content: "✓";
  padding-left: 5px;
  position: absolute;
}
```

Điều này hiển thị như sau:

{{ EmbedLiveSample('Input_value_length', 600, 40) }}

Nếu bạn cố gửi biểu mẫu với ít hơn 4 ký tự, bạn sẽ nhận được thông báo lỗi phù hợp (khác nhau giữa các trình duyệt). Nếu bạn cố nhập nhiều hơn 8 ký tự, trình duyệt sẽ không cho phép bạn.

### Chỉ định mẫu

Bạn có thể dùng thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) để chỉ định biểu thức chính quy mà giá trị nhập phải tuân theo để được coi là hợp lệ (xem [Xác thực theo biểu thức chính quy](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation#validating_against_a_regular_expression) để có khóa học cấp tốc).

Hãy xem ví dụ. Giả sử chúng ta muốn cung cấp biểu mẫu tìm kiếm ID sản phẩm, và các ID đều là mã gồm hai chữ cái theo sau là bốn chữ số. Ví dụ sau bao gồm nó:

```html
<form>
  <div>
    <label for="mySearch">Search for product by ID:</label>
    <input
      type="search"
      id="mySearch"
      name="q"
      placeholder="two letters followed by four numbers"
      required
      size="30"
      pattern="[A-z]{2}[0-9]{4}" />
    <button>Search</button>
    <span class="validity"></span>
  </div>
</form>
```

```css hidden
input {
  margin-right: 10px;
}

input:invalid ~ span::after {
  content: "✖";
  padding-left: 5px;
  position: absolute;
}

input:valid ~ span::after {
  content: "✓";
  padding-left: 5px;
  position: absolute;
}
```

Điều này hiển thị như sau:

{{ EmbedLiveSample('Specifying_a_pattern', 600, 40) }}

## Ví dụ

Bạn có thể xem ví dụ tốt về biểu mẫu tìm kiếm được dùng trong ngữ cảnh tại ví dụ [website-aria-roles](https://github.com/mdn/learning-area/tree/main/accessibility/aria/website-aria-roles) của chúng ta ([xem trực tiếp](https://mdn.github.io/learning-area/accessibility/aria/website-aria-roles/)).

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho giá trị chứa trong trường tìm kiếm.
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
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete"><code>autocomplete</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#list"><code>list</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#maxlength"><code>maxlength</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#minlength"><code>minlength</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#pattern"><code>pattern</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#placeholder"><code>placeholder</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#required"><code>required</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#size"><code>size</code></a>.
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td><code>value</code></td>
    </tr>
    <tr>
      <td><strong>Giao diện DOM</strong></td>
      <td><p>{{domxref("HTMLInputElement")}}</p></td>
    </tr>
    <tr>
      <td><strong>Phương thức</strong></td>
      <td>
        {{domxref("HTMLInputElement.select", "select()")}},
        {{domxref("HTMLInputElement.setRangeText", "setRangeText()")}},
        {{domxref("HTMLInputElement.setSelectionRange", "setSelectionRange()")}}.
      </td>
    </tr>
     <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td>
        không có thuộc tính <code>list</code>:
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role">searchbox</a></code><br />
        có thuộc tính <code>list</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role">combobox</a></code>
      </td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms)
- {{HTMLElement("input")}} và giao diện {{domxref("HTMLInputElement")}} nó dựa trên
- [`<input type="text">`](/en-US/docs/Web/HTML/Reference/Elements/input/text)
