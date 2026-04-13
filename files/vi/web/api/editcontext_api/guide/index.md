---
title: Using the EditContext API
slug: Web/API/EditContext_API/Guide
page-type: guide
---

{{DefaultAPISidebar("EditContext API")}}

**[EditContext API](/en-US/docs/Web/API/EditContext_API)** có thể được sử dụng để xây dựng các trình chỉnh sửa văn bản phong phú trên web hỗ trợ các trải nghiệm nhập văn bản nâng cao, như soạn thảo {{glossary("Input Method Editor")}} (IME), bảng chọn emoji, hoặc bất kỳ bề mặt UI liên quan đến chỉnh sửa cụ thể theo nền tảng nào khác.

Bài viết này trình bày các bước cần thiết để xây dựng trình chỉnh sửa văn bản bằng EditContext API. Trong hướng dẫn này, bạn sẽ xem xét các bước chính liên quan đến việc xây dựng trình chỉnh sửa mã HTML đơn giản có tô sáng cú pháp của mã khi bạn nhập, và hỗ trợ soạn thảo IME.

## Mã cuối cùng và bản demo trực tiếp

Để xem mã cuối cùng, hãy kiểm tra [mã nguồn](https://github.com/mdn/dom-examples/tree/main/edit-context/html-editor) trên GitHub. Bạn nên mở mã nguồn khi đọc, vì hướng dẫn chỉ hiển thị các phần quan trọng nhất của mã.

Mã nguồn được tổ chức thành các tệp sau:

- [index.html](https://github.com/mdn/dom-examples/blob/main/edit-context/html-editor/index.html) chứa phần tử UI trình chỉnh sửa và tải CSS và JavaScript cần thiết cho bản demo.
- [styles.css](https://github.com/mdn/dom-examples/blob/main/edit-context/html-editor/styles.css) chứa các kiểu cho UI trình chỉnh sửa.
- [editor.js](https://github.com/mdn/dom-examples/blob/main/edit-context/html-editor/editor.js) chứa mã JavaScript thiết lập UI trình chỉnh sửa, kết xuất mã HTML và xử lý đầu vào người dùng.
- [tokenizer.js](https://github.com/mdn/dom-examples/blob/main/edit-context/html-editor/tokenizer.js) chứa mã JavaScript chia mã HTML thành các token riêng biệt, như thẻ mở, thẻ đóng và nút văn bản.
- [converter.js](https://github.com/mdn/dom-examples/blob/main/edit-context/html-editor/converter.js) chứa mã JavaScript chuyển đổi giữa độ lệch ký tự mà EditContext API sử dụng và các nút DOM mà trình duyệt sử dụng cho lựa chọn văn bản.

Để sử dụng bản demo trực tiếp, hãy mở [Edit Context API: HTML editor demo](https://mdn.github.io/dom-examples/edit-context/html-editor/) trong trình duyệt hỗ trợ EditContext API.

## Tạo UI trình chỉnh sửa

Bước đầu tiên là tạo UI cho trình chỉnh sửa. Trình chỉnh sửa là phần tử {{HTMLElement("div")}} với thuộc tính [`spellcheck`](/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck) được đặt thành `false` để tắt kiểm tra chính tả:

```html
<div id="html-editor" spellcheck="false"></div>
```

Để tạo kiểu cho phần tử trình chỉnh sửa, mã CSS sau được sử dụng. Mã làm cho trình chỉnh sửa lấp đầy toàn bộ khung nhìn và cuộn khi có quá nhiều nội dung. Thuộc tính {{cssxref("white-space")}} cũng được sử dụng để bảo toàn ký tự khoảng trắng trong văn bản đầu vào HTML, và thuộc tính {{cssxref("tab-size")}} được sử dụng để làm cho các ký tự tab kết xuất như hai khoảng trắng. Cuối cùng, một số màu nền, màu văn bản và màu con trỏ mặc định được đặt:

```css
#html-editor {
  box-sizing: border-box;
  width: 100%;
  height: 100%;
  border-radius: 0.5rem;
  padding: 1rem;
  overflow: auto;
  white-space: pre;
  tab-size: 2;
  caret-color: red;
  background: black;
  line-height: 1.6;
  color: red;
}
```

## Làm cho trình chỉnh sửa có thể chỉnh sửa

Để làm cho phần tử có thể chỉnh sửa trên web, hầu hết thời gian, bạn sử dụng phần tử {{HTMLElement("input")}}, phần tử {{HTMLElement("textarea")}}, hoặc thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).

Tuy nhiên, với EditContext API, bạn có thể làm cho các loại phần tử khác có thể chỉnh sửa mà không cần sử dụng thuộc tính. Để xem danh sách các phần tử có thể được sử dụng với EditContext API, hãy xem [Các phần tử có thể](/en-US/docs/Web/API/HTMLElement/editContext#possible_elements) trên trang thuộc tính `editContext` của HTMLElement.

Để làm cho trình chỉnh sửa có thể chỉnh sửa, ứng dụng demo tạo đối tượng {{domxref("EditContext")}}, truyền một số văn bản HTML ban đầu vào hàm khởi tạo, và sau đó đặt thuộc tính {{domxref("HTMLElement.editContext", "editContext")}} của phần tử trình chỉnh sửa thành đối tượng `EditContext`:

```js
// Lấy phần tử trình chỉnh sửa từ DOM.
const editorEl = document.getElementById("html-editor");

// Tạo đối tượng EditContext.
const editContext = new EditContext({
  text: "<html>\n  <body id=foo>\n    <h1 id='header'>Cool Title</h1>\n    <p class=\"wow\">hello<br/>How are you? test</p>\n  </body>\n</html>",
});

// Đặt giá trị thuộc tính editContext của trình chỉnh sửa.
editorEl.editContext = editContext;
```

Các dòng mã này làm cho phần tử trình chỉnh sửa có thể focus. Nhập văn bản vào phần tử sẽ kích hoạt sự kiện {{domxref("EditContext.textupdate_event", "textupdate")}} trên đối tượng `EditContext`.

## Kết xuất văn bản và lựa chọn người dùng

Để kết xuất mã HTML được tô sáng cú pháp trong trình chỉnh sửa khi người dùng nhập văn bản, ứng dụng demo sử dụng hàm `render()` được gọi khi văn bản mới được nhập, khi ký tự bị xóa, hoặc khi lựa chọn thay đổi.

Xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/edit-context/html-editor) để biết chi tiết đầy đủ về cách triển khai kết xuất và xử lý sự kiện.

## Thông số kỹ thuật

Xem thông số kỹ thuật trong trang [EditContext API](/en-US/docs/Web/API/EditContext_API#specifications).

## Xem thêm

- [EditContext API](/en-US/docs/Web/API/EditContext_API)
