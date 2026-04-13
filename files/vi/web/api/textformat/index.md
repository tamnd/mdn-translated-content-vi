---
title: TextFormat
slug: Web/API/TextFormat
page-type: web-api-interface
status:
  - experimental
browser-compat: api.TextFormat
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Giao diện **`TextFormat`** đại diện cho định dạng cụ thể cần được áp dụng cho một phạm vi văn bản trong vùng văn bản có thể chỉnh sửa được gắn với một phiên bản {{domxref("EditContext")}}. Định dạng văn bản được yêu cầu bởi cửa sổ {{glossary("Input Method Editor")}} (IME) mà người dùng đang soạn thảo văn bản.

Khi sử dụng một trong các vùng có thể chỉnh sửa mặc định của web, chẳng hạn như phần tử [`<textarea>`](/en-US/docs/Web/HTML/Reference/Elements/textarea), trình duyệt và hệ điều hành sẽ xử lý soạn thảo IME cho bạn. Ví dụ, khi sử dụng IME tiếng Nhật trong một textarea trên Windows, các định dạng văn bản sau đây có thể được áp dụng:

- Khi văn bản đang được soạn thảo bằng bàn phím, các ký tự được gõ có đường gạch chân lượn sóng mỏng:

  ![A textarea in Microsoft Edge on Windows with some Japanese text being composed from the IME window](./ime-squiggle-underline.png)

- Khi người dùng chọn một gợi ý từ danh sách ứng viên trong cửa sổ IME, văn bản được thay thế và được gạch chân bằng đường thẳng dày:

  ![A textarea in Microsoft Edge on Windows with some Japanese text being selected from the IME window](./ime-solid-underline.png)

Khi tạo vùng có thể chỉnh sửa tùy chỉnh bằng {{domxref("EditContext API", "", "", "nocode")}}, bạn cần tự xử lý soạn thảo IME. Bạn nên lắng nghe sự kiện {{domxref("EditContext/textformatupdate_event", "textformatupdate")}}, cung cấp danh sách các định dạng văn bản mà cửa sổ IME muốn áp dụng cho văn bản đang được soạn thảo. Sau đó bạn cập nhật định dạng của văn bản hiển thị trong vùng có thể chỉnh sửa cho phù hợp.

## Hàm khởi tạo

- {{DOMxRef("TextFormat.TextFormat", "TextFormat()")}} {{experimental_inline}}
  - : Trả về một phiên bản `TextFormat` mới.

## Thuộc tính phiên bản

- {{domxref("TextFormat.rangeStart")}} {{readonlyinline}} {{experimental_inline}}
  - : Vị trí bắt đầu của phạm vi văn bản cần được định dạng với định dạng văn bản đã cho.
- {{domxref("TextFormat.rangeEnd")}} {{readonlyinline}} {{experimental_inline}}
  - : Vị trí kết thúc của phạm vi văn bản cần được định dạng với định dạng văn bản đã cho.
- {{domxref("TextFormat.underlineStyle")}} {{readonlyinline}} {{experimental_inline}}
  - : Kiểu đường gạch chân cần được áp dụng cho phạm vi văn bản đang được định dạng.
- {{domxref("TextFormat.underlineThickness")}} {{readonlyinline}} {{experimental_inline}}
  - : Độ dày của đường gạch chân cần được áp dụng cho phạm vi văn bản đang được định dạng.

## Ví dụ

### Sử dụng sự kiện `textformatupdate`

Trong ví dụ sau, sự kiện `textformatupdate` được dùng để ghi lại các định dạng khác nhau mà cửa sổ soạn thảo IME muốn áp dụng cho các phạm vi văn bản trong phần tử có thể chỉnh sửa. Lưu ý rằng callback của trình nghe sự kiện trong ví dụ này chỉ được gọi khi sử dụng cửa sổ IME để soạn thảo văn bản.

```html
<div id="editor"></div>
```

```css hidden
#editor {
  height: 200px;
  background: #eeeeee;
}
```

```js
const editorEl = document.getElementById("editor");
const editContext = new EditContext(editorEl);
editorEl.editContext = editContext;

editContext.addEventListener("textformatupdate", (e) => {
  // Get the TextFormat instances.
  const formats = e.getTextFormats();

  // Iterate over the TextFormat instances.
  for (const format of formats) {
    console.log(
      `Applying a ${format.underlineThickness} ${format.underlineStyle} underline between ${format.rangeStart} and ${format.rangeEnd}.`,
    );
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
