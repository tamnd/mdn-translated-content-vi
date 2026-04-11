---
title: "EditContext: textupdate event"
short-title: textupdate
slug: Web/API/EditContext/textupdate_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.EditContext.textupdate_event
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Sự kiện `textupdate` của giao diện {{domxref("EditContext")}} được kích hoạt khi người dùng thực hiện thay đổi đối với văn bản hoặc vùng chọn của một vùng có thể chỉnh sửa được gắn với một thực thể `EditContext`.

Sự kiện này cho phép hiển thị văn bản và vùng chọn đã được cập nhật trong giao diện người dùng, phản hồi thao tác người dùng.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("textupdate", (event) => { })

ontextupdate = (event) => { }
```

## Loại sự kiện

Một {{domxref("TextUpdateEvent")}}. Kế thừa từ {{domxref("Event")}}.

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê dưới đây, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref('TextUpdateEvent.updateRangeStart')}} {{readonlyinline}}
  - : Trả về chỉ số của ký tự đầu tiên trong phạm vi văn bản được cập nhật.
- {{domxref('TextUpdateEvent.updateRangeEnd')}} {{readonlyinline}}
  - : Trả về chỉ số của ký tự cuối cùng trong phạm vi văn bản được cập nhật.
- {{domxref('TextUpdateEvent.text')}} {{readonlyinline}}
  - : Trả về văn bản được chèn vào trong phạm vi đã cập nhật.
- {{domxref('TextUpdateEvent.selectionStart')}} {{readonlyinline}}
  - : Trả về chỉ số của ký tự đầu tiên trong phạm vi vùng chọn mới, sau khi cập nhật.
- {{domxref('TextUpdateEvent.selectionEnd')}} {{readonlyinline}}
  - : Trả về chỉ số của ký tự cuối cùng trong phạm vi vùng chọn mới, sau khi cập nhật.

## Ví dụ

### Hiển thị văn bản đã cập nhật khi có sự kiện `textupdate`

Trong ví dụ sau, sự kiện `textupdate` của EditContext API được dùng để hiển thị văn bản mà người dùng nhập vào phần tử `<canvas>` có thể chỉnh sửa.

```html
<canvas id="editor-canvas"></canvas>
```

```js
const canvas = document.getElementById("editor-canvas");
const ctx = canvas.getContext("2d");
const editContext = new EditContext();
canvas.editContext = editContext;

editContext.addEventListener("textupdate", (e) => {
  // Khi người dùng focus vào <canvas> và nhập văn bản,
  // sự kiện này được kích hoạt, và ta dùng nó để vẽ lại văn bản.
  console.log(
    `The user entered the text: ${e.text} at ${e.updateRangeStart}. Re-rendering the full EditContext text`,
  );
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ctx.fillText(editContext.text, 10, 10);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
