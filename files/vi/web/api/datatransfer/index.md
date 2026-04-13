---
title: DataTransfer
slug: Web/API/DataTransfer
page-type: web-api-interface
browser-compat: api.DataTransfer
---

{{APIRef("HTML Drag and Drop API")}}

Đối tượng **`DataTransfer`** được sử dụng để lưu trữ bất kỳ dữ liệu nào được truyền giữa các ngữ cảnh, chẳng hạn như thao tác kéo và thả, hoặc đọc/ghi clipboard. Nó có thể chứa một hoặc nhiều mục dữ liệu, mỗi mục thuộc một hoặc nhiều kiểu dữ liệu.

`DataTransfer` được thiết kế chủ yếu cho [HTML Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API), như thuộc tính {{domxref("DragEvent.dataTransfer")}}, và vẫn được đặc tả trong phần kéo và thả HTML, nhưng hiện tại cũng được sử dụng bởi các API khác, chẳng hạn như {{domxref("ClipboardEvent.clipboardData")}} và {{domxref("InputEvent.dataTransfer")}}. Tuy nhiên, các API khác chỉ sử dụng một số phần nhất định của giao diện, bỏ qua các thuộc tính như `dropEffect`. Tài liệu về `DataTransfer` sẽ tập trung chủ yếu vào việc sử dụng trong các thao tác kéo và thả, và bạn nên tham khảo tài liệu của các API khác để biết cách sử dụng `DataTransfer` trong các ngữ cảnh đó.

## Hàm khởi tạo

- {{domxref("DataTransfer.DataTransfer","DataTransfer()")}}
  - : Tạo và trả về một đối tượng `DataTransfer` mới.

## Thuộc tính phiên bản

- {{domxref("DataTransfer.dropEffect")}}
  - : Lấy loại thao tác kéo và thả hiện đang được chọn hoặc đặt thao tác thành loại mới. Giá trị phải là `none`, `copy`, `link` hoặc `move`.
- {{domxref("DataTransfer.effectAllowed")}}
  - : Cung cấp tất cả các loại thao tác có thể thực hiện. Phải là một trong `none`, `copy`, `copyLink`, `copyMove`, `link`, `linkMove`, `move`, `all` hoặc `uninitialized`.
- {{domxref("DataTransfer.files")}} {{ReadOnlyInline}}
  - : Chứa danh sách tất cả các tệp cục bộ có sẵn trong quá trình truyền dữ liệu. Nếu thao tác kéo không liên quan đến việc kéo tệp, thuộc tính này là một danh sách rỗng.
- {{domxref("DataTransfer.items")}} {{ReadOnlyInline}}
  - : Cung cấp một đối tượng {{domxref("DataTransferItemList")}} là danh sách tất cả dữ liệu kéo.
- {{domxref("DataTransfer.types")}} {{ReadOnlyInline}}
  - : Một mảng các chuỗi cung cấp các định dạng đã được thiết lập trong sự kiện {{domxref("HTMLElement/dragstart_event", "dragstart")}}.

## Phương thức phiên bản

- {{domxref("DataTransfer.addElement()")}} {{experimental_inline}} {{non-standard_inline}}
  - : Đặt nguồn kéo cho phần tử đã cho. Đây sẽ là phần tử mà các sự kiện {{domxref("HTMLElement/drag_event", "drag")}} và {{domxref("HTMLElement/dragend_event", "dragend")}} được kích hoạt, chứ không phải đích mặc định (nút đã được kéo). Dành riêng cho Firefox.
- {{domxref("DataTransfer.clearData()")}}
  - : Xóa dữ liệu liên quan đến một kiểu nhất định. Tham số kiểu là tùy chọn. Nếu kiểu rỗng hoặc không được chỉ định, dữ liệu liên quan đến tất cả các kiểu sẽ bị xóa. Nếu dữ liệu cho kiểu được chỉ định không tồn tại, hoặc quá trình truyền dữ liệu không chứa dữ liệu nào, phương thức này sẽ không có tác dụng.
- {{domxref("DataTransfer.getData()")}}
  - : Lấy dữ liệu cho một kiểu nhất định, hoặc một chuỗi rỗng nếu dữ liệu cho kiểu đó không tồn tại hoặc quá trình truyền dữ liệu không chứa dữ liệu nào.
- {{domxref("DataTransfer.setData()")}}
  - : Đặt dữ liệu cho một kiểu nhất định. Nếu dữ liệu cho kiểu không tồn tại, nó sẽ được thêm vào cuối, sao cho mục cuối cùng trong danh sách các kiểu sẽ là định dạng mới. Nếu dữ liệu cho kiểu đã tồn tại, dữ liệu hiện có sẽ được thay thế ở cùng vị trí.
- {{domxref("DataTransfer.setDragImage()")}}
  - : Đặt hình ảnh được sử dụng để kéo nếu muốn hình ảnh tùy chỉnh.

## Ví dụ

Mỗi phương thức và thuộc tính được liệt kê trong tài liệu này đều có trang tham khảo riêng và mỗi trang tham khảo hoặc trực tiếp bao gồm một ví dụ về giao diện, hoặc có liên kết đến một ví dụ.

### Đọc dữ liệu trong sự kiện dán hoặc thả

Trong ví dụ sau, chúng tôi có một {{htmlelement("form")}} chứa ba loại đầu vào văn bản khác nhau: một phần tử {{htmlelement("input")}} dạng text, một phần tử {{htmlelement("textarea")}}, và một phần tử {{htmlelement("div")}} với [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được đặt thành `true`. Người dùng có thể dán hoặc thả văn bản vào bất kỳ phần tử nào trong số này, và dữ liệu trong đối tượng {{domxref("ClipboardEvent.clipboardData")}} hoặc {{domxref("DragEvent.dataTransfer")}} sẽ được hiển thị.

#### HTML

```html
<form>
  <fieldset>
    <legend>&lt;input /></legend>
    <input type="text" />
    <table class="center">
      <tbody>
        <tr>
          <th scope="row">Operation type</th>
          <td></td>
        </tr>
        <tr>
          <th scope="row">Content type</th>
          <td></td>
        </tr>
      </tbody>
    </table>
  </fieldset>
  <fieldset>
    <legend>&lt;textarea /></legend>
    <textarea></textarea>
    <table class="center">
      <tbody>
        <tr>
          <th scope="row">Operation type</th>
          <td></td>
        </tr>
        <tr>
          <th scope="row">Content type</th>
          <td></td>
        </tr>
      </tbody>
    </table>
  </fieldset>
  <fieldset>
    <legend>&lt;div contenteditable /></legend>
    <div contenteditable></div>
    <table class="center">
      <tbody>
        <tr>
          <th scope="row">Operation type</th>
          <td></td>
        </tr>
        <tr>
          <th scope="row">Content type</th>
          <td></td>
        </tr>
      </tbody>
    </table>
  </fieldset>
  <p class="center">
    <input type="reset" />
  </p>
</form>
```

#### CSS

```css
.center {
  text-align: center;
}

form > fieldset > * {
  vertical-align: top;
}
form input,
form textarea,
form [contenteditable] {
  min-width: 15rem;
  padding: 0.25rem;
}
[contenteditable] {
  appearance: textfield;
  display: inline-block;
  min-height: 1rem;
  border: 1px solid;
}

form table {
  display: inline-table;
}
table ol {
  text-align: left;
}
```

#### JavaScript

```js
const form = document.querySelector("form");

function displayData(event) {
  if (event.type === "drop") event.preventDefault();

  const cells = event.target.nextElementSibling.querySelectorAll("td");
  cells[0].textContent = event.type;
  const transfer = event.clipboardData || event.dataTransfer;
  const ol = document.createElement("ol");
  cells[1].textContent = "";
  cells[1].appendChild(ol);
  for (const item of transfer.items) {
    const li = document.createElement("li");
    li.textContent = `${item.kind} ${item.type}`;
    ol.appendChild(li);
  }
}

form.addEventListener("paste", displayData);
form.addEventListener("drop", displayData);
form.addEventListener("reset", () => {
  for (const cell of form.querySelectorAll("[contenteditable], td")) {
    cell.textContent = "";
  }
});
```

#### Kết quả

{{EmbedLiveSample("Reading the data in a paste or drop event", "", 400, , , , , "allow-forms")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kéo và thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Làm việc với kho dữ liệu kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)
