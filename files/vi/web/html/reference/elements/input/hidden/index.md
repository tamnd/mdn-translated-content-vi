---
title: <input type="hidden">
slug: Web/HTML/Reference/Elements/input/hidden
page-type: html-attribute-value
browser-compat: html.elements.input.type_hidden
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} có kiểu **`hidden`** cho phép nhà phát triển web đưa vào dữ liệu không thể được người dùng nhìn thấy hoặc sửa đổi khi biểu mẫu được gửi. Ví dụ: ID của nội dung hiện đang được đặt hàng hoặc chỉnh sửa, hoặc mã thông báo bảo mật duy nhất. Các đầu vào ẩn hoàn toàn vô hình trong trang được hiển thị và không có cách nào để làm nó hiển thị trong nội dung trang.

> [!NOTE]
> Các sự kiện {{domxref("Element/input_event", "input")}} và {{domxref("HTMLElement/change_event", "change")}} không áp dụng cho kiểu đầu vào này. Đầu vào ẩn không thể được focus ngay cả bằng JavaScript (ví dụ: `hiddenInput.focus()`).

## Giá trị

Thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của phần tử {{HTMLElement("input")}} chứa chuỗi chứa dữ liệu ẩn bạn muốn đưa vào khi biểu mẫu được gửi lên máy chủ. Điều này cụ thể không thể được chỉnh sửa hoặc nhìn thấy bởi người dùng qua giao diện người dùng, mặc dù bạn có thể chỉnh sửa giá trị qua công cụ phát triển trình duyệt.

> [!WARNING]
> Mặc dù giá trị không được hiển thị cho người dùng trong nội dung trang, nó có thể nhìn thấy — và có thể chỉnh sửa — bằng cách sử dụng công cụ phát triển của bất kỳ trình duyệt nào hoặc chức năng "View Source". Đừng dựa vào đầu vào `hidden` như một hình thức bảo mật.

## Thuộc tính bổ sung

Ngoài các thuộc tính chung cho tất cả các phần tử {{HTMLElement("input")}}, đầu vào `hidden` cung cấp các thuộc tính sau.

### name

Đây thực sự là một trong các thuộc tính chung, nhưng nó có ý nghĩa đặc biệt cho đầu vào ẩn. Thông thường, thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name) hoạt động trên đầu vào ẩn giống như trên bất kỳ đầu vào nào khác. Tuy nhiên, khi biểu mẫu được gửi, đầu vào ẩn có `name` được đặt thành `_charset_` sẽ tự động được báo cáo với giá trị được đặt thành mã hóa ký tự dùng để gửi biểu mẫu.

## Sử dụng đầu vào ẩn

Như đã đề cập ở trên, đầu vào ẩn có thể được sử dụng ở bất kỳ đâu khi bạn muốn bao gồm dữ liệu mà người dùng không thể nhìn thấy hoặc chỉnh sửa cùng với biểu mẫu khi nó được gửi lên máy chủ. Hãy xem một số ví dụ minh họa cách sử dụng.

### Theo dõi nội dung đã chỉnh sửa

Một trong những cách sử dụng phổ biến nhất cho đầu vào ẩn là theo dõi bản ghi cơ sở dữ liệu nào cần được cập nhật khi biểu mẫu chỉnh sửa được gửi. Quy trình làm việc điển hình trông như thế này:

1. Người dùng quyết định chỉnh sửa một số nội dung họ có quyền kiểm soát, chẳng hạn như bài đăng blog hoặc mục sản phẩm. Họ bắt đầu bằng cách nhấn nút chỉnh sửa.
2. Nội dung cần chỉnh sửa được lấy từ cơ sở dữ liệu và tải vào biểu mẫu HTML để cho phép người dùng thực hiện thay đổi.
3. Sau khi chỉnh sửa, người dùng gửi biểu mẫu và dữ liệu được cập nhật được gửi lại máy chủ để cập nhật vào cơ sở dữ liệu.

Ý tưởng ở đây là trong bước 2, ID của bản ghi đang được cập nhật được giữ trong đầu vào ẩn. Khi biểu mẫu được gửi trong bước 3, ID tự động được gửi lại máy chủ cùng với nội dung bản ghi. ID cho phép thành phần phía máy chủ của trang biết chính xác bản ghi nào cần được cập nhật với dữ liệu đã gửi.

Bạn có thể xem ví dụ đầy đủ về điều này trong phần [Ví dụ](#examples) bên dưới.

### Cải thiện bảo mật trang web

Đầu vào ẩn cũng được dùng để lưu trữ và gửi mã thông báo bảo mật hoặc _bí mật_, nhằm mục đích cải thiện bảo mật trang web. Ý tưởng cơ bản là nếu người dùng đang điền vào biểu mẫu nhạy cảm, chẳng hạn như biểu mẫu trên trang web ngân hàng để chuyển tiền sang tài khoản khác, bí mật họ được cung cấp sẽ chứng minh họ là ai họ nói, và họ đang sử dụng đúng biểu mẫu để gửi yêu cầu chuyển khoản.

Điều này sẽ ngăn người dùng độc hại tạo biểu mẫu giả, giả vờ là ngân hàng và gửi email biểu mẫu đó đến người dùng không nghi ngờ để lừa họ chuyển tiền đến nơi sai. Loại tấn công này được gọi là [Cross Site Request Forgery (CSRF)](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Website_security#cross-site_request_forgery_csrf); hầu hết mọi framework phía máy chủ uy tín đều sử dụng bí mật ẩn để ngăn chặn các cuộc tấn công như vậy.

> [!NOTE]
> Đặt bí mật trong đầu vào ẩn không tự làm cho nó an toàn. Thành phần và mã hóa của khóa sẽ làm điều đó. Giá trị của đầu vào ẩn là nó giữ bí mật liên kết với dữ liệu và tự động đưa nó vào khi biểu mẫu được gửi lên máy chủ. Bạn cần dùng các bí mật được thiết kế tốt để thực sự bảo mật trang web của mình.

## Kiểm tra hợp lệ

Đầu vào ẩn không tham gia vào kiểm tra ràng buộc; chúng không có giá trị thực sự cần ràng buộc.

## Ví dụ

Hãy xem cách chúng ta có thể triển khai phiên bản biểu mẫu chỉnh sửa đã mô tả trước đó (xem [Theo dõi nội dung đã chỉnh sửa](#tracking_edited_content)), sử dụng đầu vào ẩn để nhớ ID của bản ghi đang được chỉnh sửa.

HTML của biểu mẫu chỉnh sửa có thể trông như thế này:

```html
<form>
  <div>
    <label for="title">Post title:</label>
    <input type="text" id="title" name="title" value="My excellent blog post" />
  </div>
  <div>
    <label for="content">Post content:</label>
    <textarea id="content" name="content" cols="60" rows="5">
This is the content of my excellent blog post. I hope you enjoy it!
    </textarea>
  </div>
  <div>
    <button type="submit">Update post</button>
  </div>
  <input type="hidden" id="postId" name="postId" value="34657" />
</form>
```

Hãy cũng thêm một số CSS:

```css
html {
  font-family: sans-serif;
}

form {
  width: 500px;
}

div {
  display: flex;
  margin-bottom: 10px;
}

label {
  flex: 2;
  line-height: 2;
  text-align: right;
  padding-right: 20px;
}

input,
textarea {
  flex: 7;
  font-family: sans-serif;
  font-size: 1.1rem;
  padding: 5px;
}

textarea {
  height: 60px;
}
```

Máy chủ sẽ đặt giá trị của đầu vào ẩn có ID `postID` thành ID của bài đăng trong cơ sở dữ liệu trước khi gửi biểu mẫu đến trình duyệt người dùng và sẽ sử dụng thông tin đó khi biểu mẫu được trả về để biết bản ghi cơ sở dữ liệu nào cần cập nhật với thông tin đã sửa đổi. Không cần scripting trong nội dung để xử lý điều này.

Kết quả trông như thế này:

{{ EmbedLiveSample('Examples', '100%', 200) }}

> [!NOTE]
> Bạn cũng có thể tìm thấy ví dụ trên GitHub (xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/forms/hidden-input-example/index.html), và cũng [xem nó chạy trực tiếp](https://mdn.github.io/learning-area/html/forms/hidden-input-example/index.html)).

Khi được gửi, dữ liệu biểu mẫu được gửi lên máy chủ sẽ trông như thế này:

`title=My+excellent+blog+post&content=This+is+the+content+of+my+excellent+blog+post.+I+hope+you+enjoy+it!&postId=34657`

Mặc dù đầu vào ẩn không thể nhìn thấy hoàn toàn, dữ liệu của nó vẫn được gửi.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho giá trị của dữ liệu ẩn bạn muốn truyền lại máy chủ.
      </td>
    </tr>
    <tr>
      <td><strong>Sự kiện</strong></td>
      <td>Không có.</td>
    </tr>
    <tr>
      <td><strong>Thuộc tính chung được hỗ trợ</strong></td>
      <td><a href="/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete"><code>autocomplete</code></a></td>
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
      <td>Không có.</td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td><a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role">không có vai trò tương ứng</a></td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hướng dẫn biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms)
- {{HTMLElement("input")}} và giao diện {{domxref("HTMLInputElement")}} mà nó dựa trên
