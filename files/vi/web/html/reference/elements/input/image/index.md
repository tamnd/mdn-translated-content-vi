---
title: <input type="image">
slug: Web/HTML/Reference/Elements/input/image
page-type: html-attribute-value
browser-compat: html.elements.input.type_image
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} có kiểu **`image`** được dùng để tạo các nút gửi đồ họa, tức là các nút gửi có dạng hình ảnh thay vì văn bản.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;image&quot;&gt;", "tabbed-standard")}}

```html interactive-example
<p>Sign in to your account:</p>

<div>
  <label for="userId">User ID</label>
  <input type="text" id="userId" name="userId" />
</div>

<input
  type="image"
  id="image"
  alt="Login"
  src="/shared-assets/images/examples/login-button.png" />
```

```css interactive-example
label {
  font-size: 0.8rem;
}

label,
input[type="image"] {
  margin-top: 1rem;
}

input[type="image"] {
  width: 80px;
}
```

## Giá trị

Các phần tử `<input type="image">` không chấp nhận thuộc tính `value`. Đường dẫn đến hình ảnh sẽ hiển thị được chỉ định trong thuộc tính `src`.

## Thuộc tính bổ sung

Ngoài các thuộc tính được chia sẻ bởi tất cả các phần tử {{HTMLElement("input")}}, đầu vào nút hình ảnh hỗ trợ các thuộc tính sau.

### alt

Thuộc tính `alt` cung cấp chuỗi thay thế để sử dụng làm nhãn nút nếu hình ảnh không thể hiển thị (do lỗi, {{Glossary("user agent")}} không thể hoặc được cấu hình để không hiển thị hình ảnh, hoặc nếu người dùng đang dùng thiết bị đọc màn hình). Nếu được cung cấp, nó phải là chuỗi không rỗng phù hợp làm nhãn cho nút.

Ví dụ: nếu bạn có nút đồ họa hiển thị hình ảnh với biểu tượng và/hoặc văn bản hình ảnh "Login Now", bạn cũng nên đặt thuộc tính `alt` thành điều gì đó như `Login Now`.

> [!NOTE]
> Mặc dù thuộc tính `alt` về mặt kỹ thuật là tùy chọn, bạn nên luôn bao gồm một để tối đa hóa khả năng sử dụng của nội dung.

Về mặt chức năng, thuộc tính `alt` của phần tử `<input type="image">` hoạt động giống như thuộc tính [`alt`](/en-US/docs/Web/HTML/Reference/Elements/img#alt) trên các phần tử {{HTMLElement("img")}}.

### formaction

Chuỗi chỉ định URL để gửi dữ liệu đến. Điều này có ưu tiên hơn thuộc tính [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) trên phần tử {{HTMLElement("form")}} sở hữu {{HTMLElement("input")}}.

Thuộc tính này cũng có sẵn trên các phần tử [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit) và {{HTMLElement("button")}}.

### formenctype

Chuỗi xác định phương thức mã hóa sử dụng khi gửi dữ liệu biểu mẫu lên máy chủ. Có ba giá trị được phép:

- `application/x-www-form-urlencoded`
  - : Đây là giá trị mặc định, gửi dữ liệu biểu mẫu dưới dạng chuỗi sau khi {{Glossary("Percent-encoding", "mã hóa phần trăm")}} văn bản bằng thuật toán như {{jsxref("encodeURI", "encodeURI()")}}.
- `multipart/form-data`
  - : Sử dụng API {{domxref("FormData")}} để quản lý dữ liệu, cho phép gửi tệp lên máy chủ. Bạn _phải_ sử dụng kiểu mã hóa này nếu biểu mẫu của bạn bao gồm bất kỳ phần tử {{HTMLElement("input")}} nào có [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `file` ([`<input type="file">`](/en-US/docs/Web/HTML/Reference/Elements/input/file)).
- `text/plain`
  - : Văn bản thuần túy; chủ yếu hữu ích chỉ để gỡ lỗi, để bạn có thể dễ dàng nhìn thấy dữ liệu sẽ được gửi.

Nếu được chỉ định, giá trị của thuộc tính `formenctype` ghi đè thuộc tính [`enctype`](/en-US/docs/Web/HTML/Reference/Elements/form#enctype) của biểu mẫu sở hữu.

Thuộc tính này cũng có sẵn trên các phần tử [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit) và {{HTMLElement("button")}}.

### formmethod

Chuỗi chỉ định phương thức HTTP dùng khi gửi dữ liệu biểu mẫu; giá trị này ghi đè bất kỳ thuộc tính [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method) nào được đặt trên biểu mẫu sở hữu. Các giá trị được phép là:

- `get`
  - : URL được xây dựng bằng cách bắt đầu với URL được đưa ra bởi thuộc tính `formaction` hoặc [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action), thêm ký tự dấu hỏi ("?"), sau đó thêm dữ liệu biểu mẫu được mã hóa như được mô tả bởi `formenctype` hoặc thuộc tính [`enctype`](/en-US/docs/Web/HTML/Reference/Elements/form#enctype) của biểu mẫu. URL này sau đó được gửi lên máy chủ bằng yêu cầu HTTP {{HTTPMethod("get")}}. Phương thức này hoạt động tốt cho các biểu mẫu chỉ chứa các ký tự {{Glossary("ASCII")}} và không có tác dụng phụ. Đây là giá trị mặc định.
- `post`
  - : Dữ liệu biểu mẫu được đưa vào phần thân của yêu cầu được gửi đến URL được đưa ra bởi thuộc tính `formaction` hoặc [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) bằng yêu cầu HTTP {{HTTPMethod("post")}}. Phương thức này hỗ trợ dữ liệu phức tạp và tệp đính kèm.
- `dialog`
  - : Phương thức này được dùng để cho biết nút đóng hộp thoại liên kết với đầu vào và không truyền dữ liệu biểu mẫu chút nào.

Thuộc tính này cũng có sẵn trên các phần tử [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit) và {{HTMLElement("button")}}.

### formnovalidate

Thuộc tính Boolean mà khi có mặt, chỉ định rằng biểu mẫu không nên được xác thực trước khi gửi lên máy chủ. Điều này ghi đè giá trị của thuộc tính [`novalidate`](/en-US/docs/Web/HTML/Reference/Elements/form#novalidate) trên biểu mẫu sở hữu phần tử.

Thuộc tính này cũng có sẵn trên các phần tử [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit) và {{HTMLElement("button")}}.

### formtarget

Chuỗi chỉ định tên hoặc từ khóa cho biết nơi hiển thị phản hồi nhận được sau khi gửi biểu mẫu. Chuỗi phải là tên của **ngữ cảnh duyệt** (tức là tab, cửa sổ hoặc {{HTMLElement("iframe")}}. Giá trị được chỉ định ở đây ghi đè bất kỳ đích nào được đưa ra bởi thuộc tính [`target`](/en-US/docs/Web/HTML/Reference/Elements/form#target) trên {{HTMLElement("form")}} sở hữu đầu vào này.

Ngoài các tên thực tế của tab, cửa sổ hoặc khung nội tuyến, có một vài từ khóa đặc biệt có thể được sử dụng:

- `_self`
  - : Tải phản hồi vào cùng ngữ cảnh duyệt chứa biểu mẫu. Điều này sẽ thay thế tài liệu hiện tại bằng dữ liệu đã nhận. Đây là giá trị mặc định được sử dụng nếu không có giá trị nào được chỉ định.
- `_blank`
  - : Tải phản hồi vào ngữ cảnh duyệt mới, không có tên. Đây thường là tab mới trong cùng cửa sổ với tài liệu hiện tại, nhưng có thể khác nhau tùy thuộc vào cấu hình của {{Glossary("user agent")}}.
- `_parent`
  - : Tải phản hồi vào ngữ cảnh duyệt cha của ngữ cảnh hiện tại. Nếu không có ngữ cảnh cha, điều này hoạt động giống như `_self`.
- `_top`
  - : Tải phản hồi vào ngữ cảnh duyệt cấp cao nhất; đây là ngữ cảnh duyệt là tổ tiên trên cùng của ngữ cảnh hiện tại. Nếu ngữ cảnh hiện tại là ngữ cảnh trên cùng, điều này hoạt động giống như `_self`.

Thuộc tính này cũng có sẵn trên các phần tử [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit) và {{HTMLElement("button")}}.

### height

Số chỉ định chiều cao, theo pixel CSS, để vẽ hình ảnh được chỉ định bởi thuộc tính `src`.

### src

Chuỗi chỉ định URL của tệp hình ảnh cần hiển thị để đại diện cho nút gửi đồ họa. Khi người dùng tương tác với hình ảnh, đầu vào được xử lý như bất kỳ đầu vào nút nào khác.

### width

Số chỉ định chiều rộng để vẽ hình ảnh, theo pixel CSS.

## Thuộc tính lỗi thời

Thuộc tính sau được xác định bởi HTML 4 cho đầu vào `image`, nhưng không được triển khai bởi tất cả trình duyệt và đã bị lỗi thời kể từ đó.

### usemap

Nếu `usemap` được chỉ định, nó phải là tên của phần tử image map, {{HTMLElement("map")}}, xác định image map để sử dụng với hình ảnh. Cách sử dụng này đã lỗi thời; bạn nên chuyển sang sử dụng phần tử {{HTMLElement("img")}} khi bạn muốn sử dụng image map.

## Sử dụng đầu vào image

Phần tử `<input type="image">` là {{ glossary("replaced elements", "phần tử được thay thế")}} (phần tử mà nội dung không được tạo ra hoặc quản lý trực tiếp bởi lớp CSS), hoạt động phần lớn theo cùng cách như phần tử {{htmlelement("img")}} thông thường, nhưng với khả năng của [nút gửi](/en-US/docs/Web/HTML/Reference/Elements/input/submit).

### Tính năng cơ bản của đầu vào image

Hãy xem một ví dụ cơ bản bao gồm tất cả các tính năng cơ bản bạn cần sử dụng (Chúng hoạt động chính xác giống như trên phần tử `<img>`.):

```html
<input
  id="image"
  type="image"
  width="100"
  height="30"
  alt="Login"
  src="https://raw.githubusercontent.com/mdn/learning-area/master/html/forms/image-type-example/login.png" />
```

{{ EmbedLiveSample('Essential_image_input_features', 600, 50) }}

- Thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/input#src) được dùng để chỉ định đường dẫn đến hình ảnh bạn muốn hiển thị trong nút.
- Thuộc tính [`alt`](/en-US/docs/Web/HTML/Reference/Elements/input#alt) cung cấp văn bản thay thế cho hình ảnh, để người dùng đọc màn hình có thể hiểu rõ hơn nút được dùng để làm gì. Nó cũng sẽ hiển thị nếu hình ảnh không thể hiển thị vì bất kỳ lý do nào (ví dụ: đường dẫn bị sai). Nếu có thể, hãy sử dụng văn bản khớp với nhãn bạn sẽ sử dụng nếu bạn đang sử dụng nút gửi tiêu chuẩn.
- Các thuộc tính [`width`](/en-US/docs/Web/HTML/Reference/Elements/input#width) và [`height`](/en-US/docs/Web/HTML/Reference/Elements/input#height) được dùng để chỉ định chiều rộng và chiều cao mà hình ảnh sẽ được hiển thị, theo pixel. Nút có cùng kích thước với hình ảnh; nếu bạn cần vùng nhấn của nút lớn hơn hình ảnh, bạn sẽ cần sử dụng CSS (ví dụ: {{cssxref("padding")}}). Ngoài ra, nếu bạn chỉ chỉ định một chiều, chiều kia sẽ tự động điều chỉnh để hình ảnh duy trì {{glossary("aspect ratio")}} ban đầu.

### Ghi đè hành vi biểu mẫu mặc định

Các phần tử `<input type="image">` — như [nút gửi](/en-US/docs/Web/HTML/Reference/Elements/input/submit) thông thường — có thể chấp nhận một số thuộc tính ghi đè hành vi biểu mẫu mặc định:

- `formaction`
  - : URI của chương trình xử lý thông tin được gửi bởi phần tử đầu vào; ghi đè thuộc tính [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) của biểu mẫu sở hữu phần tử.
- `formenctype`
  - : Chỉ định loại nội dung được dùng để gửi biểu mẫu lên máy chủ. Các giá trị có thể là:
    - `application/x-www-form-urlencoded`: Giá trị mặc định nếu thuộc tính không được chỉ định.
    - `text/plain`.

    Nếu thuộc tính này được chỉ định, nó ghi đè thuộc tính [`enctype`](/en-US/docs/Web/HTML/Reference/Elements/form#enctype) của biểu mẫu sở hữu phần tử.

- `formmethod`
  - : Chỉ định phương thức HTTP mà trình duyệt sử dụng để gửi biểu mẫu. Các giá trị có thể là:
    - `post`: Dữ liệu từ biểu mẫu được đưa vào phần thân của biểu mẫu và được gửi lên máy chủ.
    - `get`: Dữ liệu từ biểu mẫu được thêm vào URI thuộc tính **`form`**, với '?' là dấu phân cách, và URI kết quả được gửi lên máy chủ. Sử dụng phương thức này khi biểu mẫu không có tác dụng phụ và chỉ chứa các ký tự ASCII.

    Nếu được chỉ định, thuộc tính này ghi đè thuộc tính [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method) của biểu mẫu sở hữu phần tử.

- `formnovalidate`
  - : Thuộc tính Boolean chỉ định rằng biểu mẫu không được xác thực khi gửi. Nếu thuộc tính này được chỉ định, nó ghi đè thuộc tính [`novalidate`](/en-US/docs/Web/HTML/Reference/Elements/form#novalidate) của biểu mẫu sở hữu phần tử.
- `formtarget`
  - : Tên hoặc từ khóa cho biết nơi hiển thị phản hồi nhận được sau khi gửi biểu mẫu. Đây là tên hoặc từ khóa cho _ngữ cảnh duyệt_ (ví dụ: tab, cửa sổ hoặc khung nội tuyến). Nếu thuộc tính này được chỉ định, nó ghi đè thuộc tính [`target`](/en-US/docs/Web/HTML/Reference/Elements/form#target) của biểu mẫu sở hữu phần tử. Các từ khóa sau có ý nghĩa đặc biệt:
    - `_self`: Tải phản hồi vào cùng ngữ cảnh duyệt hiện tại. Giá trị này là mặc định nếu thuộc tính không được chỉ định.
    - `_blank`: Tải phản hồi vào ngữ cảnh duyệt mới không có tên.
    - `_parent`: Tải phản hồi vào ngữ cảnh duyệt cha của ngữ cảnh hiện tại. Nếu không có cha, tùy chọn này hoạt động giống như `_self`.
    - `_top`: Tải phản hồi vào ngữ cảnh duyệt cấp cao nhất (tức là ngữ cảnh duyệt là tổ tiên của ngữ cảnh hiện tại và không có cha). Nếu không có cha, tùy chọn này hoạt động giống như `_self`.

### Sử dụng các điểm dữ liệu x và y

Khi bạn gửi biểu mẫu bằng nút được tạo bằng `<input type="image">`, hai điểm dữ liệu bổ sung được gửi lên máy chủ tự động bởi trình duyệt — `x` và `y`. Bạn có thể thấy điều này trong [ví dụ tọa độ X Y](https://mdn.github.io/learning-area/html/forms/image-type-example/xy-coordinates-example.html) của chúng ta.

Khi bạn nhấp vào hình ảnh để gửi biểu mẫu, bạn sẽ thấy dữ liệu được thêm vào URL dưới dạng tham số, ví dụ: `?x=52&y=55`. Nếu đầu vào hình ảnh có thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name), thì lưu ý rằng tên được chỉ định có tiền tố trên mỗi thuộc tính, vì vậy nếu `name` là `position`, tọa độ trả về sẽ được định dạng trong URL là `?position.x=52&position.y=55`. Điều này tất nhiên áp dụng cho tất cả các thuộc tính khác.

Đây là tọa độ X và Y của hình ảnh mà chuột đã nhấp vào để gửi biểu mẫu, trong đó (0,0) là góc trên bên trái của hình ảnh và mặc định trong trường hợp gửi xảy ra mà không có nhấp chuột vào hình ảnh. Chúng có thể được sử dụng khi vị trí hình ảnh được nhấp vào có ý nghĩa, ví dụ: bạn có thể có bản đồ mà khi được nhấp vào, gửi tọa độ được nhấp lên máy chủ. Mã phía máy chủ sau đó tìm ra vị trí nào đã được nhấp và trả về thông tin về các địa điểm gần đó.

Trong ví dụ trên của chúng ta, chúng ta có thể viết mã phía máy chủ tìm ra màu nào đã được nhấp dựa trên tọa độ được gửi và theo dõi số phiếu bầu cho màu yêu thích.

### Điều chỉnh vị trí và thuật toán thu nhỏ hình ảnh

Bạn có thể dùng thuộc tính {{cssxref("object-position")}} để điều chỉnh vị trí của hình ảnh trong khung phần tử `<input>`, và thuộc tính {{cssxref("object-fit")}} để kiểm soát cách kích thước hình ảnh được điều chỉnh để vừa với khung. Điều này cho phép bạn chỉ định khung cho hình ảnh bằng cách sử dụng các thuộc tính `width` và `height` để tạo không gian trong bố cục, sau đó điều chỉnh nơi hình ảnh đặt trong không gian đó và cách (hoặc nếu) nó được thu nhỏ để chiếm không gian đó.

## Ví dụ

### Biểu mẫu đăng nhập

Ví dụ sau đây cho thấy cùng nút như trước, nhưng được bao gồm trong ngữ cảnh biểu mẫu đăng nhập điển hình.

{{ EmbedLiveSample('A_login_form', 600, 170) }}

#### HTML

```html
<form>
  <p>Login to your account</p>
  <div>
    <label for="userId">User ID</label>
    <input type="text" id="userId" name="userId" />
  </div>
  <div>
    <label for="pwd">Password</label>
    <input type="password" id="pwd" name="pwd" />
  </div>
  <div>
    <input
      id="image"
      type="image"
      src="https://raw.githubusercontent.com/mdn/learning-area/master/html/forms/image-type-example/login.png"
      alt="Login"
      width="100" />
  </div>
</form>
```

#### CSS

Và một số CSS để làm cho các phần tử cơ bản ngồi gọn hơn:

```css
div {
  margin-bottom: 10px;
}

label {
  display: inline-block;
  width: 70px;
  text-align: right;
  padding-right: 10px;
}
```

### Điều chỉnh vị trí và thu nhỏ hình ảnh

Trong ví dụ này, chúng ta điều chỉnh ví dụ trước để dành thêm không gian cho hình ảnh rồi điều chỉnh kích thước và vị trí thực tế của hình ảnh bằng cách sử dụng {{cssxref("object-fit")}} và {{cssxref("object-position")}}.

{{EmbedLiveSample("Adjusting_the_image_position_and_scaling", 600, 300)}}

#### HTML

```html
<form>
  <p>Login to your account</p>
  <div>
    <label for="userId">User ID</label>
    <input type="text" id="userId" name="userId" />
  </div>
  <div>
    <label for="pwd">Password</label>
    <input type="password" id="pwd" name="pwd" />
  </div>
  <div>
    <input
      id="image"
      type="image"
      src="https://raw.githubusercontent.com/mdn/learning-area/master/html/forms/image-type-example/login.png"
      alt="Login"
      width="200"
      height="100" />
  </div>
</form>
```

#### CSS

```css
div {
  margin-bottom: 10px;
}

label {
  display: inline-block;
  width: 70px;
  text-align: right;
  padding-right: 10px;
}

#image {
  object-position: right top;
  object-fit: contain;
  background-color: #dddddd;
}
```

Ở đây, `object-position` được cấu hình để vẽ hình ảnh ở góc trên bên phải của phần tử, trong khi `object-fit` được đặt thành `contain`, cho biết hình ảnh nên được vẽ ở kích thước lớn nhất sẽ vừa trong hộp của phần tử mà không làm thay đổi tỷ lệ khung hình. Lưu ý nền xám hiển thị của phần tử vẫn hiển thị ở khu vực không được hình ảnh che.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>Không có — thuộc tính <code>value</code> không nên được chỉ định.</td>
    </tr>
    <tr>
      <td><strong>Sự kiện</strong></td>
      <td>Không có.</td>
    </tr>
    <tr>
      <td><strong>Thuộc tính chung được hỗ trợ</strong></td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#alt"><code>alt</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#src"><code>src</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#width"><code>width</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#height"><code>height</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#formaction"><code>formaction</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#formenctype"><code>formenctype</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#formmethod"><code>formmethod</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#formmethod"><code>formnovalidate</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#formtarget"><code>formtarget</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td>Không có.</td>
    </tr>
    <tr>
      <td><strong>Giao diện DOM</strong></td>
      <td><p>{{domxref("HTMLInputElement")}}</p></td>
    </tr>
    <tr>
      <td><strong>Phương thức</strong></td>
      <td>Không có.</td>
    </tr>
     <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role"><code>button</code></a></td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}} và giao diện {{domxref("HTMLInputElement")}} thực thi nó.
- Phần tử {{HTMLElement("img")}} HTML
- Định vị và thu nhỏ hình ảnh trong khung phần tử `<input>`: {{cssxref("object-position")}} và {{cssxref("object-fit")}}
