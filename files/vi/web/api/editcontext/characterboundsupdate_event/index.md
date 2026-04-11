---
title: "EditContext: characterboundsupdate event"
short-title: characterboundsupdate
slug: Web/API/EditContext/characterboundsupdate_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.EditContext.characterboundsupdate_event
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Sự kiện `characterboundsupdate` được kích hoạt khi hệ điều hành cần biết kích thước bao quanh của một số ký tự trong vùng văn bản có thể chỉnh sửa của đối tượng `EditContext`.

Điều này xảy ra khi hệ điều hành cần hiển thị một giao diện người dùng liên quan đến chỉnh sửa của nền tảng, chẳng hạn như cửa sổ {{glossary("Input Method Editor")}} (IME).

Khi sự kiện `characterboundsupdate` được kích hoạt, bạn nên tính toán kích thước bao quanh ký tự cho văn bản, rồi gọi phương thức {{domxref("EditContext.updateCharacterBounds()")}} để cung cấp thông tin cần thiết cho hệ điều hành.

Xem tài liệu của phương thức {{domxref("EditContext.updateCharacterBounds()", "updateCharacterBounds")}} để biết thêm thông tin về thời điểm và cách sử dụng sự kiện `characterboundsupdate`.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("characterboundsupdate", (event) => { })

oncharacterboundsupdate = (event) => { }
```

## Loại sự kiện

Một {{domxref("CharacterBoundsUpdateEvent")}}. Kế thừa từ {{domxref("Event")}}.

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê dưới đây, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref('CharacterBoundsUpdateEvent.rangeStart')}} {{readonlyinline}}
  - : Độ lệch của ký tự đầu tiên trong văn bản vùng có thể chỉnh sửa mà hệ điều hành cần kích thước bao quanh.
- {{domxref('CharacterBoundsUpdateEvent.rangeEnd')}} {{readonlyinline}}
  - : Độ lệch của ký tự cuối cùng trong văn bản vùng có thể chỉnh sửa mà hệ điều hành cần kích thước bao quanh.

## Ví dụ

### Cập nhật kích thước bao quanh ký tự khi cần

Ví dụ này cho thấy cách dùng phương thức `updateCharacterBounds` để cập nhật kích thước bao quanh ký tự trong `EditContext` của phần tử `canvas` khi hệ điều hành cho biết nó cần thông tin. Lưu ý rằng callback trong ví dụ này chỉ được gọi khi dùng cửa sổ IME hoặc các giao diện người dùng chỉnh sửa khác của nền tảng để soạn thảo văn bản.

```html
<canvas id="editor-canvas"></canvas>
```

```js
const FONT_SIZE = 40;
const FONT = `${FONT_SIZE}px Arial`;

const canvas = document.getElementById("editor-canvas");
const ctx = canvas.getContext("2d");
ctx.font = FONT;

const editContext = new EditContext();
canvas.editContext = editContext;

function computeCharacterBound(offset) {
  // Đo chiều rộng từ đầu văn bản đến ký tự.
  const widthBeforeChar = ctx.measureText(
    editContext.text.substring(0, offset),
  ).width;

  // Đo chiều rộng của ký tự.
  const charWidth = ctx.measureText(editContext.text[offset]).width;

  const charX = canvas.offsetLeft + widthBeforeChar;
  const charY = canvas.offsetTop;

  // Trả về DOMRect đại diện cho kích thước bao quanh ký tự.
  return DOMRect.fromRect({
    x: charX,
    y: charY - FONT_SIZE,
    width: charWidth,
    height: FONT_SIZE,
  });
}

editContext.addEventListener("characterboundsupdate", (e) => {
  const charBounds = [];
  for (let offset = e.rangeStart; offset < e.rangeEnd; offset++) {
    charBounds.push(computeCharacterBound(offset));
  }

  console.log("The required character bounds are", charBounds);
  editContext.updateCharacterBounds(e.rangeStart, charBounds);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
