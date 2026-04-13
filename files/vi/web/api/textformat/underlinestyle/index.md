---
title: "TextFormat: underlineStyle property"
short-title: underlineStyle
slug: Web/API/TextFormat/underlineStyle
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.TextFormat.underlineStyle
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Thuộc tính **`underlineStyle`** của giao diện {{domxref("TextFormat")}} cho biết kiểu đường gạch chân cần được áp dụng cho phạm vi văn bản đang được định dạng.

## Giá trị

Một {{jsxref("String")}} có một trong các giá trị sau:

- `"none"`: Không có đường gạch chân.
- `"solid"`: Đường gạch chân liền nét.
- `"double"`: Đường gạch chân đôi.
- `"dotted"`: Đường gạch chân chấm.
- `"dashed"`: Đường gạch chân gạch nối.
- `"wavy"`: Đường gạch chân lượn sóng.

## Ví dụ

### Đọc kiểu đường gạch chân cần áp dụng

Ví dụ sau cho thấy cách sử dụng thuộc tính `underlineStyle` của sự kiện `textformatupdate` để xác định kiểu đường gạch chân cần áp dụng cho văn bản đang được định dạng. Lưu ý rằng callback của trình nghe sự kiện trong ví dụ này chỉ được gọi khi sử dụng cửa sổ IME để soạn thảo văn bản.

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
  const formats = e.getTextFormats();

  for (const format of formats) {
    console.log(
      `IME wants to apply a ${format.underlineStyle} underline between ${format.rangeStart} and ${format.rangeEnd}.`,
    );
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("TextFormat")}} mà nó thuộc về.
