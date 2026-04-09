---
title: CharacterBoundsUpdateEvent
slug: Web/API/CharacterBoundsUpdateEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.CharacterBoundsUpdateEvent
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Giao diện **`CharacterBoundsUpdateEvent`** là một [sự kiện DOM](/en-US/docs/Web/API/Event) biểu diễn một yêu cầu từ hệ điều hành muốn biết ranh giới của một số ký tự nhất định trong một vùng có thể chỉnh sửa được gắn với một thể hiện {{domxref("EditContext")}}.

Giao diện này kế thừa các thuộc tính từ {{domxref("Event")}}.

{{InheritanceDiagram}}

## Bộ khởi tạo

- {{domxref("CharacterBoundsUpdateEvent.CharacterBoundsUpdateEvent", "CharacterBoundsUpdateEvent()")}} {{experimental_inline}}
  - : Tạo một đối tượng `CharacterBoundsUpdateEvent` mới.

## Thuộc tính thể hiện

- {{domxref('CharacterBoundsUpdateEvent.rangeStart')}} {{readonlyinline}} {{experimental_inline}}
  - : Độ lệch của ký tự đầu tiên trong văn bản của vùng có thể chỉnh sửa mà hệ điều hành cần biết ranh giới.
- {{domxref('CharacterBoundsUpdateEvent.rangeEnd')}} {{readonlyinline}} {{experimental_inline}}
  - : Độ lệch của ký tự cuối cùng trong văn bản của vùng có thể chỉnh sửa mà hệ điều hành cần biết ranh giới.

## Ví dụ

### Cập nhật ranh giới ký tự khi cần

Ví dụ này minh họa cách sử dụng sự kiện `characterboundsupdate` và phương thức `updateCharacterBounds` để thông báo cho hệ điều hành về ranh giới ký tự mà nó yêu cầu. Lưu ý rằng callback của trình lắng nghe sự kiện chỉ được gọi khi dùng cửa sổ IME hoặc các bề mặt giao diện chỉnh sửa đặc thù của nền tảng khác để soạn văn bản.

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
  // Measure the width from the start of the text to the character.
  const widthBeforeChar = ctx.measureText(
    editContext.text.substring(0, offset),
  ).width;

  // Measure the character width.
  const charWidth = ctx.measureText(editContext.text[offset]).width;

  const charX = canvas.offsetLeft + widthBeforeChar;
  const charY = canvas.offsetTop;

  // Return a DOMRect representing the character bounds.
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

  // Update the character bounds in the EditContext instance.
  editContext.updateCharacterBounds(e.rangeStart, charBounds);

  console.log(
    "The required character bounds are",
    charBounds
      .map(
        (bound) =>
          `(x: ${bound.x}, y: ${bound.y}, width: ${bound.width}, height: ${bound.height})`,
      )
      .join(", "),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
