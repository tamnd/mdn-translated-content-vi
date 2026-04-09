---
title: "<body>: The Document Body element"
slug: Web/HTML/Reference/Elements/body
page-type: html-element
browser-compat: html.elements.body
sidebar: htmlsidebar
---

Phần tử **`<body>`** trong [HTML](/en-US/docs/Web/HTML) biểu diễn nội dung của một tài liệu HTML. Chỉ có thể có một phần tử `<body>` trong một tài liệu.

## Thuộc tính

Phần tử này bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes), thuộc tính sự kiện và các thuộc tính đã lỗi thời:

### Thuộc tính sự kiện

> [!NOTE]
> Mỗi tên thuộc tính sự kiện dưới đây được liên kết đến sự kiện giao diện {{domxref("Window")}} tương đương. Bạn có thể lắng nghe các sự kiện này bằng cách sử dụng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) thay vì thêm thuộc tính `oneventname` vào phần tử `<body>`.

- [`onafterprint`](/en-US/docs/Web/API/Window/afterprint_event)
  - : Hàm gọi sau khi người dùng đã in tài liệu.
- [`onbeforeprint`](/en-US/docs/Web/API/Window/beforeprint_event)
  - : Hàm gọi khi người dùng yêu cầu in tài liệu.
- [`onbeforeunload`](/en-US/docs/Web/API/Window/beforeunload_event)
  - : Hàm gọi khi tài liệu chuẩn bị được dỡ tải.
- [`onblur`](/en-US/docs/Web/API/Window/blur_event)
  - : Hàm gọi khi tài liệu mất focus.
- [`onerror`](/en-US/docs/Web/API/Window/error_event)
  - : Hàm gọi khi tài liệu không tải được đúng cách.
- [`onfocus`](/en-US/docs/Web/API/Window/focus_event)
  - : Hàm gọi khi tài liệu nhận focus.
- [`onhashchange`](/en-US/docs/Web/API/Window/hashchange_event)
  - : Hàm gọi khi phần định danh fragment (bắt đầu bằng ký tự hash (`'#'`)) của địa chỉ hiện tại của tài liệu đã thay đổi.
- [`onlanguagechange`](/en-US/docs/Web/API/Window/languagechange_event)
  - : Hàm gọi khi ngôn ngữ ưa thích đã thay đổi.
- [`onload`](/en-US/docs/Web/API/Window/load_event)
  - : Hàm gọi khi tài liệu đã tải xong.
- [`onmessage`](/en-US/docs/Web/API/Window/message_event)
  - : Hàm gọi khi tài liệu đã nhận được một message.
- [`onmessageerror`](/en-US/docs/Web/API/Window/messageerror_event)
  - : Hàm gọi khi tài liệu đã nhận được một message không thể deserialize.
- [`onoffline`](/en-US/docs/Web/API/Window/offline_event)
  - : Hàm gọi khi kết nối mạng bị mất.
- [`ononline`](/en-US/docs/Web/API/Window/online_event)
  - : Hàm gọi khi kết nối mạng được khôi phục.
- [`onpageswap`](/en-US/docs/Web/API/Window/pageswap_event)
  - : Hàm gọi khi bạn điều hướng giữa các tài liệu, khi tài liệu trước đó sắp được dỡ tải.
- [`onpagehide`](/en-US/docs/Web/API/Window/pagehide_event)
  - : Hàm gọi khi trình duyệt ẩn trang hiện tại trong quá trình trình bày một trang khác từ lịch sử session.
- [`onpagereveal`](/en-US/docs/Web/API/Window/pagereveal_event)
  - : Hàm gọi khi một tài liệu được hiển thị lần đầu tiên, khi tải một tài liệu mới từ mạng hoặc kích hoạt một tài liệu.
- [`onpageshow`](/en-US/docs/Web/API/Window/pageshow_event)
  - : Hàm gọi khi trình duyệt hiển thị tài liệu của window do điều hướng.
- [`onpopstate`](/en-US/docs/Web/API/Window/popstate_event)
  - : Hàm gọi khi người dùng đã điều hướng lịch sử session.
- [`onresize`](/en-US/docs/Web/API/Window/resize_event)
  - : Hàm gọi khi tài liệu đã được thay đổi kích thước.
- [`onrejectionhandled`](/en-US/docs/Web/API/Window/rejectionhandled_event)
  - : Hàm gọi khi một {{jsxref("Promise")}} JavaScript được xử lý muộn.
- [`onstorage`](/en-US/docs/Web/API/Window/storage_event)
  - : Hàm gọi khi khu vực lưu trữ đã thay đổi.
- [`onunhandledrejection`](/en-US/docs/Web/API/Window/unhandledrejection_event)
  - : Hàm gọi khi một {{jsxref("Promise")}} JavaScript không có rejection handler bị từ chối.
- [`onunload`](/en-US/docs/Web/API/Window/unload_event) {{deprecated_inline}}
  - : Hàm gọi khi tài liệu đang được xóa bỏ.

### Các thuộc tính đã lỗi thời

> [!WARNING]
> Không sử dụng các thuộc tính đã lỗi thời này; hãy chọn các giải pháp thay thế CSS được liệt kê với mỗi thuộc tính đã lỗi thời.

- `alink` {{deprecated_inline}}
  - : Màu của văn bản cho hyperlink khi được chọn.
    Hãy sử dụng thuộc tính CSS {{cssxref("color")}} kết hợp với pseudo-class {{cssxref(":active")}} và {{cssxref(":focus")}} thay thế.
- `background` {{deprecated_inline}}
  - : URI của hình ảnh dùng làm nền.
    Hãy sử dụng thuộc tính CSS {{cssxref("background-image")}} thay thế.
- `bgcolor` {{deprecated_inline}}
  - : Màu nền cho tài liệu.
    Hãy sử dụng thuộc tính CSS {{cssxref("background-color")}} thay thế.
- `bottommargin` {{deprecated_inline}}
  - : Bị bỏ qua.
- `leftmargin` {{deprecated_inline}}
  - : Lề trái và phải của body.
    Hãy sử dụng thuộc tính CSS {{cssxref("margin-left")}} và {{cssxref("margin-right")}} (hoặc thuộc tính logic {{cssxref("margin-inline")}}) thay thế.
- `link` {{deprecated_inline}}
  - : Màu của văn bản cho hypertext link chưa được truy cập.
    Hãy sử dụng thuộc tính CSS {{cssxref("color")}} kết hợp với pseudo-class {{cssxref(":link")}} thay thế.
- `rightmargin` {{deprecated_inline}}
  - : Bị bỏ qua.
- `text` {{deprecated_inline}}
  - : Màu chữ của văn bản.
    Hãy sử dụng thuộc tính CSS {{cssxref("color")}} thay thế.
- `topmargin` {{deprecated_inline}}
  - : Lề trên và dưới của body.
    Hãy sử dụng thuộc tính CSS {{cssxref("margin-top")}} và {{cssxref("margin-bottom")}} (hoặc thuộc tính logic {{cssxref("margin-block")}}) thay thế.
- `vlink` {{deprecated_inline}}
  - : Màu của văn bản cho hypertext link đã được truy cập.
    Hãy sử dụng thuộc tính CSS {{cssxref("color")}} kết hợp với pseudo-class {{cssxref(":visited")}} thay thế.

## Ví dụ

```html
<html lang="en">
  <head>
    <title>Document title</title>
  </head>
  <body>
    <p>
      The <code>&lt;body&gt;</code> HTML element represents the content of an
      HTML document. There can be only one <code>&lt;body&gt;</code> element in
      a document.
    </p>
  </body>
</html>
```

### Kết quả

{{EmbedLiveSample('Example')}}

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
        Không có.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung flow</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở có thể bị bỏ qua nếu thứ đầu tiên bên trong nó không phải là ký tự khoảng trắng,
        comment, phần tử {{HTMLElement("script")}} hay
        phần tử {{HTMLElement("style")}}. Thẻ đóng có thể bị bỏ qua nếu
        phần tử <code>&#x3C;body></code> có nội dung hoặc có thẻ mở,
        và không được theo ngay sau bởi một comment.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Phải là phần tử thứ hai của phần tử {{HTMLElement("html")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role"
            >generic</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>
        {{domxref("HTMLBodyElement")}}
        <ul>
          <li>
            Phần tử <code>&#x3C;body></code> hiển thị giao diện
            {{domxref("HTMLBodyElement")}}.
          </li>
          <li>
            Bạn có thể truy cập phần tử <code>&#x3C;body></code> thông qua
            thuộc tính {{domxref("document.body")}}.
          </li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("html")}}
- {{HTMLElement("head")}}
- [Tổng quan về xử lý sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#registering_event_handlers)
