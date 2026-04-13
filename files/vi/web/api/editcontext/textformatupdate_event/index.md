---
title: "EditContext: textformatupdate event"
short-title: textformatupdate
slug: Web/API/EditContext/textformatupdate_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.EditContext.textformatupdate_event
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Sự kiện `textformatupdate` của giao diện {{domxref("EditContext")}} được kích hoạt khi đang soạn thảo bằng cửa sổ {{glossary("Input Method Editor")}} (IME).

Sự kiện được kích hoạt khi IME quyết định rằng một số phần văn bản đang được soạn thảo cần được định dạng khác nhau để chỉ ra trạng thái soạn thảo.

Ảnh chụp màn hình sau đây cho thấy ví dụ về văn bản được viết trong ứng dụng Notepad trên Windows, sử dụng IME tiếng Nhật. Văn bản được định dạng với gạch chân đậm để cho biết rằng nó đã được soạn thảo từ một trong các gợi ý của IME.

![Notepad on Windows with some Japanese text being composed from the IME window](./ime-notepad.png)

Là một nhà phát triển web, bạn nên lắng nghe sự kiện `textformatupdate` và cập nhật định dạng của văn bản hiển thị trong vùng có thể chỉnh sửa cho phù hợp.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("textformatupdate", (event) => { })

ontextformatupdate = (event) => { }
```

## Loại sự kiện

Một {{domxref("TextFormatUpdateEvent")}}. Kế thừa từ {{domxref("Event")}}.

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê dưới đây, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref('TextFormatUpdateEvent.getTextFormats')}}
  - : Trả về danh sách định dạng văn bản mà cửa sổ IME muốn áp dụng cho văn bản.

## Ví dụ

### Hiển thị định dạng văn bản soạn thảo IME

Trong ví dụ sau, sự kiện `textformatupdate` được dùng để cập nhật định dạng của văn bản trong vùng có thể chỉnh sửa. Lưu ý rằng callback trong ví dụ này chỉ được gọi khi dùng cửa sổ IME hoặc các giao diện người dùng chỉnh sửa khác của nền tảng để soạn thảo văn bản.

```html
<canvas id="editor-canvas"></canvas>
```

```js
const TEXT_X = 10;
const TEXT_Y = 10;

const canvas = document.getElementById("editor-canvas");
const ctx = canvas.getContext("2d");

const editContext = new EditContext();
canvas.editContext = editContext;

editContext.addEventListener("textformatupdate", (e) => {
  // Xóa canvas.
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  // Hiển thị văn bản.
  ctx.fillText(editContext.text, TEXT_X, TEXT_Y);

  // Lấy định dạng văn bản mà cửa sổ IME muốn áp dụng.
  const formats = e.getTextFormats();

  // Lặp qua các định dạng văn bản
  for (const format of formats) {
    const { rangeStart, rangeEnd, underlineStyle, underlineThickness } = format;

    const underlineXStart = ctx.measureText(
      editContext.text.substring(0, rangeStart),
    ).width;
    const underlineXEnd = ctx.measureText(
      editContext.text.substring(0, rangeEnd),
    ).width;
    const underlineY = TEXT_Y + 3;

    // Để ngắn gọn, ví dụ này chỉ vẽ một đường gạch chân đơn giản.
    // Bạn nên dùng giá trị underlineStyle và underlineThickness để vẽ đường gạch chân.

    ctx.beginPath();
    ctx.moveTo(TEXT_X + underlineXStart, underlineY);
    ctx.lineTo(TEXT_X + underlineXEnd, underlineY);
    ctx.stroke();
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
