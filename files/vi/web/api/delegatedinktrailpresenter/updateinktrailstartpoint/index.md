---
title: "DelegatedInkTrailPresenter: updateInkTrailStartPoint() method"
short-title: updateInkTrailStartPoint()
slug: Web/API/DelegatedInkTrailPresenter/updateInkTrailStartPoint
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.DelegatedInkTrailPresenter.updateInkTrailStartPoint
---

{{APIRef("Ink API")}}{{SeeCompatTable}}

Phương thức **`updateInkTrailStartPoint()`** của giao diện {{domxref("DelegatedInkTrailPresenter")}} cho biết {{domxref("PointerEvent")}} nào được sử dụng làm điểm hiển thị cuối cùng cho khung hiện tại, cho phép bộ tổng hợp cấp độ hệ điều hành hiển thị vệt mực ủy quyền trước sự kiện con trỏ tiếp theo được gửi.

## Cú pháp

```js-nolint
updateInkTrailStartPoint(event, style)
```

### Tham số

- `event` {{optional_inline}}
  - : Một {{domxref("PointerEvent")}}.
- `style`
  - : Đối tượng xác định kiểu vệt, chứa các thuộc tính sau:
    - `color`
      - : Một {{jsxref("String")}} chứa mã màu CSS hợp lệ, cho biết màu mà presenter sẽ sử dụng khi hiển thị vệt mực.
    - `diameter`
      - : Số đại diện cho đường kính mà presenter sẽ sử dụng khi hiển thị vệt mực.

### Giá trị trả về

`undefined`.

### Ngoại lệ

- `Error` {{domxref("DOMException")}}
  - : Lỗi được ném ra và thao tác bị hủy nếu:
    - Thuộc tính `color` không chứa mã màu CSS hợp lệ.
    - Thuộc tính `diameter` không phải là số hoặc nhỏ hơn 1.
    - Phần tử {{domxref("DelegatedInkTrailPresenter.presentationArea", "presentationArea")}} bị xóa khỏi tài liệu trước hoặc trong khi hiển thị.

## Ví dụ

### Vẽ vệt mực

Trong ví dụ này, chúng ta vẽ một vệt lên canvas 2D. Gần đầu mã, chúng ta gọi {{domxref("Ink.requestPresenter()")}}, truyền canvas làm vùng trình bày cho nó và lưu trữ promise nó trả về trong biến `presenter`.

Sau đó, trong trình nghe sự kiện `pointermove`, vị trí mới của đầu vệt được vẽ lên canvas mỗi lần sự kiện kích hoạt. Ngoài ra, đối tượng {{domxref("DelegatedInkTrailPresenter")}} được trả về khi promise `presenter` hoàn thành có phương thức `updateInkTrailStartPoint()` được gọi; điều này được truyền:

- Sự kiện con trỏ đáng tin cậy cuối cùng đại diện cho điểm hiển thị cho khung hiện tại.
- Đối tượng `style` chứa cài đặt màu sắc và đường kính.

Kết quả là vệt mực ủy quyền được vẽ trước khi trình duyệt hiển thị mặc định thay mặt ứng dụng, theo kiểu đã chỉ định, cho đến lần tiếp theo nó nhận được sự kiện `pointermove`.

#### HTML

```html
<canvas id="canvas"></canvas>
<div id="div">Delegated ink trail should match the color of this div.</div>
```

#### CSS

```css
div {
  background-color: lime;
  position: fixed;
  top: 1rem;
  left: 1rem;
}
```

#### JavaScript

```js
const ctx = canvas.getContext("2d");
const presenter = navigator.ink.requestPresenter({ presentationArea: canvas });
let moveCnt = 0;
let style = { color: "lime", diameter: 10 };

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

canvas.addEventListener("pointermove", async (evt) => {
  const pointSize = 10;
  ctx.fillStyle = style.color;
  ctx.fillRect(evt.pageX, evt.pageY, pointSize, pointSize);
  if (moveCnt === 20) {
    const r = getRandomInt(0, 255);
    const g = getRandomInt(0, 255);
    const b = getRandomInt(0, 255);

    style = { color: `rgb(${r} ${g} ${b} / 100%)`, diameter: 10 };
    moveCnt = 0;
    document.getElementById("div").style.backgroundColor =
      `rgb(${r} ${g} ${b} / 60%)`;
  }
  moveCnt += 1;
  await presenter.updateInkTrailStartPoint(evt, style);
});

window.addEventListener("pointerdown", () => {
  ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
});

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
```

#### Kết quả

{{EmbedLiveSample("Drawing an ink trail")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
