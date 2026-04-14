---
title: <input type="url">
slug: Web/HTML/Reference/Elements/input/url
page-type: html-attribute-value
browser-compat: html.elements.input.type_url
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} kiểu **`url`** được dùng để cho phép người dùng nhập và chỉnh sửa URL.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;url&quot;&gt;", "tabbed-shorter")}}

```html interactive-example
<form>
  <label for="url">Enter an https:// URL:</label>
  <input
    type="url"
    name="url"
    id="url"
    placeholder="https://example.com"
    pattern="https://.*"
    size="30"
    required />
</form>
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

Giá trị ô nhập được tự động xác thực để đảm bảo nó rỗng hoặc là URL được định dạng đúng trước khi biểu mẫu có thể được gửi. Các lớp giả CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}} được tự động áp dụng khi cần thiết để chỉ ra trực quan liệu giá trị hiện tại của trường có phải là URL hợp lệ hay không.

## Giá trị

Thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của phần tử {{HTMLElement("input")}} chứa một chuỗi được tự động xác thực là tuân theo cú pháp URL. Cụ thể hơn, có hai định dạng giá trị có thể vượt qua xác thực:

1. Chuỗi rỗng ("") chỉ ra người dùng không nhập giá trị hoặc giá trị đã bị xóa.
2. Một URL tuyệt đối được định dạng đúng. Điều này không nhất thiết có nghĩa là địa chỉ URL tồn tại, nhưng ít nhất nó được định dạng đúng. Một mục khớp với `urlscheme://rest-of-url` có thể hợp lệ, ngay cả khi `urlscheme` nhập không tồn tại.

Xem [Xác thực](#validation) để biết chi tiết về cách URL được xác thực để đảm bảo chúng được định dạng đúng.

## Thuộc tính bổ sung

Ngoài các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) và các thuộc tính áp dụng cho tất cả các phần tử {{HTMLElement("input")}} bất kể kiểu, ô nhập `url` hỗ trợ các thuộc tính sau.

> [!NOTE]
> Thuộc tính toàn cục [`autocorrect`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocorrect) có thể được thêm vào ô nhập url, nhưng trạng thái được lưu trữ luôn là `off`.

### list

Giá trị của thuộc tính list là {{domxref("Element.id", "id")}} của một phần tử {{HTMLElement("datalist")}} nằm trong cùng tài liệu. {{HTMLElement("datalist")}} cung cấp danh sách các giá trị được xác định trước để gợi ý cho người dùng. Bất kỳ giá trị nào trong danh sách không tương thích với [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) sẽ không được đưa vào các tùy chọn gợi ý. Các giá trị được cung cấp là gợi ý, không phải yêu cầu: người dùng có thể chọn từ danh sách này hoặc cung cấp giá trị khác.

### maxlength

Độ dài chuỗi tối đa (đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào ô nhập `url`. Đây phải là giá trị nguyên từ `0` trở lên. Nếu không có `maxlength` được chỉ định, hoặc một giá trị không hợp lệ được chỉ định, ô nhập `url` không có độ dài tối đa. Giá trị này cũng phải lớn hơn hoặc bằng giá trị của `minlength`.

Ô nhập sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nếu độ dài giá trị văn bản của trường lớn hơn `maxlength` {{glossary("UTF-16", "đơn vị mã UTF-16")}}. Xác thực ràng buộc chỉ được áp dụng khi giá trị được thay đổi bởi người dùng.

### minlength

Độ dài chuỗi tối thiểu (đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào ô nhập `url`. Đây phải là giá trị nguyên không âm nhỏ hơn hoặc bằng giá trị được chỉ định bởi `maxlength`. Nếu không có `minlength` được chỉ định, hoặc một giá trị không hợp lệ được chỉ định, ô nhập `url` không có độ dài tối thiểu.

Ô nhập sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nếu độ dài văn bản nhập vào trường nhỏ hơn `minlength` {{glossary("UTF-16", "đơn vị mã UTF-16")}}. Xác thực ràng buộc chỉ được áp dụng khi giá trị được thay đổi bởi người dùng.

### pattern

Thuộc tính `pattern`, khi được chỉ định, là biểu thức chính quy mà [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của ô nhập phải khớp để vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nó phải là biểu thức chính quy JavaScript hợp lệ, như được dùng bởi kiểu {{jsxref("RegExp")}}, và được ghi lại trong [hướng dẫn biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) của chúng ta; cờ `'u'` được chỉ định khi biên dịch biểu thức chính quy để mẫu được coi là chuỗi các điểm mã Unicode, thay vì {{Glossary("ASCII")}}. Không nên chỉ định dấu gạch chéo xung quanh văn bản mẫu.

Nếu mẫu được chỉ định không hợp lệ, không có biểu thức chính quy nào được áp dụng và thuộc tính này bị bỏ qua hoàn toàn.

> [!NOTE]
> Dùng thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Elements/input#title) để chỉ định văn bản mà hầu hết các trình duyệt sẽ hiển thị dưới dạng tooltip để giải thích các yêu cầu để khớp mẫu. Bạn cũng nên bao gồm các văn bản giải thích khác ở gần đó.

Xem phần [Xác thực mẫu](#pattern_validation) để biết chi tiết và ví dụ.

### placeholder

Thuộc tính `placeholder` là một chuỗi cung cấp gợi ý ngắn gọn cho người dùng về loại thông tin cần nhập vào trường. Nó phải là một từ hoặc cụm từ ngắn thể hiện kiểu dữ liệu mong đợi, thay vì một thông báo giải thích. Văn bản _không được_ chứa ký tự xuống dòng hay dòng mới.

Nếu nội dung của điều khiển có một hướng ({{Glossary("LTR")}} hoặc {{Glossary("RTL")}}) nhưng cần hiển thị placeholder theo hướng ngược lại, bạn có thể dùng ký tự định dạng thuật toán bidirectional Unicode để ghi đè hướng trong placeholder; xem [Cách sử dụng điều khiển Unicode cho văn bản bidi](https://www.w3.org/International/questions/qa-bidi-unicode-controls) để biết thêm.

> [!NOTE]
> Hãy tránh dùng thuộc tính `placeholder` nếu có thể. Nó không có giá trị ngữ nghĩa bằng các cách khác để giải thích biểu mẫu và có thể gây ra các sự cố kỹ thuật không mong muốn với nội dung của bạn. Xem [`<input>` labels](/en-US/docs/Web/HTML/Reference/Elements/input#labels) để biết thêm thông tin.

### readonly

Thuộc tính Boolean [`readonly`](/en-US/docs/Web/HTML/Reference/Attributes/readonly), khi có mặt, có nghĩa là trường này không thể được chỉnh sửa bởi người dùng. Tuy nhiên, `value` của nó vẫn có thể được thay đổi bằng mã JavaScript trực tiếp đặt thuộc tính `value` của {{domxref("HTMLInputElement")}}.

> [!NOTE]
> Vì trường chỉ đọc không thể có giá trị, [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required) không có tác dụng trên các ô nhập cũng có thuộc tính `readonly`.

### size

Thuộc tính `size` là giá trị số chỉ định số ký tự rộng của trường ô nhập. Giá trị phải là số lớn hơn không, và giá trị mặc định là 20. Vì độ rộng ký tự thay đổi, điều này có thể chính xác hoặc không và không nên dựa vào nó; ô nhập kết quả có thể hẹp hơn hoặc rộng hơn số ký tự được chỉ định, tùy thuộc vào ký tự và font chữ (cài đặt {{cssxref("font")}} đang được sử dụng).

Điều này _không_ đặt giới hạn về số ký tự người dùng có thể nhập vào trường. Nó chỉ chỉ định xấp xỉ bao nhiêu ký tự có thể được nhìn thấy cùng một lúc. Để đặt giới hạn trên về độ dài dữ liệu nhập, hãy dùng thuộc tính [`maxlength`](#maxlength).

### spellcheck

Thuộc tính toàn cục [`spellcheck`](/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck) được dùng để chỉ định có bật kiểm tra chính tả cho phần tử hay không. Nó có thể được dùng trên bất kỳ nội dung có thể chỉnh sửa nào, nhưng ở đây chúng ta xem xét các đặc thù liên quan đến việc dùng `spellcheck` trên các phần tử {{HTMLElement("input")}}. Các giá trị được phép cho `spellcheck` là:

- `false`
  - : Tắt kiểm tra chính tả cho phần tử này.
- `true`
  - : Bật kiểm tra chính tả cho phần tử này.
- "" (chuỗi rỗng) hoặc không có giá trị
  - : Theo hành vi mặc định của phần tử cho kiểm tra chính tả. Điều này có thể dựa trên cài đặt `spellcheck` của cha hoặc các yếu tố khác.

Trường ô nhập có thể được bật kiểm tra chính tả nếu nó không có thuộc tính [readonly](#readonly) được đặt và không bị vô hiệu hóa.

Giá trị được trả về khi đọc `spellcheck` có thể không phản ánh trạng thái thực tế của kiểm tra chính tả trong điều khiển nếu tùy chọn của {{Glossary("user agent", "user agent")}} ghi đè cài đặt.

## Sử dụng ô nhập URL

Khi bạn tạo ô nhập URL với giá trị `type` phù hợp, `url`, bạn nhận được xác thực tự động rằng văn bản nhập ít nhất ở định dạng đúng để có thể là URL hợp lệ. Điều này có thể giúp tránh các trường hợp người dùng nhầm địa chỉ trang web của họ, hoặc cung cấp địa chỉ không hợp lệ.

Tuy nhiên, điều quan trọng cần lưu ý là điều này chưa đủ để đảm bảo văn bản được chỉ định là URL thực sự tồn tại, tương ứng với người dùng của trang web, hoặc chấp nhận được theo bất kỳ cách nào khác. Nó chỉ đảm bảo giá trị của trường được định dạng đúng là URL.

> [!NOTE]
> Người dùng có thể can thiệp vào HTML của bạn, vì vậy trang web của bạn _không được_ dùng xác thực này cho bất kỳ mục đích bảo mật nào. Bạn _phải_ xác minh URL ở phía máy chủ của bất kỳ giao dịch nào mà văn bản được cung cấp có thể có bất kỳ ảnh hưởng bảo mật nào.

### Ô nhập URL cơ bản

Phần tử này được triển khai như trường ô nhập văn bản tiêu chuẩn với các tính năng xác thực cơ bản. Ở dạng cơ bản nhất, một ô nhập URL có thể được triển khai như sau:

```html
<input id="myURL" name="myURL" type="url" />
```

{{ EmbedLiveSample('A_basic_URL_input', 600, 40) }}

Lưu ý rằng nó được coi là hợp lệ khi rỗng và khi nhập một địa chỉ URL được định dạng hợp lệ, nhưng trong các trường hợp khác không được coi là hợp lệ. Bằng cách thêm thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required), chỉ các URL được định dạng đúng mới được phép; ô nhập không còn được coi là hợp lệ khi rỗng.

Không có gì đặc biệt ở đây. Gửi biểu mẫu này sẽ khiến dữ liệu sau được gửi đến máy chủ: `myURL=http%3A%2F%2Fwww.example.com`. Lưu ý cách các ký tự được thoát khi cần thiết.

### Placeholder

Đôi khi hữu ích khi cung cấp gợi ý theo ngữ cảnh về dạng dữ liệu đầu vào cần có. Điều này đặc biệt quan trọng nếu thiết kế trang không cung cấp nhãn mô tả cho mỗi {{HTMLElement("input")}}. Đây là lúc **placeholder** phát huy tác dụng. Placeholder là giá trị thể hiện dạng mà `value` nên có bằng cách trình bày ví dụ về giá trị hợp lệ, được hiển thị bên trong hộp chỉnh sửa khi `value` của phần tử là "". Khi dữ liệu được nhập vào hộp, placeholder biến mất; nếu hộp được xóa trống, placeholder xuất hiện lại.

Ở đây, chúng ta có ô nhập `url` với placeholder `http://www.example.com`. Lưu ý cách placeholder biến mất và xuất hiện lại khi bạn thao tác nội dung của trường chỉnh sửa.

```html
<input
  id="myURL"
  name="myURL"
  type="url"
  placeholder="http://www.example.com" />
```

{{ EmbedLiveSample('Placeholders', 600, 40) }}

### Kiểm soát kích thước ô nhập

Bạn có thể kiểm soát cả kích thước vật lý của hộp ô nhập và độ dài tối thiểu và tối đa được phép cho văn bản nhập.

#### Kích thước vật lý của phần tử ô nhập

Kích thước vật lý của hộp ô nhập có thể được kiểm soát bằng thuộc tính [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size). Với nó, bạn có thể chỉ định số ký tự mà hộp ô nhập có thể hiển thị cùng một lúc. Trong ví dụ này, hộp chỉnh sửa `url` rộng 30 ký tự:

```html
<input id="myURL" name="myURL" type="url" size="30" />
```

{{ EmbedLiveSample('Physical_input_element_size', 600, 40) }}

#### Độ dài giá trị phần tử

`size` tách biệt với giới hạn độ dài trên chính URL được nhập. Bạn có thể chỉ định độ dài tối thiểu, tính bằng ký tự, cho URL được nhập bằng thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Elements/input#minlength); tương tự, dùng [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/input#maxlength) để đặt độ dài tối đa của URL được nhập. Nếu `maxLength` vượt quá `size`, nội dung hộp ô nhập sẽ cuộn khi cần để hiển thị vùng chọn hoặc điểm chèn hiện tại khi nội dung được thao tác.

Ví dụ dưới đây tạo hộp nhập địa chỉ URL rộng 30 ký tự, yêu cầu nội dung không ngắn hơn 10 ký tự và không dài hơn 80 ký tự.

```html
<input
  id="myURL"
  name="myURL"
  type="url"
  size="30"
  minlength="10"
  maxlength="80" />
```

{{EmbedLiveSample("Element_value_length", 600, 40) }}

> [!NOTE]
> Các thuộc tính này cũng ảnh hưởng đến xác thực; giá trị ngắn hơn hoặc dài hơn độ dài tối thiểu/tối đa được chỉ định sẽ được phân loại là không hợp lệ; ngoài ra hầu hết các trình duyệt sẽ từ chối cho phép người dùng nhập giá trị dài hơn độ dài tối đa được chỉ định.

### Cung cấp tùy chọn mặc định

#### Cung cấp một giá trị mặc định bằng thuộc tính value

Như thường lệ, bạn có thể cung cấp giá trị mặc định cho hộp ô nhập `url` bằng cách đặt thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value):

```html
<input id="myURL" name="myURL" type="url" value="http://www.example.com" />
```

{{EmbedLiveSample("Providing_a_single_default_using_the_value_attribute", 600, 40)}}

#### Cung cấp giá trị gợi ý

Tiến thêm một bước, bạn có thể cung cấp danh sách các tùy chọn mặc định mà người dùng có thể chọn bằng cách chỉ định thuộc tính [`list`](/en-US/docs/Web/HTML/Reference/Elements/input#list). Điều này không giới hạn người dùng vào những tùy chọn đó, nhưng cho phép họ chọn các URL thường dùng nhanh hơn. Điều này cũng cung cấp gợi ý cho [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete). Thuộc tính `list` chỉ định ID của {{HTMLElement("datalist")}}, lần lượt chứa một phần tử {{HTMLElement("option")}} cho mỗi giá trị gợi ý; `value` của mỗi `option` là giá trị gợi ý tương ứng cho hộp nhập URL.

```html
<input id="myURL" name="myURL" type="url" list="defaultURLs" />

<datalist id="defaultURLs">
  <option value="https://developer.mozilla.org/"></option>
  <option value="http://www.google.com/"></option>
  <option value="http://www.microsoft.com/"></option>
  <option value="https://www.mozilla.org/"></option>
  <option value="http://w3.org/"></option>
</datalist>
```

{{EmbedLiveSample("Offering_suggested_values", 600, 40)}}

Với phần tử {{HTMLElement("datalist")}} và các {{HTMLElement("option")}} của nó, trình duyệt sẽ cung cấp các giá trị được chỉ định là các giá trị tiềm năng cho URL; điều này thường được hiển thị dưới dạng menu bật lên hoặc thả xuống chứa các gợi ý. Khi người dùng gõ, danh sách được điều chỉnh để chỉ hiển thị các giá trị khớp. Mỗi ký tự được gõ thu hẹp danh sách cho đến khi người dùng thực hiện lựa chọn hoặc gõ giá trị tùy chỉnh.

#### Sử dụng nhãn cho các giá trị gợi ý

Bạn có thể chọn bao gồm thuộc tính [`label`](/en-US/docs/Web/HTML/Reference/Elements/option#label) trên một hoặc tất cả các phần tử `<option>` để cung cấp nhãn văn bản. Một số trình duyệt có thể chỉ hiển thị nhãn, trong khi các trình duyệt khác có thể hiển thị cả nhãn và URL.

```html
<input id="myURL" name="myURL" type="url" list="defaultURLs" />

<datalist id="defaultURLs">
  <option value="https://developer.mozilla.org/" label="MDN Web Docs"></option>
  <option value="http://www.google.com/" label="Google"></option>
  <option value="http://www.microsoft.com/" label="Microsoft"></option>
  <option value="https://www.mozilla.org/" label="Mozilla"></option>
  <option value="http://w3.org/" label="W3C"></option>
</datalist>
```

{{EmbedLiveSample("Using_labels_for_suggested_values", 600, 40)}}

## Xác thực

Có hai cấp độ xác thực nội dung có sẵn cho ô nhập `url`. Đầu tiên là cấp độ xác thực tiêu chuẩn được cung cấp cho tất cả {{HTMLElement("input")}}s, tự động đảm bảo nội dung đáp ứng các yêu cầu để là URL hợp lệ. Nhưng cũng có tùy chọn thêm bộ lọc bổ sung để đảm bảo các nhu cầu chuyên biệt của bạn được đáp ứng, nếu có.

> [!WARNING]
> Xác thực biểu mẫu HTML _không_ phải là thay thế cho các script đảm bảo rằng dữ liệu nhập có định dạng phù hợp. Rất dễ dàng để ai đó điều chỉnh HTML để vượt qua xác thực hoặc xóa nó hoàn toàn. Cũng có thể ai đó bỏ qua HTML của bạn và gửi dữ liệu trực tiếp đến máy chủ của bạn. Nếu mã phía máy chủ của bạn không xác thực dữ liệu nhận được, sẽ xảy ra thảm họa khi dữ liệu định dạng sai (hoặc quá lớn, sai loại, v.v.) được nhập vào cơ sở dữ liệu của bạn.

### Xác thực cơ bản

Các trình duyệt hỗ trợ kiểu ô nhập `url` tự động cung cấp xác thực để đảm bảo chỉ văn bản khớp với định dạng URL chuẩn mới được nhập vào hộp ô nhập.

Cú pháp của URL khá phức tạp. Nó được xác định bởi [URL Living Standard](https://url.spec.whatwg.org/) của WHATWG và được mô tả cho người mới bắt đầu trong bài viết [URL là gì?](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL)

### Làm URL bắt buộc

Như đã đề cập trước đó, để yêu cầu nhập URL trước khi biểu mẫu có thể được gửi (bạn không thể để trống trường), bạn chỉ cần thêm thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) vào ô nhập.

### Xác thực mẫu

Nếu bạn cần URL nhập bị giới hạn thêm ngoài "bất kỳ chuỗi nào trông giống URL," bạn có thể dùng thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) để chỉ định {{Glossary("regular expression")}} mà giá trị phải khớp để giá trị hợp lệ.

## Ví dụ

### Xác thực URL

Trong ví dụ này, chúng ta đảm bảo URL được điền bằng thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) và URL là trên `mozilla.org` bằng thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) để minh họa.

#### HTML

Trong ô nhập `url`, chúng ta đặt `pattern` thành `".*\.mozilla\.org.*"`. Biểu thức chính quy này xác thực chuỗi có bất kỳ số ký tự nào, theo sau là ".mozilla.org", theo sau là bất kỳ số ký tự nào. Vì trình duyệt chạy cả bộ lọc URL tiêu chuẩn _và_ mẫu tùy chỉnh của chúng ta trên văn bản được chỉ định, chúng ta kết thúc với xác thực nói "đảm bảo đây là URL hợp lệ và cũng chứa `.mozilla.org`."

Lưu ý rằng mẫu nghiêm ngặt như `https://developer\.mozilla\.org.*` sẽ mạnh hơn, nhưng điều đó sẽ làm cho thuộc tính `type="url"` trở nên thừa trong trường hợp này.

Thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title) cũng mô tả `pattern` cho người dùng có công nghệ hỗ trợ.

```html live-sample___url-validation
<form>
  <label for="myURL">
    Enter a url from this site:
    <input
      id="myURL"
      name="myURL"
      type="url"
      required
      pattern=".*\.mozilla\.org.*"
      title="URL should include mozilla.org" />
    <span class="validity"></span>
  </label>
  <button>Submit</button>
</form>
```

#### CSS

CSS cung cấp các gợi ý trực quan để chỉ ra liệu nội dung có phải là {{cssxref(":valid")}} hay {{cssxref(":invalid")}} bằng cách thêm thuộc tính {{cssxref("content")}} phù hợp và bao gồm [văn bản thay thế](/en-US/docs/Web/CSS/Reference/Properties/content#alternative_text_string_counter_attr) cho người dùng có công nghệ hỗ trợ.

```css live-sample___url-validation
input:focus:invalid {
  outline: 2px solid red;
}

input:focus:valid {
  outline: 2px solid green;
}

input + span {
  padding: 0 0.3rem;
}

input:invalid + span::after {
  content: "✖" / "Content is not valid";
  color: red;
}

input:valid + span::after {
  content: "✓" / "Content is valid";
  color: green;
}
```

#### Kết quả

Sao chép URL của trang này và dán vào trường ô nhập và bạn sẽ thấy đường viền xanh lá và dấu tích xanh lá. Nhập bất kỳ URL nào khác không chứa **mozilla.org** hoặc URL không hợp lệ và bạn sẽ thấy đường viền đỏ và dấu chéo đỏ.

{{EmbedLiveSample("url-validation", "40px", , , , , "allow-forms")}}

Kiểm tra các phần [Xác thực mẫu](#pattern_validation) và [Sử dụng ô nhập URL](#using_url_inputs) để biết thêm ví dụ.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>Một chuỗi đại diện cho URL, hoặc rỗng</td>
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
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#readonly"><code>readonly</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#required"><code>required</code></a> và
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#size"><code>size</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td>
        <code>list</code>, <code>value</code>, <code>selectionEnd</code>,
        <code>selectionDirection</code>
      </td>
    </tr>
    <tr>
      <td><strong>Giao diện DOM</strong></td>
      <td><p>{{domxref("HTMLInputElement")}}</p></td>
    </tr>
    <tr>
      <td><strong>Phương thức</strong></td>
      <td>
        {{domxref("HTMLInputElement.select", "select()")}},
        {{domxref("HTMLInputElement.setRangeText", "setRangeText()")}}
        và
        {{domxref("HTMLInputElement.setSelectionRange", "setSelectionRange()")}}.
      </td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td>
        không có thuộc tính <code>list</code>:
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role">textbox</a></code><br />
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

- [Hướng dẫn biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms)
- {{HTMLElement("input")}}
- [`<input type="tel">`](/en-US/docs/Web/HTML/Reference/Elements/input/tel)
- [`<input type="email">`](/en-US/docs/Web/HTML/Reference/Elements/input/email)
